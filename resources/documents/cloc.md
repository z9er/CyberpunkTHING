# Chipware / Neuralware — Vendor Location Guide

*Parsed from `zzz_vendors.yaml`. Vendor IDs are decoded to Night City districts. Shop types match the map icons (ripperdoc, gun, netrunner, etc.).*

## How stocking & level gating works (read this first)

Every stock entry in the mod carries two independent settings, and they do different jobs:

- **`Vendors.Always_Present`** — the *quantity* rule. This means **guaranteed, not random**. It is not a daily roll or a chance to appear; once an entry qualifies, the chip is simply in the shop. There is no RNG to fight.
- **`generationPrereqs`** — the *gate*. A condition that decides whether the entry qualifies at all. For the tiered chips this is a level check; for the Doll Chip it's a quest check; most chips have no gate.

This splits every chip in the mod into three groups:

**1. Ungated chips — always there, any level.**
All reflex, skill, software, poser, and training chips (Sniper Training, Gun Fu, Kenjutsu, Voodoo, Rebecca, Poseur, etc.) are flatly `Always_Present` with no prereq. They exist the moment the vendor does, from level 1 onward. These have **no rarity tiers** — each is a single fixed item, so there's nothing to "roll."

**2. Rarity-tiered chips — level-gated, one rarity at a time.**
Only the Neuralware operating systems and the organ/cyberware line come in rarities (Common → Legendary). Each rarity is its **own** stock entry with its own `LootPrereqs.<rarity>CWLevelAvailabilityAtVendor` gate plus `Always_Present`. So:

- Whichever rarity your level qualifies for **will** be in stock — deterministically, guaranteed, not a chance drop.
- The gate is a **level band**, not a floor: **once you out-level a rarity, it stops showing.** You see the rarity that matches your current level, and the lower tiers drop off the shelf — you won't still find Commons late-game.
- Net effect: rarity *is* your level here. Walk into any ripperdoc and the Neuralware waiting for you is whatever tier your level currently sits in.

*(The exact player level for each band lives in a separate **LootPrereqs** file, not in this vendor file. The vendor file only names the rule. Grab that file if you want the precise level numbers per rarity.)*

**3. Quest-gated chips — the Doll Chip.**
Maiko's Doll Chip (and its cracked version) need `sq026_done ≥ 1` **and** `sq026_maiko_dead == 0` — you must have finished the Clouds questline (*Automatic Love / Pisces*) **and** Maiko must still be alive. Kill her and it's gone for good. No level component.

### Rarity coverage quirk

- **Zetatech / Dynalar / Arasaka Neuralware** → all five rarities (Common, Uncommon, Rare, Epic, Legendary).
- **Miltech Neuralware** → **Rare, Epic, Legendary only** — no Common or Uncommon exists anywhere, and it's Dogtown-only. Miltech is inherently a mid/late-game OS.
- **Organ line** (Cyber Heart, Cyber Liver, Melee Grip, Peacekeeper, Universal Blood Vessels) → all five rarities.


## The Neuralware operating systems (base ripperdoc stock)

Every **ripperdoc** below stocks these cyberware OS chips in all quality tiers (Common → Legendary), gated by your level:

- **Zetatech Neuralware** — at *every* listed ripperdoc
- **Dynalar Neuralware** — at *every* listed ripperdoc
- **Arasaka Neuralware** — at *every* listed ripperdoc
- **Miltech Neuralware** — only at the four **Dogtown** ripperdocs (Rare/Epic/Legendary only): cz_con, cz_monument (Anderson), cz_monument (Farida), cz_stadium

Two ripperdocs also carry the **organ/cyberware line** (Cyber Heart, Cyber Liver, Melee Grip, Peacekeeper, Universal Blood Vessels — all tiers — plus a Rare Poison Injector): **Anderson (Dogtown – Monument)** and **Kabuki ripperdoc #2 (Watson)**.

## By location — what each shop sells

### ?

