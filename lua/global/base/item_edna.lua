-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class ItemEdna: ItemBase
local ItemEdna = Class(require("global.base.item_base"))

---comment
---@return EdnaAbility[]
function ItemEdna:GetAbilities()
    return __engine.inventory.GetItemAbilities(self)
end

return ItemEdna