-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")

---@class NonClientBase: Entity
---@field avatar_id AvatarId
---@field placement_guid string
---@field template_guid string
local NonClientBase = Class(Entity)

function NonClientBase:Init()
    local m = self:GetClass()
    ---@cast m NonClientBase

    self._BEHAVIOR = {}

    repeat
        if m._BEHAVIOR ~= nil then
            for name, callback in pairs(m._BEHAVIOR) do
                if not self._BEHAVIOR[name] then
                    self._BEHAVIOR[name] = callback
                end
            end
        end

        m = m:GetBaseClass()
    until m == nil
end

---Adds a behavior
---@param name string
---@param callback function
function NonClientBase:AddBehavior(name, callback)
    if not rawget(self, "_BEHAVIOR") then
        rawset(self, "_BEHAVIOR", {})
    end

    self._BEHAVIOR[name] = callback;
end

---@return Vector
function NonClientBase:GetPosition()
    return __engine.movement.GetPosition(self)
end

---@return Quaternion
function NonClientBase:GetRotation()
    return __engine.movement.GetRotation(self)
end

---@return Vector
function NonClientBase:GetVelocity()
    return __engine.movement.GetVelocity(self)
end

---@return Entity[]
function NonClientBase:GetInterests()
    return __engine.interests.GetInterests(self)
end

function NonClientBase:Despawn()
    __engine.loader.DespawnAvatar(self)
end

return NonClientBase