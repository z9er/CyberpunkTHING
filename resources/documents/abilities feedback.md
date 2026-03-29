gas tank original description
```
When hit within melee distance of player, releases toxic cloud, that poisons / hurt player. 
When killed 5% chance of releasing it too. When not killed, getting closed to their body 
will release cloud too. Setting them on fire, shortly after they have activated their ability, 
makes them explode, and pernamently turns off their ability
```

gas tank - no real notes, i like how it works and implementation. might be nice to have a slider for how much damage it does. i particularly appreciate the nuance of it being exploitable when enemies use it and you can just set it on fire and disable the ability permanently... should abilities that have been permanently disabled show as red in scanner? just a random thought i had cuz cyberware malfunction obviously can do that too (and maybe should with these abiltiies as well, too)

aegis original description
```
"When shot at, activates for 30 seconds. Protects from 90% of bullets (smart weapons can bypass it). 
Using CC on enemy can disable this ability too. Mostly used on Drones and by netrunners. 
(alternative defense ability, for kerenzikov and tigers tattoo)
"
```

aegis - great effect, i think the idea is fun but there's a couple things that'll probably be a good change. rather than a longer cd that goes on, id rather have enemies use this more often for a shorter amount of time, because it's like a buffed up kerenzikov with a downside of smart weapons going through it. so in a menu for it, sort of like how viper used to do, would have a slider about the cd for ability and how long it lasts right, so you could do like lasts for 5 seconds then would be on a 5 second cd. i also think this might be an ability that just... happens for the enemy, even if not in combat, eg, it's like this permanent thing they've implanted in themselves so even from afar they're doing something with the weird effect pre combat, this also helps signpost to the player hey... what does this mean? this also brings to mind the thing about how do we tell players about these abilities, i know you had thought about tooltips but let's think about that later :)

banshee original description
```
When player is close, can perform Howl (can use audioware for audio sound effect?). 
Sound temporary stuns player (some visual effect), and slows them / their melee attacks for few seconds. 
/ drunk effect? Maybe buffs friendlies too?
```

I tried this on the older version and mostly just got knocked down, though to be fair i didn't have audioware, so i couldn't really tell on this one. melee didn't seem to be slower and didn't get a drunk effect. ill try on the new version later as a postscript

blood pump original description
```
Heals 75% hp over 10 seconds. Activates when under 50% hp. Long Cooldown
```

didn't seem to work when tried on old version

cryo bullets original description
```
Each bullet hit, slows player down, by 2%. Stacks to 100%, and lasts some time.
Gets cleared when player is on fire,
```
works well, and is interesting, i will say that i would be careful about giving it to too many enemies. one thing im thinking of about your fire thing is this could have a fun interaction with fire (and stuff like overclock overheat) where you take significantly less damage from fire put on during and directly after having the ice effect, so you could purposefully give yourself overclock overheat and maybe it wouldn't make you die? dunno just thinking, might be a fun collab

electric plating original description
```
Electric Plating (no explosion), but player gets shocked when hiting him, or reciving hits.
```
i mean, does what it says on the tin. good effect. seems fine. im not sure how much damage it does since im just kinda running through but maybe some sort of slider for damage of it, unless it Just stuns. 

flame armor original description
```
Enemy has burn when in combat (visible flames). 
When effect is active, they are immune to fire attacks, deal fire damage
and burn player on touch (offensive and defensive)
```
looks cool, relatively intuitive. because it confers an immunity i would be wary of making this very widespread, i think you had like one particular miniboss type dude in mind. id still add a slider for damage tho :)

