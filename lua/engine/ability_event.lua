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

---@enum (key) EventType
local EventType = {
    Use = 0,
    Charge = 1,
    Channel = 2,
    Cancel = 3,
}

---@class Effect
---@field target Entity
---@field type integer
---@field amount? number
---@field delta_hp_id? integer
---@field delay? number
---@field effect_duration? number
---@field combat_flags? integer

---@class AbilityEvent
---@field ability? EdnaAbility
---@field buff? OaBuff
---@field source Entity
---@field target? Entity
---@field effect_source? EdnaFunction|EdnaAbility|OaBuff
---@field effects Effect[]
---@field prediction_id integer
---@field combo_stage_id integer
---@field rotation? Quaternion
---@field position Vector
---@field event_duration number
---@field event_type integer
local AbilityEvent = {}

---@param source Entity
---@param event_type EventType
---@return AbilityEvent
function AbilityEvent.New(source, event_type)
    local obj = {}

    setmetatable(obj, {
        __index = AbilityEvent
    })

    obj.effects = {}
    obj.source = source
    obj.event_type = EventType[event_type]
    obj.prediction_id = 0
    obj.combo_stage_id = 0
    obj.event_duration = 0
    obj.position = __engine.movement.GetPosition(source)

    return obj
end

---@param ability? EdnaAbility
function AbilityEvent:SetAbility(ability)
    self.ability = ability
end

---@param buff? OaBuff
function AbilityEvent:SetBuff(buff)
    self.buff = buff
end

---@param number number
function AbilityEvent:SetDuration(number)
    self.event_duration = number
end

---@param number integer
function AbilityEvent:SetPredictionId(number)
    self.prediction_id = number
end

---@param number integer
function AbilityEvent:SetComboStageId(number)
    self.combo_stage_id = number
end

---@param rotation Quaternion
function AbilityEvent:SetRotation(rotation)
    self.rotation = rotation
end

---@param source? EdnaFunction|EdnaAbility|OaBuff
function AbilityEvent:SetEffectSource(source)
    self.effect_source = source
end

---@param target? Entity
function AbilityEvent:SetTarget(target)
    self.target = target
end

---@param effects Effect[]
function AbilityEvent:AddEffects(effects)
    for _, effect in ipairs(effects) do
        self:AddEffect(effect)
    end
end

---@param effect Effect
function AbilityEvent:AddEffect(effect)
    self.effects[#self.effects + 1] = effect
end

function AbilityEvent:Fire()
    __engine.ability.FireEvent(self)
end

AbilityEvent.EffectType = EffectType
AbilityEvent.CombatFlags = CombatFlags

return AbilityEvent