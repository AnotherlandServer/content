-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Trigger = require("global.base.trigger")
local HN20 = Class(Trigger)

function HN20:TriggerAction(player)
    player:ShowTutorialMessage(2823)
end

return HN20