- **Vendor** `BlackMarketer_HUB` — Black Market fixer network:
  - Aim Assist Chip, Bullet Time, Dancer, Flash And Thunderclap, Flash Step, Gun Fu, Kung Fu, Lead And Steel, Quick Draw, Quick Draw Bullets, Repudiation, Wrecking Ball

### Badlands / added district (needs its own mod)

- **Gun shop** `bls_ina_se1_gunsmith_02`:
  - Ballistic Processor Chip, Gun Fu, Kerenzikov Chip
- **Medic / pharmacy** `bls_ina_se1_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Ripperdoc** `bls_ina_se1_ripperdoc_01` — *(Neuralware OS chips only)*
- **Ripperdoc** `bls_ina_se1_ripperdoc_02` — *(Neuralware OS chips only)*
- **Gun shop** `bls_ina_se5_gunsmith_01`:
  - Miltech Infantry Chip, Sniper Training
- **Melee trainer** `bls_ina_se5_melee_01`:
  - Boxing Chip, Dancer, Doll Chip, Kenjutsu Training, Lead And Steel, Wrecking Ball

### City Center — Corpo Plaza

- **Medic / pharmacy** `cct_cpz_medic_01`:
  - Adrenaline Controller Chip, Trauma Team Chip

### City Center — Downtown

- **Gun shop** `cct_dtn_guns_01`:
  - Aim Assist Chip, Gun Fu, Hornet Chip, Hound Chip, Miltech Infantry Chip, Sniper Training
- **Medic / pharmacy** `cct_dtn_medic_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Ripperdoc** `cct_dtn_ripdoc_01` — *(Neuralware OS chips only)*

### Dogtown

- **Gun shop** `cz_con_gunsmith_01`:
  - Boxing Chip, Kenjutsu Training, Miltech Infantry Chip, Police Training, Sniper Training
- **Medic / pharmacy** `cz_con_medic_01`:
  - Adrenaline Controller Chip Cracked, Trauma Team Chip Cracked
- **Ripperdoc** `cz_con_ripdoc_01` — *(Neuralware OS chips only)*

### Dogtown — Monument

- **Ripperdoc** `cz_monument_ripperdoc_anderson` — Anderson:
  - Cyber Heart (all tiers), Cyber Liver (all tiers), Melee Grip (all tiers), Peacekeeper (all tiers), Poison Injector Rare, Universal Blood Vessels (all tiers)
- **Ripperdoc** `cz_monument_ripperdoc_farida` — Farida — *(Neuralware OS chips only)*

### Dogtown — Stadium area

- **Gun shop** `cz_stadium_gunsmith_01`:
  - Boxing Chip, Kenjutsu Training, Miltech Infantry Chip, Police Training, Sniper Training
- **Junk shop** `cz_stadium_junk_01_michal_k` — Michal K:
  - Cold Blood, Cyber Psycho Memories, Doll Chip, Drunken Fist Chip, Ninja Chip, Poseur Cool, Poseur Corpo, Poseur Tech, Rebecca Chip, Ring Master Chip, Scav Memory Chip, Tiger Claw Chip
- **Medic / pharmacy** `cz_stadium_medic_01`:
  - Adrenaline Controller Chip Cracked, Trauma Team Chip Cracked
- **Netrunner / software** `cz_stadium_netrunner_01`:
  - Adrenaline Controller Chip Cracked, Arasaka Shadow Cracked Chip, Ballistic Processor Chip Cracked, Berserk Limit Breaker Chip Cracked, Doll Chip Cracked, Encryptor Chip Cracked, Hornet Chip Cracked, Hound Chip Cracked, Jammer Chip Cracked, Kerenzikov Chip Cracked, Learning Support Cracked, Limit Breaker Cracked Chip, Memory Compression Chip Cracked, Overcharge Chip Cracked, Redudancy Loop Chip Cracked, Sanvedvistan Limit Breaker Chip Cracked, Skill Chip, Spellsword Chip Cracked, Trauma Team Chip Cracked, Upload Upgrade Chip, Voodoo Chip Cracked, Wildfire Chip Cracked
- **Ripperdoc** `cz_stadium_ripperdoc_01` — *(Neuralware OS chips only)*