flash step original description
```
Allows to teleport behind player, every X seconds.
```
this is fuckin cool. would put a slider for how many x seconds so it's configurable. would make for a very scary shotgun guy. maybe vary it so there's like one who can flash step behind you or whatever once every once in a while, or another who would do like three jumps in a row attacking each time rapidly (particularly with a shotgun that's pretty evil) not necessarily behind but also maybe to the side of you. just thinkin ;) maybe teleporting make a noise or... something to show that something happened. an effect? dunno, would be more intuitive

gorgon original description
```
When player looks them into enemies eyes, they cannot look away
(camera is locked) till enemy is killed, or player manages 
to forcefully break contact away. Add some creppy SFX and some debufs? - 
range depended / drains ram
```
im not sure i really have any notes on this. i love the red eye effect, it drains ram. i mean... pretty cool shit. i wouldn't put it on a metric ton of people but this is fun to sprinkle in. the "camera lock" is less annoying than i thought it'd be, but it's definitely like oh shit im being fucked with and make you prioritize those fuckers

husk original description
```
Enemies, with red eyes. They spawn lying on ground. 
And when player enters combat with boss, t hey come after player. 
```
i should probably test this in the area with the actual dude. didn't seem to work in scav haunt which isn't surprising. will try on new version

juice tank original description
```
constant health regen countered by poison or bleeding
```
i can't tell much about it ingame, i do see it gives some regen. I'd suggest a slider for the regen effect. I like that it has counters though :) i have one thought, pumpin up regen to about the highest it could be, and then making it where you could also counter it, or maybe permanently turn it off, by a hit to the back of the enemy. incentivizing smart counterplay even if you don't have poison or bleeding (melee stun, move around, wack em, w/e)

machine learning original description
```
When android dies with this ability, all other droids from same faction with this ability, within certain range, gets buffed /kerenzikov / sandevista /Smart weapon resistance, accuracy buff. Budf gained is random and can be stacking. Ability used only for droids.
```
haven't officially tried this yet cuz it's all scavs in this stupid haunt, but, i like the general idea, i would suggest one thing though. I would change pretty much anything smart gun related anywhere from resistance to resistance via longer lockon time (with a slider), because bullets magically missing is lame, but longer lock on (which Cannot be mitigated by ping or overclock instalock perk) is gonna actually be a better feel for player. my two cents

```
Cyber Enemies:
CE_HasAegisAbilityGroup
CEBansheeAbilityGroup
CE_BloodPumpAbilityGroup
CECryoBulletsAbilityGroup
CEElectricPlatingAbilityGroup
CE_HasFlameArmorAbilityGroup
CE_HasFlashStepAbilityGroup
CE_HasGorgonAbilityGroup
CEHuskAbilityGroup
CEJuiceInjectorAbilityGroup
CEMachineLearningAbilityGroup
CEMedusaAbilityGroup
CE_PainEditorAbilityGroup
CEPhoenixProtocolAbilityGroup
CEKPoisonTankAbilityGroup
CE_RadarAbilityGroup
CERadarFuckerAbilityGroup
CE_AWACSAbilityGroup
CEScavScanShieldAbilityGroup
CEScanShieldAbilityGroup
CEKSmokeTankAbilityGroup:
CESantaMuertaAbilityGroup
CEThreatDetectorAbilityGroup
CECanSpawnTurretAbilityGroup
CE_HasVoodooAbilityGroup
CE_HeBombAbilityGroup
CE_PoisonBombAbilityGroup
CE_HasHeBombDroneAbilityGroup
CE_HasBombDrone1AbilityGroup
CE_HasScannerDronesS1AbilityGroup
CE_HasCombatDronesS1AbilityGroup

Armor mod:
CE_HasAddrenalineControllerAbilityGroup
CE_HasFrontalSubdermalArmorAbilityGroup
AU_HasSubdermalArmorLowAbilityGroup
AU_HasSubdermalArmorMediumAbilityGroup
AU_HasSubdermalArmorHeavyAbilityGroup
AU_HasSubdermalArmorSuperHeavyAbilityGroup
AU_HasChemTechAbilityGroup
CENanoMatrixAbilityGroup
CE_HasScaleSubdermalArmorAbilityGroup
CESelfRepairAbilityGroup
```
