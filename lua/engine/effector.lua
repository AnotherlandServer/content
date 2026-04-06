--------------------------------------------------------------------------------
-- COMPLETE LUA FILE WITH ALL DEFINITIONS AND FIELDS
-- This file uses EmmyLua / Lua Language Server annotations to define a 
-- "complete" set of classes and fields for ability/effect objects.
-- It references a strict TargetFactory union for shape-based targeting.
--------------------------------------------------------------------------------

local AbilityEvent = require("engine.ability_event")
local TargetFactory = require("engine.target_factory")
local Player = require("global.base.player")
local Timer = require("core.timer")

--------------------------------------------------------------------------------
-- Buff
--------------------------------------------------------------------------------
---@class Buff
---@field buffName? string
---@field buffDuration? number
---@field delay? number
---@field onlyFromStealth? boolean
---@field onUseChance? number
---@field initialStackCount? number
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- Damage
--------------------------------------------------------------------------------
---@class Damage
---@field damageMult? number
---@field weaponDPSMod? number
---@field attackPowerMod? number
---@field threatMod? number
---@field onlyFromStealth? boolean
---@field projectileSpeed? number
---@field projectileAcceleration? number
---@field aoeTargetCap? number
---@field aoeCoefficient? number
---@field delay? number
---@field children? EffectorDefinition   -- sub-effects triggered after damage
---@field targetFactory? TargetFactoryDef
---@field useInstigatorAsSource? boolean
---@field importEffectChainingDamage? boolean


--------------------------------------------------------------------------------
-- Heal
--------------------------------------------------------------------------------
---@class Heal
---@field useDefaultHealCalculation? boolean
---@field addProportionOfInstigatorBaseHP? number
---@field addProportionOfSourceBaseHP? number
---@field damageMult? number
---@field children? EffectorDefinition
---@field targetFactory? TargetFactoryDef
---@field useInstigatorAsSource? boolean
---@field importEffectChainingDamage? boolean
---@field fullDamageFormula? boolean
---@field weaponDPSMod? number
---@field delay? number

--------------------------------------------------------------------------------
-- HealPerSecond
--------------------------------------------------------------------------------
---@class HealPerSecond
---@field damageMult? number
---@field weaponDPSMod? number
---@field attackPowerMod? number
---@field useDefaultHealCalculation? boolean
---@field children? EffectorDefinition
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- DamagePerSecond
--------------------------------------------------------------------------------
---@class DamagePerSecond
---@field damageMult? number
---@field weaponDPSMod? number
---@field attackPowerMod? number
---@field children? EffectorDefinition
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- Interrupt
--------------------------------------------------------------------------------
---@class Interrupt

--------------------------------------------------------------------------------
-- ChangeEnergy
--------------------------------------------------------------------------------
---@class ChangeEnergy
---@field Add_Proportion_OfMax? number


--------------------------------------------------------------------------------
-- DispellBuffs
--------------------------------------------------------------------------------
---@class DispellBuffs
---@field subGroups? string[]      -- e.g. ["Stun","Sleep"]
---@field buffGroups? string[]     -- e.g. ["BuffGroup_HackDrives"]
---@field children? EffectorDefinition
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- Move
--------------------------------------------------------------------------------
---@class Move
---@field distanceMax? number
---@field toTarget? boolean
---@field moveEffectDuration? number
---@field delay? number
---@field distanceModifier? number
---@field faceTarget? boolean


--------------------------------------------------------------------------------
-- Teleport
--------------------------------------------------------------------------------
---@class Teleport
---@field toTarget? boolean
---@field faceTarget? boolean
---@field delay? number


--------------------------------------------------------------------------------
-- Threat
--------------------------------------------------------------------------------
---@class Threat
---@field threatMod? number
---@field taunt? boolean
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- SpawnPet
--------------------------------------------------------------------------------
---@class SpawnPet
---@field contentEntry? string


--------------------------------------------------------------------------------
-- SpawnMount
--------------------------------------------------------------------------------
---@class SpawnMount
---@field contentEntry? string