### Heywood — The Glen

- **Gun shop** `hey_gle_gunsmith_01`:
  - Bullet Time, Miltech Infantry Chip, Police Training, Sniper Training

### Heywood — Vista del Rey

- **Gun shop** `hey_rey_gunsmith_01`:
  - Miltech Infantry Chip, Skill Chip
- **Netrunner / software** `hey_rey_netrunner_01`:
  - Arasaka Shadow Chip, Encryptor Chip, Hornet Chip, Hound Chip, Learning Support, Memory Compression Chip, Redudancy Loop Chip, Spellsword Chip, Upload Upgrade Chip

### Heywood — Wellsprings

- **Gun shop** `hey_spr_gunsmith_01`:
  - Ballistic Processor Chip, Hornet Chip, Police Training, Quick Draw Bullets
- **Medic / pharmacy** `hey_spr_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Ripperdoc** `hey_spr_ripperdoc_01` — *(Neuralware OS chips only)*

### Pacifica — Coastview

- **Medic / pharmacy** `pac_cvi_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Tech store** `pac_cvi_techstore_01`:
  - Encryptor Chip, Hornet Chip, Hound Chip, Jammer Chip, Learning Support, Limit Breaker Cracked Chip, Memory Compression Chip, Redudancy Loop Chip, Ring Master Chip, Spellsword Chip, Upload Upgrade Chip, Voodoo Chip

### Pacifica — West Wind Estate

- **Gun shop** `pac_wwd_gunsmith_01`:
  - Ballistic Processor Chip, Police Training, Sniper Training
- **Melee trainer** `pac_wwd_melee_01`:
  - Berserk Limit Breaker Chip, Boxing Chip, Doll Chip, Drunken Fist Chip, Kung Fu, Repudiation, Wrecking Ball
- **Ripperdoc** `pac_wwd_ripperdoc_01` — *(Neuralware OS chips only)*

### Santo Domingo — Arroyo

- **Gun shop** `std_arr_gunsmith_01`:
  - Miltech Infantry Chip, Police Training, Poseur Cool, Quick Draw Bullets, Sniper Training
- **Medic / pharmacy** `std_arr_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Ripperdoc** `std_arr_ripperdoc_01` — *(Neuralware OS chips only)*

### Santo Domingo — Rancho Coronado

- **Gun shop** `std_rcr_gunsmith_01`:
  - Aim Assist Chip, Miltech Infantry Chip, Police Training
- **Medic / pharmacy** `std_rcr_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Ripperdoc** `std_rcr_ripperdoc_01` — *(Neuralware OS chips only)*

### Watson — Kabuki

- **Junk shop** `wat_kab_junkshop_01`:
  - Doll Chip, Skill Chip
- **Medic / pharmacy** `wat_kab_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Netrunner / software** `wat_kab_netrunner_01`:
  - Encryptor Chip, Hornet Chip, Hound Chip, Learning Support, Memory Compression Chip, Upload Upgrade Chip
- **Ripperdoc** `wat_kab_ripperdoc_01` — *(Neuralware OS chips only)*
- **Ripperdoc** `wat_kab_ripperdoc_02`:
  - Cyber Heart (all tiers), Cyber Liver (all tiers), Melee Grip (all tiers), Peacekeeper (all tiers), Poison Injector Rare, Universal Blood Vessels (all tiers)
- **Ripperdoc** `wat_kab_ripperdoc_03` — *(Neuralware OS chips only)*

### Watson — Little China

- **Gun shop** `wat_lch_gunsmith_01` — 2nd Amendment:
  - Miltech Infantry Chip, Police Training, Quick Draw Bullets
- **Medic / pharmacy** `wat_lch_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Melee trainer** `wat_lch_melee_01` — Coach Fred (boxing):
  - Boxing Chip, Doll Chip, Kung Fu, Repudiation
- **Netrunner / software** `wat_lch_netrunner_01` — Nix (Afterlife):
  - Arasaka Shadow Cracked Chip, Encryptor Chip Cracked, Redudancy Loop Chip Cracked, Spellsword Chip Cracked
