-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class ItemEdna: ItemBase
local ItemEdna = Class(require("global.base.item_base"))

---@return EdnaAbility[]
function ItemEdna:GetAbilities()
    return __engine.ability.GetAbilities(self)
end

return ItemEdna