--------------------------------------------------------------------------------
-- SpawnAvatar
--------------------------------------------------------------------------------
---@class SpawnAvatar
---@field ContentClass? string
---@field MinCount? number
---@field MaxCount? number
---@field CountStep? number
---@field DeathDuration? number
---@field AliveTime? number
---@field minDistance? number
---@field maxDistance? number
---@field leashRadius? number


--------------------------------------------------------------------------------
-- SpawnTwistSpike
--------------------------------------------------------------------------------
---@class SpikeEffectors
---@field TickAbilityName? string
---@field EnterAbilityName? string
---@field LeaveAbilityName? string
---@field OnDestroyAbilityName? string

---@class SpawnTwistSpike
---@field ContentClass? string
---@field Duration? number
---@field SleepDuration? number
---@field RangeMax? number
---@field delay? number
---@field SpikeEffectors? SpikeEffectors


--------------------------------------------------------------------------------
-- RangeDamage
--------------------------------------------------------------------------------
---@class RangeDamage
---@field projectileSpeed? number


--------------------------------------------------------------------------------
-- KnockbackTarget
--------------------------------------------------------------------------------
---@class KnockbackTarget
---@field distanceMax? number
---@field knockbackDistClamp? number
---@field delay? number
---@field moveEffectDuration? number


--------------------------------------------------------------------------------
-- HeavySpecialEnergy
--------------------------------------------------------------------------------
---@class HeavySpecialEnergy
---@field proportionOfMax? number
---@field clear? boolean
---@field onlyOneWeapon? boolean


--------------------------------------------------------------------------------
-- EqualizeHealth
--------------------------------------------------------------------------------
---@class EqualizeHealth
---@field useStickies? boolean
---@field distance? number
---@field totalHPMod? number


--------------------------------------------------------------------------------
-- StickyTarget
--------------------------------------------------------------------------------
---@class StickyTarget
---@field lifeTime? number
---@field maxDistance? number
---@field maxTargets? number


--------------------------------------------------------------------------------
-- DrinkSoma
--------------------------------------------------------------------------------
---@class DrinkSoma
---@field somaType? number
---@field amount? number


--------------------------------------------------------------------------------
-- SetSourceParams
--------------------------------------------------------------------------------
---@class SetSourceParamsParams
---@field [string]? any

---@class SetSourceParams
---@field params? SetSourceParamsParams


--------------------------------------------------------------------------------
-- ResetCooldown
--------------------------------------------------------------------------------
---@class ResetCooldown
---@field proportionOfMax? number
---@field minimumInSeconds? number
---@field ignoreSkillGroups? string[]  -- e.g. ["SkillGroup_Gunner_Chrono"]
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- SoulUplink
--------------------------------------------------------------------------------
---@class SoulUplink
---@field NumOfSoulTransferred? number


--------------------------------------------------------------------------------
-- StrealMyLandAddress
--------------------------------------------------------------------------------
---@class StrealMyLandAddress

--------------------------------------------------------------------------------
-- MeleeDamage
--------------------------------------------------------------------------------
---@class MeleeDamage
---@field damageMult? number
---@field addProportionOfTargetMaxHP? number
---@field isUseSourceLevel? boolean
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- TellBehavior
--------------------------------------------------------------------------------
---@class TellBehavior
---@field tellSource? string
---@field tellTarget? string
---@field targetFactory? TargetFactoryDef


--------------------------------------------------------------------------------
-- ChangeStance
--------------------------------------------------------------------------------
---@class ChangeStance
---@field stanceIndex? number
---@field stanceRank? number


