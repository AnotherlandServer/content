-- Copyright (C) 2024 AnotherlandServer
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU Affero General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.

local OBJECT_CLASS_SETUP = {}

function SCRIPT:Attach()
    Log.Info("Attaching to '" .. self.name .. "' of class '" .. self.class .. "'")

    -- Run class dependent setup function
    if OBJECT_CLASS_SETUP[self.class] then
        OBJECT_CLASS_SETUP[self.class](self)
    end

    if self.Init then
        self:Init()
    end
end

function SCRIPT:HotReload()
    self:Attach()
end

---Adds a behavior
---@param name string
---@param callback function
function SCRIPT:AddBehavior(name, callback)
    if self._BEHAVIOR == nil then
        self._BEHAVIOR = {}
    end

    if self._BEHAVIOR[name] then
        Log.Warn("Overriding behavior '" .. name .. "' of entity '" .. self.name .. "'")
    end 

    self._BEHAVIOR[name] = callback;
end

---
--- Object class specific initialization
---

function Trigger_Setup(instance)
    if instance.TriggerAction then
        instance:AddBehavior("triggeraction", instance.TriggerAction)
    end
end

OBJECT_CLASS_SETUP["Trigger"] = Trigger_Setup