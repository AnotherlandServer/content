-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local GetWorld = require("engine.world")
local NpcOtherland = require("global.base.npc_otherland")

---@class OnSpawnRunTo: NpcOtherland
local OnSpawnRunTo = Class(NpcOtherland)

OnSpawnRunTo:On("Spawned", 
    ---@param self OnSpawnRunTo
    function(self)
        Log.Debug(self.name .. ": OnSpawnRunTo")
        local target = GetWorld():GetEntityById(self:Get("tags")) --[[@as NonClientBase?]]

        if target then
            self:Set("moveDest", target:GetPosition())
            self:Set("moveSpeed", self:Get("runSpeed"))
        end
    end)

return OnSpawnRunTo