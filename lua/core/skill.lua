-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Events = require("core.events")

---@class Skill: Events
---@field template_guid string
---@field instance_guid string?
---@field name string
---@field class string
---@field __skill any?
---@field __item_ability any?
---@field __npc NpcOtherland?
---@field __npc_ability_idx number?
local Skill = Class(Events)

---@param key string
---@return any
function Skill:Get(key)
    if self.__skill ~= nil then
        return self.__skill:Get(key)
    elseif self.__item_ability ~= nil then
        return self.__item_ability:Get(key)
    elseif self.__npc_ability_idx ~= nil and self.__npc ~= nil then
        return __engine.ability.GetNpcAbilityValue(self.__npc, self.__npc_ability_idx, key)
    else
        error("Skill does not have a skill, npc or item ability set.")
    end
end

---@param key string
---@param value any
---@return any
function Skill:Set(key, value)
    if self.__skill ~= nil then
        error("Cannot write skill attribute.")
    elseif self.__item_ability ~= nil then
        error("Cannot write item ability attribute.")
    elseif self.__npc_ability_idx ~= nil and self.__npc ~= nil then
        __engine.ability.SetNpcAbilityValue(self.__npc, self.__npc_ability_idx, key, value)
    else
        error("Skill does not have a skill, npc or item ability set.")
    end
end

---@param key string
---@return any
function Skill:Reset(key)
    if self.__skill ~= nil then
        error("Cannot write skill attribute.")
    elseif self.__item_ability ~= nil then
        error("Cannot write item ability attribute.")
    elseif self.__npc_ability_idx ~= nil and self.__npc ~= nil then
        __engine.ability.ResetNpcAbilityValue(self.__npc, self.__npc_ability_idx, key)
    else
        error("Skill does not have a skill, npc or item ability set.")
    end
end

return Skill