-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "engine.behavior"
---@module "global.base.player"
---@module "global.base.npc_otherland"

local Class = require("core.class")

---@class BaseQuest: Class
---@field id number
---@field level number
---@field world string
---@field exp_reward? number
---@field bit_reward? number
---@field item_reward? string| { assassin: string, energizer: string, rage: string, tech: string }
---@field preconditions? { level?: number, quests_finished?: number[] }
---@field questgivers string[]
---@field questreceivers string[]
local BaseQuest = Class()
BaseQuest.questgivers = {}
BaseQuest.questreceivers = {}

---@enum QuestMarker
BaseQuest.QuestMarker = {
    None = 0,
    QuestGiver = 1,
    QuestTarget = 2,
    QuestReceiverIncomplete = 3,
    QuestReceiverComplete = 4,
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
        for _, qg in ipairs(self.questgivers) do
            if target.name == qg then
                player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestGiver)
            end
        end
    elseif player:HasQuestInProgress(self.id) then
        for _, qr in ipairs(self.questreceivers) do
            if target.name == qr then
                player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestReceiverIncomplete)
            end
        end
    elseif player:HasQuestCompleted(self.id) then
        for _, qr in ipairs(self.questreceivers) do
            if target.name == qr then
                player:UpdateQuestMarker(target, self, BaseQuest.QuestMarker.QuestReceiverComplete)
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
        for _, qg in ipairs(self.questgivers) do
            if speaker.name == qg then
                if self:RunOfferDialogue(player, speaker) then
                    return true
                end
            end
        end
    elseif player:HasQuestInProgress(self.id) then
        for _, qr in ipairs(self.questreceivers) do
            if speaker.name == qr then
                if self:RunAcceptedDialogue(player, speaker) then
                    return true
                end
            end
        end

        return self:RunObjectiveDialogue(player, speaker)
    elseif player:HasQuestCompleted(self.id) then
        for _, qr in ipairs(self.questreceivers) do
            if speaker.name == qr then
                if self:RunCompletedDialogue(player, speaker) then
                    return true
                end
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
function BaseQuest:RunObjectiveDialogue(player, speaker)
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

return BaseQuest