--------------------------------------------------------------------------------
-- EffectorDefinition
--------------------------------------------------------------------------------
---@class EffectorDefinition
---@field damage? Damage
---@field buff? Buff
---@field heal? Heal
---@field healPerSecond? HealPerSecond
---@field damagePerSecond? DamagePerSecond
---@field interrupt? Interrupt
---@field changeEnergy? ChangeEnergy
---@field dispellBuffs? DispellBuffs
---@field move? Move
---@field teleport? Teleport
---@field threat? Threat
---@field spawnPet? SpawnPet
---@field spawnMount? SpawnMount
---@field spawnAvatar? SpawnAvatar
---@field spawnTwistSpike? SpawnTwistSpike
---@field rangeDamage? RangeDamage
---@field knockbackTarget? KnockbackTarget
---@field heavySpecialEnergy? HeavySpecialEnergy
---@field equalizeHealth? EqualizeHealth
---@field stickyTarget? StickyTarget
---@field drinkSoma? DrinkSoma
---@field setSourceParams? SetSourceParams
---@field resetCooldown? ResetCooldown
---@field soulUplink? SoulUplink
---@field strealMyLandAddress? StrealMyLandAddress
---@field meleeDamage? MeleeDamage
---@field TellBehavior? TellBehavior
---@field changeStance? ChangeStance
---

---@class EffectAmount
---@field amount number
---@field type "Normal"|"Critical"

---@class EffectSource
---@field type "Ability"|"Buff"|"Item"
---@field entity EdnaAbility|OaBuff|EdnaFunction

---@class Effector
---@field def EffectorDefinition
---@field item? EdnaFunction
---@field target? Player|NpcOtherland
---@field source Player|NpcOtherland
---@field ability? EdnaAbility
---@field buff? OaBuff
---@field targetRotation? Quaternion
---@field externalEvent? AbilityEvent
---@field externalEffect? Effect
---@field importedTarget? Player|NpcOtherland
---@field baseDelay? number
local Effector = {}

