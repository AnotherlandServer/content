-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")
local AvatarFilter = require("engine.avatar_filter")
local GetWorld = require("engine.world")

---@class Quest: BaseQuest
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
    { id = 0, type = "interact", required_count = 1, avatar_filter = AvatarFilter.FindByContentId("00e4c508-c07d-4ee1-aeda-a136e1d736d5") },
}

---@param player Player
---@param speaker NpcOtherland
---@return boolean handled
function Quest:RunOfferDialogue(player, speaker)
    Quest:ExecuteDialogue(player, speaker, 1350, {
        { content_id = 13502, choices = { { choice_emote = "TellMore", next_index = 1 } } },
        { content_id = 13503, choices = { { choice_emote = "TellMore", next_index = 2 } } },
        { content_id = 13504, choices = {}, quest_id = self.id },
    })

    return true
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