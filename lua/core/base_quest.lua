-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "engine.behavior"
---@module "global.base.player"
---@module "global.base.npc_otherland"

local AvatarFilter = require("engine.avatar_filter")

local Class = require("core.class")

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

function BaseQuest:Init()
    __engine.questlog.UpdateQuest(self)

    for idx, condition in ipairs(self.conditions or {}) do
        condition.id = idx - 1

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
function BaseQuest:MarkAvailableConditional(player)
    if self:IsAvailable(player) then
        player.quest_log:MarkQuestAvailable(self.id)
    end
end

---@param player Player
---@return boolean
function BaseQuest:IsAvailable(player)
    if self.preconditions then
        if self.preconditions.level and player:Get("lvl") < self.preconditions.level then
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
    elseif player:HasQuestCompleted(self.id) then
        if self.completion_filter and self.completion_filter:TestEntity(target) then
            player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestRelevant)
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
            local dialogue = self:GetOfferDialogue(player, speaker)
            if dialogue and #dialogue > 0 then
                dialogue[#dialogue].quest_id = self.id
                self:ExecuteDialogue(player, speaker, false, dialogue)

                return true
            end
        end
    elseif player:HasQuestInProgress(self.id) then
        if self.progress_filter:TestEntity(speaker) then
            local dialogue = self:GetProgressionDialogue(player, speaker)
            if dialogue and #dialogue > 0 then
                self:ExecuteDialogue(player, speaker, false, dialogue)
                return true
            end
        end
    elseif player:HasQuestCompleted(self.id) and self.completion_filter then
        if self.completion_filter:TestEntity(speaker) then
            local dialogue = self:GetCompletedDialogue(player, speaker)
            if dialogue and #dialogue > 0 then
                self:ExecuteDialogue(player, speaker, true, dialogue)
                return true
            end
        end
    end

    return false
end

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function BaseQuest:GetOfferDialogue(player, speaker)
    -- Default implementation does nothing
    return {}
end

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function BaseQuest:GetAcceptedDialogue(player, speaker)
    -- Default implementation does nothing
    return {}
end

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function BaseQuest:GetCompletedDialogue(player, speaker)
    -- Default implementation does nothing
    return {}
end

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function BaseQuest:GetProgressionDialogue(player, speaker)
    -- Default implementation does nothing
    return {}
end

---@param player Player
---@param speaker NpcOtherland
---@param finish_quest boolean
---@param dialogue DialogueNode[]
function BaseQuest:ExecuteDialogue(player, speaker, finish_quest, dialogue)
    return __engine.dialogue.ExecuteDialogue(player, speaker, self.id, finish_quest, dialogue)
end

---@param player Player
---@return ConditionProgress[]
function BaseQuest:ActiveConditions(player)
    local result = {}

    for _, condition in ipairs(self.conditions or {}) do
        table.insert(result, {
            condition = condition,
            count = __engine.questlog.GetConditionProgress(self, player, condition.id),
        })
    end

    return result
end

---@param player Player
---@return ConditionProgress|nil
function BaseQuest:NextCondition(player)
    return self:ActiveConditions(player)[1]
end

---@param player Player
---@param target Player|NonClientBase
function BaseQuest:InteractionCompleted(player, target)
    Log.Debug("BaseQuest:InteractionCompleted with target " .. target.name)

    local state = self:NextCondition(player)
    if not state then
        return
    end

    if state.condition.type == "interact" and state.condition.avatar_filter:TestEntity(target) then
        self:UpdateQuestProgress(player, state.condition.id, "ADD", 1)
    end
end

---@param player Player
---@param condition_id number
---@param update "ADD"|"REMOVE"|"SET"
---@param value number
function BaseQuest:UpdateQuestProgress(player, condition_id, update, value)
    __engine.questlog.UpdateQuestProgress(player, self.id, condition_id, update, value);
end

return BaseQuest