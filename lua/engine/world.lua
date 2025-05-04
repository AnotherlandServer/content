-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@return BaseWorld
function GetWorld()
    return __engine.world.GetWorld()
end

return GetWorld