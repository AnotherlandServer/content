-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class Events: Class
---@field _EVENTS table
local Events = Class()

function Events:InitEvents()
    local m = self:GetClass()
    ---@cast m Events

    self._EVENTS = {}

    repeat
        if m._EVENTS ~= nil then
            for event, callbacks in pairs(m._EVENTS) do
                if not self._EVENTS[event] then
                    self._EVENTS[event] = {}
                end

                for _, callback in ipairs(callbacks) do
                    table.insert(self._EVENTS[event], callback)
                end
            end
        end

        m = m:GetBaseClass()
    until m == nil	
end

---Registers a callback function to be executed when a specific event occurs
---@param event string The name of the event to listen for
---@param callback fun(self:Entity, ...:any):any The function to execute when the event is triggered
---@return nil
function Events:On(event, callback)
    if not rawget(self, "_EVENTS") then
        rawset(self, "_EVENTS", {})
    end

    if not self._EVENTS[event] then
        self._EVENTS[event] = {}
    end

    table.insert(self._EVENTS[event], callback)
end

---Triggers all callbacks registered for a specific event
---@param event string The name of the event to trigger
---@vararg any
---@return nil
function Events:Emit(event, ...)
    if self._EVENTS[event] then
        for _, callback in ipairs(self._EVENTS[event]) do
            callback(self, ...)
        end
    end
end

return Events