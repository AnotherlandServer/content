-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Trigger = require("global.base.trigger")
local ClassWarrior = Class(Trigger)

function ClassWarrior:TriggerAction(player)
    player:Set("combatStyle", 0);
end

return ClassWarrior