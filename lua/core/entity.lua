-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class Entity
local Entity = Class()

---@private
Entity._EVENTS = {}

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

---Registers a callback function to be executed when a specific event occurs
---@param event string The name of the event to listen for
---@param callback fun(self:Entity, ...:any):any The function to execute when the event is triggered
---@return nil
function Entity.On(event, callback)
    if not Entity._EVENTS[event] then
        Entity._EVENTS[event] = {}
    end

    table.insert(Entity._EVENTS[event], callback)
end

---Triggers all callbacks registered for a specific event
---@param event string The name of the event to trigger
---@vararg any
---@return nil
function Entity:Emit(event, ...)
    if Entity._EVENTS[event] then
        for _, callback in ipairs(Entity._EVENTS[event]) do
            callback(self, ...)
        end
    end
end

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
    return __engine.gameobject.Set(self, key)
end

---@type fun(self:Entity)
Entity.Init = nil

function Entity:Attach()
    Log.Trace("Attaching to '" .. self.name .. "' of class '" .. self.class .. "'")

    if self.Init then
        self:Init()
    end
end

function Entity:HotReload()
    self:Attach()
end

return Entity