-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "engine.behavior"
---@module "global.base.player"
---@module "global.base.npc_otherland"

local AvatarFilter = require("engine.avatar_filter")
local Timer = require("core.timer")
local Class = require("core.class")

---@class QuestCondition
---@field id number
---@field type "interact"|"dialogue"|"wait"|"kill"|"loot"|"proximity"
---@field current_count? number
---@field required_count? number
---@field avatar_filter? AvatarFilter

---@class BaseQuest: Class
---@field id number
local BaseQuest = Class()

function BaseQuest:HotReload()
end

---@param player Player
---@param condition_id number
---@param update "ADD"|"REMOVE"|"SET"
---@param value number
function BaseQuest:UpdateQuestProgress(player, condition_id, update, value)
    __engine.questlog.UpdateQuestProgress(player, self.id, condition_id, update, value);
end

---@return QuestCondition?
function BaseQuest:GetActiveCondition()
end

---@param condition integer
---@return QuestCondition
function BaseQuest:GetCondition(condition)
end

return BaseQuest