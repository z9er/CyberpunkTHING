[Changelog](https://github.com/z9er/CyberpunkTHING/blob/main/Changelog.md)

&#10240;
&#10240;

[![Discord Link](https://i.imgur.com/OehZMjj.png)](https://discord.gg/eJdMQKnQVt "Discord for Support and Feedback")

[logo image]: https://i.imgur.com/OehZMjj.png

&#10240;

#### More immersive, more realistic. A bullet's a bullet, and Night City is full of hardened gangoons with hair triggers and bad attitudes. But they've never run into anything like you.

&#10240;

#### More than just a collection of other modders' amazing work, we are actively developing new mods to add gameplay elements that support our vision. We provide a fully preconfigured and easy to use modded experience; it just works, plug n' play.

&#10240;


![wjack readme 1](https://i.imgur.com/Pne7IiW.png)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://i.imgur.com/JZ3pUvU.png">
  <img alt="Shows an illustrated sun in light color mode and a moon with stars in dark color mode." src="https://i.imgur.com/wxtFNkO.png">
</picture>

[![Features List](https://i.imgur.com/GLyL7rR.png)](https://github.com/z9er/CyberpunkTHING/blob/main/modlist.md)

# MO2 for Cyberpunk

Mod Organizer 2 and Cyberpunk 2077 aren't normally compatible - using MO2 on the game leads to CET and Redscript errors. This has been addressed through a plugin called Root Builder that allows specific folders to be automatically be copied into the game folders when launching the game, and be automatically cleaned up once the game closes.
Root builder requires a specific folder structure. The archive folder of mods is MO2 deploys via its Virtual File System (**VFS**),  this works in 99% of cases for mods of this type.
The other folders are copied before runtime, namely: bin, engine, r6, red4ext and Redmods. This way your game folder remains intact when not run via MO2.
This means under all practical purposes, these mods are installed manually, but with the convenience of a mod manager. 

While most mods will work, there are a few that do some archive checking and thus require manual installation outside of MO2

&#10240;

![wjack readme 2](https://i.imgur.com/z6KynkI.png)

# Premium vs Non-Premium

&#10240;

For premium Nexus users installing this Wabbajack is a one click process

![Premium GIF](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNzk3YTc2MTI0MzJmMmUyY2I0NmUyYTdhMTk0NzY5ZTY3ZmIxYjAxZCZjdD1n/mlMB0EnTfhTsAo6L7C/giphy.gif)

For non-premium users, the installation process is still simple. You just have to click **"Download"** followed by **"Slow Download"** as Wabbajack brings up buttons for every mod



&#10240;

# Ensuring Clean Game Install

&#10240;

```
If you've ever modded Cyberpunk before, it's important to ensure you have a clean game folder
```

Go to your main Cyberpunk 2077 directory and delete the **all** folders except for **"archive"**

![wjack readme 3](https://i.imgur.com/AXG7U40.png)

Additionally delete the **"mod"** folder in **"Cyberpunk 2077/archive/pc/"** 

![wjack readme 4](https://i.imgur.com/YW0s73X.png)

Now make sure you go and verify your game files through **Steam** or **GOG**

If you have used Vortex before, please purge the installed mods, you will be able to redeploy them later if you choose to

```
This Wabbajack list does not work with the Epic version of Cyberpunk 2077
```



&#10240;

# Steam/GOG Config

### Disable any game Overlays

The Steam/GOG Overlay can cause issues with certain mods and is
recommended to be turned off

Steam:
Open the Properties window (right click the game in your Library->Properties),
navigate to the _General_ tab and un-tick the _Enable the Steam Overlay while in-game_
checkbox

GOG:
Open the settings window (Cog in the top left of GOG Galaxy),
navigate to the Game Features tab and un-tick the Overlay checkbox

## Change Steam/GOG Update Behavior

Cyberpunk 2077 is still being updated by CDPR. Whenever the game updates, it's quite possible
that everything can break due to these changes

Steam:
To ensure that Steam does not automatically update the game unless you want it to, head over
to the Properties window, navigate to the _Updates_ tab and change
_Automatic updates_ to _Only update this game when I launch it_

GOG:
To ensure that GOG does not automatically update the game unless you want it to, head over
to the Settings window, navigate to the _Game Features_ tab and turn off the checkbox for
_Auto Update Games_



&#10240;

# Using Wabbajack

### Preparations

Grab the latest release of Wabbajack from [here](https://github.com/wabbajack-tools/wabbajack/releases) 

[![wjack readme 5](https://i.imgur.com/ljncxQg.png)](https://github.com/wabbajack-tools/wabbajack/releases "Wabbajack Link")

[wjack readme 5 p2]: https://i.imgur.com/ljncxQg.png

Place the `Wabbajack.exe` in a location like `C:\Wabbajack`

```
Wabbajack can be installed to any folder as long as it is on the same hard drive as 
your Cyberpunk 2077 game directory
```

### Downloading and Installing

The download and installation process depends on
your system specs. Wabbajack will calculate the amount of threads it will use at
the start of the installation

To have the highest amount of threads and thus the fastest speed, it is advised to have the working folder on an SSD, this doesn't matter a huge deal for the modlist itself however it will matter when playing the game

1. Open Wabbajack
2. Load the Modlist by clicking **"Browse Modlists"** (selecting the Cyberpunk 2077) 

![demonstration of finding list](https://media.giphy.com/media/d5g7myYxhXqsLzKHHL/giphy.gif)

3. Set Cyberpunk THING to install to `C:\Cyberpunk THING` and downloads to `C:\Cyberpunk THING\Downloads`
   You can set a different path if you wish, but avoid system protected folders. 
   
```
Avoid installing the list to a system protected folder like Program Files, ensure the list is installed to a different location 
than the folder Wabbajack.exe is located in
```
   
4. Click the Go/Begin button
5. Wait for Wabbajack to finish

### Problems with Wabbajack

There are a lot of different scenarios where Wabbajack will produce an error.
If you do not see an installation failed warning do not worry about it. If you
feel like wabbajack is stuck or a download is hanging just restart wabbajack,
it will pick up from exactly where you left off

Please rerun wabbajack at least twice and try to manually download the file
from first before posting about a failed download

**Could not download x**

If a mod updated and the old files got deleted, it may be impossible to download
them. In this case just wait until there is a list update

**Wabbajack could not find my game folder**

You need to have launched the game once before WJ will locate it. The list works with the **GOG** or **Steam** version of the game

Support in [Cyberpunk THING discord](https://discord.gg/eJdMQKnQVt)



&#10240;

# Post-Installation

In order to use the included mod [Simple Flashlight](https://www.nexusmods.com/cyberpunk2077/mods/2913) open the "Game Folder Files" folder in your modlist install location, and copy the archive folder into your main Cyberpunk 2077 directory

![demonstration of game folder files thing](https://media.giphy.com/media/N8oz510KVUrX2PzLBN/giphy.gif)

### Starting the Game

Head over to the installation folder and locate an executable named
ModOrganizer.exe and launch it. Once its launched there will be a dropdown box
on the top right and a big run button next to it

Ensure it is set to `Cyberpunk 2077` by selecting it in the dropdown
box and then hitting the run button. Due to how it is deploying the files, you may have to click "Run" twice. This is normal



&#10240;

![wjack readme 6](https://i.imgur.com/Cf8RliI.png)

# CET Setup

&#10240;


When you start the game for the first time you will be met with an overlay prompting you to choose a key to toggle on Cyber Engine Tweaks, recommend that you choose the **"~"** key for the **"Overlay Key"**

![wjack readme 7](https://i.imgur.com/GotiBl6.png)

Keybinds for **"BetterScopes",** **"NanoDrone",** **"QuestTrackingToggle"** are as follows:

Additional weapon zoom is <kbd>Shift</kbd>

Quest Tracking Toggle is <kbd>F11</kbd>

NanoDrone forwards, left, backwards, and right is <kbd>w</kbd> <kbd>a</kbd> <kbd>s</kbd> and <kbd>d</kbd>, and up and down are <kbd>Space</kbd> and <kbd>Control</kbd>

Any of this can be changed by hitting your bound **CET Overlay Key** and going to **"Bindings"**

![wjack readme 8](https://i.imgur.com/HiLTXZA.png)



&#10240;

# Quickslots Settings

&#10240;

In Cyberpunk, there is no way to bind multiple hotkeys for actions, items, or abilities, as each must be assigned through the menu to the one assignable hotkey at a time, leading to gameplay interruptions if you want to play well. [Custom Quickslots](https://www.nexusmods.com/cyberpunk2077/mods/3096) solves this issue by allowing bindable hotkeys which show up on the Native game UI and allow you up to 20 hotkeyed actions, abilities, or items. Some small setup is required

```
Navigating the Mods menu uses the arrows at the top to switch between the different pages of mods
```

After clicking **"Mods"** in the main menu, navigate to the **"QSLOTS"** section, you can add slots and then select the key they bind to. This will need to be duplicated in **CET Bindings** in order for it to work. Recommend adding slots as needed during the course of gameplay

![wjack readme 9](https://i.imgur.com/8Rfy44l.png)



&#10240;

# Recommended Game Settings

&#10240;

```
This collection is built around the very hard difficulty setting
```

After clicking **"Settings"** in the main menu, near the left side of the top menu click on the **"GAMEPLAY"** section, recommend changing **"Aim Assist"** and **"Aim Assist - Melee Combat"** to **"Off"**

![wjack readme 10](https://i.imgur.com/mAUjyAW.png)

Near the right side of the top menu click on the **"INTERFACE"** section, recommend changing **"Damage Numbers Mode"** to **"Off,"** **"Overhead Damage Numbers"** to **"None,"** and **"Threat and Damage Indicator"** to **"Damage Only"**

![wjack readme 11](https://i.imgur.com/6JNViAW.png)

Further down in the **"HUD Visibility"** section, recommend keeping all on except **"Hints,"** **"Activity Log,"** and **"NPC Names"**

![wjack readme 12](https://i.imgur.com/zleClLA.png)

```
New players may want to keep "Hints" on until they feel they no longer need them
```


&#10240;

# Adjusted Mod Configuration

&#10240;

Several mods in the collection have been adjusted with permission from their mod authors. You are limited to using the **Techdeck** from [Drone Companions](https://www.nexusmods.com/cyberpunk2077/mods/4520) as an alternative to a cyberdeck rather than something that can be run in tandem. The movement changes from [Alternate Midair Movement and Walljumping](https://www.nexusmods.com/cyberpunk2077/mods/5160) are now part of the **Maneuvering System** cyberware.



&#10240;

# Updating/Uninstalling

If this Modlist receives an update please check the Changelog before doing
anything. Always backup your saves or start a new game after updating

**Wabbajack will delete all files that are not part of the Modlist when updating!**

This means that any additional mods you have installed on top of the Modlist
will be deleted. Your downloads folder will not be touched! That means if you have made your own modded setup on top of the list, you should update those mods *manually*.

Updating is like installing. You only have to make sure that you select the same
path and tick the _overwrite existing Modlist_ button

### Removing the Modlist

You can just remove the MO2 folder, along with any Game Folder file mod you've installed and be done with it



&#10240;

# Frequently Asked Questions

[Answers to common troubleshooting or game balancing questions can be found on our FAQ page](https://github.com/z9er/CyberpunkTHING/blob/main/FAQ.md)

Our [FAQ page](https://github.com/z9er/CyberpunkTHING/blob/main/FAQ.md) is a treasure trove of information that we’ve gathered from answering users' questions over time. If you have an issue, we highly recommend you check if it's already been answered. And if not, you can always find us on our [Discord server](https://discord.gg/eJdMQKnQVt) :)

&#10240;

# Testimonials

[Strangerism:](https://www.nexusmods.com/fallout4/users/116794)

When things gets heated I need to back out, run, hide, jump on buildings, reposition, go around the block to take them from behind, peek a boo. You never know where they coming from, always on the look out for an exit, a plan b. Fighting these gangoons really feels satisfyingly now and the city layout has become part of it. Initially was a struggle but then I adapted, learned, with experience I become a better merc, not just with the levels and powers meta, but in the way you play, actually. it plays more as an open world city game now. the best there is

[harltone7443:](https://forums.nexusmods.com/index.php?/user/159683838-harltone7443/)

Honestly, this collection is just great. It has basically fixed ALL the major complaints I had with the vanilla game. I'm about 10 hours in with a full hacker build and truly loving the challenge. No more cheese mode see everything through walls, or slowing down time for 20 seconds over and over and over again.

[Read about more people's experiences with the list here](https://github.com/z9er/CyberpunkTHING/blob/main/Testimonials.md)

&#10240;

# Credits and Thanks

A special thanks to [TeslaCoiled](https://www.nexusmods.com/cyberpunk2077/users/3534466), without whom this crazy experiment would never have gotten off the ground.

This could not have been done without the Cyberpunk modding scene at large. They have taken what could have been a forgettable game and turned it into an unforgettable experience.

Additional thanks and credits to:

- Deristat for playtesting, QA and feedback
- moLy, Busy Oscar, and the rest of the Cyberpunk THING Palace of the Mind for suggestions, ideas, and vision
- [Bobbytronics](https://www.nexusmods.com/users/161227193) for the wonderfully customized version of [Alternative Midair Movement](https://www.nexusmods.com/cyberpunk2077/mods/5160)
- vahndaar for the bundled mods "Takedown and Dispose Rewards," "Fix Level Up Notification," and "Fistfight Armor"
- Leon Maxwell for their unofficial [Vehicle Combat](https://www.nexusmods.com/cyberpunk2077/mods/3815) fix
- [walrus420](https://www.nexusmods.com/cyberpunk2077/users/4076520) for the incredible Cyberpunk THING logo!
- [SOSUINEPXISUYU](https://www.nexusmods.com/cyberpunk2077/users/75442863?tab=user+files) for the beautiful and striking screenshots.
- General namedrops for specific help and utilities: [psiberx](https://www.nexusmods.com/cyberpunk2077/users/108159138), [KeanuWheeze/Nexusguy999](https://www.nexusmods.com/cyberpunk2077/users/77476393), [scissors](https://www.nexusmods.com/cyberpunk2077/users/78269633), [rfuzzo](https://www.nexusmods.com/users/16300749), [KiroCobra](https://www.nexusmods.com/cyberpunk2077/users/40108180), and the Cyberpunk 2077 modding Discord!
- Can't forget the [WolvenKit](https://www.nexusmods.com/cyberpunk2077/mods/2201) Team, the [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107) team, and the [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511) team for making the tools all modders use, and the modding Discords in general for being a font of information!
- JTK from the Wabbajack team, as well as Xanza, Delta, and Crit for making MO2 for Cyberpunk a reality


**_Remember to endorse the mods in this that you enjoy: the people who made these mods are the only reason this exists._**

For support or to give feedback you can reach us at the [modlist discord link below:](https://discord.gg/eJdMQKnQVt)

[![Discord Link](https://i.imgur.com/2zyLjNQ.png)](https://discord.gg/eJdMQKnQVt "Discord for Support and Feedback")

[logo image]: https://i.imgur.com/2zyLjNQ.png

[Changelog](https://github.com/z9er/CyberpunkTHING/blob/main/Changelog.md)
