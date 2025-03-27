-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Player = require("global.base.player")
local AbilityInvocation = require("engine.ability_invocation")
local TargetFactory = require("global.base.edna_ability.target_factory")

---@class EdnaAbility: Skill
local EdnaAbility = Class(require("core.skill"))

---comment
---@param caster Player|NpcOtherland
---@param request AbilityRequest
function EdnaAbility:Cast(caster, request)
    Log.Debug("EdnaAbility:Cast")

    if self:Get("sourceMustBeAlive") and not caster:Get("alive") then
        Log.Debug("EdnaAbility:Cast - Source must be alive")
        return
    end

    if caster:GetClass() == Player then
        ---@cast caster Player
        if not caster:ConsumeCooldown(self:Get("externalCooldownsConsumed"), self:Get("internalCooldown")) then
            Log.Debug("EdnaAbility:Cast - Cooldown not ready")
            return
        end
    else
        Log.Debug("Caster is not a player")
    end


    local factory = TargetFactory.New({})
    factory:FindTargets(request)

    local invocation;

    if request.item then
        invocation = AbilityInvocation:New(self, caster, "Item", "Charge")
        invocation.item = request.item
        invocation:SetDuration(request.item:Get("WepAttSpeed"))
    end

    invocation:SetPredictionId(request.prediction_id)
    invocation:SetComboStageId(request.combo_stage_id)

    invocation:Invoke()
end

return EdnaAbility