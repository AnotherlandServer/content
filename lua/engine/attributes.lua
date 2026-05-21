-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class AttributesContainer
---@field Strength number
---@field Strength_Mod number
---@field Dexterity number
---@field Dexterity_Mod number
---@field Focus number
---@field Focus_Mod number
---@field Stamina number
---@field Stamina_Mod number
---@field AttackPower number
---@field AttackPower_Mod number
---@field HitRating number
---@field HitRating_Mod number
---@field Hit_Chance number
---@field CritRating number
---@field CritRating_Mod number
---@field Crit_Chance number
---@field BlockRating number
---@field BlockRating_Mod number
---@field Block_Chance number
---@field BendRating number
---@field BendRating_Mod number
---@field Bend_Chance number
---@field ReflectRating number
---@field ReflectRating_Mod number
---@field Reflect_Chance number
---@field ArmorRating number
---@field ArmorRating_Mod number
---@field Armor_Reduction number
---@field HeavyEnergyPerHit_Mod number
---@field SpecialEnergyPerHit_Mod number
---@field Threat_Mod number
---@field AttackRangePhysAdd number
---@field ClassSkillCooldown_Reduction number
---@field CriticalDamage_Mod number
---@field CriticalChance_Reduction number
---@field BlockedDamage_Reduction number
---@field FinalDamage_Mod number
---@field FinalHealing_Mod number
---@field HealingReceived_Mod number
---@field AoE_MaxSubTargets number
---@field AoE_SubTargetsDamage_Scale number
---@field HealthRegen_Mod number
---@field ExtraHealthRegen number
---@field ExtraHealthRegen_Mod number
---@field Xp_Mod number
---@field Stealth_Level number
---@field Degenerate_Level number
---@field Jump_Scale number
---@field Movement_Mod number
---@field FreeFallDistance_Mod number
---@field DamagePercPerMeter_Mod number
---@field ExtraSomaCapacity number
---@field Energy number
---@field EnergyRegen number
---@field BaseDPS number
---@field WeaponDPS number
---@field WeaponDPS_Mod number
---@field AnyDmg_Reduction number
---@field WepMaxDmg number
---@field WepMinDmg number
local AttributesContainer = {}

---@enum (key) Attribute
AttributesContainer.ATTRIBUTE = {
    Strength = 0,
    Strength_Mod = 1,
    Dexterity = 2,
    Dexterity_Mod = 3,
    Focus = 4,
    Focus_Mod = 5,
    Stamina = 6,
    Stamina_Mod = 7,
    AttackPower = 8,
    AttackPower_Mod = 9,
    HitRating = 10,
    HitRating_Mod = 11,
    Hit_Chance = 12,
    CritRating = 13,
    CritRating_Mod = 14,
    Crit_Chance = 15,
    BlockRating = 16,
    BlockRating_Mod = 17,
    Block_Chance = 18,
    BendRating = 19,
    BendRating_Mod = 20,
    Bend_Chance = 21,
    ReflectRating = 22,
    ReflectRating_Mod = 23,
    Reflect_Chance = 24,
    ArmorRating = 25,
    ArmorRating_Mod = 26,
    Armor_Reduction = 27,
    HeavyEnergyPerHit_Mod = 28,
    SpecialEnergyPerHit_Mod = 29,
    Threat_Mod = 30,
    AttackRangePhysAdd = 31,
    ClassSkillCooldown_Reduction = 32,
    CriticalDamage_Mod = 33,
    CriticalChance_Reduction = 34,
    BlockedDamage_Reduction = 35,
    FinalDamage_Mod = 36,
    FinalHealing_Mod = 37,
    HealingReceived_Mod = 38,
    AoE_MaxSubTargets = 39,
    AoE_SubTargetsDamage_Scale = 40,
    HealthRegen_Mod = 41,
    ExtraHealthRegen = 42,
    ExtraHealthRegen_Mod = 43,
    Xp_Mod = 44,
    Stealth_Level = 45,
    Degenerate_Level = 46,
    Jump_Scale = 47,
    Movement_Mod = 48,
    FreeFallDistance_Mod = 49,
    DamagePercPerMeter_Mod = 50,
    ExtraSomaCapacity = 51,
    Energy = 52,
    EnergyRegen = 53,
    BaseDPS = 54,
    WeaponDPS = 55,
    WeaponDPS_Mod = 56,
    AnyDmg_Reduction = 57,
    WepMaxDmg = 58,
    WepMinDmg = 59,
}

---@return AttributesContainer
function AttributesContainer:New()
    local container = {}

    for attr, _ in pairs(self.ATTRIBUTE) do
        container[attr] = 0
    end

    setmetatable(container, { __index = self })

    return container
end

function AttributesContainer:NewDefault()
    local container = {}

    for attr, _ in pairs(self.ATTRIBUTE) do
        container[attr] = 0
    end

    container.Strength_Mod = 1
    container.Dexterity_Mod = 1
    container.Focus_Mod = 1
    container.Stamina_Mod = 1
    container.AttackPower_Mod = 1
    container.HitRating_Mod = 1
    container.CritRating_Mod = 1
    container.BlockRating_Mod = 1
    container.BendRating_Mod = 1
    container.ReflectRating_Mod = 1
    container.ArmorRating_Mod = 1
    container.HeavyEnergyPerHit_Mod = 1
    container.SpecialEnergyPerHit_Mod = 1
    container.Threat_Mod = 1
    container.ClassSkillCooldown_Reduction = 1
    container.CriticalDamage_Mod = 1
    container.CriticalChance_Reduction = 1
    container.BlockedDamage_Reduction = 1
    container.FinalDamage_Mod = 1
    container.FinalHealing_Mod = 1
    container.HealingReceived_Mod = 1
    container.HealthRegen_Mod = 1
    container.ExtraHealthRegen_Mod = 1
    container.Xp_Mod = 1
    container.Movement_Mod = 1
    container.FreeFallDistance_Mod = 1
    container.DamagePercPerMeter_Mod = 1
    container.WeaponDPS_Mod = 1

    setmetatable(container, { __index = self })

    return container
end

function AttributesContainer:SetNamedAttribute(name, value)
    if name == "" then
        return
    end

    if self[name] ~= nil then
        self[name] = value
    else
        error("Attribute '" .. name .. "' does not exist in AttributesContainer.")
    end
end

---@param other AttributesContainer
function AttributesContainer:AddAttributes(other)
    for attr, _ in pairs(self.ATTRIBUTE) do
        self[attr] = self[attr] + other[attr]
    end
end

---@param op "Add"|"Mul"|"Sub"|"Div"
---@param name Attribute
---@param value number
function AttributesContainer:Modify(op, name, value)
    if op == "Add" then
        self[name] = self[name] + value
    elseif op == "Mul" then
        self[name] = self[name] * value
    elseif op == "Sub" then
        self[name] = self[name] - value
    elseif op == "Div" then
        self[name] = self[name] / value
    end
end

return AttributesContainer