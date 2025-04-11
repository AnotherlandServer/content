-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local NpcOtherland = require("global.base.npc_otherland")

---@module '_effector_defs'

---@class TargetFactory
---@field source Entity
---@field ability EdnaAbility
---@field def TargetFactoryDef
local TargetFactory = {}


---comment
---@param source Entity
---@param ability EdnaAbility
---@param def TargetFactoryDef
---@return TargetFactory
function TargetFactory.New(source, ability, def)
    local instance = {}

    setmetatable(instance, {
        __index = TargetFactory
    })

    instance.source = source
    instance.ability = ability
    instance.def = def

    return instance
end

---comment
---@param request AbilityRequest
---@return Entity[]
function TargetFactory:FindTargets(request)
    local targets

    if self["FindTargets_" .. self.def.type] then
        targets = self["FindTargets_" .. self.def.type](self, request)
    else
        Log.Err("TargetFactory:FindTargets - Target type not found: " .. self.def.type)
        targets = {}
    end

    if self.def.settings.affectSelf then
        table.insert(targets, self.source)
    end

    return targets
end

---comment
---@return NpcOtherland|Player[]
function TargetFactory:GetFilteredInterests()
    local interests = self.source:GetInterests()
    local filtered = {}

    if self.def.settings.affectSelf then
        table.insert(filtered, self.source)
    end

    local Player = require("global.base.player")

    for _,v in ipairs(interests) do
        -- For now we only handle npcs and players. I'm sure there should be more valid targets.
        if v.GetClass() == NpcOtherland or v.GetClass() == Player then 
            ---@cast v NpcOtherland|Player

            local relationship = v:Relationship(self.source --[[@as Player]])

            if 
                (self.def.settings.affectEnemies and relationship == 2) or 
                (self.def.settings.affectNeutral and relationship == 1) or 
                (self.def.settings.affectFriends and relationship == 0) 
            then
                table.insert(filtered, v)
            end
        end
    end

    return filtered
end

---comment
---@param request AbilityRequest
---@return Entity[]
function TargetFactory:FindTargets_pie(request)
    Log.Debug("TargetFactory:FindTargets_pie")

    local def = self.def --[[@as PieTargetFactory]]

    local targets = self:GetFilteredInterests()
    local result = {}
    local rotation 
    
    if request.target_rotation then
        Log.Debug("TargetFactory:FindTargets_pie - Using target rotation")
        rotation = request.target_rotation
    else
        Log.Debug("TargetFactory:FindTargets_pie - Using source rotation")
        rotation = self.source:GetRotation()
    end

    ---@cast rotation -nil

    local forward = rotation:MulVec(Vector.Z):Normalize()
    local angle
    local radius_max
    local radius_min

    if self.def.settings.angle then
        angle = self.def.settings.angle
    else
        angle = math.pi / 2
    end

    if def.settings.radiusMax then
        radius_max = self.def.settings.radiusMax
    else
        radius_max = 0
    end

    if def.settings.radiusMin then
        radius_min = self.def.settings.radiusMin
    else
        radius_min = 0
    end

    for _,v in ipairs(targets) do
        local direction = (v:GetPosition() - self.source:GetPosition()):WithY(0)

        if direction:Length() >= radius_min and direction:Length() <= radius_max then
            local angle_between = forward:AngleBetween(direction:WithY(0):Normalize())

            Log.Debug("TargetFactory:FindTargets_pie - Angle: " .. angle_between .. " / " .. angle / 2)

            if angle_between < angle / 2 then
                table.insert(result, v)
            end
        end
    end

    return result
end

---comment
---@param request AbilityRequest
---@return Entity[]
function TargetFactory:FindTargets_none(request)
    local range_max = self.ability:Get("RangeMax")

    if request.target == nil then 
        return {}
    end

    local distance = (request.target:GetPosition() - self.source:GetPosition())

    if distance:Length() <= range_max then
        return { [1] = request.target }
    end

    return {}
end

return TargetFactory