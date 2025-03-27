-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@enum (key) EffectType
local EffectType = {
    Damage = 1,
    Healing = 2, -- Not sure if correct
}

---@enum (key) AbilityType
local AbilityType = {
    Item = 1,
    Skill = 2,
    Buff = 3
}

---@enum (key) EventType
local EventType = {
    Charge = 0,
    Use = 1,
    Negate = 2,
    Channel = 3,
    Cancel = 4,
    ChannelEnd = 5,
    Max = 6
}

---@class Effects
---@field target Entity
---@field type integer
---@field amount? number
---@field delta_hp_id? integer
---@field delay? number
---@field effect_duration? number
---@field combat_flags? integer

---@class AbilityInvocation
---@field ability EdnaAbility
---@field source Entity
---@field item? EdnaFunction
---@field effects Effects[]
---@field prediction_id integer
---@field combo_stage_id integer
---@field rotation? Quaternion
---@field position Vector
---@field event_duration number
---@field ability_type integer
---@field event_type integer
local AbilityInvocation = {}

---comment
---@param source Entity
---@param ability_type AbilityType
---@param event_type EventType
---@return AbilityInvocation
function AbilityInvocation:New(ability, source, ability_type, event_type)
    local obj = {}
    setmetatable(obj, {
        __index = AbilityInvocation
    })

    obj.ability = ability
    obj.effects = {}
    obj.source = source
    obj.ability_type = AbilityType[ability_type]
    obj.event_type = EventType[event_type]
    obj.prediction_id = 0
    obj.combo_stage_id = 0
    obj.rotation = source:GetRotation()
    obj.position = source:GetPosition()

    return obj
end

function AbilityInvocation:SetDuration(number)
    self.event_duration = number
end

function AbilityInvocation:SetPredictionId(number)
    self.prediction_id = number
end

function AbilityInvocation:SetComboStageId(number)
    self.combo_stage_id = number
end

---comment
---@param target Entity
---@param amount integer
---@param delay? number
---@param duration? number
function AbilityInvocation:AddDamageEffect(target, amount, delay, duration)
    self.effects[#self.effects + 1] = {
        target = target,
        type = EffectType.Damage,
        amount = amount,
        delta_hp_id = __engine.combat.Damage(target, amount),
        delay = delay,
        effect_duration = duration,
    }
end

---comment
---@param target Entity
---@param amount integer
---@param delay? number
---@param duration? number
function AbilityInvocation:AddHealingEffect(target, amount, delay, duration)
    self.effects[#self.effects + 1] = {
        target = target,
        type = EffectType.Healing,
        amount = amount,
        delta_hp_id = __engine.combat.Damage(target, amount),
        delay = delay,
        effect_duration = duration,
    }
end

---comment
---@param target Entity
---@param buff any
function AbilityInvocation:AddBuffEffect(target, buff)
    
end

function AbilityInvocation:Invoke()
    __engine.ability.Invoke(self)
end

return AbilityInvocation