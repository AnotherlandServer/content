-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseWorld = require("core.base_world")

---@class GameEntry_P: BaseWorld
local GameEntry_P = Class(BaseWorld)

function GameEntry_P:PreLoadPlayerInventory(player)
    Log.Debug("PreLoadPlayerInventory")

    if player:Get("firstTimeSpawn") then
        local combat_style = player:Get("combatStyle")
        local class
        local gender

        if combat_style == 0 then
            class = "Rage"
        elseif combat_style == 1 then
            class = "Gunner"
        elseif combat_style == 2 then
            class = "Assassin"
        elseif combat_style == 3 then
            class = "Energizer"
        else
            Log.Debug("Unknown class: " .. combat_style)
            player:BeginLoadInventory()
            return
        end

        if player:Get("customizationGender") == 1 then
            gender = "Female"
        else
            gender = "Male"
        end

        player:Set("firstTimeSpawn", false)

        player:ApplyClassItem("Class_Preset_Tutorial_End_" .. class .. "_" .. gender, true, function ()
            Log.Debug("Preset applied")
            player:BeginLoadInventory()
        end)
    else
        player:BeginLoadInventory()
    end
end

return GameEntry_P