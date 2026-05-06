# Time Dilation Overhaul 2.0

## Origin

The original Time Dilation Overhaul shipped in November 2022 against Cyberpunk 1.6. brahmax built it in pure CET/Lua, which was the right call for the tooling that existed at the time, but it boxed the mod in. Anything that needed to wrap a vanilla method or reach into the combat layer was off the table. The mod page promised a long roadmap, and most of it never made it into a release. By the time 2.0 hit, the bottom fell out: stat names changed, every Sandevistan product line picked up Plus and PlusPlus tiers, Militech got a second line called Apogee, and the modlist filled with newer Sandy mods doing pieces of what TDO had aimed at.

I asked brahmax in April 2026 if he'd mind me picking it up. He was glad to. The original vision still sits with him, and we've been trading notes since on which corners to keep, which to round, and what to do with the bits that were never real. TDO 2.0 is its own thing under the hood — different architecture, different stack, new features — but the feel he was going for is the goal.

## Architecture

Three layers.

**Lua / CET** — config, the Native Settings UI tree, JSON persistence, runtime stat curve calculation (linear/exponential/logarithmic across quality tiers), session lifecycle, and detection of other relevant mods (RAM Based Scanner TD, Cyberware Improved, etc.). 350+ configurable variables.

**RedScript** — anything requiring vanilla method wrapping. NPC time dilation, scanner duration, katana reflection, Sandy DOT, vehicle TD, delayed kills, quantum teleport, manufacturer-specific weapon bonuses, the Sandy reactivation grace fix, the ranged fire rate fix.

**YAML / TweakXL** — static TweakDB records. Custom Sandy items, status effects (DOT, scanning bar, malware, delayed death), custom attunements, vendor placement, the displayName rename. Codeware sits alongside as the localization registrar — `displayName` is typed as `gamedataLocKeyWrapper` in 2.x, so raw strings via `TweakDB:SetFlat` don't take. TweakXL and Codeware are both required dependencies as a result.

### File layout

```
TDO/
├── r6/
│   ├── scripts/TDO/
│   │   ├── Core/                  TimeDilationFixes, NPCTimeDilation, TimeBetweenHitsScaling
│   │   ├── Scanning/              ScanningTimeDilation
│   │   ├── Sandy/                 SandevistanDOT, KatanaReflect, KurosawaDeath,
│   │   │                          QuantumTeleport, VehicleTimeDilation,
│   │   │                          ManufacturerBonuses, PartialCharge
│   │   ├── Synergy/               ManufacturerSynergy
│   │   ├── Localization/          LocalizationProvider + Packages/English
│   │   ├── Config/                TDOConfig
│   │   └── module.reds
│   └── tweaks/TDO/                CustomSandevistans, StatusEffects, Attunements,
│                                  Vendors, phase3-rename
└── bin/x64/plugins/cyber_engine_tweaks/mods/tdo/
    ├── init.lua
    ├── CETKit/                    GameUI module pattern (modernized 2026-04)
    ├── config/, modules/, definitions/, data/
```

## Current game state (verified via WolvenKit + in-game CET logs)

### Sandevistan product lines

| Line | Vanilla display name | Base record | Tiers | Tier pattern |
|------|---------------------|-------------|-------|-------------|
| C1 | Zetatech Sandevistan | `Items.AdvancedSandevistanC1MK1` | 9 | MK1 → MK1Plus → MK2 → ... → MK4PlusPlus |
| C2 | Dynalar Sandevistan | `Items.AdvancedSandevistanC2MK1` | 9 | MK1 → MK1Plus → MK2 → ... → MK4PlusPlus |
| C3 | QianT "Warp Dancer" | `Items.AdvancedSandevistanC3MK3` | 7 | MK3 → MK3Plus → MK4 → ... → MK5PlusPlus |
| C4 | Militech "Falcon" | `Items.AdvancedSandevistanC4MK4` | 5 | MK4 → MK4Plus → MK5 → MK5Plus → MK5PlusPlus |
| C5 | Militech "Apogee" | `Items.AdvancedSandevistanApogee` | 3 | Base → Plus → PlusPlus |

Note: Apogee is Militech's second product line, not a separate manufacturer. The original 1.x design assumed Apogee was its own brand. It isn't.

### Ability distribution by line

