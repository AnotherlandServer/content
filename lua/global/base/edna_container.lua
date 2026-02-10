-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Interaction = require("engine.interaction")
local LootTable = require("engine.loot_table")
local dump = require("core.dump")

---@class EdnaContainer: InteractObject
local EdnaContainer = Class(require("global.base.interact_object"))

---@param player Player
function EdnaContainer:RequestLoot(player)
    local interactionDuration = self:Get("InteractionDuration");
    if interactionDuration then
        Log.Debug("Requesting loot with duration: " .. interactionDuration)
        Interaction.Interact(player, self, interactionDuration):Send()
    end
end

---@param player Player
function EdnaContainer:HandleInteraction(player)
    local loot = LootTable:New(self:Get("lootTable")):GetRandomLoot()

    for _, entry in ipairs(loot) do
        self:DropItem(player, nil, entry.item, entry.count)
    end
end

return EdnaContainer