-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@enum HitType
local HitType = {
    Normal = 0,
    Critical = 1,
    Dodge = 2,
    Parry = 3,
    Block = 4,
    Evade = 5,
    Miss = 6,
}

return HitType