-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")

---@class Player: Entity
local Player = Class(Entity)

---@private
Player._BEHAVIOR = {}

---Adds a behavior
---@param name string
---@param callback function
function Player.AddBehavior(name, callback)
    Player._BEHAVIOR[name] = callback;
end

---comment
---@param self Player
---@param _ any
---@param main_hand string
---@param off_hand string
Player.AddBehavior("requestselectweapon", function (self, _, main_hand, off_hand)
    local main_hand = main_hand or "00000000-0000-0000-0000-000000000000"
    local off_hand = off_hand or "00000000-0000-0000-0000-000000000000"

    Log.Debug("Requesting weapon selection for player " .. self.name .. " - " .. main_hand .. " - " .. off_hand)

    -- Update active weapon
    self:Set("weapon", { main_hand, off_hand })
    self:Emit("OnEquipmentChanged")
end)

Player:On("OnAbilityRequest", 
    ---comment
    ---@param self Player
    ---@param request AbilityRequest
    function (self, request)
        if request.target then
            Log.Debug("Ability request for player " .. self.name .. " - target " .. request.target.name)
        else
            Log.Debug("Ability request for player " .. self.name)
        end

        if request.combo_stage_id ~= nil then
            Log.Debug("Combo id: " .. request.combo_stage_id)
        end

        if request.reference_id and request.toggle_mode == 1 then 
            local item = self:GetItem(request.reference_id)
            local skill = self:GetSkill(request.reference_id)

            if item ~= nil then 
                if item.class == "ednaFunction" then
                    ---@cast item EdnaFunction
                    request.item = item

                    if item.NormalAttack ~= nil then 
                        item.NormalAttack:Cast(self, request)
                    else
                        Log.Warn("No abilities found for item " .. request.reference_id)
                    end
                end
            elseif skill ~= nil then
                skill:Cast(self, request)
            end
        end  
    end)

