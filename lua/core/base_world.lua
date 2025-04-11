-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Events = require("core.events")

---@class WorldDefinition
---@field id integer
---@field guid string
---@field name string
---@field umap_guid string

---@class ZoneDefinition
---@field id integer
---@field guid string
---@field zone string
---@field is_instance boolean
---@field realu_zone_type string

---@class ZoneConfig
---@field force_generate_guid_key boolean
---@field allow_summon_portal boolean
---@field spawn_to_the_last_save_position boolean
---@field instance_scope integer
---@field settings ZoneSettings

---@class ZoneSettings
---@field mapName string
---@field mapGuid string
---@field portalGuid string
---@field minLvl integer
---@field IsRaid boolean

---@class BaseWorld: Events
---@field world WorldDefinition
---@field zone ZoneDefinition
local BaseWorld = Class(Events)

---@param player Player
function BaseWorld:PreLoadPlayerInventory(player)
    player:BeginLoadInventory()
end

---@param player Player
function BaseWorld:PostLoadPlayerInventory(player)
end

---@param player Player
function BaseWorld:SpawnPlayer(player)
    -- Spawn the player in the game world
    player:Spawn()
end

return BaseWorld