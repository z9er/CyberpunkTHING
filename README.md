&#10240;
&#10240;

[![Discord Link](https://i.imgur.com/OehZMjj.png)](https://discord.gg/eJdMQKnQVt "Discord for Support and Feedback")

[logo image]: https://i.imgur.com/OehZMjj.png

&#10240;

#### The aim is to make Cyberpunk the game it was always intended to be. More immersive, more realistic. A bullet's a bullet, and Night City is full of hardened gangoons with hair triggers and bad attitudes. But they've never run into anything like you.

&#10240;

#### More than just a collection of other modders' amazing work, we are actively developing new mods to add gameplay elements that support our vision. We provide a fully preconfigured and easy to use modded experience; it just works, plug n' play.

&#10240;


![Features](https://i.imgur.com/Pne7IiW.png)


[![Features List](https://i.imgur.com/3ffXZ8g.png)](https://github.com/z9er/CyberpunkTHING/blob/main/modlist.md "Expanded Feature List")

[Featureimage]: https://i.imgur.com/3ffXZ8g.png

[A complete list of ALL of the features in the collection can be found in this article here](https://github.com/z9er/CyberpunkTHING/blob/main/modlist.md)

# MO2 for Cyberpunk? 
It works. Really*.

Mod Organizer 2 and Cyberpunk 2077 aren't normally compatible - using MO2 on the game leads to CET and Redscript errors. We've managed to address this through a plugin called Root Builder that allows specific folders to be automatically be copied into the game folders when launching the game, and be automatically cleaned up once the game closes.
Root builder requires a specific folder structure. The archive folder of mods is MO2 deploys via its VFS,  this works in 99% of cases for mods of this type.
The other folders are copied before runtime, namely: bin, engine, r6, red4ext and Redmods. This way your game folder remains intact when not run via MO2.
This means under all practical purposes, these mods are installed manually, but with the convenience of a mod manager. 

While most mods will work, there are a few that do some archive checking and thus require manual installation outside of MO2.


---

&#10240;


![To Install](https://i.imgur.com/z6KynkI.png)

# Premium vs Non-Premium

&#10240;

For premium Nexus users installing this Wabbajack is a one click process

For non-premium users, the installation process is still simple. You just have to click **"Download"** followed by **"Slow Download"** as Vortex brings up buttons for every mod.

---

&#10240;

# Ensuring Clean Game Install

&#10240;

```
If you've ever modded Cyberpunk before, it's important to ensure you have a clean game folder
```

Go to your main Cyberpunk 2077 directory and delete the **"bin,"** **"engine,"** **"r6,"** and **"red4ext"** folder

![Clean Install 1](https://i.imgur.com/AXG7U40.png)

Additionally delete the **"mod"** folder in **"Cyberpunk 2077/archive/pc/"** 

![Clean Install 2](https://i.imgur.com/YW0s73X.png)

Now make sure you go and verify your game files through **Steam**, **GOG** or **Epic**



Please delete manually added files & verify game integrety before installing. For Vortex, please purge the installed mods, you will be able to redeploy them later if you choose to. 

## Steam/Gog Config

### Disable any game Overlays

The Steam/GOG Overlay can cause issues with certain mods and is
recommended to be turned off.

Steam:
Open the Properties window (right click the game in your Library->Properties),
navigate to the _General_ tab and un-tick the _Enable the Steam Overlay while in-game_
checkbox.

GOG:
Open the settings window (Cog in the top left of GOG Galaxy),
navigate to the Game Features tab and un-tick the Overlay checkbox. 


## Change Steam/GOG's Update Behavior

Cyberpunk 2077 is still being updated by CDPR. Whenever the game updates, it's quite possible
that everything can break due to these changes.

Steam:
To ensure that Steam does not automatically update the game unless you want it to, head over
to the Properties window, navigate to the _Updates_ tab and change
_Automatic updates_ to _Only update this game when I launch it_.

GOG:
To ensure that GOG does not automatically update the game unless you want it to, head over
to the Settings window, navigate to the _Game Features_ tab and turn off the checkbox for
_Auto Update Games_.

## Using Wabbajack

### Preparations

Grab the latest release of Wabbajack from [here](https://github.com/wabbajack-tools/wabbajack/releases) and place the `Wabbajack.exe`
file in `X:\Wabbajack`

### Downloading and Installing

The download and installation process depends on
your system specs. Wabbajack will calculate the amount of threads it will use at
the start of the installation.

To have the highest amount of threads and thus the fastest speed, it is advised
to have the working folder on an SSD, this doesn't matter a huge deal for the modlist itself however it will matter significantly more for playing the game. 

1. Open Wabbajack
2. Load the Modlist from either Browse Modlists (selecting the Cyberpunk 2077 dropdown and unoffical checkbox) or Install from Disk (if you have downloaded the list from elsewhere).
3. Set MO2077 to install to `X:\MO2077` and downloads to `X:\MO2077\Downloads`.
   You can set a different path if you wish, but avoid system protected folders. 
4. Click the Go/Begin button
5. Wait for Wabbajack to finish

### Problems with Wabbajack

There are a lot of different scenarios where Wabbajack will produce an error.
If you do not see an installation failed warning do not worry about it. If you
feel like wabbajack is stuck or a download is hanging just restart wabbajack,
it will pick up from exactly where you left off.

Please rerun wabbajack at least twice and try to manually download the file
from first before posting about a failed download.

**Could not download x**:

If a mod updated and the old files got deleted, it may be impossible to download
them. In this case just wait till I update the Modlist.

**Wabbajack could not find my game folder**:

You need to have launched the game once before WJ will locate it. Additionally
Wabbajack will not work with pirated versions of the game. The list works with games from Steam, GOG and Epic Game Store.

Support in [Cyberpunk THING discord](https://discord.gg/eJdMQKnQVt)

## Post-Installation

If you want to use Simple Flashlight, I have included it to prove it functions with this setup. Simply open the "Game Folder Files" folder in your modlist install location, and copy the archive files into /Cyberpunk 2077/archive/pc/mod. If you do not wish to use this mod or test it, you can ignore these files.

### Starting the Game

Head over to the installation folder and locate an executable named
ModOrganizer.exe and launch it. Once its launched there will be a dropdown box
on the top right and a big run button next to it.

Ensure it is set to `Cyberpunk 2077` by selecting it in the dropdown
box and then hitting the run button. Due to how it is deploying the files, you may have to click "Run" twice. This is normal. 

&#10240;

![Recommended](https://i.imgur.com/Cf8RliI.png)

# CET Setup

&#10240;


When you start the game for the first time you will be met with an overlay prompting you to choose a key to toggle on Cyber Engine Tweaks, recommend that you choose the **"~"** key for the **"Overlay Key"**

![First CET Popup](https://i.imgur.com/GotiBl6.png)

The main **"Cyber Engine Tweaks"** window will now pop up, and on it you should click the **"Bindings"** button near the top left of the window, which will now show the **"Inputs"** and **"Hotkeys"** buttons

![CET Binding](https://i.imgur.com/y5VOQID.png)

Recommend binding keys for **"BetterScopes",** **"NanoDrone",** **"QuestTrackingToggle"** in the **"Hotkeys"** section, and binding keys for any necessary **"CustomQuickslots",** and **"NanoDrone"** in the **"Inputs"** section.

Above the section there is a **"Save"** button which you should click to save any changes

![Save](https://i.imgur.com/sBEhi0D.png)

---

&#10240;

# Quickslots Settings

&#10240;

```
Navigating the Mods menu uses the arrows at the top to switch between the different pages of mods
```

After clicking **"Mods"** in the main menu, navigate to the **"QSLOTS"** section, recommend changing **"WE3D - Drugs of Night City Compatibility Mode,"** **"Hide empty consumable and grenade slots,"** **"Hide empty cyberware ability slots"** and **"Small item slots"** to **"On"**. Recommend changing **"Number of Custom Quickslots"** to **"0"** and then adding slots as needed during the course of gameplay.

![Qslots Recommended Settings Combined](https://i.imgur.com/5beF1SW.png)

---

&#10240;

# Recommended Game Settings

&#10240;

```
This collection is built around the very hard difficulty setting
```

After clicking **"Settings"** in the main menu, near the left side of the top menu click on the **"GAMEPLAY"** section, recommend changing **"Aim Assist"** and **"Aim Assist - Melee Combat"** to **"Off"**

![Gameplay Recommended Settings Combined](https://i.imgur.com/mAUjyAW.png)

Near the right side of the top menu click on the **"INTERFACE"** section, recommend changing **"Damage Numbers Mode"** to **"Off,"** **"Overhead Damage Numbers"** to **"None,"** and **"Threat and Damage Indicator"** to **"Damage Only"**

![Interface Recommended Settings Combined](https://i.imgur.com/6JNViAW.png)

Further down in the **"HUD Visibility"** section, recommend keeping all on except **"Hints,"** **"Activity Log,"** and **"NPC Names"**

![Hud Visibility](https://i.imgur.com/zleClLA.png)

```
New players may want to keep "Hints" on until they feel they no longer need them
```

# Updating

If this Modlist receives an update please check the Changelog before doing
anything. Always backup your saves or start a new game after updating.

**Wabbajack will delete all files that are not part of the Modlist when updating!**

This means that any additional mods you have installed on top of the Modlist
will be deleted. Your downloads folder will not be touched! That means if you have made your own modded setup on top of the list, you should update mods *manually*.

Updating is like installing. You only have to make sure that you select the same
path and tick the _overwrite existing Modlist_ button.

# FAQ

How do I update to a later version?

- All you have to do is rerun wabbajack with the new version of the installer.
  If you have the downloads wabbajack will hash everything, download any new mods,
  and make the necessary changes in your install folder. This will remove mods you have added yourself.

Is [insert mod name here] part of the list?

- Check the modlist manifest. If there is a utilitiy that you think should be in the list, ask nicely in the discord. Do not ping me or DM me with requests. 

Will you add x mod to the list?

- Maybe?

I think I found a bug! Here are some things that are not bugs:

- Thanks! Please let us know via the discord.

# Removing the Modlist

You can just remove the MO2 folder, along with any Game Folder file mod you've installed and be done with it.

# Credits and Thanks

A special thanks to [TeslaCoiled](https://www.nexusmods.com/cyberpunk2077/users/3534466), without whom this crazy experiment would never have gotten off the ground.

This could not have been done without the Cyberpunk modding scene at large. They have taken what could have been a forgettable game and turned it into an unforgettable experience.

Additional thanks and credits to:

- [walrus420](https://www.nexusmods.com/cyberpunk2077/users/4076520) for the incredible Cyberpunk THING logo!
- [SOSUINEPXISUYU](https://www.nexusmods.com/cyberpunk2077/users/75442863?tab=user+files) for the beautiful and striking screenshots.
- persen for the wonderfully customized version of [Alternative Midair Movement](https://www.nexusmods.com/cyberpunk2077/mods/5160)
- [KeanuWheeze/Nexusguy999](https://www.nexusmods.com/cyberpunk2077/users/77476393) for the bundled mod "Only Smart Weapon Crosshairs"
- vahndaar for the bundled mods "Takedown and Dispose Rewards," "Fix Level Up Notification," and "Fistfight Armor"
- Busy Oscar for playtesting and feedback
- General namedrops for specific help and utilities: [psiberx](https://www.nexusmods.com/cyberpunk2077/users/108159138), [KeanuWheeze/Nexusguy999](https://www.nexusmods.com/cyberpunk2077/users/77476393), [scissors](https://www.nexusmods.com/cyberpunk2077/users/78269633), [rfuzzo](https://www.nexusmods.com/users/16300749), [KiroCobra](https://www.nexusmods.com/cyberpunk2077/users/40108180), and the Cyberpunk 2077 modding Discord!
- Can't forget the [WolvenKit](https://www.nexusmods.com/cyberpunk2077/mods/2201) Team, the [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107) team, and the [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511) team for making the tools all modders use, and the modding Discords in general for being a font of information!

MO2077 - made by:
- JTK

Special Thanks

- Xanza
- Delta 
- Crit

**_PLEASE DO NOT FORGET TO ENDORSE THE MOD AUTHORS!_**

For support or to give feedback you can reach us at the [collection discord link below:](https://discord.gg/eJdMQKnQVt)

[![Discord Link](https://i.imgur.com/QmblGWu.png)](https://discord.gg/eJdMQKnQVt "Discord for Support and Feedback")

[logo image]: https://i.imgur.com/QmblGWu.png

# Changelog

See [Changelog](https://next.nexusmods.com/cyberpunk2077/collections/yzoj3d?tab=Changelog).
