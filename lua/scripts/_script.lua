-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local OBJECT_CLASS_SETUP = {}

function SCRIPT:Attach()
    Log.Trace("Attaching to '" .. self.name .. "' of class '" .. self.class .. "'")

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
    elseif instance.TriggerOnce then
        instance:AddBehavior("triggeraction", function (trigger, player)
            if not trigger._FIRED then
                trigger:TriggerOnce(player)
                trigger._FIRED = true
            end
        end)
    end
end

OBJECT_CLASS_SETUP["Trigger"] = Trigger_Setup