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

---@class Quest1350: BaseQuest
local Quest = Class(BaseQuest)

Quest.id = 1350
Quest.level = 1
Quest.world = "GameEntry_P"
Quest.exp_reward = 6
Quest.bit_reward = 2
Quest.questgiver = AvatarFilter.FindByInstanceId("ab097d08-b8c7-4286-a268-70d4c8e5f372")
Quest.progress_dialogue = 1355
Quest.completion_dialogue = 1355
Quest.conditions = {
    Conditions.Interact(1, AvatarFilter.FindByContentId("00e4c508-c07d-4ee1-aeda-a136e1d736d5")),
}

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function Quest:GetOfferDialogue(player, speaker)
    return {
        Dialogue.Line(13502):Choice("TellMore"),
        Dialogue.Line(13503):Choice("TellMore"),
        Dialogue.Line(13504),
    }
end

---@param player Player
---@param speaker NpcOtherland
---@return DialogueNode[]
function Quest:GetCompletedDialogue(player, speaker)
    return {
        Dialogue.Line(10892):Choice("TellMore"),
    }
end

function Quest:OnQuestAccepted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]
    local container = GetWorld():FindEntitiesWithFilter(self.conditions[1].avatar_filter)[1] --[[@as NpcOtherland]]

    sellars:Set("target", container.avatar_id)

    GetWorld():RequestSpawnAvatar("SpawnVfx", "GE_01_BallSpawnVFX_lua", nil, container:GetPosition(), Vector.ZERO)
end

function Quest:OnQuestCompleted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]
    sellars:Set("target", NULL_AVATAR_ID)
end

function Quest:OnQuestAbandoned(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]
    sellars:Set("target", NULL_AVATAR_ID)
end

return Quest