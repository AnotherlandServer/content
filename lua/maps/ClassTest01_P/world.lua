-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseWorld = require("core.base_world")
local Timer = require("core.timer")

---@class ClassTest01_P: BaseWorld
local ClassTest01_P = Class(BaseWorld)

function ClassTest01_P:PreLoadPlayerInventory(player)
    Log.Debug("PreLoadPlayerInventory")

    local gender
    if player:Get("customizationGender") == 1 then
        gender = "Female"
    else
        gender = "Male"
    end

    local class
    if player:Get("combatStyle") == 0 then
        class = "Rage"
    elseif player:Get("combatStyle") == 1 then
        class = "Gunner"
        if gender == "Female" then
            gender = "female" -- Gunner preset has female gender in lower-case
        end
    elseif player:Get("combatStyle") == 2 then
        class = "Assassin"
    elseif player:Get("combatStyle") == 3 then
        class = "Energizer"
    else
        Log.Debug("Unknown class: " .. player:Get("combatStyle"))
        player:BeginLoadInventory()
        return
    end

    player:ApplyClassItem("Class_Preset_Tutorial_" .. class .. "_Category6_" .. gender, true, function ()
        Log.Debug("Preset applied")
        player:BeginLoadInventory()
    end)
end

return ClassTest01_P