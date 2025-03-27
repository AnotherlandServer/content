-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class EdnaFunction: ItemEdna
---@field NormalAttack EdnaAbility
---@field HeavyAttack? EdnaAbility
---@field SpecialAttack? EdnaAbility
local EdnaFunction = Class(require("global.base.item_edna"))

function EdnaFunction:Init()
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

return EdnaFunction