-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")
local GetWorld = require("engine.world")
local AvatarFilter = require("engine.avatar_filter")

local SELLARS_INSTANCE_ID = "ab097d08-b8c7-4286-a268-70d4c8e5f372"
local CONTAINER_INSTANCE_ID = "4af8fc0d-24e5-4ee8-8870-c236ff12448e"

---@class Quest1350: BaseQuest
local Quest = Class(BaseQuest)

---@param player Player
function Quest:OnQuestAccepted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(AvatarFilter.FindByInstanceId(SELLARS_INSTANCE_ID))[1] --[[@as NpcOtherland]]
    local container = GetWorld():FindEntitiesWithFilter(AvatarFilter.FindByInstanceId(CONTAINER_INSTANCE_ID))[1] --[[@as NpcOtherland]]

    sellars:Set(player, "target", container.avatar_id)

    GetWorld():RequestSpawnAvatar("SpawnVfx", "EDNAContainer", "GE_01_BallSpawnVFX_lua", nil, container:GetPosition(), Vector.ZERO)
end

---@param player Player
function Quest:OnQuestCompleted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(AvatarFilter.FindByInstanceId(SELLARS_INSTANCE_ID))[1] --[[@as NpcOtherland]]
    sellars:Set(player, "target", NULL_AVATAR_ID)
end

---@param player Player
function Quest:OnQuestAbandoned(player)
    local sellars = GetWorld():FindEntitiesWithFilter(AvatarFilter.FindByInstanceId(SELLARS_INSTANCE_ID))[1] --[[@as NpcOtherland]]
    sellars:Set(player, "target", NULL_AVATAR_ID)
end

return Quest