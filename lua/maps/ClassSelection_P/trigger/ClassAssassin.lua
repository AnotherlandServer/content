-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Trigger = require("global.base.trigger")
local ClassAssassin = Class(Trigger)

function ClassAssassin:TriggerAction(player)
    player:Set("combatStyle", 2);
end

return ClassAssassin