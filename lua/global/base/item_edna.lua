-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class ItemAttributes
---@field AttackPower number
---@field ArmorRating number
---@field HitRating number
---@field Focus number
---@field BlockRating number
---@field Dexterity number
---@field Movement_Mod number
---@field Strength number
---@field ReflectRating number
---@field BendRating number
---@field CritRating number
---@field Stamina number

---@class ItemEdna: ItemBase
local ItemEdna = Class(require("global.base.item_base"))

---@return EdnaAbility[]
function ItemEdna:GetAbilities()
    return __engine.ability.GetAbilities(self)
end

function ApplyAttribute(item, attributes, idx)
    local name = item:Get("autoAttributeType" .. idx)
    local value = item:Get("autoAttributeValue" .. idx)

    if name ~= "" then
        attributes[name] = value
    end
end

---@return ItemAttributes
function ItemEdna:GetAttributes()
    local attributes = {
        AttackPower = 0,
        ArmorRating = 0,
        HitRating = 0,
        Focus = 0,
        BlockRating = 0,
        Dexterity = 0,
        Movement_Mod = 0,
        Strength = 0,
        ReflectRating = 0,
        BendRating = 0,
        CritRating = 0,
        Stamina = 0
    }

    for i = 1, 6 do
        ApplyAttribute(self, attributes, i)
    end

    return attributes
end

return ItemEdna