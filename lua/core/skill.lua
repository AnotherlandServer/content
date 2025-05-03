-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Events = require("core.events")

---@class Skill: Events
local Skill = Class(Events)

---@param key string
---@return any
function Skill:Get(key)
    if self.__skill ~= nil then
        return self.__skill:Get(key)
    else
        return self.__item_ability:Get(key) 
    end
end

return Skill