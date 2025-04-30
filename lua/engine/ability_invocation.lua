-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@enum (key) EffectType
local EffectType = {
    Damage = 1,
    Healing = 3,

    Dispell = 8,
    DamageWithoutNumber = 20, -- ??
    FallingDamage = 32,
    HealOverTime = 33,

}

---@enum (key) CombatFlags
local CombatFlags = {
    Critical = 0x10,
    Dodge = 0x02,
    Parry = 0x04,
    Block = 0x20,
    Evading = 0x40,
    Miss = 0x80,
}

---@enum (key) AbilityType
local AbilityType = {
    Item = 1,
    Skill = 2,
    Buff = 3
}

---@enum (key) EventType
local EventType = {
    Use = 0,
    Charge = 1,
    Channel = 2,
    Cancel = 3,
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
---@field target? Entity
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

---@param ability EdnaAbility
---@param source Entity
---@param ability_type AbilityType
---@param event_type EventType
---@return AbilityInvocation
function AbilityInvocation.New(ability, source, ability_type, event_type)
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
    obj.event_duration = 0
    obj.rotation = source:GetRotation()
    obj.position = source:GetPosition()

    return obj
end

---@param number number
function AbilityInvocation:SetDuration(number)
    self.event_duration = number
end

---@param number integer
function AbilityInvocation:SetPredictionId(number)
    self.prediction_id = number
end

---@param number integer
function AbilityInvocation:SetComboStageId(number)
    self.combo_stage_id = number
end

---@param rotation Quaternion
function AbilityInvocation:SetRotation(rotation)
    self.rotation = rotation
end

---@param item EdnaFunction
function AbilityInvocation:SetItem(item)
    self.item = item
end

---@param target Entity
function AbilityInvocation:SetTarget(target)
    self.target = target
end

---@param target Entity
---@param amount? integer
---@param delay? number
---@param duration? number
function AbilityInvocation:AddDamageEffect(target, amount, delay, duration, flags)
    local delta_hp_id

    if amount ~= nil then
        delta_hp_id = __engine.combat.Damage(target, amount)
    end

    self.effects[#self.effects + 1] = {
        target = target,
        type = EffectType.Damage,
        amount = amount,
        delta_hp_id = delta_hp_id,
        delay = delay,
        effect_duration = duration,
        combat_flags = flags,
    }
end


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

---@param target Entity
---@param buff any
function AbilityInvocation:AddBuffEffect(target, buff)
    
end

function AbilityInvocation:Invoke()
    __engine.ability.Invoke(self)
end

AbilityInvocation.CombatFlags = CombatFlags

return AbilityInvocation