# Enemy AI — Idea Shorthand (brahmax × viper)

Distilled from the Cyberpunk 2077 DMs (Jun 2023 → Jun 2024). Covers ENC / SDO / TDO / WTNC-THING. Organized by theme, terse on purpose.

---

## 0. Design philosophy (the "why")
- **Give enemies the player's toys.** Same abilities/cyberware as the player, implemented interestingly — not everything translates (e.g. feedback circuit). (Skyrim-perks-on-enemies inspiration.)
- **New behaviors > number tweaks.** Bullet-sponge health is lazy; enemies *doing different things* is the real fix. Creative work, not just technical.
- **Difficulty = aggression + reaction speed, not staying power.** Fast incoming *and* outgoing. Low TTK both ways.
- **Kill player god-scaling.** Levels only hang perks; weapon rarity only = mod slots; damage comes from perks/attributes. Keeps enemies relevant without magic scaling.
- **Hidden resistances are bad** unless telegraphed everywhere in-game (people ignore scanner info). Prefer visible, behavioral differences.
- **Cathedral-vs-Parlor / don't reinvent the wheel.** Make your AI stuff *compatible* with others' rather than overriding everything. Modular on/off toggles per faction/enemy type.
- **"Brutal" difficulty (Shadow of War model):** keep max incoming damage but also crank player outgoing — fast & lethal both ways. This is the THING vs. boring-vanilla-plus WTNC split.
- **Multi-tier AI** (Starsector/Starfield refs) = beautiful but enormous work.

## 1. Faction-differentiated combat AI
- Three archetypes: **Reckless** (Maelstrom/Animals/Wraiths) charge from cover, little cover use, no suppressive/regroup; **Tactical** (Corpo) suppressive fire, coordinate, regroup + support; **In-between** regroup/support but no suppressive.
- Counter-argument you landed on: don't build gorgeous AI for one faction only — instead **a few unique abilities per group + general AI upgrades for everyone**. Less work, enough differentiation.
- Faction quickhack affinities: Arasaka/VDBs → system failure + synapse burnout; Maelstrom → damage hacks.
- Faction-specific berserk/sandy "types"; possibly adapting to the player's weapon/OS.

## 2. Movement, positioning & reaction speed
- **Speed up the AI action-check interval** (console-tuned ≈ 0.1–0.5s = sluggish). Faster turning, spotting, reactions. Tester + halgari: "speeding up animations would massively boost enemy capabilities" — polish out the pauses.
- Fix: slow turning while running, idling in cover, going fully static with no LOS.
- **Refined rush:** charge, but stop sprinting and start shooting once close (~12m) — don't run all the way in unless melee.
- Regroup when far from squad; walk/rush to support teammates near the player (needs cooldown).
- Strafe tactics; ambush attacks when player is behind cover.
- **Retreat / get-out-of-dodge at low HP** (the "wile e. coyote" behavior — a favorite).
- **Quick-peek from cover** (STALKER inspiration): add time dilation to rotation so they snap out of sprint to shoot; speed up peek animations. Maybe not for *all* enemies.
- Position prediction for grenade throws.
- **React to player cheese** (walling, smart-snipers): deploy vision-blocking device, bunker down, and send reinforcements after you.

## 3. Cover & suppression
- Suppressive fire + precise/aimed shots from cover.
- **Snipers pierce cover** (restore what CDPR removed) + laser telegraph, walling, instant-repeek punishment.
- Tech weapons shoot through walls/cover.
- Grenade flushing to force player out of cover — but tune it, spam gets annoying (saw 4–5 in a row).

## 4. Sandevistan enemies (major theme)
- Vanilla sandy ≈ normal enemy → make them *distinct*.
- **Differentiate by sandy tier:** higher tier = faster in time dilation; per-tier VFX (low tier smoke/fire, no wavy loop; T3 keeps original). Fix visibility so sandy enemies are seeable during dilation.
- Dodge/evade when player < 2m (makes melee harder); heavy strafing; "harass" action forcing them within ~7m.
- TDO ambition: brand-specific sandy effects (Raven etc.), different effect *types* per enemy.

## 5. Melee combat
- Enemies **block, parry, dodge** (restored katana block; mantis-blade parry pose). Counterattacks stun properly.
- **Boss melee-dodge via inserted fixed-interval dodge actions** in the moveset (fires when player attacks & <2m) — nuanced, doesn't break combos, unlike kerenzikov bullet-dodge.
- Speculative: scale player "melee skill" to crush through enemy blocks.
- **Charged jump attack** to close distance + knock down (HMG or any enemy) — needs a tell, since knockdown often = death. Variant: launch + dash-back, knock player off a building.
- Idea: charging enemy "touches" you and you fall (contact knockdown).

