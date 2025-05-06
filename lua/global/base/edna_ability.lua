-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local TargetFactory = require("engine.target_factory")
local Effector = require("engine.effector")
local HitTable = require("engine.hit_table")

---@class EdnaAbility: Skill
local EdnaAbility = Class(require("core.skill"))

---@param source Player|NpcOtherland
---@return TargetFactory
function EdnaAbility:ConstructTargetFactory(source)
    local targetFactory = self:Get("TargetFactory")
    return TargetFactory.New(source, targetFactory)
end

---@param source Player|NpcOtherland
---@param invocation AbilityEvent
---@param request AbilityRequest
function EdnaAbility:Use(source, invocation, request)
    local effectors = self:Get("effectorSettings");
    ---@cast effectors EffectorDefinition

    if type(effectors) == "table" then
        local effector = Effector:New(source, effectors)
        effector:SetAbility(self)
        effector:SetItem(request.item)
        effector:SetTarget(request.target)

        local effects = effector:Apply()
        invocation:AddEffects(effects)
    end
end

---@param source Player|NpcOtherland
---@param invocation AbilityEvent
---@param request AbilityRequest
---@return boolean
function EdnaAbility:Channel(source, invocation, request)
    local effectorChannelingSettings = self:Get("effectorChannelingSettings")
    ---@cast effectorChannelingSettings EffectorDefinition

    if type(effectorChannelingSettings) == "table" then
        local effector = Effector:New(source, effectorChannelingSettings)
        effector:SetAbility(self)
        effector:SetItem(request.item)
        effector:SetTarget(request.target)

        local effects = effector:Apply()
        invocation:AddEffects(effects)

        return #effects > 0
    end

    return true
end

---@param attacker Player|NpcOtherland
---@param defender Player|NpcOtherland
---@return HitType
---@return number
function EdnaAbility:CauseDamage(attacker, defender)
    local hit_table = HitTable:New(attacker, defender)
    hit_table:SetCanBeBlocked(self:Get("canBeBlocked"))

    Log.Debug("Player:Attack - Attack power rating: " .. attacker:Get("statAttackPowerRating"))


    local minDamage = attacker:Get("statWepMinDmg")
    local maxDamage = attacker:Get("statWepMaxDmg")

    local base_dmg = math.random(minDamage, maxDamage) 

    Log.Debug("Player:Attack - Base damage ( " .. minDamage .. " / " .. maxDamage .." ): " .. base_dmg)
    Log.Debug("Player:Attack - Final damage mod: " .. attacker:Get("statFinalDamageMod"))
    
    local damage = (base_dmg + attacker:GetBaseDamage() + attacker:Get("statAttackPowerRating"))
        * attacker:Get("statFinalDamageMod")
    local hit_type = hit_table:Roll()

    Log.Debug("Player:Attack - Hit type: " .. hit_type)
    Log.Debug("Player:Attack - Damage before reduction: " .. damage)

    if hit_type == "Miss" then
        damage = 0
    elseif hit_type == "Block" then
        damage = damage * defender:Get("statBlockedDamageMod")
    elseif hit_type == "Dodge" then
        damage = 0
    elseif hit_type == "Parry" then
        damage = 0
    elseif hit_type == "Critical" then
        damage = damage * attacker:Get("statCriticalDamageMod")
    end

    damage = damage - defender:Get("statAnyDmgReduction")

    Log.Debug("Player:Attack - Damage any reduction: " .. defender:Get("statAnyDmgReduction"))

    local armor_reduction = defender:Get("statArmorReduction") - attacker:Get("statPeneBonus")

    Log.Debug("Player:Attack - Armor reduction: " .. armor_reduction)

    damage = damage - armor_reduction

    Log.Debug("Player :Attack - Damage after reduction: " .. damage)


    return hit_type, math.max(math.floor(damage), 0)
end

return EdnaAbility