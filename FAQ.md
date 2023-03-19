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
  <summary>My saved games are blank ingame</summary>
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
  
  ![shud 2](https://i.imgur.com/t8J91RJ.png)
  
  ```
  FOR WABBAJACK USERS
  ```
  
  In **MO2** in the left panel left click **"Limited Hud"** to highlight it, then right click it and select **"Open in Explorer"**
  
  ![shud 3](https://i.imgur.com/EuBGa2T.png)
  
  Navigate to **"Root/r6/Input"**
  
  ![shud 4](https://i.imgur.com/qReV98j.png)
  
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
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>The car mod shop wrench icon isn't on the map</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>I can't breach protocol or quickhack an enemy</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>My car fell through the ground</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>I can't get into Claire's garage</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>When I upgrade my weapon the stats don't change</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>An enemy gang member called the police on me</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

&#10240;

## Vortex Specific Troubleshooting

<details>
  <summary>I cannot see the mod settings menu ingame</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>What are some recommended CET keybinds?</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
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
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>Wabbajack can't find Cyberpunk 2077</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>My flashlight isn't working</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>Mods I added disappeared on update</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>I can't get my preorder rewards</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
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
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>The breach protocol minigame is too easy/hard</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>My sandevistan isn't slowing time</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>I can't see enemies through walls with ping</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>My distraction quickhacks cost 0 ram</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>I can't walljump</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>I want to change the Immersive Timeskip hotkey from o</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>

<details>
  <summary>I can't use a sandevistan and a techdeck at the same time</summary>
  &#10240;
  
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod ac dolor vel pharetra. Sed gravida purus a dolor lobortis, sed bibendum dolor rutrum.
  
</details>