## 6. Netrunners & hacking
- Enemy netrunners should do more than one hack — **buff/heal teammates**: camo, sturdiness, damage resistance, heal + cleanse debuffs.
- **Quickhack conditions:** control hacks (cripple movement) at 15–50m; damage hacks keyed to player FOV/cone angle from the enemy; buff hacks require a squadmate near the player.
- Enemy netrunners can hack **teammates** (vanilla: player-only); make friendly netrunner NPCs useful too.
- Damage hacks more dangerous (synapse burnout brutal).
- **Playstyle-mirroring hacks** (aspirational, blocked by condition limits): you hack everyone → cyberware malfunction; you shotgun → cripple movement.
- **Boosted Cortex / quickhack reflection:** enemy ICE clones your hack back at you; disable only via ICEbreaker; boss-only.
- **Thicker ICE + breach puzzle** to cut higher RAM cost → skilled play (beat minigame) vs. brute-force. Only netrunners/minibosses/bosses. Configurable timers (separate for ENC bosses vs. normal access points); minigame size scales with rank.
- **Autoreloader** ability (techies never reload).

## 7. Stealth AI
- Faster detection, wider peripheral vision, sprint action to investigate bodies.
- **Body-discovery chain:** find body → comms-call animation → squad alerted → call 2 for backup → netrunner immediately traces player. (Guard against false triggers from thrown knives/distractions.)
- Enemies advance on **last-known position** (sound-based), forcing cover changes; enemies throw **recon/ping grenades** to reveal you.
- **Force enemy identification:** scanner-only, no icon — you must recognize appearances. Pair with masking ink / disabling highlight.
- Fast spotting justified lore-wise by advanced cyberware / Kiroshi.

## 8. Status effects & buffs
- Enemies lost the ability to apply status effects on player post-2.0 → **recreated via custom effectors**: Scav bleed, Wraith poison, android death-explosion on hit.
- Broken elemental DoT → use **debuffs instead**: burn → −armor (~200); shock → disable cyberdeck/quickhacks.
- Fairness twist: enemy status/DoT **can't kill you** (floor).
- **Berserk:** red-eyes + sturdiness buff + VFX as telegraph; finisher-immunity while active; bullet-ricochet idea to make berserk "real"; melee-vulnerable / bullet-resistant variant to vary playstyles (viper: hard/impossible → fall back to per-faction berserk types).
- **Buff duration rule:** short + frequent (recurs through a fight) beats long + one-time chunk. Same logic for player TDO buffs.

## 9. Reinforcements & spawns
- Reinforcement calling **reserved for elites only** (VC called it far too often). Drone reinforcements (from CP:Online). Mission-specific, not every open-world NPC.
- Custom AV spawns (spawned different units + Smasher in 5-star AVs); world-editing to add enemies to boss arenas (unused mechs/netrunners exist).

## 10. Enemy variety & archetypes
- Add unused archetypes (Scav/Arasaka techies, corpo spec ops, centaurs). **Weakspot system** as a bullet-sponge fix without lowering HP.
- New weapons on enemies (Kyubi, Kolac, Hercules + autoreloader, Authority GL) — gated out of early game.
- **Custom AI archetypes via Lua action map** (learned from the maxtac miniboss) to avoid WKit; later, **edit behavior files directly** for complex sequences beyond TweakDB's fixed AI sequences.
- Collapsed stat tiers to normal/rare/elite/boss.
- **Armor pen per weapon** instead of flat +damage (Nekomata 90%, snipers ~75%, revolvers 50%, shotguns 25%) — counters heavy-armor player cheese without touching scaling.
- Stagger resistance as its own ability + slider; subdermal-armor tiers.

## 11. Boss design
- Target **2–4 min fights**; lower HP granularity but still lethal; distinct **phases** (separate berserk & sandy phases).
- **Per-hit damage cap on bosses (~7%)** to stop frag/hc22 one-shots — ideally a slider, not forced.
- Unique effects/anims via ent/behavior-file edits (Oda trail on Smasher, Oda backflip, etc.).
- Every boss can **temporarily deactivate player cyberware** (frequency slider). Smasher cripple/malfunction during HMG.
- **Chameleon exception** for bosses/snipers (vanilla only triggers when standing still; sandy strafing breaks it).
- Single-boss fights are inherently less rich than an org-crime "tapestry" → add **reinforcements/adds** for interest.
- Community hook: "first to beat Smasher on very hard, no cheats, wins a prize."

## 12. Systems / wildcards
- **Expand ICE as a full system** for players *and* enemies (with tesla).
- **AI summons** — e.g. summon Alt as a VFX-only "AI entity" (Skyrim-mod inspired).
- **NPC magnet effect** — pulls the enemy's weapon away (Edgerunners-inspired).
- **Rogue-AI enemies** / weird rogue-AI content (Cyberpunk vampirism, etc.).
- Nuanced **enemy armor system** (base game barely has enemy armor).
- Asset reuse for effects: repurpose unused animations (mech "missile" from a crouch anim), blue/purple/red sandy-eye VFX.

---

### One-line thesis
Make enemies fast, aggressive, and *distinct* — give them the player's abilities, telegraph the scary stuff, keep everything modular and compatible, and let difficulty come from behavior and pressure rather than health bloat.
