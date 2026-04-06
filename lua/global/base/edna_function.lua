-- Copyright (C) 2026 AnotherlandServer
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

---@enum WeaponType
EdnaFunction.WeaponType = {
    Melee = 1,
    Ranged = 2,
}

local WeaponTypeLoopup = {
    ["Energizer_2H_BeamGun"] = EdnaFunction.WeaponType.Ranged,
    ["Energizer_1H_Throwing"] = EdnaFunction.WeaponType.Ranged,
    ["Gunner_2H_AutomaticRifle"] = EdnaFunction.WeaponType.Ranged,
    ["Gunner_2H_ShoulderRifle"] = EdnaFunction.WeaponType.Ranged,
    ["Energizer_1H_StickyGun"] = EdnaFunction.WeaponType.Ranged,
    ["Gunner_2H_CrossBow"] = EdnaFunction.WeaponType.Ranged,
    ["Assassin_1H_Pole"] = EdnaFunction.WeaponType.Melee,
    [""] = EdnaFunction.WeaponType.Melee,
    ["Gunner_2H_Shotgun"] = EdnaFunction.WeaponType.Ranged,
    ["Assassin_1H_Dagger"] = EdnaFunction.WeaponType.Melee,
    ["Energizer_2H_RailGun"] = EdnaFunction.WeaponType.Ranged,
    ["Rage_2H_Polearm"] = EdnaFunction.WeaponType.Melee,
    ["Rage_2H_Sword"] = EdnaFunction.WeaponType.Melee,
    ["Energizer_2H_Launcher"] = EdnaFunction.WeaponType.Ranged,
    ["Hacker_1H_Glove"] = EdnaFunction.WeaponType.Melee,
    ["Assassin_1H_Sword"] = EdnaFunction.WeaponType.Melee,
    ["Gunner_2H_AssaultRifle"] = EdnaFunction.WeaponType.Ranged,
    ["Energizer_2H_PulseGun"] = EdnaFunction.WeaponType.Ranged,
    ["Hacker_1H_Orb"] = EdnaFunction.WeaponType.Ranged,
    ["Energizer_2H_Railgun"] = EdnaFunction.WeaponType.Ranged,
    ["Gunner_1H_Pistol"] = EdnaFunction.WeaponType.Ranged,
    ["Hacker_1H_Screen"] = EdnaFunction.WeaponType.Ranged,
    ["Rage_2H_PoleArm"] = EdnaFunction.WeaponType.Melee,
    ["Hacker_Glove"] = EdnaFunction.WeaponType.Melee,
    ["Gunner_2H_Bow"] = EdnaFunction.WeaponType.Ranged,
}

local WeaponCombatStyle = {
    ["Energizer_2H_BeamGun"] = 3,
    ["Energizer_1H_Throwing"] = 3,
    ["Gunner_2H_AutomaticRifle"] = 1,
    ["Gunner_2H_ShoulderRifle"] = 1,
    ["Energizer_1H_StickyGun"] = 3,
    ["Gunner_2H_CrossBow"] = 1,
    ["Assassin_1H_Pole"] = 2,
    [""] = 6,
    ["Gunner_2H_Shotgun"] = 1,
    ["Assassin_1H_Dagger"] = 2,
    ["Energizer_2H_RailGun"] = 3,
    ["Rage_2H_Polearm"] = 0,
    ["Rage_2H_Sword"] = 0,
    ["Energizer_2H_Launcher"] = 3,
    ["Hacker_1H_Glove"] = 4,
    ["Assassin_1H_Sword"] = 2,
    ["Gunner_2H_AssaultRifle"] = 1,
    ["Energizer_2H_PulseGun"] = 3,
    ["Hacker_1H_Orb"] = 4,
    ["Energizer_2H_Railgun"] = 3,
    ["Gunner_1H_Pistol"] = 1,
    ["Hacker_1H_Screen"] = 4,
    ["Rage_2H_PoleArm"] = 0,
    ["Hacker_Glove"] = 4,
    ["Gunner_2H_Bow"] = 1,
}

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

    return "Normal", damage
end

---@param target Player|NpcOtherland
---@return HitType type
---@return number heal
function EdnaFunction:RollHeal(target)
    local minHeal = self:Get("WepMinDmg")
    local maxHeal = self:Get("WepMaxDmg")

    local heal = math.random(minHeal, maxHeal)

    return "Normal", heal
end

---@return WeaponType
function EdnaFunction:GetWeaponType()
    return WeaponTypeLoopup[self:Get("weaponType")] or EdnaFunction.WeaponType.Melee
end

---@return integer
function EdnaFunction:GetCombatStyle()
    return WeaponCombatStyle[self:Get("weaponType")] or 0
end

return EdnaFunction