-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local AbilityInvocation = require("engine.ability_invocation")
local TargetFactory = require("global.base.edna_ability.target_factory")

---@class EdnaAbility: Skill
local EdnaAbility = Class(require("core.skill"))

---comment
---@param request AbilityRequest
---@param invocation AbilityInvocation
---@param effector Damage
function EdnaAbility:Effector_damage(request, invocation, effector)
    local targets
    local minDamage = 0
    local maxDamage = 0

    if invocation.item then
        minDamage = invocation.item:Get("WepMinDmg")
        maxDamage = invocation.item:Get("WepMaxDmg")
    end

    if effector.targetFactory then
        local targetfactory = TargetFactory.New(invocation.source, effector.targetFactory)
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

        local damage = math.random(minDamage, maxDamage)

        if effector.damageMult ~= nil then
            damage = damage * effector.damageMult
        end

        if effector.weaponDPSMod ~= nil then
            damage = damage * effector.weaponDPSMod
        end

        invocation:AddDamageEffect(target, damage, effector.delay)

        ::continue::
    end
end

---comment
---@param caster Player|NpcOtherland
---@param request AbilityRequest
function EdnaAbility:Cast(caster, request)
    Log.Debug("EdnaAbility:Cast")

    if self:Get("sourceMustBeAlive") and not caster:Get("alive") then
        Log.Debug("EdnaAbility:Cast - Source must be alive")
        return
    end

    local Player = require("global.base.player")
    if caster:GetClass() == Player then
        ---@cast caster Player
        if not caster:ConsumeCooldown(self:Get("externalCooldownsConsumed"), self:Get("internalCooldown")) then
            Log.Debug("EdnaAbility:Cast - Cooldown not ready")
            return
        end
    else
        Log.Debug("Caster is not a player")
    end

    if request.target ~= nil and request.target_rotation == nil then
        Log.Debug("EdnaAbility:Cast - Target rotation not set, calculating")

        -- Calculate rotation towards target
        local target_pos = request.target:GetPosition()
        local caster_pos = caster:GetPosition()

        -- Create a rotation that points from caster to target
        local direction = (target_pos - caster_pos):Normalize():WithY(0)

        request.target_rotation = Quaternion.FromRotationArc(Vector.Z, direction)
    end

    local invocation

    if request.item then
        invocation = AbilityInvocation:New(self, caster, "Item", "Charge")
        invocation.item = request.item
        invocation:SetDuration(request.item:Get("WepAttSpeed"))
    else
        Log.Warn("EdnaAbility:Cast - Non-item abilities not implemented yet")
        return
    end

    invocation:SetPredictionId(request.prediction_id)
    invocation:SetComboStageId(request.combo_stage_id)

    if request.target_rotation then
        invocation:SetRotation(request.target_rotation)
    end

    local effectors = self:Get("effectorSettings");
    ---@cast effectors EffectorDefinition

    for k,v in pairs(effectors) do
        Log.Debug("EdnaAbility:Cast - Effector: " .. k)
        if self["Effector_" .. k] then
            self["Effector_" .. k](self, request, invocation, v)
        else
            Log.Warn("EdnaAbility:Cast - Effector not implemented: " .. k)
        end
    end

    invocation:Invoke()
end

return EdnaAbility