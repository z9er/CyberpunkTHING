# Net Hound × Much Better Netrunning — fix breakdown (handoff notes)

Written for the mod author. Section 1 is the diagnosis (solid). Section 2 is the
**proof-of-concept that is currently shipping and works**. Section 3 is the
**recommended "proper" implementation** now that MBN's real API
(`NetrunnerUtils`, `PerformNPCBreach`) has been reviewed.

---

## 1. Root cause

Net Hound fired a vanilla-style RemoteBreach (`QuickHack.NetHoundRemoteBreach`,
`actionName: RemoteBreach`) via `ApplyQuickhackEffector`. Under MBN this hits
nothing: MBN removes vanilla remote breach, and unlock state is no longer the
vanilla `IsBreached` flag.

NPC quickhack access is gated by MBN's **breach registry, keyed by position**
(`BreachRegistrySystem.reds`):

```reds
public final const func IsPersonnelBreachedNearPosition(pos: Vector4, radius: Float) -> Bool {
  return this.IsSubnetBreachedNearPosition(pos, radius, 1);   // subnet 1 = personnel
}
```

`IsSubnetBreachedNearPosition` looks for a recorded personnel breach whose stored
position is **non-zero** and within `radius` (2D). `radius` =
`BetterNetrunningSettings.AccessPointNetworkRadius()` (50m). A zero-position row is
skipped. So the requirement is: *record a personnel breach, at a real position,
within 50m of the NPC.*

The dart's ping + memory-wipe always worked because those are separate
`AddStatusEffectToAttackEffector`s; only the breach effector was dead.

---

## 2. Proof-of-concept (currently shipping, verified working)

### YAML — fire a detectable marker instead of the dead RemoteBreach

`Items.SnifferDartWeaponModAbility`:

```yaml
    -   $type: AddStatusEffectToAttackEffector
        prereqRecord: Prereqs.AimedHeadshotFromStealthCanBreach
        statusEffect: BaseStatusEffect.SJ_NetHoundBreachTrigger
        applicationChance:
        -   BaseStats.AlwaysApplyChance
```

```yaml
BaseStatusEffect.SJ_NetHoundBreachTrigger:
    $type: StatusEffect
    statusEffectType: Neutral
    duration:
        statModifiers:
        -   $type: ConstantStatModifier
            statType: BaseStats.MaxDuration
            modifierType: Additive
            value: 0.1
    gameplayTags:
    -   SJ_NetHoundBreach
    uiData: None
```

### redscript — catch the marker, write the registry at the NPC position

```reds
@wrapMethod(NPCPuppet)
protected cb func OnStatusEffectApplied(evt: ref<ApplyStatusEffectEvent>) -> Bool {
  let result = wrappedMethod(evt);
  if ArrayContains(evt.staticData.GameplayTags(), n"SJ_NetHoundBreach") {
    NetHoundBreach.BreachNPCNetwork(this);
  }
  return result;
}
```

```reds
// personnel-only flags, then:
registry.RecordBreach(deviceLink.GetID(), flags, now, npcPos);   // npcPos = npc.GetWorldPosition()
```

This works, but it takes two shortcuts (addressed in Section 3): it keys the
registry row by the **device-link ID** rather than a real AP, and it never grants
breach XP.

---

## 3. Recommended "proper" implementation

Now that `NetrunnerUtils` and `PerformNPCBreach` have been reviewed, there are two
clean options. Both still use the marker-SE trigger from Section 2 — only the body
of `BreachNPCNetwork` changes.

### Option B (most faithful — one call): drive MBN's own NPC breach

`PuppetDeviceLinkPS.PerformNPCBreach` is MBN's real entry point. It resolves the AP
(wired → deviceLink AP → nearest by proximity via
`NetrunnerUtils.GetNearestAccessPointBreachStatus`), queues the real
`NPCBreachEvent`, grants XP through `RecordBreachNPCForXPFix` (which is
`private static` and reachable no other way), and restores grapple interactions.

```reds
@wrapMethod(NPCPuppet)
protected cb func OnStatusEffectApplied(evt: ref<ApplyStatusEffectEvent>) -> Bool {
  let result = wrappedMethod(evt);
  if ArrayContains(evt.staticData.GameplayTags(), n"SJ_NetHoundBreach") {
    let ps = this.GetPuppetPS();
    if IsDefined(ps) {
      let link = ps.GetDeviceLink();
      if IsDefined(link) {
        link.PerformNPCBreach(HackingMinigameState.Succeeded);
      }
    }
  }
  return result;
}
```

