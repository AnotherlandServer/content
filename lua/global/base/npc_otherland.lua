-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local NonClientBase = require("global.base.non_client_base")
local Relationship = require("core.relationship")
local Dump = require("core.dump")

---@class NpcOtherland: NonClientBase
local Npc = Class(NonClientBase)

--- Compute NPC base values
local HpBase = {}
local ArmorTable = {}
local AttackPowerTable = {}

for i = 1, 4 do
    table.insert(HpBase, 8.75 * i ^ 2 + 54.25 * i - 17.5)
end

for i = 1, 64 do
    table.insert(ArmorTable, math.floor((0.5755 * i ^ 2) - 1.203 * i + 0.6275))
end

for i = 1, 64 do
    table.insert(AttackPowerTable, math.floor((0.171305 * i ^ 2) - 0.27783 * i + 0.10653))
end

function Npc:Init()
    NonClientBase.Init(self)

    local lvl = self:Get("lvl")
    local generalDifficulty = self:Get("generalDifficulty")

    Log.Debug("GD " .. generalDifficulty)

    --- These stats control enemy difficulty and scaling
    self:Set("hpMax", (HpBase[math.max(generalDifficulty, 1)] * lvl) * self:Get("HpMod"))
    self:Set("hpCur", (HpBase[math.max(generalDifficulty, 1)] * lvl) * self:Get("HpMod"))
    self:Set("statArmorReduction", ArmorTable[lvl])
    self:Set("statAttackPower", AttackPowerTable[lvl])
    self:Set("statBlockChance", 5 * generalDifficulty)
    self:Set("statBlockedDamageMod", 0.75) -- 50% block seems to be way to high, even though the description says blocking halves damage
    self:Set("statCritChance", 5 * generalDifficulty)
    self:Set("statCriticalDamageMod", 1.3)
    self:Set("statCriticalChanceReduction", 2 * generalDifficulty)
    self:Set("statHitChance", 1 * generalDifficulty)
end

---MetaMorph vendor execute
---@param player Player
---@param ... any
function Npc:DoVendorExecute(player, ...)
    local params = { ... }

    -- Apply metamorph customization parameters
    player:Set("customizationGender", params[1])
    player:Set("customizationHeight", params[2])
    player:Set("customizationFat", params[3])
    player:Set("customizationSkinny", params[4])
    player:Set("customizationMuscular", params[5])
    player:Set("customizationBustSize", params[6])
    player:Set("race", params[7])
    player:Set("customizationBrowAngle", params[8])
    player:Set("customizationEyeBrowPos", params[9])
    player:Set("customizationEyePosSpacing", params[10])
    player:Set("customizationEyePos", params[11])
    player:Set("customizationEyeSizeLength", params[12])
    player:Set("customizationEyeSizeWidth", params[13])
    player:Set("customizationEyesPretty", params[14])
    player:Set("customizationMouthPos", params[15])
    player:Set("customizationMouthWidth", params[16])
    player:Set("customizationMouthLowerLipThic", params[17])
    player:Set("customizationMouthUpperLipThic", params[18])
    player:Set("customizationMouthExpression", params[19])
    player:Set("customizationNosePosLength", params[20])
    player:Set("customizationNosePosWidth", params[21])
    player:Set("customizationNosePortude", params[22])
    player:Set("customizationEarSize", params[23])
    player:Set("customizationEarElf", params[24])
    player:Set("customizationCheekBone", params[25])
    player:Set("customizationCheek", params[26])
    player:Set("customizationChinPortude", params[27])
    player:Set("customizationJawChubby", params[28])
end

Npc:AddBehavior("dovendorexecute", Npc.DoVendorExecute)

function Npc:RequestDialogue(player)
    -- This is a super basic default implementation for just displaying the dialog that's 
    -- defined for the npc.
    local dialog_id = self:Get("Dialogs")[0];

    if dialog_id ~= nil then
        player:ShowDialogue(self, dialog_id)
    end
end

---@param other NpcOtherland|Player
---@return Affiliation
function Npc:RelationshipTo(other)
    return Relationship.AffiliationFromRank(
        __engine.faction.EntityRelationship(self, other)
    )
end

return Npc