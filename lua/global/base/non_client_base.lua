-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")

---@class NonClientBase: Entity
local NonClientBase = Class(Entity)

---@private
NonClientBase._BEHAVIOR = {}

---Adds a behavior
---@param name string
---@param callback function
function NonClientBase.AddBehavior(name, callback)
    if NonClientBase._BEHAVIOR[name] then
        Log.Warn("Overriding behavior '" .. name .. "'")
    end 

    NonClientBase._BEHAVIOR[name] = callback;
end

return NonClientBase