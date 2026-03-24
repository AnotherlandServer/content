-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")
local Effector = require("engine.effector")
local AbilityEvent = require("engine.ability_event")
local Timer = require("core.timer")

---@class OaBuff: Entity
---@field placement_guid string
---@field template_guid string
---@field instigator Player|NpcOtherland
---@field target Player|NpcOtherland
---@field triggers { [string]: table }
---@field triggerState { [string]: { triggered: boolean, gated: boolean, timer: Timer? } }
local OaBuff = Class(Entity)

function OaBuff:Init()
    self.triggers = {}
    self.triggerState = {}
    
    local triggers = self:Get("eventTriggeredEffectors")
    if triggers then
        for event, attribs in pairs(triggers) do
            self.triggers[event] = attribs
            self.triggerState[event] = { triggered = false, gated = false, timer = nil }
        end
    end
end

function OaBuff:Tick()
    local settings = self:Get("effectorSettings")

    if settings then
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
end

---@param source Player|NpcOtherland
---@param damage EffectAmount
function OaBuff:OnOwnerDamaged(source, damage)
    if self.instigator == source and self:CanTriggerEffector("damageByInstigator") then
        self:TriggerEffector("damageByInstigator", source, damage)
    end
end

---@param source Player|NpcOtherland
---@param heal EffectAmount
function OaBuff:OnOwnerHealed(source, heal)
end

---@param source Player|NpcOtherland
function OaBuff:OnOwnerDeath(source)
    if self:Get("destroyOnOwnerDied") then 
        self:Expire()
    end 
end

---@param source Player|NpcOtherland
function OaBuff:OnOwnerRevive(source)
end

---@param source Player|NpcOtherland
function OaBuff:OnInstigatorDeath(source)
end

function OaBuff:Expire()
    __engine.buffs.RemoveBuff(self.target, "Instance", self.placement_guid)
end

---@param effector string
function OaBuff:CanTriggerEffector(effector)
    local trigger = self.triggers["damageByInstigator"]
    local state = self.triggerState["damageByInstigator"]

    if
        not trigger and
        (state.triggered and not trigger.settings.canReTrigger) or
        state.gated
    then
        return false
    end

    return true
end

---@param effectorName string
---@param instigator Player|NpcOtherland
---@param amount EffectAmount
function OaBuff:TriggerEffector(effectorName, instigator, amount)
    local trigger = self.triggers[effectorName]
    local state = self.triggerState[effectorName]

    state.triggered = true
    
    if trigger.settings.timeGate then
        state.gated = true

        if state.timer then
            state.timer:Stop()
        end

        state.timer = Timer:SingleShot(self, trigger.settings.timeGate, function()
            state.gated = false
            state.timer = nil
        end)
    end

    
    local effector = Effector:New(instigator, trigger.effects)
    effector:SetBuff(self)
    effector:SetSourceAmount(amount)
    effector:SetTarget(self.target)

    if trigger.settings.exportDamageSourceAsTarget then
        effector:ImportTarget(instigator)
    end
    
    local effects = effector:Apply()
    
    Log.Debug("OaBuff:TriggerEffector - Triggered effector '" .. effectorName .. "' with " .. #effects .. " effects")

    local event = AbilityEvent.New(instigator, "Use")
    event:SetBuff(self)
    event:SetEffectSource(self)
    event:AddEffects(effects)
    event:Fire()
end

return OaBuff