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

---comment
---@param source Player|NpcOtherland
---@param request AbilityRequest
function EdnaAbility:Invoke(source, request)
    Log.Debug("EdnaAbility:Cast")

    if self:Get("sourceMustBeAlive") and not source:Get("alive") then
        Log.Debug("EdnaAbility:Cast - Source must be alive")
        return
    end

    local Player = require("global.base.player")
    if source:GetClass() == Player then
        ---@cast source Player
        
        local cooldown
        if request.item then
            cooldown = request.item:Get("WepAttSpeed")
        else
            cooldown = self:Get("internalCooldown")
        end

        if #self:Get("externalCooldownsConsumed") == 0 and self:Get("isAutoAttack") then
            if not source:ConsumeCooldown({[1] = "22a4f191-0183-48ec-8b17-4f9c6cb72f47"}, cooldown) then
                Log.Debug("EdnaAbility:Cast - Cooldown not ready")
                return
            end
        else
            if not source:ConsumeCooldown(self:Get("externalCooldownsConsumed"), cooldown) then
                Log.Debug("EdnaAbility:Cast - Cooldown not ready")
                return
            end
        end
    else
        Log.Debug("Caster is not a player")
    end

    if request.target ~= nil and request.target_rotation == nil then
        Log.Debug("EdnaAbility:Cast - Target rotation not set, calculating")

        -- Calculate rotation towards target
        local target_pos = request.target:GetPosition()
        local caster_pos = source:GetPosition()

        -- Create a rotation that points from caster to target
        local direction = (target_pos - caster_pos):Normalize():WithY(0)

        request.target_rotation = Quaternion.FromRotationArc(Vector.Z, direction)
    end

    local invocation

    local event_type
    if self:Get("CastTime") > 0 then
        event_type = "Charge"
    else
        event_type = "Use"
    end

    if request.item then
        --invocation = AbilityInvocation.New(self, source, "Item", "Channel")
        invocation = AbilityInvocation.New(self, source, "Item", event_type)
        invocation:SetItem(request.item)
        invocation:SetDuration(self:Get("CastTime"))
    else
        Log.Warn("EdnaAbility:Cast - Non-item abilities not implemented yet")
        return
    end

    invocation:SetTarget(request.target)
    invocation:SetPredictionId(request.prediction_id)
    invocation:SetComboStageId(request.combo_stage_id)

    if request.target_rotation then
        invocation:SetRotation(request.target_rotation)
    end

    invocation:Invoke()

    if source.GetClass() == Player then
        source._TestTimer = Timer:Start(source, self:Get("CastTime"), 0, function (timer, stopping)
            invocation = AbilityInvocation.New(self, source, "Item", "Channel")
            invocation:SetItem(request.item)
            invocation:SetDuration(999999) --request.item:Get("WepAttSpeed"))
            --invocation:SetDuration(-1)
            --invocation:SetDuration(self:Get("TickPeriod"))
            --invocation:SetDuration(-1)
            --invocation:SetPredictionId(request.prediction_id)
            --invocation:SetComboStageId(1)
            invocation:SetTarget(request.target)

            if request.target_rotation then
                invocation:SetRotation(request.target_rotation)
            end

            invocation:Invoke()
    
            ---@cast source Player
            source:BeginChanneling(request.item:Get("WepAttSpeed"), self, request)
        end)
    end
end

---@param source Player|NpcOtherland
---@param request AbilityRequest
---@return boolean
function EdnaAbility:Channel(source, request)
    Log.Debug("EdnaAbility:Channel")

    local effectors = self:Get("effectorSettings");
    ---@cast effectors EffectorDefinition

    if type(effectors) == "table" then
        local invocation = AbilityInvocation.New(self, source, "Item", "Channel")
        invocation:SetItem(request.item)
        invocation:SetDuration(self:Get("TickPeriod"))
        invocation:SetTarget(request.target)
        --invocation:SetDuration(-1) --self:Get("TickPeriod"))
        --invocation:SetPredictionId(request.prediction_id)

        for k,v in pairs(effectors) do
            Log.Debug("EdnaAbility:Cast - Effector: " .. k)
            if self["Effector_" .. k] then
                self["Effector_" .. k](self, request, invocation, v)
            else
                Log.Warn("EdnaAbility:Cast - Effector not implemented: " .. k)
            end
        end

        invocation:Invoke()

        return false
    end

    local effectorChannelingSettings = self:Get("effectorChannelingSettings")
    ---@cast effectorChannelingSettings EffectorDefinition

    if type(effectorChannelingSettings) == "table" then
        if request.target:Get("alive") == false then
            return false
        end

        --local invocation = AbilityInvocation.New(self, source, "Item", "Charge")
        local invocation = AbilityInvocation.New(self, source, "Item", "Use")
        invocation:SetItem(request.item)
        --invocation:SetTarget(request.target)
        --invocation:SetDuration(-1)
        --invocation:SetComboStageId(2)
        --invocation:SetComboStageId(request.combo_stage_id)
        --invocation:SetDuration(self:Get("TickPeriod"))
        --invocation:SetPredictionId(request.prediction_id)

        for k,v in pairs(effectorChannelingSettings) do
            Log.Debug("EdnaAbility:Cast - EffectorChanneling: " .. k)
            if self["Effector_" .. k] then
                self["Effector_" .. k](self, request, invocation, v)
            else
                Log.Warn("EdnaAbility:Cast - EffectorChanneling not implemented: " .. k)
            end
        end

        invocation:Invoke()
    end

    return true
end

return EdnaAbility