- **Ripperdoc** `wat_lch_ripperdoc_01` — *(Neuralware OS chips only)*

### Watson — Northside

- **Gun shop** `wat_nid_gunsmith_01`:
  - Ballistic Processor Chip
- **Medic / pharmacy** `wat_nid_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Medic / pharmacy** `wat_nid_medicstore_02`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Ripperdoc** `wat_nid_ripperdoc_01` — *(Neuralware OS chips only)*

### Westbrook — Charter Hill

- **Ripperdoc** `wbr_hil_ripdoc_01` — *(Neuralware OS chips only)*

### Westbrook — Japantown

- **Gun shop** `wbr_jpn_gunsmith_01`:
  - Miltech Infantry Chip, Overcharge Chip, Rebecca Chip, Sniper Training
- **Junk shop** `wbr_jpn_junkshop_02`:
  - Cyber Psycho Memories, Doll Chip, Ninja Chip, Poseur Cool, Poseur Corpo, Poseur Tech
- **Medic / pharmacy** `wbr_jpn_medicstore_01`:
  - Adrenaline Controller Chip, Trauma Team Chip
- **Melee trainer** `wbr_jpn_melee_01`:
  - Dancer, Flash And Thunderclap, Flash Step, Kenjutsu Training, Lead And Steel, Quick Draw
- **Netrunner / software** `wbr_jpn_netrunner_01`:
  - Arasaka Shadow Chip, Encryptor Chip, Hornet Chip, Hound Chip, Jammer Chip, Learning Support, Memory Compression Chip, Upload Upgrade Chip
- **Netrunner / software** `wbr_jpn_netrunner_02`:
  - Arasaka Shadow Chip, Encryptor Chip, Hornet Chip, Hound Chip, Jammer Chip, Learning Support, Memory Compression Chip, Upload Upgrade Chip
- **Ripperdoc** `wbr_jpn_ripperdoc_01` — *(Neuralware OS chips only)*
- **Ripperdoc** `wbr_jpn_ripperdoc_02` — *(Neuralware OS chips only)*
- **Tech store** `wbr_jpn_techstore_01`:
  - Police Training

## By chip — where to buy it

- **Adrenaline Controller Chip** — Badlands / added district (needs its own mod) (Medic / pharmacy); City Center — Corpo Plaza (Medic / pharmacy); City Center — Downtown (Medic / pharmacy); Heywood — Wellsprings (Medic / pharmacy); Pacifica — Coastview (Medic / pharmacy); Santo Domingo — Arroyo (Medic / pharmacy); Santo Domingo — Rancho Coronado (Medic / pharmacy); Watson — Kabuki (Medic / pharmacy); Watson — Little China (Medic / pharmacy); Watson — Northside (Medic / pharmacy); Westbrook — Japantown (Medic / pharmacy)
- **Adrenaline Controller Chip Cracked** — Dogtown (Medic / pharmacy); Dogtown — Stadium area (Medic / pharmacy); Dogtown — Stadium area (Netrunner / software)
- **Aim Assist Chip** — Black Market fixer network ? (Vendor); City Center — Downtown (Gun shop); Santo Domingo — Rancho Coronado (Gun shop)
- **Arasaka Neuralware** — all ripperdocs citywide
- **Arasaka Shadow Chip** — Heywood — Vista del Rey (Netrunner / software); Westbrook — Japantown (Netrunner / software)
- **Arasaka Shadow Cracked Chip** — Dogtown — Stadium area (Netrunner / software); Nix (Afterlife) Watson — Little China (Netrunner / software)
- **Ballistic Processor Chip** — Badlands / added district (needs its own mod) (Gun shop); Heywood — Wellsprings (Gun shop); Pacifica — West Wind Estate (Gun shop); Watson — Northside (Gun shop)
- **Ballistic Processor Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Berserk Limit Breaker Chip** — Pacifica — West Wind Estate (Melee trainer)
- **Berserk Limit Breaker Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Boxing Chip** — Badlands / added district (needs its own mod) (Melee trainer); Coach Fred (boxing) Watson — Little China (Melee trainer); Dogtown (Gun shop); Dogtown — Stadium area (Gun shop); Pacifica — West Wind Estate (Melee trainer)
- **Bullet Time** — Black Market fixer network ? (Vendor); Heywood — The Glen (Gun shop)
- **Cold Blood** — Michal K Dogtown — Stadium area (Junk shop)
- **Cyber Heart** — Anderson Dogtown — Monument (Ripperdoc); Watson — Kabuki (Ripperdoc)
- **Cyber Liver** — Anderson Dogtown — Monument (Ripperdoc); Watson — Kabuki (Ripperdoc)
- **Cyber Psycho Memories** — Michal K Dogtown — Stadium area (Junk shop); Westbrook — Japantown (Junk shop)
- **Dancer** — Badlands / added district (needs its own mod) (Melee trainer); Black Market fixer network ? (Vendor); Westbrook — Japantown (Melee trainer)
- **Doll Chip** — Badlands / added district (needs its own mod) (Melee trainer); Coach Fred (boxing) Watson — Little China (Melee trainer); Michal K Dogtown — Stadium area (Junk shop); Pacifica — West Wind Estate (Melee trainer); Watson — Kabuki (Junk shop); Westbrook — Japantown (Junk shop)
- **Doll Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Drunken Fist Chip** — Michal K Dogtown — Stadium area (Junk shop); Pacifica — West Wind Estate (Melee trainer)
- **Dynalar Neuralware** — all ripperdocs citywide
- **Encryptor Chip** — Heywood — Vista del Rey (Netrunner / software); Pacifica — Coastview (Tech store); Watson — Kabuki (Netrunner / software); Westbrook — Japantown (Netrunner / software)
- **Encryptor Chip Cracked** — Dogtown — Stadium area (Netrunner / software); Nix (Afterlife) Watson — Little China (Netrunner / software)
- **Flash And Thunderclap** — Black Market fixer network ? (Vendor); Westbrook — Japantown (Melee trainer)
- **Flash Step** — Black Market fixer network ? (Vendor); Westbrook — Japantown (Melee trainer)
- **Gun Fu** — Badlands / added district (needs its own mod) (Gun shop); Black Market fixer network ? (Vendor); City Center — Downtown (Gun shop)
- **Hornet Chip** — City Center — Downtown (Gun shop); Heywood — Vista del Rey (Netrunner / software); Heywood — Wellsprings (Gun shop); Pacifica — Coastview (Tech store); Watson — Kabuki (Netrunner / software); Westbrook — Japantown (Netrunner / software)
- **Hornet Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Hound Chip** — City Center — Downtown (Gun shop); Heywood — Vista del Rey (Netrunner / software); Pacifica — Coastview (Tech store); Watson — Kabuki (Netrunner / software); Westbrook — Japantown (Netrunner / software)
- **Hound Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Jammer Chip** — Pacifica — Coastview (Tech store); Westbrook — Japantown (Netrunner / software)
- **Jammer Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Kenjutsu Training** — Badlands / added district (needs its own mod) (Melee trainer); Dogtown (Gun shop); Dogtown — Stadium area (Gun shop); Westbrook — Japantown (Melee trainer)
- **Kerenzikov Chip** — Badlands / added district (needs its own mod) (Gun shop)
- **Kerenzikov Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Kung Fu** — Black Market fixer network ? (Vendor); Coach Fred (boxing) Watson — Little China (Melee trainer); Pacifica — West Wind Estate (Melee trainer)
- **Lead And Steel** — Badlands / added district (needs its own mod) (Melee trainer); Black Market fixer network ? (Vendor); Westbrook — Japantown (Melee trainer)
- **Learning Support** — Heywood — Vista del Rey (Netrunner / software); Pacifica — Coastview (Tech store); Watson — Kabuki (Netrunner / software); Westbrook — Japantown (Netrunner / software)
- **Learning Support Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Limit Breaker Cracked Chip** — Dogtown — Stadium area (Netrunner / software); Pacifica — Coastview (Tech store)
- **Melee Grip** — Anderson Dogtown — Monument (Ripperdoc); Watson — Kabuki (Ripperdoc)
- **Memory Compression Chip** — Heywood — Vista del Rey (Netrunner / software); Pacifica — Coastview (Tech store); Watson — Kabuki (Netrunner / software); Westbrook — Japantown (Netrunner / software)
- **Memory Compression Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Miltech Infantry Chip** — 2nd Amendment Watson — Little China (Gun shop); Badlands / added district (needs its own mod) (Gun shop); City Center — Downtown (Gun shop); Dogtown (Gun shop); Dogtown — Stadium area (Gun shop); Heywood — The Glen (Gun shop); Heywood — Vista del Rey (Gun shop); Santo Domingo — Arroyo (Gun shop); Santo Domingo — Rancho Coronado (Gun shop); Westbrook — Japantown (Gun shop)
- **Miltech Neuralware** — Anderson Dogtown — Monument (Ripperdoc); Dogtown (Ripperdoc); Dogtown — Stadium area (Ripperdoc); Farida Dogtown — Monument (Ripperdoc)
- **Ninja Chip** — Michal K Dogtown — Stadium area (Junk shop); Westbrook — Japantown (Junk shop)
- **Overcharge Chip** — Westbrook — Japantown (Gun shop)
- **Overcharge Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Peacekeeper** — Anderson Dogtown — Monument (Ripperdoc); Watson — Kabuki (Ripperdoc)
- **Poison Injector Rare** — Anderson Dogtown — Monument (Ripperdoc); Watson — Kabuki (Ripperdoc)
- **Police Training** — 2nd Amendment Watson — Little China (Gun shop); Dogtown (Gun shop); Dogtown — Stadium area (Gun shop); Heywood — The Glen (Gun shop); Heywood — Wellsprings (Gun shop); Pacifica — West Wind Estate (Gun shop); Santo Domingo — Arroyo (Gun shop); Santo Domingo — Rancho Coronado (Gun shop); Westbrook — Japantown (Tech store)
- **Poseur Cool** — Michal K Dogtown — Stadium area (Junk shop); Santo Domingo — Arroyo (Gun shop); Westbrook — Japantown (Junk shop)
- **Poseur Corpo** — Michal K Dogtown — Stadium area (Junk shop); Westbrook — Japantown (Junk shop)
- **Poseur Tech** — Michal K Dogtown — Stadium area (Junk shop); Westbrook — Japantown (Junk shop)
- **Quick Draw** — Black Market fixer network ? (Vendor); Westbrook — Japantown (Melee trainer)
- **Quick Draw Bullets** — 2nd Amendment Watson — Little China (Gun shop); Black Market fixer network ? (Vendor); Heywood — Wellsprings (Gun shop); Santo Domingo — Arroyo (Gun shop)
- **Rebecca Chip** — Michal K Dogtown — Stadium area (Junk shop); Westbrook — Japantown (Gun shop)
- **Redudancy Loop Chip** — Heywood — Vista del Rey (Netrunner / software); Pacifica — Coastview (Tech store)
- **Redudancy Loop Chip Cracked** — Dogtown — Stadium area (Netrunner / software); Nix (Afterlife) Watson — Little China (Netrunner / software)
- **Repudiation** — Black Market fixer network ? (Vendor); Coach Fred (boxing) Watson — Little China (Melee trainer); Pacifica — West Wind Estate (Melee trainer)
- **Ring Master Chip** — Michal K Dogtown — Stadium area (Junk shop); Pacifica — Coastview (Tech store)
- **Sanvedvistan Limit Breaker Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Scav Memory Chip** — Michal K Dogtown — Stadium area (Junk shop)
- **Skill Chip** — Dogtown — Stadium area (Netrunner / software); Heywood — Vista del Rey (Gun shop); Watson — Kabuki (Junk shop)
- **Sniper Training** — Badlands / added district (needs its own mod) (Gun shop); City Center — Downtown (Gun shop); Dogtown (Gun shop); Dogtown — Stadium area (Gun shop); Heywood — The Glen (Gun shop); Pacifica — West Wind Estate (Gun shop); Santo Domingo — Arroyo (Gun shop); Westbrook — Japantown (Gun shop)
- **Spellsword Chip** — Heywood — Vista del Rey (Netrunner / software); Pacifica — Coastview (Tech store)
- **Spellsword Chip Cracked** — Dogtown — Stadium area (Netrunner / software); Nix (Afterlife) Watson — Little China (Netrunner / software)
- **Tiger Claw Chip** — Michal K Dogtown — Stadium area (Junk shop)
- **Trauma Team Chip** — Badlands / added district (needs its own mod) (Medic / pharmacy); City Center — Corpo Plaza (Medic / pharmacy); City Center — Downtown (Medic / pharmacy); Heywood — Wellsprings (Medic / pharmacy); Pacifica — Coastview (Medic / pharmacy); Santo Domingo — Arroyo (Medic / pharmacy); Santo Domingo — Rancho Coronado (Medic / pharmacy); Watson — Kabuki (Medic / pharmacy); Watson — Little China (Medic / pharmacy); Watson — Northside (Medic / pharmacy); Westbrook — Japantown (Medic / pharmacy)
- **Trauma Team Chip Cracked** — Dogtown (Medic / pharmacy); Dogtown — Stadium area (Medic / pharmacy); Dogtown — Stadium area (Netrunner / software)
- **Universal Blood Vessels** — Anderson Dogtown — Monument (Ripperdoc); Watson — Kabuki (Ripperdoc)
- **Upload Upgrade Chip** — Dogtown — Stadium area (Netrunner / software); Heywood — Vista del Rey (Netrunner / software); Pacifica — Coastview (Tech store); Watson — Kabuki (Netrunner / software); Westbrook — Japantown (Netrunner / software)
- **Voodoo Chip** — Pacifica — Coastview (Tech store)
- **Voodoo Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Wildfire Chip Cracked** — Dogtown — Stadium area (Netrunner / software)
- **Wrecking Ball** — Badlands / added district (needs its own mod) (Melee trainer); Black Market fixer network ? (Vendor); Pacifica — West Wind Estate (Melee trainer)
- **Zetatech Neuralware** — all ripperdocs citywide

## Custom vendors added by the mod (new NPCs placed on the map)

These are brand-new merchants the mod spawns at fixed spots (mostly Watson/Kabuki, Pacifica, Santo Domingo). They carry the reflex/skill/poser chips:

- **Arroyo Market (Santo Domingo)**: Bullet Time, Gun Fu, Kenjutsu Training, Poseur Tech, Rebecca Chip
- **Kabuki Gun Range**: Aim Assist Chip, Ballistic Processor Chip, Miltech Infantry Chip, Overcharge Chip, Police Training, Sniper Training
- **Kabuki Market**: Flash And Thunderclap, Kenjutsu Training, Ninja Chip, Poseur Cool, Poseur Corpo, Sanvedvistan Limit Breaker Chip, Tiger Claw Chip
- **Pacifica Market**: Boxing Chip, Cold Blood, Cyber Psycho Memories, Flash Step, Kerenzikov Chip, Lead And Steel, Police Training, Poseur Corpo, Ring Master Chip, Scav Memory Chip, Sniper Training, Wildfire Chip, Wrecking Ball
- **North Side / Docks**: Berserk Limit Breaker Chip, Poseur Tech, Ring Master Chip, Scav Memory Chip
- **Vista del Rey Market**: Drunken Fist Chip, Flash And Thunderclap, Kenjutsu Training, Poseur Cool, Ring Master Chip, Sanvedvistan Limit Breaker Chip, Wrecking Ball

## Heads-up on vendor IDs

- `bls_ina_se1_*` / `bls_ina_se5_*` use a `sector` naming that isn't vanilla Night City — these look like they belong to an **added-district mod**. If you don't run that mod, those shops (and their chips) simply won't appear, so don't count on them.