local Effectors = {
    ---@param effector Effector
    ---@param def Damage
    ---@return Effect[]
    damage = function (effector, def)
        ---@type Effect[]
        local effects = {}

        local targets = effector:CreateTargetFactory(def.targetFactory):FindTargets()
    
        if def.aoeTargetCap ~= nil then 
            if #targets > def.aoeTargetCap then
                targets = { table.unpack(targets, 1, def.aoeTargetCap) }
            end
        end

        for _, target in ipairs(targets) do
            ---@cast target Player|NpcOtherland
            
            local is_unattackable = target:Get("isUnAttackable")
            if effector.source.class == "player" and target.class == "npcOtherland" then
                local player = effector.source --[[@as Player]]
                is_unattackable = target:Get(player, "isUnAttackable")
            end
            
            if target:Get("alive") == false or is_unattackable then
                goto continue
            end
    
            --Log.Debug("EdnaAbility:Effector_damage - Target: " .. target.name)

            local hit_type, damage 
            local combat_flags

            if def.useInstigatorAsSource then
                effector.externalEffect.amount = effector.externalEffect.amount + effector.externalEffect.amount
                return {}
            elseif effector.ability then
                hit_type, damage = effector.ability:CauseDamage(effector.source, target)
            end

            local delta_hp_id = FireDamageEvent(target, effector.source, effector.item or effector.buff or effector.ability, {
                type = hit_type == "Critical" and "Critical" or "Normal",
                amount = damage,
            },
            (def.delay or 0) + (effector.baseDelay or 0))

            --Log.Debug("Effector:damage - Target: " .. target.name .. ", Damage: " .. damage .. ", HitType: " .. hit_type)

            if hit_type == "Critical" then
                combat_flags = AbilityEvent.CombatFlags.Critical
            elseif hit_type == "Dodge" then
                combat_flags = AbilityEvent.CombatFlags.Dodge
            elseif hit_type == "Parry" then
                combat_flags = AbilityEvent.CombatFlags.Parry
            elseif hit_type == "Block" then
                combat_flags = AbilityEvent.CombatFlags.Block
            elseif hit_type == "Evade" then
                combat_flags = AbilityEvent.CombatFlags.Evading
            elseif hit_type == "Miss" then
                combat_flags = AbilityEvent.CombatFlags.Miss
            end

            effects[#effects + 1] = {
                target = target,
                type = AbilityEvent.EffectType.Damage,
                combat_flags = combat_flags,
                delta_hp_id = delta_hp_id,
                amount = damage,
                delay = def.delay,
            }
    
            ::continue::
        end

        return effects
    end,

    ---@param effector Effector
    ---@param def Heal
    ---@return Effect[]
    heal = function (effector, def)
        ---@type Effect[]
        local effects = {}

        local targets = effector:CreateTargetFactory(def.targetFactory):FindTargets()
        
        for _, target in ipairs(targets) do
            ---@cast target Player|NpcOtherland

            --Log.Debug("EdnaAbility:Effector_heal - Target: " .. target.name)

            if target.class == "npcOtherland" then
                ---@cast target NpcOtherland
                target:MoveToPosition(effector.source:GetPosition(), target:Get("runSpeed"), function() end)
            end

            local hit_type
            local heal_amount = 0
            local combat_flags
            local delta_hp_id = nil

            if def.useDefaultHealCalculation ~= false then
                if effector.item then
                    hit_type, heal_amount = effector.item:RollHeal(target)

                    --[[if hit_type == HitType.Critical then
                        combat_flags = AbilityEvent.CombatFlags.Critical
                    elseif hit_type == HitType.Dodge then
                        combat_flags = AbilityEvent.CombatFlags.Dodge
                    elseif hit_type == HitType.Parry then
                        combat_flags = AbilityEvent.CombatFlags.Parry
                    elseif hit_type == HitType.Block then
                        combat_flags = AbilityEvent.CombatFlags.Block
                    elseif hit_type == HitType.Evade then
                        combat_flags = AbilityEvent.CombatFlags.Evading
                    elseif hit_type == HitType.Miss then
                        combat_flags = AbilityEvent.CombatFlags.Miss
                    end]]
                end
            end

            if def.addProportionOfInstigatorBaseHP ~= nil then
                heal_amount = heal_amount + math.floor(def.addProportionOfInstigatorBaseHP * (effector.target:Get("hpMax") - effector.target:Get("hpMin")))
            end

            if def.addProportionOfSourceBaseHP ~= nil then
                heal_amount = heal_amount + math.floor(def.addProportionOfSourceBaseHP * (effector.source:Get("hpMax") - effector.source:Get("hpMin")))
            end

            local delta_hp_id = FireHealEvent(target, effector.source, effector.item or effector.buff or effector.ability, {
                type = hit_type == "Critical" and "Critical" or "Normal",
                amount = heal_amount,
            },
            (def.delay or 0) + (effector.baseDelay or 0))

            effects[#effects + 1] = {
                target = target,
                type = AbilityEvent.EffectType.Healing,
                delta_hp_id = delta_hp_id,
                amount = heal_amount,
                combat_flags = combat_flags,
            }
        end

        return effects
    end,

    ---@param effector Effector
    ---@param def Buff
    ---@return Effect[]
    buff = function (effector, def)
        if def.onUseChance and math.random() < def.onUseChance then
            return {}
        end

        --- Todo: Check onlyFromStealth condition

        local effects = {}
        local targets = effector:CreateTargetFactory(def.targetFactory):FindTargets()

        for _, target in ipairs(targets) do
            ---@cast target Player|NpcOtherland

            if not target:HasBuff("Name", def.buffName) then
                target:AddBuffByName(def.buffName, effector.source, def.buffDuration, def.delay, def.initialStackCount)
            end
        end

        return effects
    end,

    ---@param effector Effector
    ---@param def ChangeStance
    ---@return Effect[]
    changeStance = function (effector, def)
        if effector.source.class ~= "player" then
            Log.Err("Effector:changeStance - Source is not a player")
            return {}
        end

        local player = effector.source --[[@as Player]]
        player:ChangeStance(def.stanceIndex, def.stanceRank)

        return {}
    end,
}

---@param source Player|NpcOtherland
---@param def EffectorDefinition
---@return Effector
function Effector:New(source, def)
    local instance = {}

    setmetatable(instance, {
        __index = Effector
    })

    instance.source = source
    instance.def = def

    return instance
end

---@param event AbilityEvent
function Effector:SetExternalEvent(event)
    self.externalEvent = event
end

---@param effect? Effect
function Effector:SetExternalEffect(effect)
    self.externalEffect = effect
end

---@param target Player|NpcOtherland
function Effector:ImportTarget(target)
    self.importedTarget = target
