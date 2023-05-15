--[[
commonFunctions.lua

Copyright (c) 2022 TeslaCoiled
]]

--- [FUNCTION]: Save the contents of the settings array to a JSON file in the directory
--- @param stuff table
--- @param[opt=modName] string
--- @return nil
function saveSettings(stuff, filename)
    filename = filename or modName

	local next = next

    if next(stuff) == nil then
        print("[" .. modName .. "] ERROR: Current config table does not exist.")
        return
    end

    local file = io.open("config/" .. filename .. ".json", "w+")

    if file == nil then
        print("[" .. modName .. "] ERROR: Could not open/create " .. filename .. ".json file to save settings.")
    else
        file:write(json.encode(stuff))
        file:close()
    end
end

--- [FUNCTION]: Attempt to load the contents of the settings array to "nUISettings.json" in the "/config/" directory.
--- [DETAILS]: If that fails, read in the contents of "userConfig.lua"
--- Returns the contents of the file as an lua table.
--- @return table
function loadSettings(filename)
    filename = filename or modName

	local file = io.open("config/" .. filename .. ".json", "r");
    local jsonString

	if file == nil then
	else
        jsonString = file:read("*all")
        file:close()
		if jsonString == "" then
			return nil
		else
			return json.decode(jsonString)
		end
    end
end

function clearSettings(filename)
    filename = filename or modName

	os.remove("config/" .. filename .. ".json")
	
    -- local file = io.open("config/" .. filename .. ".json", "w+")
    -- file:write("")
    -- file:close()
end