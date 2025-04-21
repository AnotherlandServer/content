-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class Portal
---@field map_name string
---@field world_name string
---@field display_name string
---@field world_icon string
---@field portal_icon string
---@field description string
---@field portal_type integer
---@field world_type integer
---@field player_level integer
---@field level integer

---@class PortalBook
---@field player Player
---@field portal Portal
---@field name string
---@field can_save boolean
---@field max_slots integer
---@field portals Portal[]
local PortalBook = {}

---@param player Player
---@param portal Portal
---@param can_save? boolean
---@param max_slots? integer
---@return PortalBook
function PortalBook:New(player, portal, can_save, max_slots)
    local obj = {}
    setmetatable(obj, {
        __index = PortalBook
    })

    obj.player = player
    obj.portal = portal
    obj.name = portal:Get("PortalLocationName")
    obj.can_save = can_save or false
    obj.max_slots = max_slots or 0
    obj.portals = {}

    return obj
end

---comment
---@param map_name string
---@param world_name string
---@param display_name string
---@param world_icon string
---@param portal_icon string
---@param description string
---@param portal_type integer
---@param world_type integer
---@param level integer
function PortalBook:AddPortal(map_name, world_name, display_name, world_icon, portal_icon, description, portal_type, world_type, level)
    local new_portal = {
        map_name = map_name,
        world_name = world_name,
        display_name = display_name,
        world_icon = world_icon,
        portal_icon = portal_icon,
        description = description,
        portal_type = portal_type,
        world_type = world_type,
        player_level = self.player:Get("lvl"),
        level = level
    }

    table.insert(self.portals, new_portal)
end

function PortalBook:Send()
    __engine.portalbook.Send(self)
end

return PortalBook