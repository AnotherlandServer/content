-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class Interaction
---@field initiator Player|NonClientBase
---@field target Player|NonClientBase
---@field kind "interact" | "extract" | "capture" | "cast_complete" | "cast_interrupt"
---@field duration number?
local Interaction = {}

function Interaction:Send()
    __engine.ability.FireInteractionEvent(self.initiator, self, self.target)
end

---@param initiator Player|NonClientBase
---@param target Player|NonClientBase
---@param duration number
---@return Interaction
function Interaction.Interact(initiator, target, duration)
    return setmetatable({
        initiator = initiator,
        target = target,
        kind = "interact",
        duration = duration,
    }, { __index = Interaction })
end

---@param initiator Player|NonClientBase
---@param target Player|NonClientBase
---@param duration number
---@return Interaction
function Interaction.Extract(initiator, target, duration)
    return setmetatable({
        initiator = initiator,
        target = target,
        kind = "extract",
        duration = duration,
    }, { __index = Interaction })
end

---@param initiator Player|NonClientBase
---@param target Player|NonClientBase
---@param duration number
---@return Interaction
function Interaction.Capture(initiator, target, duration)
    return setmetatable({
        initiator = initiator,
        target = target,
        kind = "capture",
        duration = duration,
    }, { __index = Interaction })
end

---@param initiator Player|NonClientBase
---@param target Player|NonClientBase
---@return Interaction
function Interaction.CastComplete(initiator, target)
    return setmetatable({
        initiator = initiator,
        target = target,
        kind = "cast_complete",
    }, { __index = Interaction })
end

---@param initiator Player|NonClientBase
---@param target Player|NonClientBase
---@return Interaction
function Interaction.CastInterrupt(initiator, target)
    return setmetatable({
        initiator = initiator,
        target = target,
        kind = "cast_interrupt",
    }, { __index = Interaction })
end

return Interaction