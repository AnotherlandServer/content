-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local TargetFactory = require("engine.target_factory")
local Effector = require("engine.effector")

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

return EdnaAbility