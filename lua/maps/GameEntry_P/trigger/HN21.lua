-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Trigger = require("global.base.trigger")
local HN21 = Class(Trigger)

function HN21:TriggerAction(player)
    player:ShowTutorialMessage(2824)
end

return HN21