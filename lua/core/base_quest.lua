-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "engine.behavior"
---@module "global.base.player"
---@module "global.base.npc_otherland"

local AvatarFilter = require("engine.avatar_filter")
local Timer = require("core.timer")
local Class = require("core.class")

---@class ConditionProgress
---@field condition Condition
---@field count number

---@class BaseQuest: Class
---@field id number
local BaseQuest = Class()

---@enum QuestMarker
BaseQuest.QuestMarker = {
    None = 0,
    QuestGiver = 1,
    QuestRelevant = 2,
}

function BaseQuest:HotReload()
end

---@param player Player
---@param condition_id number
---@param update "ADD"|"REMOVE"|"SET"
---@param value number
function BaseQuest:UpdateQuestProgress(player, condition_id, update, value)
    __engine.questlog.UpdateQuestProgress(player, self.id, condition_id, update, value);
end

---@param player Player
---@return number
function BaseQuest:GetLastConditionUpdateTime(player)
    return __engine.questlog.GetLastConditionUpdateTime(self.id, player)
end


return BaseQuest