-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local NonClientBase = require("global.base.non_client_base")

---@class Trigger: NonClientBase
local Trigger = Class(NonClientBase)

---@type fun(self:Trigger, player:any)
Trigger.TriggerAction = nil

---@type fun(self:Trigger, player:any)
Trigger.TriggerOnce = nil

function Trigger:OnTrigger(player)
    if self.TriggerAction then
        self:TriggerAction(player)
    elseif self.TriggerOnce then
        if not self._FIRED then
            self:TriggerOnce(player)
            self._FIRED = true
        end
    end
end

Trigger:AddBehavior("triggeraction", Trigger.OnTrigger)

return Trigger