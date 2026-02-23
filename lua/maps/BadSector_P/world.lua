-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseWorld = require("core.base_world")
local Timer = require("core.timer")

---@class BadSector_P: BaseWorld
local BadSector_P = Class(BaseWorld)

function BadSector_P:SpawnPlayer(player)
    Timer:SingleShot(player, 10, function ()
        player.quest_log:AcceptQuest(1625)
    end)

    BaseWorld.SpawnPlayer(self, player)
end

return BadSector_P