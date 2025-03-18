-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Ability = Class(require("core.entity"))

function Ability:Exec(caster, target)
    Log.Debug("Executing ability")
end

return Ability