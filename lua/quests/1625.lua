-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")


---@class Quest1625: BaseQuest
local Quest = Class(BaseQuest)

---@param player Player
function Quest:OnQuestFinished(player)
   player:TriggerRemoteEvent("BadSectorEnd")
end

return Quest