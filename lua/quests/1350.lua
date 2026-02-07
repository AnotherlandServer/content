-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")
local GetWorld = require("engine.world")

---@class Quest1350: BaseQuest
local Quest = Class(BaseQuest)

---@param player Player
function Quest:OnQuestAccepted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]
    local container = GetWorld():FindEntitiesWithFilter(self.conditions[1].avatar_filter)[1] --[[@as NpcOtherland]]

    sellars:Set(player, "target", container.avatar_id)

    GetWorld():RequestSpawnAvatar("SpawnVfx", "GE_01_BallSpawnVFX_lua", nil, container:GetPosition(), Vector.ZERO)
end

---@param player Player
function Quest:OnQuestCompleted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]
    sellars:Set(player, "target", NULL_AVATAR_ID)
end

---@param player Player
function Quest:OnQuestAbandoned(player)
    local sellars = GetWorld():FindEntitiesWithFilter(self.questgiver)[1] --[[@as NpcOtherland]]
    sellars:Set(player, "target", NULL_AVATAR_ID)
end

return Quest