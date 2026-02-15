-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Relationship = require("core.relationship")

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
----- TargetFactory
--------------------------------------------------------------------------------

---@class TargetFactory
---@field source Player|NpcOtherland
---@field def TargetFactoryDef
---@field selectedTarget? Entity
---@field positionOverride? Vector
---@field rotationOverride? Quaternion
local TargetFactory = {}

---@param source Player|NpcOtherland
---@param def TargetFactoryDef
---@return TargetFactory
function TargetFactory.New(source, def)
    local instance = {}

    setmetatable(instance, {
        __index = TargetFactory
    })

    instance.source = source
    instance.def = def

    return instance
end

---@param target? Entity
function TargetFactory:SetSelectedTarget(target)
    self.selectedTarget = target
end

---@param position? Vector
function TargetFactory:OverridePosition(position)
    self.positionOverride = position
end

---@param rotation? Quaternion
function TargetFactory:OverrideRotation(rotation)
    self.rotationOverride = rotation
end

---@return Entity[]
function TargetFactory:FindTargets()
    local targets

    if self["FindTargets_" .. self.def.type] then
        targets = self["FindTargets_" .. self.def.type](self)
    else
        Log.Err("TargetFactory:FindTargets - Target type not found: " .. self.def.type)
        targets = {}
    end

    if self.def.settings.affectSelf then
        table.insert(targets, self.source)
    end

    return targets
end

---@param target NpcOtherland|Player
---@return boolean
function TargetFactory:ShouldEffect(target)
    local relationship = target:RelationshipTo(self.source --[[@as Player]])

    if 
        (self.def.settings.affectEnemies and relationship == Relationship.Affiliation.Hostile) or 
        (self.def.settings.affectNeutral and relationship == Relationship.Affiliation.Neutral) or 
        (self.def.settings.affectFriends and relationship >= Relationship.Affiliation.Friendly)
    then
        return true
    end

    return false
end

---@return NpcOtherland|Player[]
function TargetFactory:GetFilteredInterests()
    local interests = self.source:GetInterests()
    local filtered = {}

    if self.def.settings.affectSelf then
        table.insert(filtered, self.source)
    end

    local Player = require("global.base.player")
    local NpcOtherland = require("global.base.npc_otherland")

    for _,v in ipairs(interests) do
        -- For now we only handle npcs and players. I'm sure there should be more valid targets.
        if v.GetClass() == NpcOtherland or v.GetClass() == Player then 
            ---@cast v NpcOtherland|Player

            if self:ShouldEffect(v) then
                table.insert(filtered, v)
            end
        end
    end

    return filtered
end

---@return Entity[]
function TargetFactory:FindTargets_pie()
    --Log.Debug("TargetFactory:FindTargets_pie")

    local def = self.def --[[@as PieTargetFactory]]

    local targets = self:GetFilteredInterests()
    local result = {}
    local rotation 
    
    if self.rotationOverride then
        rotation = self.rotationOverride
    else
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
        local distance = direction:Length()

        if distance >= radius_min and distance <= radius_max then
            -- If this is the selected target, always include it (no angle check needed)
            -- The pie angle check is for catching additional enemies in your swing
            if v == self.selectedTarget and distance >= radius_min and distance <= radius_max then
                table.insert(result, v)
            -- Skip angle check if target is at the same position (avoid NaN from normalizing zero vector)
            elseif distance < 0.001 then
                table.insert(result, v)
            else
                local direction_normalized = direction:Normalize()
                local forward_flat = forward:WithY(0):Normalize()
                local angle_between = forward_flat:AngleBetween(direction_normalized)

                if angle_between <= angle / 2 then
                    table.insert(result, v)
                end
            end
        end
    end

    return result
end

---@return Entity[]
function TargetFactory:FindTargets_circle()
    --Log.Debug("TargetFactory:FindTargets_circle")

    local def = self.def --[[@as CircleTargetFactory]]

    local targets = self:GetFilteredInterests()
    local result = {}

    local radius_max
    local radius_min

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
            table.insert(result, v)
        end
    end

    return result
end

---@return Entity[]
function TargetFactory:FindTargets_none()
    if self.selectedTarget == nil or not self:ShouldEffect(self.selectedTarget --[[@as Player|NpcOtherland]]) then 
        return {}
    else
        return { [1] = self.selectedTarget }
    end
end

---@return Entity[]
function TargetFactory:FindTargets_self()
    return { [1] = self.source }
end

return TargetFactory