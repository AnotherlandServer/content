-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local AbilityInvocation = require("engine.ability_invocation")
local TargetFactory = require("global.base.edna_ability.target_factory")
local Timer = require("core.timer")

---@class EdnaAbility: Skill
local EdnaAbility = Class(require("core.skill"))

---comment
---@param invocation AbilityInvocation
---@param effector Damage
---@param target Entity
function EdnaAbility:CauseDamage(invocation, effector, target)
    local minDamage = 0
    local maxDamage = 0
    
    if invocation.item then
        minDamage = invocation.item:Get("WepMinDmg")
        maxDamage = invocation.item:Get("WepMaxDmg")
    end

    local damage = math.random(minDamage, maxDamage)
    if effector.damageMult ~= nil then
        damage = damage * effector.damageMult
    end

    if effector.weaponDPSMod ~= nil then
        damage = damage * effector.weaponDPSMod
    end

    invocation:AddDamageEffect(target, damage, effector.delay, invocation.ability:Get("TickPeriod"))
end

---comment
---@param request AbilityRequest
---@param invocation AbilityInvocation
---@param effector Damage
---@param channeling boolean
function EdnaAbility:Effector_damage(request, invocation, effector, channeling)
    local targets

    if effector.targetFactory then
        local targetfactory = TargetFactory.New(invocation.source, self, effector.targetFactory)
        targets = targetfactory:FindTargets(request)
    elseif request.target then
        targets = { request.target }
    else
        targets = {}
    end

    if effector.aoeTargetCap ~= nil then 
        if #targets > effector.aoeTargetCap then
            targets = { table.unpack(targets, 1, effector.aoeTargetCap) }
        end
    end

    for _, target in ipairs(targets) do
        if target:Get("alive") == false or target:Get("isUnAttackable") == true then
            goto continue
        end

        Log.Debug("EdnaAbility:Effector_damage - Target: " .. target.name)
        self:CauseDamage(invocation, effector, target)


        ::continue::
    end
end

---@param source Player|NpcOtherland
---@return TargetFactory
function EdnaAbility:ConstructTargetFactory(source)
    local targetFactory = self:Get("TargetFactory")

    return TargetFactory.New(source, self, targetFactory)
end

---@param source Player|NpcOtherland
---@param invocation AbilityInvocation
---@param request AbilityRequest
function EdnaAbility:Use(source, invocation, request)
    local effectors = self:Get("effectorSettings");
    ---@cast effectors EffectorDefinition

    if type(effectors) == "table" then
        for k,v in pairs(effectors) do
            Log.Debug("EdnaAbility:Cast - Effector: " .. k)

            if v.delay == nil and invocation.item then
                v.delay = 0--invocation.item:Get("weaponDelay")
            end

            Log.Debug("EdnaAbility:Cast - Effector delay: " .. v.delay)

            if self["Effector_" .. k] then
                self["Effector_" .. k](self, request, invocation, v)
            else
                Log.Warn("EdnaAbility:Cast - Effector not implemented: " .. k)
            end
        end

        return false
    end
end

---@param source Player|NpcOtherland
---@param invocation AbilityInvocation
---@param request AbilityRequest
---@return boolean
function EdnaAbility:Channel(source, invocation, request)
    local effectorChannelingSettings = self:Get("effectorChannelingSettings")
    ---@cast effectorChannelingSettings EffectorDefinition

    if type(effectorChannelingSettings) == "table" then
        if request.target:Get("alive") == false then
            return false
        end

        for k,v in pairs(effectorChannelingSettings) do
            Log.Debug("EdnaAbility:Cast - EffectorChanneling: " .. k)

            if self["Effector_" .. k] then
                self["Effector_" .. k](self, request, invocation, v)
            else
                Log.Warn("EdnaAbility:Cast - EffectorChanneling not implemented: " .. k)
            end
        end
    end

    return true
end

return EdnaAbility