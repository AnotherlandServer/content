-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")
local AvatarFilter = require("engine.avatar_filter")
local GetWorld = require("engine.world")
local Conditions = require("core.quest_conditions")
local Dialogue = require("core.quest_dialog")
local Timer = require("core.timer")

---@class Quest1352: BaseQuest
local Quest = Class(BaseQuest)

Quest.id = 1352
Quest.level = 1
Quest.world = "GameEntry_P"
Quest.exp_reward = 6
Quest.bit_reward = 2
Quest.questgiver = AvatarFilter.FindByInstanceId("ab097d08-b8c7-4286-a268-70d4c8e5f372")
Quest.progress_dialogue = 1355
Quest.preconditions = {
    level = 1,
    quests_finished = { 1350 }
}
Quest.conditions = {
    Conditions.Wait(5)
}

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function Quest:GetOfferDialogue(player, speaker)
    return {
        Dialogue.Line(6044):Choice("TellMore"),
        Dialogue.Line(13505),
    }
end

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function Quest:GetCompletedDialogue(player, speaker)
    return {
    }
end

---@param player Player
function Quest:OnQuestAccepted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]

    sellars:Set(player, "target", player.avatar_id)
    sellars:PlayAnimationForPlayer(player, "SellarsLaunchTube", 4.0333)
end

---@param player Player
function Quest:OnQuestCompleted(player)
end

---@param player Player
function Quest:OnQuestAbandoned(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]

    sellars:Set(player, "target", NULL_AVATAR_ID)
    sellars:CancelAnimationForPlayer(player)
end

return Quest