-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local dump = require("core.dump")

---@class LootTable
---@field partitions LootPartition[]
local LootTable = {}

---@class LootEntry
---@field item string

---@class LootPartition
---@field minCount number
---@field maxCount number
---@field entries LootEntry[]

---@class Loot
---@field item string
---@field count number

---comment
---@param table any
---@return LootTable
function LootTable:New(table)
    local obj = {}
    setmetatable(obj, {
        __index = self
    })

    obj.partitions = {}

    if table.QuestItems then
        obj:AddPartition(table.QuestItems)
    end

    if table.JunkItems then
        obj:AddPartition(table.JunkItems)
    end

    if table.ExtractItems then
        obj:AddPartition(table.ExtractItems)
    end

    if table.SimpleDrops then 
        for _, drop in ipairs(table.SimpleDrops) do
            table.insert(obj.partitions, {drop})
        end
    end

    dump(obj.partitions)
    return obj
end

function LootTable:AddPartition(partition)
    for _, drop in ipairs(partition) do
        local countMin = drop.CountMin or 1
        local countMax = drop.CountMax or countMin

        local entries = {}

        for _, item in ipairs(drop.itemWeightList) do
            for _ = 1, item.weight do
                table.insert(entries, {
                    item = item.itemContentTemplate,
                })
            end
        end

        table.insert(self.partitions, {
            minCount = countMin,
            maxCount = countMax,
            entries = entries
        })
    end
end

---@return Loot[]
function LootTable:GetRandomLoot()
    if #self.partitions == 0 then
        return {}
    end

    local combinedLoot = {}

    for _, partition in ipairs(self.partitions) do
        Log.Debug("Partition: " .. partition.minCount .. "-" .. partition.maxCount .. " entries: " .. #partition.entries)

        local count = math.random(partition.minCount, partition.maxCount)
        Log.Debug("Count: " .. count)

        for _ = 1, count do
            local index = math.random(1, #partition.entries)
            local entry = partition.entries[index]

            if combinedLoot[entry.item] then
                combinedLoot[entry.item].count = combinedLoot[entry.item].count + 1
            else
                combinedLoot[entry.item] = {
                    item = entry.item,
                    count = 1
                }
            end
        end
    end

    -- Convert combined loot to a list
    local result = {}
    for _, entry in pairs(combinedLoot) do
        table.insert(result, entry)
    end

    return result
end

return LootTable