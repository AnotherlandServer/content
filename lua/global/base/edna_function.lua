-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class EdnaFunction: ItemEdna
---@field NormalAttack EdnaAbility
---@field HeavyAttack? EdnaAbility
---@field SpecialAttack? EdnaAbility
---@field owner Player
local EdnaFunction = Class(require("global.base.item_edna"))

function EdnaFunction:Init()
    Log.Debug("EdnaFunction:Init - Initializing EdnaFunction for " .. self.name)

    for _,v in ipairs(self:GetAbilities()) do
        local type = v:Get("abilityType")

        if type == "Normal" then
            self.NormalAttack = v
        elseif type == "Heavy" then
            self.HeavyAttack = v
        elseif type == "Special" then
            self.SpecialAttack = v
        end 
    end
end

---@param target Player|NpcOtherland
---@return HitType type
---@return number damage
function EdnaFunction:RollDamage(target)
    local minDamage = self:Get("WepMinDmg")
    local maxDamage = self:Get("WepMaxDmg")

    local damage = math.random(minDamage, maxDamage)

    return 0, damage
end

---@param target Player|NpcOtherland
---@return HitType type
---@return number heal
function EdnaFunction:RollHeal(target)
    local minHeal = self:Get("WepMinDmg")
    local maxHeal = self:Get("WepMaxDmg")

    local heal = math.random(minHeal, maxHeal)

    return 0, heal
end

return EdnaFunction