- **Zetatech (C1)** — dur, ts, rchrg, coolBase, enterCost, attune (MK2+), bnsDmg, fallDmg, ts_Air, hwDmg_Air, headDmg_Air, weakDmg_Air, bnsDmg_Air
- **Dynalar (C2)** — dur, ts, rchrg, coolBase, enterCost, attune (MK2+), critCh, critDmg
- **QianT (C3)** — dur, ts, rchrg, coolBase, attune, enterCost, mitCh, mitStr, elemRes, thRes, chRes, elRes
- **Militech Falcon (C4)** — dur, ts, rchrg, coolBase, killDur, enterCost, attune, critCh, critDmg, bnsDmg, killHeal
- **Militech Apogee (C5)** — dur, ts, rchrg, coolBase, killDur, enterCost, attune, critCh, critDmg, headDmg, killStam

`BaseStats.AttunementHelper` is absent from the lowest tiers of C1/C2 (MK1, MK1Plus) but present on all MK2+ tiers of those lines and all tiers of C3/C4/C5. The curve system handles this naturally — abilities absent from early tiers don't apply there.

### Sandy record structure

Each Sandy carries `statModifiers` (HasSandevistan, Duration, TimeScale, RechargeDuration, CooldownBase, EnterCost, AttunementHelper), `OnEquip` GameplayLogicPackages with UIData and conditional effectors via `ApplyStatGroupEffector` + `TimeDilationPSMPrereq`, `objectActions` (UseSandevistan, DisableSandevistan, UseCorruptedSandevistan, DisableCorruptedSandevistan), `cyberwareType: Sandevistan`, and the `Attunements.ReflexesSandyProlong` attunement (Reflexes × 0.1 → bonus Duration).

### New stats since 1.6

- `TimeDilationSandevistanCooldownBase` — base cooldown value
- `TimeDilationSandevistanEnterCost` — charge cost on activation (negative value)
- `AttunementHelper` — scaling stat tied to Reflexes
- `SandevistanCharge` stat pool — charge-based activation system

### Other cyberware

- **Synaptic Accelerator** — `Items.AdvancedSynapticAcceleratorCommon` etc., `cyberwareType: SynapticAccelerator`
- **Reflex Recorder** (was "Reflex Tuner" in 1.6) — `Items.AdvancedReflexRecorderCommon` etc., `cyberwareType: ReflexRecorder`

---

## Phase 1 — Lua core modernization (shipped)

**1.1 CETKit update.** Replaced the 2021 psiberx GameSession.lua with a modern GameUI module pattern. Cron.lua and GameSettings.lua are still fine, kept as-is.

**1.2 Tier system update.** Base records in sandyData.lua are still valid. Ability discovery handles Plus/PlusPlus tiers (double the tiers per line). CurveCalc spans more indices now — C1 has 9 tiers instead of 4.

**1.3 New stat support.** Added CooldownBase, EnterCost, AttunementHelper to abilityData.lua. Handle `Attunements.ReflexesSandyProlong` in OnEquip discovery.

**1.4 Config migration.** Bumped config version. New ability keys for new stats. Missing entries handled gracefully for existing 1.x users. Keys for all the new features added (NPC TD, scanning, DOT, etc.).

In-game verification: 9/9/7/5/3 tier discovery, all new stats found, NUI menu populated, `[TDO] Initialized!`.

## Phase 2 — Bug fixes & QoL (shipped)

**2.1 Sandy reactivation grace period.** Vanilla `SandevistanDecisions.EnterCondition` never checks the `SandevistanDeactivationTimeStamp` that `SandevistanEvents.OnExit` writes. This lets the player waste an activation by re-triggering Sandy during the ease-out phase. Kerenzikov has the equivalent 0.10s grace check at `KerenzikovDecisions.EnterCondition:255-259`. Sandy doesn't. The fix wraps `SandevistanDecisions.EnterCondition`, compares `scriptInterface.GetNow()` against `SandevistanDeactivationTimeStamp + 0.10`, returns false if still inside the grace window.

