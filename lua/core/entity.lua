-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Events = require("core.events")

---@class Entity: Events
local Entity = Class(Events)

---@type string
Entity.name = nil

---@type integer
Entity.avatar_id = nil

---@type string
Entity.class = nil

---@type string
Entity.placement_guid = nil

---@type string
Entity.template_guid = nil

---@param key string
---@return any
function Entity:Get(key)
    return __engine.gameobject.Get(self, key)
end

---@param key string
---@param value any
---@return any
function Entity:Set(key, value)
    return __engine.gameobject.Set(self, key, value)
end

---@param key string
---@return any
function Entity:Reset(key)
    return __engine.gameobject.Reset(self, key)
end

---@type fun(self:Entity)
Entity.Init = nil

function Entity:Attach()
    Log.Trace("Attaching to '" .. self.name .. "' of class '" .. self.class .. "'")

    self:InitEvents()

    if self.Init then
        self:Init()
    end
end

function Entity:HotReload()
    self:Attach()
end

---@return Vector
function Entity:GetPosition()
    return __engine.movement.GetPosition(self)
end

---@return Quaternion
function Entity:GetRotation()
    return __engine.movement.GetRotation(self)
end

---@return Vector
function Entity:GetVelocity()
    return __engine.movement.GetVelocity(self)
end

---comment
---@return Entity[]
function Entity:GetInterests()
    return __engine.interests.GetInterests(self)
end

return Entity