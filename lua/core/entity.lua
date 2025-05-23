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

---@type string
Entity.class = nil

---@overload fun(self:Entity, key:string): any
---@overload fun(self:Entity, player:Player, key:string): any
function Entity:Get(...)
    if type(select(1, ...)) == "string" then
        return __engine.gameobject.Get(self, select(1, ...))
    else
        return __engine.gameobject.GetPlayerLocal(self, select(1, ...), select(2, ...))
    end
end

---@overload fun(self:Entity, key:string): any
---@overload fun(self:Entity, key:string, value:any): any
function Entity:Set(...)
    if type(select(1, ...)) == "string" then
        return __engine.gameobject.Set(self, select(1, ...), select(2, ...))
    else
        return __engine.gameobject.SetPlayerLocal(self, select(1, ...), select(2, ...), select(3, ...))
    end
end

---@overload fun(self:Entity, key:string): any
---@overload fun(self:Entity, player:Player, key:string): any
function Entity:Reset(...)
    if type(select(1, ...)) == "string" then
        return __engine.gameobject.Reset(self, select(1, ...))
    else
        return __engine.gameobject.ResetPlayerLocal(self, select(1, ...), select(2, ...))
    end
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

return Entity