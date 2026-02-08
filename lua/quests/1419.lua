-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")

---@class Quest1419: BaseQuest
local Quest = Class(BaseQuest)

---@param player Player
function Quest:OnQuestFinished(player)
    local combat_style = player:Get("combatStyle")
    local class
    local gender = ""

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
        gender = "_Female"
    end

    player:ApplyClassItem("Class_Preset_Tutorial_End_" .. class .. "_LM_L1" .. gender, true, nil)
end

return Quest