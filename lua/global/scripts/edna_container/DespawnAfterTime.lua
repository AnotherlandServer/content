-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local NonClientBase = require("global.base.non_client_base")
local Timer = require("core.timer")

---@class Script: NonClientBase
local Script = Class(NonClientBase)

Script:On("Spawned",
    ---@param self Script
    function(self)
        local time = tonumber(self:Get("tags"))

        if time then
            Timer:Start(self, time, time, function ()
                self:Despawn()
            end)
        end
    end)

return Script