-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local NpcOtherland = require("global.base.npc_otherland")

---@class Script: NpcOtherland
local Script = Class(NpcOtherland)

function Script:Init()
    NpcOtherland.Init(self)
end

return Script