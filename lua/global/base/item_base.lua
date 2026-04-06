-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class ItemBase: Entity
---@field placement_guid string
---@field template_guid string
local ItemBase = Class(require("core.entity"))

return ItemBase