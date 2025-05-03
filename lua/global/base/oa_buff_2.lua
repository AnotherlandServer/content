-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")
local Effector = require("engine.effector")
local AbilityEvent = require("engine.ability_event")

---@class OaBuff: Entity
---@field placement_guid string
---@field template_guid string
---@field instigator Player|NpcOtherland
---@field target Player|NpcOtherland
local OaBuff = Class(Entity)

function OaBuff:Attach()
    Log.Debug("OaBuff:Attach()")
end

function OaBuff:Detach()
    Log.Debug("OaBuff:Detach()")
end

function OaBuff:Tick()
    local effector = Effector:New(self.instigator, self:Get("effectorSettings"))
    effector:SetBuff(self)
    effector:SetTarget(self.target)
    
    local effects = effector:Apply()

    local event = AbilityEvent.New(self.target, "Use")
    event:SetBuff(self)
    event:SetEffectSource(self)
    event:AddEffects(effects)
    event:Fire()
end

return OaBuff