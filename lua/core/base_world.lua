-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "engine.avatar_filter"

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
---@field IsTutorial boolean

---@class BaseWorld: Events
---@field world WorldDefinition
---@field zone ZoneDefinition
---@field conf ZoneConfig
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
    if self.conf.settings.IsTutorial == true then
        player:Set("tutorialMode", true)
        player:Set("firstTimeSpawn", true)
    else
        player:Set("tutorialMode", false)
        player:Set("firstTimeSpawn", false)
    end

    player:RecalculateStats()

    if player:Get("firstTimeSpawn") then
        player:Set("hpCur", player:Get("hpMax"))
    end

    -- Spawn the player in the game world
    player:Spawn()
end

---@param id string
---@return Entity?
function BaseWorld:GetEntityById(id)
    return __engine.world.GetEntityById(id)
end

---@param id AvatarId
---@return Entity?
function BaseWorld:GetEntityByAvatarId(id)
    return __engine.world.GetEntityByAvatarId(id)
end

---@param name string
---@return Entity?
function BaseWorld:GetEntityByName(name)
    return __engine.world.GetEntityByName(name)
end

---@param id string
---@return Entity[]
function BaseWorld:FindEntitiesByTemplateId(id)
    return __engine.world.FindEntitiesByTemplateId(id)
end

---@param class string
---@return Entity[]
function BaseWorld:FindEntitiesByClass(class)
    return __engine.world.FindEntitiesByClass(class)
end

---@param filter AvatarFilter
---@return Entity[]
function BaseWorld:FindEntitiesWithFilter(filter)
    if filter.type == "Content" then
        return self:FindEntitiesByTemplateId(filter.filter --[[@as string]])
    elseif filter.type == "Instance" then
        local ent = self:GetEntityById(filter.filter --[[@as string]])
        if ent then
            return { ent }
        end
        return {}
    else
        error("Unsupported filter type: " .. tostring(filter.type))
    end
end
---@return number -- World time in seconds
function BaseWorld:CurrentTime()
    return __engine.world.GetCurrentTime()
end

---@param name string
---@param class string
---@param template string
---@param owner? Entity
---@param position Vector
---@param rotation Vector
---@param params? table
---@param callback? fun(err: string?, ent: Entity?)
function BaseWorld:RequestSpawnAvatar(name, class, template, owner, position, rotation, params, callback)
    params = params or {}

    params["pos"] = position
    params["rot"] = rotation

    __engine.loader.RequestSpawnInstance(owner, class, template, name, params, callback)
end

return BaseWorld