-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Events = require("core.game_controller")

---@class InstanceDungeon: GameController
local InstanceDungeon = Class(Events)

---comment
---@param self InstanceDungeon
---@param player Player
InstanceDungeon:On("OnPlayerSpawning", function (self, player)
    
end)

return InstanceDungeon