(Original 1.x mod page described this as the "Synaptic Accelerator / Reflex Recorder fix." Research showed SA/RR don't appear in the Sandy state machine at all — the actual bug is the missing grace period check. Renamed accordingly.)

**2.2 Ranged weapon fire rate during Sandy.** CDPR's `WeaponTransition.CalcCycleTimeDeltaFactor` (weaponTransitions.swift:169-181) partially compensates weapon fire rate during Sandy, but dampens the compensation through `ProportionalClampF(1.0, 2.0, cycleTime, 0.5, 0.9)`. Fast weapons (SMG/rifle/LMG) get about 50% of the compensation they need; slow weapons get about 90%. Net: every weapon fires noticeably slower than real time during Sandy.

The fix wraps `WeaponTransition.CalcCycleTimeDeltaFactor`, returns flat `1.0 / globalTimeDilation` when Sandy is active. Restores the 2022 TDO power fantasy: dilated world, undilated firearms. One wrap covers semi/full/burst/charge modes since this is a base-class method shared by all shoot states.

### Dropped / deferred from Phase 2

- **TimeBetweenHits scaling** — moved to Phase 6. The unified TD principle established 2026-04-19 (entities in their own TD fire at real-time; frozen entities can't hit a dilated observer) means the original Phase 2 implementation (scale when target is the player in TD) had it backwards — it let frozen NPCs land hits on a Sandy'd player. Correct semantics belong with the NPC-side TD logic in Phase 6.
- **Sandy buff cleanup** — dropped. CDPR already handles this at `SandevistanEvents.OnExit:217` via `StatusEffectHelper.RemoveAllStatusEffectsByType`.
- **Loot container TD fix** — deferred. Needs in-game reproduction to characterize current behavior before committing to a fix.

## Phase 3 — Manufacturer rethink: rename + stat curve differentiation (shipped)

### 3.1 Rename slate

| Line | Vanilla name | New name | Notes |
|------|--------------|----------|-------|
| C1 | Zetatech Sandevistan | **Zetatech "Shrike" Sandevistan** | Model name added to all 9 tiers. Identity: reliable entry-pro, ranged-speed focus. |
| C2 | Dynalar Sandevistan | **Dynalar "Tanto" Sandevistan** | Model name added to all 9 tiers. Identity: chromed katana specialist — melee kill extension (5.3) + block mitigation (5.4) + boosts katana reflect (5.5) when C2 equipped. |
| C3 | QianT "Warp Dancer" | unchanged | brahmax: "pretty much fine." |
| C4 | Militech "Falcon" | unchanged | Identity minor rework via stat curves + 5.7 weapon-type bonuses. |
| C5 | Militech "Apogee" | unchanged | Premium top-tier. |

### 3.2 Stat curve differentiation

Per-line identity profile (HIGH / MODERATE / LOW relative to lineup):

| Line | TS (TD depth) | Duration | Recharge | Vibe |
|------|---------------|----------|----------|------|
| Shrike | MODERATE (30) | SHORT–MOD (6.6→9.9) | FAST (35→15) | Pop it often, on-and-off |
| Tanto | MODERATE (50) | MOD (8.8→9.9) — extends via 5.3 kill ext | MOD (50→25) | Commit to engagement, rewarded by melee kills |
| Warp Dancer | **VERY HIGH (85)** | LONG (8.8→11) | SLOW (80→45) | Glass cannon — deepest TD, long downtime |
| Falcon | MODERATE (50) | MOD–LONG (9.9→11) | MOD (45→30) | Balanced generalist; shines with 5.7 synergy |
| Apogee | HIGH (80) | LONG (9.9→11) | MOD (35→25) | Above-average everywhere, earned via rarity |

Two corrections from Phase 1: Warp Dancer's TS was 20 (weakest TD in the lineup) — fixed to 85 (deepest TD), matches its glass-cannon identity. Apogee's duration was 6.6/6.6 (shortest in the lineup) — fixed to 9.9→11, matches what an elite tier deserves.

Numeric values live in `bin/x64/plugins/cyber_engine_tweaks/mods/tdo/config/nUIDefaults.lua` and the matching `userConfig.lua` (byte-identical — new installs pick up the tuned defaults automatically).

### 3.3 Implementation stack

Original plan was raw-string `TweakDB:SetFlat` from CET Lua. In-game testing proved `displayName` is typed as `gamedataLocKeyWrapper` in 2.x; raw strings fail with `[TweakDB::SetFlat] Failed to convert value... Expecting: gamedataLocKeyWrapper`. Pivoted mid-implementation to the proven MBN + Merc Protocol stack:

- `r6/scripts/TDO/Localization/LocalizationProvider.reds` — Codeware `ModLocalizationProvider` subclass
- `r6/scripts/TDO/Localization/Packages/English.reds` — text entries for `Item-TDO-C1Shrike-Name` and `Item-TDO-C2Tanto-Name`
- `r6/tweaks/TDO/phase3-rename.yaml` — TweakXL overrides `displayName` on all 18 tiers to reference the Codeware-registered keys

### 3.4 Side-effect fix landed with Phase 3

Phase 1's tier-discovery loop (`sandys:AddExistingProductLine`) was gated inside `if nativeSettings ~= nil`, meaning users without Native Settings UI had an empty `sandys.sandys` table. Didn't surface until Phase 3's downstream iteration silently no-op'd for those users. Moved the loop out of the conditional at `init.lua:109-113` (commit `5d95d4c`) — discovery now runs unconditionally, matching Phase 1's architectural intent.

Pre-existing residual: `sandys:ProcessAllAbilities(config)` still sits inside the `nativeSettings` gate, so users without NSS get the displayName rename but NOT the stat curve retunes. Pre-existing TDO defect, not Phase 3's responsibility. Flagged for Phase 4+ if the NSS assumption changes.

## Phase 4 — Custom Sandevistans (shipped)

### 4.1 Zetatech "Valkyrie" — new C1 top-tier variant

`$base: Items.AdvancedSandevistanC1MK4PlusPlus`. Enhanced ranged attack speed and reload speed during TD. Custom attunement: Reflexes → attack speed bonus. Slots above vanilla C1MK4PlusPlus as a prestige variant.

### 4.2 Militech "Kestrel" — new Militech variant, distinct from Falcon and Apogee

`$base: Items.AdvancedSandevistanC4MK5PlusPlus`. Mid-weight Militech with Power/Tech weapon focus, complementing vanilla Falcon's balanced approach. Power weapon ricochet bonus, Tech weapon charge speed bonus during TD. Custom attunement: Technical → weapon type damage bonus.

### 4.3 Raven "Fusillade" — new manufacturer line

Full new item record, `cyberwareType: Sandevistan`. Removes fire rate safety limits (maximum mechanical fire rate). Very high TD strength, very short duration. Custom attunement: Reflexes → fire rate scaling. Has to play nice with Melee Attacks Fixes & Enhancements' attack speed scaling.

### 4.4 Fuyutsuki "Kurosawa" — new manufacturer line

Full new item record. High TD strength. On melee hit during TD, marks target with "Kurosawa Mark" status effect. On TD exit, marked targets receive lethal damage after a 1.5s delay (delayed death animation). Custom attunement: Reflexes → melee damage during TD. Reference: Merc Protocol's Phantom Slash for TargetingSystem patterns.

### 4.5 MoorE "Quantum" — new manufacturer line

**Base Quantum** (level 10, available at the same tier as other vanilla Sandys). Activation freezes time, shows waypoint UI for course plotting. Teleport to destination via `TeleportationFacility.Teleport` (Void Systems pattern from Sogimsu). Apply "Quantum Malware" to NPCs within radius (slows their cyberware). Passive dodge chance bonus outside TD. Custom attunement: Cool → malware duration/strength. Clone spawning patterns from Sogimsu + StaticEntitySystem.

**Advanced Quantum** (higher-level variant, per brahmax). Two-charge system, WoW-style: each charge has its own cooldown, charges regenerate independently, can be used back-to-back. No visible charge bar — pure RedScript counter on PlayerPuppet, no UI. Pattern reference: Black Budget "Graviton Palm PL" (`Items.BackblastProjectileLauncher`) — wraps `BaseChargesStatListener.OnStatPoolValueChanged`, uses an `@addField` lock flag + `DelayCallback` pattern to prevent recursion. The stat-pool mechanism gives independent-CD behavior; Graviton's bonus-grant trick is NOT reused (we want clean separate CDs, not doubled regen speed).

Implementation: pure RedScript fields on PlayerPuppet (`m_quantumChargeCount`, `m_quantumChargeRegenTimer[2]`). Wraps `UseSandevistanAction.StartAction()` (same hook point Void Systems uses for Sogimsu) — if Advanced Quantum is equipped, check the charge counter, consume one on activation, reject if 0. Regen logic via DelaySystem tick callback. Custom targeting reticle deferred (brahmax: "w/e on that") — revisit during Phase 9 implementation.

### 4.6 Vendor placement

Each custom Sandy available at specific ripperdoc vendors. YAML vendor records with LocKey descriptions. Six placements total. Codeware localization extended to 22 keys.

### Custom Sandy summary

| Item | Manufacturer | Base | Key abilities | Attunement |
|------|--------------|------|---------------|------------|
| Valkyrie | Zetatech (existing) | C1MK4PlusPlus variant | Enhanced ranged attack speed/reload | Reflexes → atk speed |
| Kestrel | Militech (existing) | C4MK5PlusPlus variant | Power/Tech weapon bonuses | Technical → weapon dmg |
| Fusillade | Raven (new) | New line | Max fire rate, extreme TD, short dur | Reflexes → fire rate |
| Kurosawa | Fuyutsuki (new) | New line | Delayed kill on melee, high TD | Reflexes → melee dmg |
| Quantum | MoorE (new) | New line | Teleport, malware, passive dodge | Cool → malware |

Generic +Crit Chance/Damage conditional bonuses ship with Phase 4; manufacturer-specialty mechanics (Fusillade fire rate uncapping, Kurosawa delayed kill, Quantum teleport) are deferred to Phase 5/9 where they belong with the rest of the combat layer.

---

## Phase 5 — Sandevistan combat features (planned)

**5.1 Sandy DOT.** Status effect applied during Sandy TD. `ModifyStatPoolValueEffector` drains health per tick on a 1s interval through DelaySystem (pattern from Black Chrome's PoolSystem). Damage based on resting health (base max HP, no temp HP buffs). Scales with TD strength: stronger TD = more DOT. Attunement mitigates linearly:

```
dot = baseDOT * (1 - attunement / maxAttunement)
```

Max-attunement Sandy = 0 DOT. Min-attunement (tiers without `AttunementHelper` — C1MK1, C1MK1Plus, C2MK1, C2MK1Plus) takes the full `baseDOT` hit. Configurable threshold below which no DOT applies. Everything NUI-exposed.

**5.2 Sandy VFX grading.** Below a TD strength threshold, mild screen effect. Above it, full blue screen effect. Threshold configurable via NUI. E3 2019 Lighting Mod compat: legacy `sandyVFX.vfxOption` had an auto-flip from option 1 to 2 when `ModArchiveExists("E3_2019.archive")` was true — reintroduce equivalent behavior here. Pairs with the "no blue screen while driving" toggle (8.4) so vehicle Sandy reads visually distinct.

**5.3 Dynalar kill extension (C2 specific).** `SandevistanKillRechargeValue` already exists as a vanilla stat. Tanto restriction: only MELEE kills extend duration, not all kills. Wrap kill detection, check weapon type, conditionally apply the extension.

**5.4 Dynalar block mitigation (C2 specific).** During TD with a bladed weapon blocking, increased damage mitigation. Stamina drain on resting-stamina basis. Reference: Easier Counter Attack's `MeleeDeflectDecisions` hook.

**5.5 Katana bullet reflection ("Jade Fox" tier).** Intercept incoming ranged damage while blocking with a katana during TD. Redirect at the current target. Stamina drain per reflection (resting-stamina basis). Options: katana-only vs katana+mantis blades, TD-only vs always. Hook: `MeleeDeflectDecisions.EnterCondition` for the timing window. Damage intercept comes from wrapping the ranged-damage-on-blocking-player path.

**5.6 Zetatech / Raven ranged weapon boost.** During TD with a C1 Sandy equipped, increased ranged attack speed and reduced reload time. Raven Fusillade goes further — removes ALL fire rate limits. Has to coexist with Melee Attacks Fixes & Enhancements; same scaling approach (divide timing values by speed multiplier).

**5.7 Militech weapon type bonuses.** During TD with a C4 Sandy equipped, conditional bonuses based on weapon evolution type:
- Power → ricochet count and damage bonus
- Tech → charge speed bonus
- Smart → tracking accuracy bonus

## Phase 6 — NPC time dilation (planned)

Unified TD principle (established 2026-04-19): an entity in its own time dilation operates at real-time rate; an entity not in TD operates at dilated (slowed) rate relative to a dilated observer. Drives both 6.2 (relative speed scaling) and 6.3 (hit timing reintroduction from former Phase 2.2).

**6.1 NPC Sandy / Kerenzikov detection.** On player Sandy activation, scan nearby hostiles. Check `HasKerenzikov`, `HasSandevistan` stats. Each NPC cyberware variant has an assigned TD strength value.

**6.2 NPC individual time dilation.** Use `TimeDilationHelper.SetIndividualTimeDilation()` per NPC (only those with their own Sandy/Kerenzikov). NPC TD strength < player → moves faster than frozen NPCs but slower than normal. NPC TD strength > player → moves FASTER than normal (dangerous; brahmax specifically wanted this on the table). Only applies to enemies who have noticed the player.

**6.3 Shooter-in-TD hit timing.** Wraps `TargetShootComponent.CalculateTimeBetweenHits` — scale cooldown when the SHOOTER is in TD, not when the target is the player in TD (which is what the original Phase 2 attempt did and got backwards). Frozen NPCs get no compensation, so they can't land shots on a dilated player. NPCs in their own TD via 6.2 get compensation, so they fire at real-time rate, mirroring the player's 2.2 fire rate fix.

Implementation note: `TargetShootComponent` is attached to the target, not the shooter. The wrap needs access to shooter identity via the `TimeBetweenHitsParameters` struct or the calling call-site. If params don't carry shooter, wrap `ShouldBeHit` (targetShootComponent.swift:277-282) instead — the weapon/owner chain is accessible there. Resolved during implementation.

**6.4 Is CDPR's 2.x relative-TD claim actually working?** brahmax: "CDPR said they implemented this in 2.0 but I can't help but feel they screwed it up. Feels wrong somehow." Investigation task gating 6.2 implementation: instrument vanilla via LogChannel, check whether `TimeDilationHelper.SetIndividualTimeDilation` is invoked on NPCs with their own Sandy/Kerenzikov during a player Sandy. If CDPR's system works, Phase 6 becomes a thin layer tuning the scaling curve. If it doesn't, build from scratch.

**6.5 Drone Companion support.** Detect Drone Companion mod entities. Apply appropriate TD scaling to friendly drones.

**6.6 Phoenicia compatibility surface.** Phoenicia's in-development mod makes NPCs trigger their Sandy offensively on combat triggers (gap-close, low HP, melee defense) with CD/duration limits. Her work is complementary to Phase 6 — she provides activation triggers, we provide relative-speed and hit-timing scaling once NPCs are in TD.

Integration model: TDO Phase 6 exposes NPC TD scaling as the "when an NPC is in TD, make them fire/move at real-time rate" layer. Phoenicia's mod provides "when should an NPC enter TD" triggers. Both ship independently — TDO works without hers (frozen NPCs miss, only Sandy'd NPCs scale), her mod works without ours. Reach-out to Phoenicia: defer until Phase 6 code is written and the hook API is concrete. Don't pre-commit API before there's something to show.

## Phase 7 — Scanning time dilation (planned)

**7.1 Duration bar system.** Custom UI widget: green bar below the stamina bar. Decays while scanning TD is active. Recharges when scanning TD is inactive. Depleted = scanning TD blocked until fully recharged.

**7.2 Intelligence scaling.** Base duration scales with player Intelligence stat. Higher Intelligence = longer scanning TD, faster recharge. Netrunner suit quality provides a bonus.

**7.3 RAM Scanner TD compatibility.** Detect if RAM Based Scanner Time Dilation is installed. If installed: TDO handles duration bar/depletion, RBSTD controls TD strength. If not: TDO handles everything (bar AND TD strength).

**7.4 Streaming distance caveat.** brahmax flagged a range bug: "ran into that same bug with range that MBN did, so prob fixable." Root cause: Cyberpunk despawns world entities at ~60m from the player. For MBN this unlinked device/network logic, causing breached networks to "forget" their state on re-approach. Same risk for scanner TD if the effect reaches past 60m — targets become streamed-out stubs with no state.

Mitigation: clamp scanning TD effect range to <60m. If a longer-range use case emerges, fall back to per-target state caching keyed by EntityID, rehydrated when the entity streams back in.

## Phase 8 — Vehicle time dilation ("Herbie") (planned)

Original 2022 TDO used Sandy fragments as the trigger. 2.x has no fragments. New trigger: detect the **car Sandy perk** (TweakDBID to be hunted via WolvenKit when this phase arrives — not blocking Phase 8 start, but the exact perk path needs confirmation). If the perk is owned, Herbie is available. Toggleable via config to let players pick this over CDPR's vanilla vehicle TD.

brahmax on why this matters: "probably what i miss the most... obviously there's no more sandevistan fragments or attachments, so would do implementation of if the player has the car sandevistan perk, apply the feature."

**8.1 Vehicle TD activation.** Wrap the vehicleTransition that disables Sandy in vehicles. Skip the disable if the player has the car Sandy perk AND Herbie is enabled in config. Reference: `vehicleControlFocusModeTimeDilation` profile.

**8.2 Charge mechanic — scales with equipped Sandy rarity.** Vehicle TD uses a charge system (not duration-based). Charge depletes while active, recharges while inactive. Effect rarity tier scales with the equipped Sandy's tier — brahmax: "differ the rarities of how it applied before with fragment generally depending what rarity sandevistan the player has." Stronger Sandy equipped → stronger Herbie charge capacity / effect strength / duration. Configurable charge rate and max charge via NUI.

**8.3 Vehicle weapon compatibility.** Make sure all weapon types work during vehicle TD. Reference: drive-by mods' tag-append pattern for weapon enablement.

**8.4 VFX synergy with 5.2.** brahmax called this out specifically — the "no blue screen while driving" toggle pairs with Herbie, makes in-car Sandy visually distinct from on-foot Sandy. Document as a co-feature in both phases' NUI groupings.

**8.5 Open hunt — car Sandy perk TweakDB path.** Not decided at design time. Will be hunted via WolvenKit when Phase 8 implementation begins. Possible candidates to verify: `NewPerks.VehicleSandevistan*`, `Vehicles.SandyDriving*`, or a new 2.x perk added post-2022. User confirmed this can be deferred.

## Phase 9 — Quantum teleport & malware (planned)

**9.1 Teleport course plotting.** On Quantum Sandy activation, near-full time freeze. Player plots a waypoint (reuse existing waypoint/ping UI patterns). On confirm, teleport to destination via `TeleportationFacility.Teleport`.

**9.2 Malware application.** On teleport arrival, broadcast Quantum Malware to NPCs within radius. Status effect underclocks target cyberware (reduces their TD capability). Duration configurable.

**9.3 Passive dodge bonus.** While Quantum is equipped (not active), small dodge chance increase. OnEquip stat modifier in YAML.

## Phase 10 — New systems (planned)

**10.1 Partial charge activation.** Allow Sandy activation at reduced charge for reduced duration / effectiveness. Minimum charge threshold configurable (default ~25%). Duration scales linearly with charge level. Adds tactical depth to charge management.

**10.2 Custom attunements (YAML).** Each custom Sandy gets a manufacturer-appropriate attunement:
- Valkyrie (Zetatech) — Reflexes → ranged attack speed
- Kestrel / Falcon (Militech) — Technical → weapon type bonuses
- Fusillade (Raven) — Reflexes → fire rate scaling
- Kurosawa (Fuyutsuki) — Reflexes → melee damage during TD
- Quantum (MoorE) — Cool → malware duration/strength

Pattern: `CombinedStatModifier` with `refStat` and `multiplier`.

**10.3 Manufacturer synergy system.** Detect full manufacturer sets across cyberware slots. Same-manufacturer cyberware provides synergy bonus. Bonuses: small stat increases (2-5%) per matching piece. Reference: Raven Gemini II's interlink rating approach.

---

## External mod compatibility

### Required dependencies

| Dependency | Since | Use |
|------------|-------|-----|
| **Codeware** | Phase 3 | `ModLocalizationProvider` for `displayName` text (`Item-TDO-*-Name` keys). Phase 4+ custom Sandy item records register names/descriptions here. |
| **TweakXL** | Phase 3 | YAML-driven TweakDB overrides under `r6/tweaks/TDO/`. Phase 3 used it for vanilla record `displayName` flats. Phase 4+ uses it for full custom Sandy records ($base inheritance, custom statModifiers, etc.). |

### Compatibility strategies

| Mod | Strategy |
|-----|----------|
| RAM Based Scanner TD | Detect via `GetMod()`, defer TD strength control if present |
| Cyberware Improved | Detect, skip overlapping Kerenzikov stats if present |
| Melee Attacks Fixes | Use the same attack speed scaling approach for fire rate mods |
| CyberwareEX | Standard equipment slots, no conflict |
| Merc Protocol | Coordinate Evasion Streak + Sandy (same author controls both) |
| Overclock Overheat | Different TD source, no conflict |
| Black Chrome | No overlap, reference PoolSystem pattern |
| Drive-by mods | Make sure vehicle TD doesn't break weapon tags |

## Build order

Phases 1-4 are shipped and verified in-game. Each phase is independently testable.

1. **Phase 1** — Lua core modernization. Done 2026-04-08. 9/9/7/5/3 tier discovery, all new stats found, NUI menu populated.
2. **Phase 2** — Sandy grace period + ranged fire rate fix, both verified in-game. TimeBetweenHits scaling moved to Phase 6 per the unified TD principle. Sandy buff cleanup + loot container dropped/deferred.
3. **Phase 3** — C1 renamed to Zetatech "Shrike", C2 to Dynalar "Tanto" via Codeware + TweakXL. Per-line stat curves retuned. C3 Warp Dancer TS corrected from the Phase 1 anomaly (20 → 85). Apogee duration corrected (6.6/6.6 → 9.9→11). C3/C4/C5 names unchanged.
4. **Phase 4** — 5 custom Sandys + 6 ripperdoc vendor placements. Codeware localization at 22 keys. Advanced Quantum two-charge system via the `SandevistanCharge` pool listener + stack-based UI buff tied to actual `TimeDilationSandevistanRechargeDuration`. Generic +Crit Chance/Damage conditional bonuses; manufacturer-specialty mechanics deferred to Phase 5/9.
5. **Phase 5** — Sandy combat features (DOT with attunement scaling, VFX grading, kill extension, block, reflect, weapon bonuses).
6. **Phase 6** — NPC time dilation: unified TD principle (relative speed + shooter-in-TD hit timing). Phoenicia compat integration point.
7. **Phase 7** — Scanning time dilation + RBSTD compatibility + 60m streaming distance clamp.
8. **Phase 8** — Vehicle time dilation: car Sandy perk trigger, rarity-scaled effect, VFX synergy with 5.2. Perk TweakDB path TBD.
9. **Phase 9** — Quantum teleport + malware + advanced two-charge variant.
10. **Phase 10** — Partial charge, custom attunements, manufacturer synergy.

Phases 1-3 give a working mod. Phases 4-5 add the meat. Phases 6-10 are the ambitious features.

## Reference mods (proven patterns)

| Pattern | Source mod | File |
|---------|------------|------|
| Teleport + TargetingSystem | Merc Protocol | `perk_reflexes.reds` (Phantom Slash) |
| DelaySystem tick callbacks | Black Chrome | `PoolSystem.reds` |
| Attack speed scaling | Melee Attacks Fixes | `MeleeTransition.GetAttackDataFromState` |
| Deflect timing hooks | Easier Counter Attack | `MeleeDeflectDecisions` |
| `TeleportationFacility` | Void Systems | `Sogimsu.reds` |
| `StaticEntitySystem` spawning | Void Systems | `Sogimsu.reds` |
| Scanner TD manipulation | RAM Scanner TD | `scanner.reds` |
| Vehicle weapon tags | Drive-by mods | tags append pattern |
| NUI integration | Much Better Netrunning | `nativeSettingsUI.lua` |
| Gravity during TD | Enhanced Air Kerenzikov | `AirKerenzikov.reds` |
| Two-charge stat pool | Black Budget | `BackblastProjectileLauncher` (Graviton Palm PL) |

## Credits

brahmax (original TDO 1.x author) — authoritative on what 2022 TDO felt like. Drove the Phase 3 rename direction, the MoorE double-charge design, Sandy DOT attunement mitigation, the car Sandy perk model, the Phoenicia collaboration framing, and the streaming range caveat for Phase 7.

Phoenicia (in-development NPC offensive Sandy mod) — complementary scope. Phase 6 is the "when in TD, behave real-time" layer; her mod is the "when to enter TD" trigger layer. Reach out once Phase 6 hooks are concrete.
