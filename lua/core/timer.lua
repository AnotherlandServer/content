-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Events = require("core.events")

---@class Timer
---@field _interval number
---@field _elapsed number
---@field _max_duration number
---@field _engine_timer table
local Timer = Class()

---@param owner Entity
---@param interval number
---@param max_duration? number
---@param callback fun(timer: Timer, stopping: boolean)
---@return Timer
function Timer:Start(owner, interval, max_duration, callback)
    local instance = {}
    setmetatable(instance, { __index = Timer })

    instance._interval = interval
    instance._elapsed = 0
    instance._max_duration = max_duration
    instance._engine_timer = __engine.timer.CreateTimer(owner, interval, function (timer)
        if type(instance._max_duration) == "number" then
            instance._elapsed = instance._elapsed + interval

            if instance._elapsed >= instance._max_duration then
                callback(instance, true)
                instance:Stop()
            else
                callback(instance, false)
            end
        else
            callback(instance, false)
        end
    end)

    return instance
end

function Timer:Stop()
    if self._engine_timer then
        __engine.timer.DestroyTimer(self._engine_timer)
        self._engine_timer = nil
    end
end

return Timer