---comment
---@param self Player
---@param mainhand? EdnaFunction
---@param offhand? EdnaFunction
Player:On("OnWeaponSelect", function (self, mainhand, offhand)
    ---comment
    ---@param stats any
    ---@param weapon EdnaFunction
    function AddWeaponStats(stats, weapon)
        local dps = (weapon:Get("WepMinDmg") + ((weapon:Get("WepMaxDmg") - weapon:Get("WepMinDmg")) / 2)) / weapon:Get("WepAttSpeed")

        stats.statWeaponDPS = stats.statWeaponDPS + dps
        stats.statWepMaxDmg = stats.statWepMaxDmg + weapon:Get("WepMaxDmg")
        stats.statWepMinDmg = stats.statWepMinDmg + weapon:Get("WepMinDmg")
        stats.statHitRating = stats.statHitRating + weapon:Get("HitRating")
        stats.statHeavyRating = stats.statHeavyRating + weapon:Get("HeavyRating")
        stats.statAttackPowerRating = stats.statAttackPowerRating + weapon:Get("AttackPowerRating")
        stats.statSpecialRating = stats.statSpecialRating + weapon:Get("SpecialRating")
        stats.statParryRating = stats.statParryRating + weapon:Get("ParryRating")
        stats.statPeneRating = stats.statPeneRating + weapon:Get("PeneRating")
        stats.attributeStrength = stats.attributeStrength + weapon:Get("Strength")
        stats.attributeHealth = stats.attributeHealth + weapon:Get("Stamina")
        stats.attributeFocus = stats.attributeFocus + weapon:Get("Focus")
    end

    ---comment
    ---@param stats any
    ---@param weapon EdnaFunction
    function AddAutoAttribute(stats, weapon)

    end

    local stats = {
        statWeaponDPS = 0,
        statWepMaxDmg = 0,
        statWepMinDmg = 0,
        statArmorRating = 0,
        statHitRating = 0,
        statHeavyRating = 0,
        statAttackPowerRating = 0,
        statSpecialRating = 0,
        statParryRating = 0,
        statPeneRating = 0,
        attributeDexterity = 0,
        attributeStrength = 0,
        attributeWisdom = 0,
        attributeHealth = 0,
        attributeFocus = 0,
    }

    if mainhand ~= nil then
        AddWeaponStats(stats, mainhand)
    end

    if offhand ~= nil then
        AddWeaponStats(stats, offhand)
    end

    for k,v in pairs(stats) do
        self:Set(k, v)
    end

    --attributeAttackPowerPhys
    --attributeAttackPowerSpell
    --attributeConstitution
    --attributeCrafting
    --attributeCriticalPhys
    --attributeCriticalSpell
    --attributeDegenerate_Level
    --attributeDexterity
    --attributeDisguise
    --attributeEnergy
    --attributeEnergyCurrent
    --attributeEnergyDecay_Stealthed_PercentageNormalized
    --attributeEnergyEquilibrium_PercentageNormalized
    --attributeEnergyGain_AutoAttack_Hit_Absolute
    --attributeEnergyGain_WithTarget_PerSecond_Absolute
    --attributeEnergyInitial_PercentageNormalized
    --attributeEnergyMax
    --attributeEnergyRegen
    --attributeFocus
    --attributeHastePhys
    --attributeHasteSpell
    --attributeHealth
    --attributeHealthRegen
    --attributeHitRatingPhys
    --attributeHitRatingSpell
    --attributeInCombat_ToEquilibrium_PerSecond_Absolute
    --attributeInCombat_ToEquilibrium_PerSecond_PercentageNormalized
    --attributeIntuition
    --attributeItem_Level
    --attributeJump
    --attributeMissRatingPhys
    --attributeMissRatingSpell
    --attributeMovement
    --attributeOutOfCombat_ToEquilibrium_PerSecond_Absolute
    --attributeOutOfCombat_ToEquilibrium_PerSecond_PercentageNormalized
    --attributeResilience
    --attributeRun
    --attributeStealth_Level
    --attributeStrength
    --attributeWisdom
--
    --statAnyDmgReduction
    --statAoE_MaxSubTargets
    --statAoE_SubTargetsDamageMod
    --statArmorRating
    --statArmorReduction
    --statAttackPower
    --statAttackPowerBonus
    --statAttackPowerRating
    --statAttackRangePhysAdd
    --statAttackRating
    --statBendChance
    --statBendRating
    --statBlockChance
    --statBlockedDamageMod
    --statBlockRating
    --statCritChance
    --statCritDmgRating
    --statCriticalChanceReduction
    --statCriticalDamageMod
    --statCriticalDamageModBonus
    --statCritRating
    --statDamagePercPerMeterMod
    --statDefencePowerPhys
    --statDefenceRatingPhys
    --statDodgeChance
    --statDodgeRating
    --statEnergyCurrentH1
    --statEnergyCurrentH2
    --statEnergyCurrentH3
    --statEnergyCurrentS1
    --statEnergyCurrentS2
    --statEnergyCurrentS3
    --statEvadeChance
    --statEvadeRating
    --statExtraHealthRegen
    --statFinalDamageMod
    --statFinalHealingMod
    --statFreeFallDistanceMod
    --statHasteClassSkills
    --statHastePhysNormal
    --statHealingReceivedMod
    --statHeavyBonus
    --statHeavyEnergyPerHit
    --statHeavyRating
    --statHitChance
    --statHitRating
    --statInitialThreatMod
    --statParryChance
    --statParryRating
    --statPeneBonus
    --statPeneRating
    --statReflectChance
    --statReflectRating
    --statSpecialBonus
    --statSpecialEnergyPerHit
    --statSpecialRating
    --statStamina
    --statTCMax
    --statThreatMod
    --statWeaponDPS
    --statWepMaxDmg
    --statWepMinDmg
    --statXpMod
end)

---comment
---@param item_id string
---@return ItemBase
function Player:GetItem(item_id)
    return __engine.inventory.GetItem(self, item_id)
end

---comment
---@return ItemBase[]
function Player:GetEquipment()
    return __engine.inventory.GetEquipment(self)
end

---comment
---@return ItemBase[]
function Player:GetItems()
    return __engine.inventory.GetItems(self)
end

---comment
---@return EdnaAbility?
function Player:GetSkill(skill_id)
    return __engine.skillbook.GetSkill(self, skill_id)
end

---comment
---@param cooldowns string[]|ContentRef[]
---@param duration number
function Player:ConsumeCooldown(cooldowns, duration)
    if #cooldowns == 0 then
        return
    end

    if type(cooldowns[1]) == "table" then
        local ids = {}

        for _,v in pairs(cooldowns) do
            table.insert(ids, v.id)
        end

        return __engine.cooldown.Consume(self, ids, duration)
    else
        return __engine.cooldown.Consume(self, cooldowns, duration)
    end
end

function Player:GetInterests()
    return __engine.interest.GetInterests(self)
end

return Player