**One thing to verify before choosing B:** in the normal game flow
`PerformNPCBreach` is called from `ScriptedPuppet.OnAccessPointMiniGameStatus`
*after* a breach minigame has populated the `HackingMinigame` blackboard. The AP's
`NPCBreachEvent` handler was not reviewed here, so confirm it unlocks the personnel
subnet on its own and does not read stale `ActivePrograms`/`HackingMinigame.Entity`
state. If it does depend on that, set the blackboard's breach-target entity to the
NPC first, or use Option A. Also note B unlocks **personnel** (that's what an NPC
breach means in MBN) — it is not subnet-selectable the way the PoC is.

### Option A (subnet-explicit, verified model): resolve the real AP, then record

Keeps full control over which subnet unlocks (Net Hound = personnel only) and fixes
the device-link-ID shortcut by resolving the real AP the same way MBN does:

```reds
let radius = BetterNetrunningSettings.AccessPointNetworkRadius();
let ap = NetrunnerUtils.GetNearestAccessPointBreachStatus(npc, radius);   // wired OR proximity

let flags: BreachUnlockFlags;
flags.unlockPersonnel = true;   // basic/surveillance stay false

if IsDefined(ap) {
  // ap was found within `radius` of the NPC, so recording at the AP's own
  // position still satisfies IsPersonnelBreachedNearPosition(npcPos, radius).
  let apEntity = ap.GetOwnerEntityWeak() as GameObject;
  let apPos = IsDefined(apEntity) ? apEntity.GetWorldPosition() : npc.GetWorldPosition();
  ap.m_betterNetrunningUnlockTimestampPersonnel = now;
  ap.ForcePersistentStateChanged();
  registry.RecordBreach(ap.GetID(), flags, now, apPos);
  ap.PropagateUnlockToNearbyAccessPoints(flags, now);
} else {
  // No AP in range at all. MBN's own systems can't breach this NPC either;
  // the device-link-keyed record is a Net-Hound-specific allowance. Drop this
  // branch if Net Hound should respect MBN's "must be near an AP" rule.
  registry.RecordBreach(npc.GetPuppetPS().GetDeviceLink().GetID(), flags, now, npc.GetWorldPosition());
}
```

`NetrunnerUtils` lives in module `BetterNetrunning.ColdWar`, so Option A needs
`import BetterNetrunning.ColdWar.*`.

### Recommendation

Use **Option B** if a Net Hound breach should be indistinguishable from a normal
NPC breach (XP included) and the `NPCBreachEvent` handler check passes. Use **Option
A** if you want to keep it strictly personnel-only and independent of minigame
blackboard state — it's the closest verified match to the shipping PoC, minus the
device-link shortcut.

---

## 4. Cleanup / packaging (applies to any option)

- **Remove the `Notify(...)` on-screen messages** — they were only breach-fired
  diagnostics.
- **Hard MBN dependency:** the script imports MBN modules, so it fails to compile
  without MBN and would take down the whole redscript blob. Ship as a separate
  optional "Extra Iconics + MBN" patch, or guard/branch on MBN's presence. Do not
  fold into base Extra Iconics.
- **Marker SE:** if it ever stops applying, that's the `SJ_NetHoundBreachTrigger`
  record, not the script.
- Subnet mapping matches MBN's Overload Breach convention: NPC → personnel,
  camera/turret → surveillance, else → basic/root. Net Hound = personnel only.

## 5. MBN API reference (reviewed)

* `NetrunnerUtils.GetNearestAccessPointBreachStatus(target: ref<GameObject>, radius: Float) -> ref<AccessPointControllerPS>`
  — wired AP first (`GetAPFromPersistentState`), then nearest AP device by
  proximity (prefers an already-breached one). Module `BetterNetrunning.ColdWar`.
* `PuppetDeviceLinkPS.PerformNPCBreach(state: HackingMinigameState)` — MBN's real
  NPC-breach entry; routes `NPCBreachEvent` + XP + grapple restore.
* `BreachRegistrySystem`: `RecordBreach(apID, flags, timestamp, apPosition)`,
  `IsPersonnelBreachedNearPosition(pos, radius)`, `SUBNET_PERSONNEL()`.
* `AccessPointControllerPS.PropagateUnlockToNearbyAccessPoints(flags, timestamp)`.
* Fields: `m_betterNetrunningUnlockTimestamp{Basic,Personnel,Surveillance}` on
  `SharedGameplayPS`/AP; `m_betterNetrunningNPCUnlockTimestamp{...}` on the puppet PS.
* Not reviewed: the AP-side `NPCBreachEvent` handler (the one detail Option B
  depends on).
