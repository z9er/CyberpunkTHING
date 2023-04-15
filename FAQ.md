[![Discord Link](https://i.imgur.com/OehZMjj.png)](https://discord.gg/eJdMQKnQVt "Discord for Support and Feedback")

# Frequently Asked Questions

&#10240;

- [General Troubleshooting](#general-troubleshooting)
- [Vortex Specific Troubleshooting](#vortex-specific-troubleshooting)
- [Wabbajack Specific Troubleshooting](#wabbajack-specific-troubleshooting)
- [Gameplay Questions](#gameplay-questions)

&#10240;

## General Troubleshooting

<details>
  <summary>Can I add this list to my existing save?</summary>
  &#10240;
  
  **You can add this list to an existing vanilla save with no issues.** If you're adding this to a previously modded save, it would depend on the mods that were   associated. Sometimes mods that add items to the game through ArchiveXL can be baked into the save, and if that mod is no longer there, would cause the game to crash.
  
  &#10240;
  
</details>

<details>
  <summary>My game flatlines when opening with a redscript error</summary>
  &#10240;
  
  **It's important to ensure that this list is installed onto a purely vanilla setup to avoid script errors and crashes from old mods.**
  
  Go to your main Cyberpunk 2077 directory and delete the **all** folders except for **"archive"**

![Clean Install 1](https://i.imgur.com/AXG7U40.png)

Additionally delete the **"mod"** folder in **"Cyberpunk 2077/archive/pc/"** 

![Clean Install 2](https://i.imgur.com/YW0s73X.png)

Now make sure you go and verify your game files through **Steam**, **GOG** or **Epic**
  
  &#10240;
  
</details>

<details>
  <summary>I don't see the initial CET keybind popup</summary>
  &#10240;
  
  Go to your main **Cyberpunk 2077 directory** to **"bin/x64/plugins/cyber_engine_tweaks"** and delete **"bindings.json"**, then restart the game.
  
  ![CET binding location](https://i.imgur.com/5BTFUBx.png)
  
   &#10240;
</details>

<details>
  <summary>My saved games are slow to load/blank ingame</summary>
  &#10240;
  
  ![picture of problem](https://i.imgur.com/XBoH5Fi.png)
  
  If you run into the error displayed above, you will want to disable cloud saves as that game setting can cause this issue.
  
  On the left side of the main menu, click on **"Settings"**
  
  ![Example settings](https://i.imgur.com/2yoHsqd.png)
  
  At the top click **"Gameplay"**
  
  ![first image](https://i.imgur.com/8W36yPc.png)
  
  Scroll down to **"Enable cross-platform Saves"** and ensure that it is turned off
  
  ![second image](https://i.imgur.com/t6QOwYM.png)
  
   &#10240;
  
</details>

<details>
  <summary>I can't remote activate a door to open it</summary>
  &#10240;
  
  ![bnet 1](https://i.imgur.com/DTkEwci.png)
  
  If you run into the above issue where there is no way to remote activate a door or window, you will need to ensure that [Better Netrunning](https://www.nexusmods.com/cyberpunk2077/mods/2302) is correctly configured. On the left side of the main menu click on **"Mods"**
  
  ![bnet 2](https://i.imgur.com/U2wROZZ.png)
  
  Go to **"Better Netrunning"**
  
  ![bnet 3](https://i.imgur.com/GxIVeTh.png)
  
  Scroll down to the **"Access Points"** section and ensure that **"Unlock Networks With No Access Points"** is enabled
  
  ![bnet 4](https://i.imgur.com/7S5GG80.png)
  
  This will correct the issue
  
  ![bnet 5](https://i.imgur.com/W3I8uMT.png)
  
   &#10240;
  
</details>

<details>
  <summary>My custom quickslots binds aren't working</summary>
  &#10240;
  
  In order for your [custom quickslots](https://www.nexusmods.com/cyberpunk2077/mods/3096) options to work, your choices that you bind in the **"Mods"** menu will need to be duplicated in CET. As an example of this, you would first choose a keybind and action for a quickslot by going to **"Mods"** on the left side of the main menu
  
  ![qslot 1](https://i.imgur.com/U2wROZZ.png)
  
  At the top, select **"QSLOTS"**
  
  ![qslot 2](https://i.imgur.com/vNUFxDF.png)
  
  Adjust **"Number of Custom Quickslots"** to be 1 or more
  
  ![qslot 3](https://i.imgur.com/F0eHCqd.png)
  
  In this example, selecting for **"food"** and selecting **"9"** as the keybind
  
  ![qslot 4](https://i.imgur.com/3LBK12M.png)
  
  Press the key you chose to bind for the CET menu in order to open it, and go to **"Bindings"**
  
  ![qslot 5](https://i.imgur.com/ICUwKoO.png)
  
  Will want to duplicate the keybind for the same slot, which was Slot 1
  
  ![qslot 6](https://i.imgur.com/HOAMy7C.png)
  
  Then save the selection, and the quickslot you have chosen will now work
  
  ![qslot 7](https://i.imgur.com/5oVjZgx.png)
  
  &#10240;
  
</details>

<details>
  <summary>I am stuck in conversation with Jackie</summary>
  &#10240;
  
  You're sitting sharing a nice moment pondering the future's opportunities with Jackie at the food stand outside of your apartment, and you need to call the car in order to "feel the factory new ride". If your hints are disabled it won't tell you what to do, but you'll want to call your vehicle, default keybind is **"V"**
  
  ![example of jackie](https://i.imgur.com/CAZD805.png)
  
  &#10240;
  
</details>

<details>
  <summary>My hud disappears when using a controller</summary>
  &#10240;
  
  ![shud](https://i.imgur.com/OuugWwr.png)
  
  The reason this option is off in **"Mod Settings"**, **"LHUD ADDONS"** is if it is on, it allows certain keys to turn off all hud elements, which can be quite annoying on controller. If you would like to turn this on but want to change the keybind you will need to go to 
  
  ```
  FOR VORTEX USERS
  ```
  
  In your main Cyberpunk 2077 directory, navigate to **"r6\input"** and open **"LimitedHUD.xml**
  
  ![shud 2](https://i.imgur.com/t8J91RJ.png)
  
  ```
  FOR WABBAJACK USERS
  ```
  
  In **MO2** in the left panel left click **"Limited Hud"** to highlight it, then right click it and select **"Open in Explorer"**
  
  ![shud 3](https://i.imgur.com/EuBGa2T.png)
  
  Navigate to **"Root\r6\Input"**
  
  ![shud 4](https://i.imgur.com/qReV98j.png)
  
  ```
  Continued for Both
  ```
  
  **"LimitedHUD.xml** can be customized to choose whatever keybinds you would like, [a full list of CDPR's method for key naming here](https://nativedb.red4ext.com/EInputKey)
  
  ![shud 5](https://i.imgur.com/ONUo751.png)
  
  &#10240;
  
</details>

<details>
  <summary>My game crashes when I open the map</summary>
  &#10240;
  
  This is associated with a **Reshade** version issue. As this list does not include and is not tested for any reshade, adding one is at your own risk, and this is one of a multitude of issues that can arise in using one
  
   &#10240;
  
</details>

<details>
  <summary>How do I name a save?</summary>
  &#10240;
  
  You're about to create a manual save, but don't just immediately click it. If you look at the top left above that you will see where you can add a name to your save
  
  ![save](https://i.imgur.com/f96LrEP.png)
  
  &#10240;
  
</details>

<details>
  <summary>Why is it so bright in the middle of the night?</summary>
  &#10240;
  
  This is a vanilla game error and has been reported to CDPR, hopefully they will patch this in the future
  
</details>

<details>
  <summary>The car mod shop wrench icon isn't on the map</summary>
  &#10240;
  
  When on your map, on the left side ensure that when on **"FILTER: CUSTOM"** that the **"DROP POINT"** section is highlighted and the wrench icon for the [Car Modification Shop](https://www.nexusmods.com/cyberpunk2077/mods/4034) will appear in Northeast Watson
  
  ![shop 1](https://i.imgur.com/AXpYYJd.png)
  ![shop 2](https://i.imgur.com/LCJ6TCd.png)
  
  &#10240;
  
</details>

<details>
  <summary>I can't breach protocol or quickhack an enemy</summary>
  &#10240;
  
 This is due to [Better Netrunning's](https://www.nexusmods.com/cyberpunk2077/mods/2302) changes to vanilla network topology
  
  ![netrun](https://i.imgur.com/40Rr5lY.png)
  
  Sometimes the quickest way into a network is an unconscious gonk
  
  &#10240;
  
</details>

<details>
  <summary>My car fell through the ground</summary>
  &#10240;
  
  This is a vanilla game error and has been reported to CDPR, hopefully they will patch this in the future
  
  &#10240;
  
</details>

<details>
  <summary>I can't get into Claire's garage</summary>
  &#10240;
  
  This was a known issue with [Immersive Bartenders](https://www.nexusmods.com/cyberpunk2077/mods/7203) which has now been fixed, but could still be an issue on a save that was running a previous version. If the issue is affecting you, the mod author has an optional file that can be added found [here](https://www.nexusmods.com/cyberpunk2077/mods/7203?tab=files)
  
  ![optional file](https://i.imgur.com/5pOgUZ1.png)
  
  His instructions for using it are
  
  ![beast 2](https://i.imgur.com/5FtutwT.png)
  
  &#10240;
  
</details>

<details>
  <summary>When I upgrade my weapon the stats don't change</summary>
  &#10240;
  
  If you notice this happening on the crafting screen, don't continue to try to upgrade the gun. Reload your save and the issue will be resolved
  
   &#10240;
  
</details>

<details>
  <summary>An enemy gang member called the police on me</summary>
  &#10240;
  
  This is associated with [Vehicle Combat](https://www.nexusmods.com/cyberpunk2077/mods/3815). At high stars, in addition to enemy reinforcements NCDP's finest can show up, as a reflection of things getting completely out of hand
  
  &#10240;
  
</details>

&#10240;

</details>

<details>
  <summary>I turned on the Limited Hud Addon Simple Hud Toggle and it isn't working</summary>
  &#10240;
  
  Restart your game and it will, it defaults to <kbd>F1</kbd>
  
  &#10240;
  
</details>

&#10240;

## Vortex Specific Troubleshooting

<details>
  <summary>I cannot see the mod settings menu ingame</summary>
  &#10240;
  
  This is often associated with the **Vortex Redmod Autoconversion** being toggled on. It is off by default, but if it has done the autoconversion you will need to go through a process to correct this, and you will not have to redownload the associated mods. Go to the left side of Vortex to the grey bar and click on **"Settings"**
  
  ![step 1](https://i.imgur.com/ilpBWRY.png)
  
Go to the middle top grey bar and click on **"V2077 Settings"** and ensure that **"Automatically convert old style 'archive' mods to REDmods on install"** is greyed out and is not active
  
  ![step 2](https://i.imgur.com/iSYsHmn.png)
  
  ![step 3](https://i.imgur.com/nhjRZnF.png)
  
Go to the left hand side of vortex and click on **"Mods"** on the grey bar
  
  ![step 4](https://imgur.com/qmilmkT.png)
  
 Left click on the mod at the top of the list in the middle of the screen to highlight it
  
  ![step 5](https://i.imgur.com/ZnFt4GG.png)
  
Scroll to the bottom mod in the list and shift + left click it in order to highlight all of the mods
  
  ![step 6](https://i.imgur.com/sMgjtyG.png)
  
  On the white bar that has appeared at the very bottom of the list click **"Remove"**
  
  ![step 7](https://i.imgur.com/YOX2Eh1.png)
  
  In the popup that appears ensure that **"Remove Mod"** is ticked with a blue and white checkmark, but that **"Delete Archive"** remains unticked and clear
  
  ![step 8](https://i.imgur.com/TCjQfam.png)
  
 Click **"Remove"** at the bottom right of the popup 
  
  ![step 9](https://i.imgur.com/0DZZrf9.png)
  
 In the next popup, tick the box for **"Apply to Recommended Mods"** so that a blue and white checkmark appears 
  
  ![step 10](https://i.imgur.com/DdN6SNc.png)
  
  ![step 11](https://i.imgur.com/T2FjoXZ.png)
  
Then click on **"Disable"** bottom right of the grey popup  
  
  ![step 12](https://i.imgur.com/umC3y4R.png)
  
The list of mods will now show as **"Uninstalled"** in blue
  
  ![step 13](https://i.imgur.com/gcxRfNe.png)
  
Scroll down to the mod **"Cyberpunk Thing"** and left click it 
  
  ![step 14](https://i.imgur.com/uSZAlMx.png)
  
  After highlighting **"Cyberpunk Thing"** right click it and left click **"Install"**
  
  ![step 15](https://i.imgur.com/alHSwBk.png)
  
  In the popup that appears click **"Install Now"**
  
  ![step 16](https://i.imgur.com/L2LCxFQ.png)
  
 These steps will undo the REDmod autoconversion that vortex performed and will correct your install without you having to redownload any mods
  
  &#10240;
  
</details>

<details>
  <summary>What are some recommended CET keybinds?</summary>
  &#10240;
  
  Some binding recommendations for important features
  
  ![here](https://i.imgur.com/H3FeGjQ.png)
  
  &#10240;
  
</details>

&#10240;

## Wabbajack Specific Troubleshooting

<details>
  <summary>I don't see the initial CET keybind popup</summary>
  &#10240;
  
  In **MO2**, right click on **"CT Config"** in the left hand panel and select **"Open in Explorer"** and go to **"Root/bin/x64/plugins/cyber_engine_tweaks"** and delete **"bindings.json"**, then restart the game.
  
  ![CET binding location](https://i.imgur.com/cDUXnZP.png)
  
  &#10240;
  
  </details>

<details>
  
  <summary>How can I use MO2 to download mods from Nexus?</summary>
  &#10240;
  
  In **MO2**, click on the wrench icon on the top bar
  
  ![wjack 1](https://i.imgur.com/uXQdCzn.png)
  
  In the popup click on **"Nexus"**
  
  ![wjack 2](https://i.imgur.com/mKMH2pd.png)
  
  Click on **"Associate with 'Download with manager' Links"** and approve its request
  
  ![wjack 3](https://i.imgur.com/hRtGSZI.png)
  
  &#10240;
  
</details>

<details>
  <summary>Wabbajack can't find Cyberpunk 2077</summary>
  &#10240;
  
  One common cause for this is the **Wabbajack** client not being on the same hard drive as the game install, another is forgetting to have **Steam** or **GOG** verify and reacquire files as part of doing a cleaning of your Cyberpunk 2077 install
  
  &#10240;
  
</details>

<details>
  <summary>My flashlight isn't working</summary>
  &#10240;
  
  In order to use the included mod [Simple Flashlight](https://www.nexusmods.com/cyberpunk2077/mods/2913) open the "Game Folder Files" folder in your modlist install location, and copy the archive folder into your main Cyberpunk 2077 directory

![demonstration of game folder files thing](https://media.giphy.com/media/N8oz510KVUrX2PzLBN/giphy.gif)
  
  &#10240;
  
</details>

<details>
  <summary>Mods I added disappeared on update</summary>
  &#10240;
  
  To keep some of your custom mods when updating the **Wabbajack** rename the mods in **MO2** and add [NoDelete] on the left hand MO2 pane. As example "Dawn FM" becomes "[NoDelete] Dawn FM"
  
   &#10240;
  
</details>

<details>
  <summary>I can't get my preorder rewards</summary>
  &#10240;
  
  Launching the game through MO2 means that those rewards do not populate in your game as they have to go through CDPR's launcher. The easiest workaround is to in your new game run it without the modlist active (running through **GOG** or **Steam**), go through the prologue to your apartment and get the items, then launch the game through **MO2** to use the list after that
  
  &#10240;
  
</details>

&#10240;

## Gameplay Questions

<details>
  <summary>How do I use the CET console?</summary>
  &#10240;
  
  You can find a guide on some useful CET console commands [here](https://wiki.redmodding.org/cyber-engine-tweaks/console/how-do-i)
  
   &#10240;
  
</details>

<details>
  <summary>I can't find the new sandevistans or techdecks</summary>
  &#10240;
  
  You can find the new sandevistans added by [Time Dilation Overhaul](https://www.nexusmods.com/cyberpunk2077/mods/4931) at
  
  ![locations 1](https://i.imgur.com/6PySXe7.png)
  
  You can find the new techdecks added by [Drone Companions](https://www.nexusmods.com/cyberpunk2077/mods/4520)
  
  ![locations 2](https://i.imgur.com/EBG6RLY.png)
  
  ![locations 3](https://i.imgur.com/BF7qHnT.png)
  
  &#10240;
  
</details>

<details>
  <summary>I level too slowly/quickly</summary>
  &#10240;
  
  Adjustments to leveling can be made by going to **"Mods"** in the main menu
  
  ![step 1](https://i.imgur.com/U2wROZZ.png)
  
  Go to **"RMK Mods"**
  
  ![rmk mods](https://i.imgur.com/uOJA9Yt.png)
  
  Scroll to **"Simple XP Multiplier"** and adjust any values to your liking
  
  ![simple xp mult](https://i.imgur.com/YWYtwsp.png)
  
  &#10240;
  
</details>

<details>
  <summary>I take/do too much/little damage</summary>
  &#10240;
  
  Adjustments to damage taken or done can be made by going to **"Mods"** in the main menu
  
  ![step 1](https://i.imgur.com/U2wROZZ.png)
  
  Go to **"RMK Mods"**
  
  ![rmk mods](https://i.imgur.com/uOJA9Yt.png)
  
  Scroll to the **"Damage to NPC Multiplier"** or **"Damage to Player Multiplier"** and adjust any values to your liking
  
  ![dmg npc](https://i.imgur.com/k9yXNSS.png)
  ![dmg plyr](https://i.imgur.com/8HUjNHo.png)
  
  &#10240;
  
</details>

<details>
  <summary>The breach protocol minigame is too easy/hard</summary>
  &#10240;
  
  Adjustments to the breach protocol can be made by going to **"Mods"** in the main menu
  
  ![step 1](https://i.imgur.com/U2wROZZ.png)
  
  Go to **"RMK Mods"**
  
  ![rmk mods](https://i.imgur.com/uOJA9Yt.png)
  
  Scroll to the **"Challenging Breach Minigame"** and adjust any values to your liking
  
  ![brch](https://i.imgur.com/uiiogVl.png)
  
  &#10240;
  
</details>

<details>
  <summary>My sandevistan isn't slowing time</summary>
  &#10240;
  
  With [Time Dilation Overhaul,](https://www.nexusmods.com/cyberpunk2077/mods/4931) some of the brands like Dynalar and Zetatech have very low (near real time) time dilation strength by default. Recommend staying with the defaults, but this can be adjusted by going to **"Mods"**
  
  ![step 1](https://i.imgur.com/U2wROZZ.png)
  
  and go to **"TDO"** to make any desired adjustments
  
  ![tdo menu](https://i.imgur.com/Z3ITTaW.png)
  
  &#10240;
  
</details>

<details>
  <summary>I can't see enemies through walls with ping</summary>
  &#10240;
  
  This is a purposeful balance adjustment accomplished with the included mod [Disable Highlighting Through Walls,](https://www.nexusmods.com/cyberpunk2077/mods/3314) as without it ping can lead to extreme ease combined with tech weapons, and makes stealth far less rewarding. You are still able to manually mark enemies either yourself or through the [Nano Drone](https://www.nexusmods.com/cyberpunk2077/mods/3419) and this mark will show through walls
  
  ![walls](https://i.imgur.com/MzsrFMr.png)
  ![walls 2](https://i.imgur.com/Y4MmLNr.png)
  
  &#10240;
  
</details>

<details>
  <summary>My distraction quickhacks cost 0 ram</summary>
  &#10240;
  
  This is a known [Better Netrunning](https://www.nexusmods.com/cyberpunk2077/mods/2302) issue and is a UI glitch that does not affect the actual cost, which is correctly taken from your ram. The author is aware of the issue, but since the mod adds so much it is very much worth using
  
  &#10240;
  
</details>

<details>
  <summary>I can't walljump</summary>
  &#10240;
  
  The included mod [Alternative Midair Movement and Walljumping](https://www.nexusmods.com/cyberpunk2077/mods/5160) was customized for inclusion with [Demigod's](https://www.nexusmods.com/cyberpunk2077/users/30144935) permission to have the changes associated with the cyberware **"Maneuvering System"** which can be bought at the Arroyo Ripperdoc
  
  &#10240;
  
</details>

<details>
  <summary>I want to change the Immersive Timeskip hotkey from o</summary>
  &#10240;
  
  ```
  FOR VORTEX USERS
  ```
  
  In your main Cyberpunk 2077 directory, navigate to **"r6\input"** and open **"ImmersiveTimeskip.xml**
  
  ![shud 2](https://i.imgur.com/7Ts5R9G.png)
  
  ```
  FOR WABBAJACK USERS
  ```
  
  In **MO2** in the left panel left click **"Immersive Timeskip"** to highlight it, then right click it and select **"Open in Explorer"**
  
  ![shud 3](https://i.imgur.com/t37UVF9.png)
  
  Navigate to **"Root\r6\Input"**
  
  ![shud 4](https://i.imgur.com/I7zK8Se.png)
  
  ```
  Continued for Both
  ```
  
  **"ImmersiveTimeskip.xml** can be customized to choose whatever keybinds you would like, [a full list of CDPR's method for key naming here](https://pastebin.com/nsQ1cqi8)
  
  ![shud 5](https://i.imgur.com/fHosI4t.png)
  
  &#10240;
  
</details>

<details>
  <summary>I can't use a sandevistan and a techdeck at the same time</summary>
  &#10240;
  
  This was a limitation we added for balance reasons with the mod author's permission. If you would like to change this
  
   ```
  FOR VORTEX USERS
  ```
  
  In **Vortex** in the **"Mods"** section, navigate to **"CT Config"** and right click it to **"Open in File Manager"**
  
  ![shud 2](https://i.imgur.com/HYroN5m.png)
  
  Navigate to **"CT Config\bin\x64\plugins\cyber_engine_tweaks\mods\Drone Companions\Modules"** and open the file **"Techdecks.lua"**
  
  ![2nd](https://i.imgur.com/a7D9naZ.png)
  
  ```
  FOR WABBAJACK USERS
  ```
  
  In **MO2** in the left panel left click **"CT Config"** to highlight it, then right click it and select **"Open in Explorer"**
  
  ![3nd](https://i.imgur.com/pteWnMf.png)
  
  Navigate to **"Root\bin\x64\plugins\cyber_engine_tweaks\mods\Drone Companions\Modules"** and open the file **"Techdecks.lua"**
  
  ```
  Continued for Both
  ```
  
  In **"Techdecks.lua"** go to line 2041
  
  ![techdeck 1](https://i.imgur.com/IpO9yEN.png)
  
  and adjust **"Cyberdeck"** to be **"Techdeck"** 
  
  ![techdeck 2](https://i.imgur.com/rGD3A60.png)
  
  Keep in mind this change would have to be done again when the list updates
  
  &#10240;
  
</details>
