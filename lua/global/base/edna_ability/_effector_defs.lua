--------------------------------------------------------------------------------
-- COMPLETE LUA FILE WITH ALL DEFINITIONS AND FIELDS
-- This file uses EmmyLua / Lua Language Server annotations to define a 
-- "complete" set of classes and fields for ability/effect objects.
-- It references a strict TargetFactory union for shape-based targeting.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--                      1) TARGET FACTORY DEFINITIONS
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- BaseSettings
--------------------------------------------------------------------------------

---@class BaseSettings
---@field affectSelf? boolean
---@field affectFriends? boolean
---@field affectEnemies? boolean
---@field affectNeutral? boolean
---@field partyOnly? boolean
---@field targetLocation? boolean
---@field useInstigatorAsSource? boolean
---@field filterBehavior? string


--------------------------------------------------------------------------------
-- Circle
--------------------------------------------------------------------------------
---@class CircleSettings: BaseSettings
---@field radiusMin? number
---@field radiusMax? number

---@class CircleTargetFactory
---@field type "circle"
---@field settings CircleSettings


--------------------------------------------------------------------------------
-- Pie
--------------------------------------------------------------------------------
---@class PieSettings: BaseSettings
---@field radiusMin? number
---@field radiusMax? number
---@field angle? number

---@class PieTargetFactory
---@field type "pie"
---@field settings PieSettings


--------------------------------------------------------------------------------
-- Stickies
--------------------------------------------------------------------------------
---@class StickiesSettings: BaseSettings

---@class StickiesTargetFactory
---@field type "stickies"
---@field settings StickiesSettings


--------------------------------------------------------------------------------
-- None
--------------------------------------------------------------------------------
---@class NoneSettings: BaseSettings

---@class NoneTargetFactory
---@field type "none"
---@field settings NoneSettings


--------------------------------------------------------------------------------
-- Self
--------------------------------------------------------------------------------
---@class SelfSettings: BaseSettings

---@class SelfTargetFactory
---@field type "self"
---@field settings SelfSettings


--------------------------------------------------------------------------------
-- Threats
--------------------------------------------------------------------------------
---@class ThreatsSettings: BaseSettings

---@class ThreatsTargetFactory
---@field type "threats"
---@field settings ThreatsSettings


--------------------------------------------------------------------------------
-- Union type: TargetFactoryDef
--------------------------------------------------------------------------------
---@alias TargetFactoryDef
---| CircleTargetFactory
---| PieTargetFactory
---| StickiesTargetFactory
---| NoneTargetFactory
---| SelfTargetFactory
---| ThreatsTargetFactory


--------------------------------------------------------------------------------
--                      2) TOP-LEVEL FIELDS (OBJECTS)
--------------------------------------------------------------------------------

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