--[[
HardSet.lua
HardSet Manager

Copyright (c) 2023 Wolffy.au
]]

modName = modeName or "CPTHING_HardSet"
local HardSet = {
    version = '1.0.0'
}
local module = {}

GameSettings = require('CETKit/GameSettings')
local commonFunctions = require("TeslaCoiled/commonFunctions.lua")

-- print("Load last saved setting of HardSet switch on or off")
local internal = loadSettings() or {
    ["enabled"] = false
}
-- print(json.encode(internal))

-- print("Load up the predefined HardSet settings if needed")
if internal.hardSettings == nil then
    internal.hardSettings = require("HardSetDefaults") or {
        ["/gameplay/difficulty/AimAssistance"] = 0 -- 0 | 1 | 2
    }
end
-- print(json.encode(internal))

---Backup the current user settings
function module.saveUserSettings()
    --[[Iterate through each of the settings]]
    local usersettings = {}

    print("Go through each hard setting")
    for k, v in pairs(internal.hardSettings) do
        -- 	* If there are existing values in the DB, we hard set the values and leave the DB untouched
        local value = GameSettings.Get(k)
        usersettings[k] = value
        print("Current: " .. k .. " - " .. tostring(value))
    end

    --[[Dump the settings to a backup file]]
    print("Save settings")
    internal.backupSettings = usersettings
    saveSettings(internal)

    return usersettings
end
-- module.saveUserSettings()

---Check if I've already saved the original settings before, so I don't over-write them
function module.loadUserSettings()
    local usersettings = internal.backupSettings

    -- 	* If there are no values in the DB, then we save current values to DB while hard setting values
    if usersettings == nil then
        print("No settings found, backup settings now")
        usersettings = module.saveUserSettings()
    else
        print("Settings found")
    end

    return usersettings
end
-- internal.backupSettings = module.loadUserSettings()

---Rollback the user settings prior to HardSet
function module.rollbackSettings()
    if not (internal.backupSettings == nil) then
        -- * Rollback settings
        for k, v in pairs(internal.backupSettings) do
            print("Resetting: " .. k .. " - " .. tostring(v))
            GameSettings.Set(k, v)
        end
    end

    -- * Empty out the DB
    -- print("Delete settings")
    -- clearSettings()
    internal.enabled = false
    saveSettings(internal)
end
-- module.rollbackSettings()

--- Check if hard settings are being forced in game
function HardSet.Enabled() return internal.enabled end
-- print("Check HardSet.Enabled()")
-- print("HardSet.Enabled() = " .. (HardSet.Enabled() and 'true' or 'false'))

--- Enable or disable forcing hard settings in game
---@param state boolean
function HardSet.Set(state)
    internal.enabled = state
    if state then
        --[[On disabling setting switch]]

        internal.backupSettings = module.loadUserSettings()

        --[[Iterate through each of the settings]]
        for k, v in pairs(internal.hardSettings) do
            -- * Force setting
            print("Hardsetting: " .. k .. " - " .. tostring(v))
            GameSettings.Set(k, v)

            --[[TODO Grey out setting UI]]
            -- GameSettings.Toggle(k)
        end
        print(json.encode(internal))
        saveSettings(internal)
    else
        --[[On disabling setting switch]]
        module.rollbackSettings()
    end
end
-- print("Enable HardSet")
-- HardSet.Set(true)
-- print("HardSet.Enabled() = " .. (HardSet.Enabled() and 'true' or 'false'))

return HardSet
