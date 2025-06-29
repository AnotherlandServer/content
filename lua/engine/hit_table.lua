-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Dump = require("core.dump")

---@class HitTable
---@field attacker Player|NpcOtherland
---@field defender Player|NpcOtherland
---@field canBeBlocked boolean
local HitTable = {}

--- Compute hit chance penalty table
local HitChancePenalty = {
    [1] = 0,
}

for i = 1, 70 do
    if i < 3 then
        table.insert(HitChancePenalty, HitChancePenalty[i] + 0.5)
    else
        table.insert(HitChancePenalty, HitChancePenalty[i] + 3)
    end
end

---@enum (key) HitType
local HitType = {
    Normal = 0,
    Critical = 1,
    Dodge = 2,
    Parry = 3,
    Block = 4,
    Evade = 5,
    Miss = 6,
    Bend = 7,
    Reflect = 8,
}

---@param attacker Player|NpcOtherland
---@param defender Player|NpcOtherland
---@return HitTable
function HitTable:New(attacker, defender)
    local obj = {}

    setmetatable(obj, {
        __index = self
    })

    --[[@cast obj HitTable]]

    obj.attacker = attacker
    obj.defender = defender
    obj.canBeBlocked = true
   
    return obj
end

---@param value boolean
function HitTable:SetCanBeBlocked(value)
    self.canBeBlocked = value
end

---@return number
function HitTable:MissChance()
    local hit_chance = 95

    --- Penalty to hit chance based on level difference
    if self.attacker:Get("lvl") < self.defender:Get("lvl") then
        hit_chance = hit_chance - HitChancePenalty[self.defender:Get("lvl") - self.attacker:Get("lvl") + 1]
    end

    --- Apply hit chance from stats
    hit_chance = hit_chance + self.attacker:Get("statHitChance")

    --- Cap values
    hit_chance = math.min(hit_chance, 100)
    hit_chance = math.max(hit_chance, 0)

    return 100 - hit_chance
end

---@return number
function HitTable:CritChance()
    local crit_chance = 1

    crit_chance = crit_chance + 
        self.attacker:Get("statCritChance") - 
        self.defender:Get("statCriticalChanceReduction")

    crit_chance = math.min(crit_chance, 100)
    crit_chance = math.max(crit_chance, 0)

    return crit_chance
end

---@return number
function HitTable:BlockChance()
    if self.canBeBlocked == false then
        return 0
    end

    local block_chance = self.defender:Get("statBlockChance")

    block_chance = math.min(block_chance, 100)
    block_chance = math.max(block_chance, 0)

    return block_chance
end

---@return number
function HitTable:DodgeChance()
    if self.defender.class == "npcOtherland" then
        return 0
    end

    local dodge_chance = self.defender:Get("statDodgeChance")

    dodge_chance = math.min(dodge_chance, 100)
    dodge_chance = math.max(dodge_chance, 0)

    return dodge_chance
end

---@return number
function HitTable:ParryChance()
    if self.defender.class == "npcOtherland" then
        return 0
    end

    local parry_chance = self.defender:Get("statParryChance")

    parry_chance = math.min(parry_chance, 100)
    parry_chance = math.max(parry_chance, 0)

    return parry_chance
end

---@return HitType
function HitTable:Roll()
    function AddToTable(hit_table, type, value)
        for _ = 1, math.ceil(value) do
            table.insert(hit_table, type)
        end
    end

    local table = {}

    local miss_chance = self:MissChance()
    local block_chance = self:BlockChance()
    local dodge_chance = self:DodgeChance()
    local parry_chance = self:ParryChance()
    local crit_chance = self:CritChance()
    local hit_chance = 100 - miss_chance - block_chance - dodge_chance - parry_chance - crit_chance
    
    --Log.Debug("Miss chance: " .. miss_chance)
    --Log.Debug("Block chance: " .. block_chance)
    --Log.Debug("Dodge chance: " .. dodge_chance)
    --Log.Debug("Parry chance: " .. parry_chance)
    --Log.Debug("Hit chance: " .. hit_chance)
    --Log.Debug("Crit chance: " .. crit_chance)

    AddToTable(table, "Miss", self:MissChance())
    AddToTable(table, "Block", self:BlockChance())
    AddToTable(table, "Dodge", self:DodgeChance())
    AddToTable(table, "Parry", self:ParryChance())
    AddToTable(table, "Normal", hit_chance)
    AddToTable(table, "Critical", self:CritChance())

    --for i = 1, #table do
    --    Log.Debug(i .. " - " .. table[i])
    --end

    local roll = math.random(1, 100)

    return table[roll]
end

return HitTable