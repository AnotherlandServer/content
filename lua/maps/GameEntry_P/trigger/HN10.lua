-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Trigger = require("global.base.trigger")
local HN10 = Class(Trigger)

function HN10:TriggerAction(player)
    player:ShowTutorialMessage(2813)
end

return HN10