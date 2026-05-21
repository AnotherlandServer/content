-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")

---@class NonSpawnPlacement: Entity
---@field avatar_id AvatarId
---@field placement_guid string
---@field template_guid string
local NonSpawnPlacement = Class(require("core.entity"))

return NonSpawnPlacement