end

---@param def? TargetFactoryDef
---@return TargetFactory
function Effector:CreateTargetFactory(def)
    local factoryDef = def

    if not factoryDef then
        if self.ability then
            local targetType = self.ability:Get("targetType")

            if targetType == "Self" then
                factoryDef = {
                    type = "self",
                    settings = {
                        affectSelf = true,
                    }
                }
            elseif targetType == "Enemy" then
                factoryDef = {
                    type = "none",
                    settings = {
                        affectEnemies = true,
                    }
                }
            else
                Log.Err("Effector:CreateTargetFactory - TargetType not found: " .. targetType)
                factoryDef = {
                    type = "none",
                    settings = {
                        affectFriends = true,
                        affectEnemies = true,
                        affectNeutral = true,
                    }
                }
            end
        else
            factoryDef = {
                type = "none",
                settings = {
                    affectFriends = true,
                    affectEnemies = true,
                    affectNeutral = true,
                }
            }
        end
    end

    local targetfactory = TargetFactory.New(self.source, factoryDef)
    targetfactory:SetSelectedTarget(self.target)
    targetfactory:OverrideRotation(self.targetRotation)

    if self.importedTarget then
        targetfactory:ImportTarget(self.importedTarget)
    end

    return targetfactory
end

---@param item EdnaFunction
function Effector:SetItem(item)
    self.item = item
end

---@param target? Player|NpcOtherland
function Effector:SetTarget(target)
    self.target = target
end

---@param ability EdnaAbility
function Effector:SetAbility(ability)
    self.ability = ability
end

---@param buff OaBuff
function Effector:SetBuff(buff)
    self.buff = buff
end

---@param rotation? Quaternion
function Effector:SetTargetRotation(rotation)
    self.targetRotation = rotation
end

---@param delay? number
function Effector:SetBaseDelay(delay)
    self.baseDelay = delay
end

---@return Effect[]
function Effector:Apply()
    local effects = {}

    for k,v in pairs(self.def) do
        local effector = Effectors[k]

        if effector then
            for _,v in ipairs(effector(self, v)) do 
                effects[#effects + 1] = v
            end
        else
            Log.Err("Effector:Apply - Effector not implemented: " .. k)
        end
    end

    return effects
end

---@param target Player|NpcOtherland
---@param instigator Player|NpcOtherland
---@param source? EdnaFunction|EdnaAbility|OaBuff
---@param amount EffectAmount
---@param delay? number
---@return integer delta_hp_id
function FireDamageEvent(target, instigator, source, amount, delay)
    local id = __engine.combat.GenerateId()

    if delay then
        Timer:SingleShot(target, delay, function()
            __engine.combat.FireDamageEvent(target, id, instigator, source, amount)
        end)
    else
        __engine.combat.FireDamageEvent(target, id, instigator, source, amount)
    end

    return id
end

---@param target Player|NpcOtherland
---@param instigator Player|NpcOtherland
---@param source? EdnaFunction|EdnaAbility|OaBuff
---@param amount EffectAmount
---@param delay? number
---@return integer delta_hp_id
function FireHealEvent(target, instigator, source, amount, delay)
    local id = __engine.combat.GenerateId()

    if delay then
        Timer:SingleShot(target, delay, function()
            __engine.combat.FireHealEvent(target, id, instigator, source, amount)
        end)
    else
        __engine.combat.FireHealEvent(target, id, instigator, source, amount)
    end

    return id
end

---@param target Player|NpcOtherland
---@param instigator Player|NpcOtherland
---@param source? EdnaFunction|EdnaAbility|OaBuff
---@param amount EffectAmount
---@param delay? number
---@return integer delta_hp_id
function FireReviveEvent(target, instigator, source, amount, delay)
    local id = __engine.combat.GenerateId()

    if delay then
        Timer:SingleShot(target, delay, function()
            __engine.combat.FireReviveEvent(target, id, instigator, source, amount)
        end)
    else
        __engine.combat.FireReviveEvent(target, id, instigator, source, amount)
    end

    return id
end

return Effector