-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")

---@class Player: Entity
local Player = Class(Entity)

---@private
Player._BEHAVIOR = {}

---Adds a behavior
---@param name string
---@param callback function
function Player.AddBehavior(name, callback)
    Player._BEHAVIOR[name] = callback;
end

function Player:Behavior_RequestSelectWeapon(_, id)
    if id ~= nil then
        Log.Debug("Requesting weapon selection for player " .. self.name .. " - " .. id)
        self:Set("weapon", { id, "00000000-0000-0000-0000-000000000000" })
    end
end

Player.AddBehavior("requestselectweapon", Player.Behavior_RequestSelectWeapon)

return Player