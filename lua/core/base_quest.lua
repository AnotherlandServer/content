-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "engine.behavior"
---@module "global.base.player"
---@module "global.base.npc_otherland"

local AvatarFilter = require("engine.avatar_filter")

local Class = require("core.class")

---@class BaseCondition
---@field id number
---@field type string
---@field required_count number
---@field package filter AvatarFilter?
---@field package beacon NonClientBase?

---@class InteractCondition: BaseCondition
---@field type "interact"
---@field avatar_filter AvatarFilter

---@class DialogCondition: BaseCondition
---@field type "dialog"
---@field dialog_id number

---@alias Condition InteractCondition | DialogCondition

---@class ConditionProgress
---@field condition Condition
---@field count number

---@class BaseQuest: Class
---@field id number
---@field level number
---@field world string
---@field exp_reward? number
---@field bit_reward? number
---@field item_reward? string| { assassin: string, energizer: string, rage: string, tech: string }
---@field preconditions? { level?: number, quests_finished?: number[] }
---@field questgiver? AvatarFilter
---@field progress_dialogue? number
---@field completion_dialogue? number
---@field conditions? Condition[]
---@field private progress_filter? AvatarFilter
---@field private completion_filter? AvatarFilter
local BaseQuest = Class()

---@enum QuestMarker
BaseQuest.QuestMarker = {
    None = 0,
    QuestGiver = 1,
    QuestRelevant = 2,
}

---@param player Player
function BaseQuest:MarkAvailableConditional(player)
    if self:IsAvailable(player) then
        player.quest_log:MarkQuestAvailable(self.id)
    end
end

function BaseQuest:IsAvailable(player)
    if self.preconditions then
        if self.preconditions.level and player:Get("level") < self.preconditions.level then
            return false
        end
        if self.preconditions.quests_finished then
            for _, quest_id in ipairs(self.preconditions.quests_finished) do
                if not player:HasQuestFinished(quest_id) then
                    return false
                end
            end
        end
    end
    return true
end

---@param player Player
---@param target NonClientBase
function BaseQuest:UpdateQuestMarker(player, target)
    Log.Debug("Updating quest marker for player " .. player.name .. " and target " .. target.name .. " - state " .. player.quest_log:GetQuestState(self.id))

    if player:HasQuestAvailable(self.id) then
        if self.questgiver and self.questgiver:TestEntity(target) then
            player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestGiver)
        end
    elseif player:HasQuestInProgress(self.id) then
        if self.progress_filter and self.progress_filter:TestEntity(target) then
            player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestRelevant)
        elseif self.completion_filter and self.completion_filter:TestEntity(target) then
            player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestRelevant)
        else
            for _, condition in ipairs(self.conditions or {}) do
                if condition.avatar_filter:TestEntity(target) then
                    player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestRelevant)
                    return
                end
            end
        end
    else
        player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.None)
    end
end

---@param player Player
---@param speaker NpcOtherland
---@return boolean handled
function BaseQuest:RunDialogue(player, speaker)
    if player:HasQuestAvailable(self.id) then
        if self.questgiver:TestEntity(speaker) then
            if self:RunOfferDialogue(player, speaker) then
                return true
            end
        end
    elseif player:HasQuestInProgress(self.id) then
        if self.progress_filter:TestEntity(speaker) then
            if self:RunAcceptedDialogue(player, speaker) then
                return true
            end
        end

        return self:RunProgressionDialogue(player, speaker)
    elseif player:HasQuestCompleted(self.id) and self.completion_filter then
        if self.completion_filter:TestEntity(speaker) then
            if self:RunCompletedDialogue(player, speaker) then
                return true
            end
        end
    end

    return false
end

---@param player Player
---@param speaker NpcOtherland
---@return boolean handled
function BaseQuest:RunOfferDialogue(player, speaker)
    -- Default implementation does nothing
    return false
end

---@param player Player
---@param speaker NpcOtherland
---@return boolean handled
function BaseQuest:RunAcceptedDialogue(player, speaker)
    -- Default implementation does nothing
    return false
end

---@param player Player
---@param speaker NpcOtherland
---@return boolean handled
function BaseQuest:RunCompletedDialogue(player, speaker)
    -- Default implementation does nothing
    return false
end

---@param player Player
---@param speaker NpcOtherland
---@return boolean handled
function BaseQuest:RunProgressionDialogue(player, speaker)
    -- Default implementation does nothing
    return false
end

---@class Choice
---@field choice_emote "Close"|"Approve"|"Reject"|"Next"|"TellMore"
---@field next_index number

---@class DialogueNode
---@field content_id number
---@field quest_id? number
---@field choices Choice[]

---@param player Player
---@param speaker NpcOtherland
---@param id number
---@param dialogue DialogueNode[]
function BaseQuest:ExecuteDialogue(player, speaker, id, dialogue)
    return __engine.dialogue.ExecuteDialogue(player, speaker, id, dialogue)
end

function BaseQuest:Init()
    __engine.questlog.UpdateQuest(self)

    for _, condition in ipairs(self.conditions or {}) do
        if condition.type == "interact" then
            condition.filter = condition.avatar_filter
        elseif condition.type == "dialog" then
            condition.filter = AvatarFilter.FindByDialog(condition.dialog_id)
        else
            error("Unknown condition type: " .. condition.type)
        end

        if not condition.beacon and condition.avatar_filter then
            condition.beacon = GetWorld():FindEntitiesWithFilter(condition.avatar_filter)[1] --[[@as NonClientBase]]
        end
    end
    
    if self.progress_dialogue then
        self.progress_filter = AvatarFilter.FindByDialog(self.progress_dialogue)
    end

    if self.completion_dialogue then
        self.completion_filter = AvatarFilter.FindByDialog(self.completion_dialogue)
    end
end

function BaseQuest:HotReload()
    self:Init()
end

---@param player Player
---@return ConditionProgress[]
function BaseQuest:ActiveConditions(player)
    local result = {}

    for _, condition in ipairs(self.conditions or {}) do
        table.insert(result, {
            condition = condition,
            count = 0,
        })
    end

    return result
end

return BaseQuest