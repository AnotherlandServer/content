-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")
local GetWorld = require("engine.world")
local AvatarFilter = require("engine.avatar_filter")


---@class Quest1352: BaseQuest
local Quest = Class(BaseQuest)

local SELLARS_INSTANCE_ID = "ab097d08-b8c7-4286-a268-70d4c8e5f372"

---@param player Player
function Quest:OnQuestAccepted(player)
    local sellars = GetWorld():FindEntitiesWithFilter(AvatarFilter.FindByInstanceId(SELLARS_INSTANCE_ID))[1] --[[@as NpcOtherland]]

    sellars:Set(player, "target", player.avatar_id)
    sellars:PlayAnimationForPlayer(player, "SellarsLaunchTube", 4.0333)
end

---@param player Player
function Quest:OnQuestCompleted(player)
end

---@param player Player
function Quest:OnQuestAbandoned(player)
    local sellars = GetWorld():FindEntitiesWithFilter(AvatarFilter.FindByInstanceId(SELLARS_INSTANCE_ID))[1] --[[@as NpcOtherland]]

    sellars:Set(player, "target", NULL_AVATAR_ID)
    sellars:CancelAnimationForPlayer(player)
end

return Quest