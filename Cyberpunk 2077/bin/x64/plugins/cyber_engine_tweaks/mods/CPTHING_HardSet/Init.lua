--[[
	MOD TITLE: CyberpunkTHING Hard Set
	MOD AUTHOR: Wolffy.au
	MOD VERSION: 1.0, 13/05/2023, Cyberpunk 2077 v1.62
	MOD DESCRIPTION:

	This mod changes the game settings to a hard mode while supporting a rollback mechanism. Native UI compatible.

	The purpose of this mod is to make the game more challenging and realistic.

	There is only one setting to enable the mod through Native Settings UI, which is on by default. 

	MOD THANKS: Thanks to the CET team, WolvenKit Team, the Cyberpunk 2077 Modding Discord, keanuWheeze/NexusGuy999
	for their amazing work with Native Settings UI and the Cyberpunk 2077 modding community at large for example code
	I used to understand how lua scripting for Cyberpunk 2077 works!
--]]

modName = "CPTHING_HardSet"
-- print("1")
local HardSet = require('HardSet') or print(modName .. ": Unable to load HardSet.lua")

-- print("2")

registerForEvent("onInit", function()
    -- print("3")
    -- print(HardSet)
    -- print(HardSet.Enabled())

    -- [[Initialize and create Native Settings UI Menu]]
    nativeSettings = GetMod("nativeSettings")
    if nativeSettings ~= nil then
        nativeSettings.addTab("/cpTHING", "Cyberpunk THING") -- Initialize Menu
        -- nativeSettings.addSubcategory("/cpTHING/hardSet", "HardSet")
        nativeSettings.addSwitch("/cpTHING", "Enable HardSet",
            "Enable/Disable Hard Settings", HardSet.Enabled(), false,
            function(state)
				HardSet.Set(state)
			end,
			0
    	)
    end
    -- print("4")
end)
