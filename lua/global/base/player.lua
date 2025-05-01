-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")
local Timer = require("core.timer")
local AbilityInvocation = require("engine.ability_invocation")
local Relationship = require("core.relationship")

---@enum AbilityState
local AbilityState = {
    Casting = 0,
    Channeling = 1,
    EndState = 2,
}

---@class AbilityStateStore
---@field request AbilityRequest
---@field ability EdnaAbility
---@field state AbilityState
---@field currentTimer Timer

---@class Player: Entity
---@field abilityState? AbilityStateStore
-----@field channelAbility? EdnaAbility
-----@field channelRequest? AbilityRequest
-----@field channelTimer? Timer
-----@field executionTimer? Timer
-----@field cancelChannel boolean
local Player = Class(Entity)

---@private
Player._BEHAVIOR = {}

---Adds a behavior
---@param name string
---@param callback function
function Player.AddBehavior(name, callback)
    Player._BEHAVIOR[name] = callback;
end

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

function Player:Init()
    self.cancelChannel = false
end

Player:On("OnAbilityRequest",     
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

        Log.Debug("Toggle mode: " .. request.toggle_mode)

        if request.reference_id and request.toggle_mode == 1 then 
            local item = self:GetItem(request.reference_id)
            local skill = self:GetSkill(request.reference_id)

            if item ~= nil then 
                if item.class == "ednaFunction" then
                    ---@cast item EdnaFunction
                    request.item = item

                    if item.NormalAttack ~= nil then 
                        self:CastAbility(item.NormalAttack, request)
                        --item.NormalAttack:Invoke(self, request)
                    else
                        Log.Warn("No abilities found for item " .. request.reference_id)
                    end
                end
            elseif skill ~= nil then
                skill:Invoke(self, request)
            end
        elseif request.toggle_mode == 2 then
            self:CancelAbility()
        end  
    end)

---@param self Player
Player:On("OnAbilityChannel", function (self)

    end
)

---@param self Player
---@param mainhand? EdnaFunction
---@param offhand? EdnaFunction
Player:On("OnWeaponSelect", function (self, mainhand, offhand)
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

---@param item_id string
---@return ItemBase
function Player:GetItem(item_id)
    return __engine.inventory.GetItem(self, item_id)
end

---@return ItemBase[]
function Player:GetEquipment()
    return __engine.inventory.GetEquipment(self)
end

---@return ItemBase[]
function Player:GetItems()
    return __engine.inventory.GetItems(self)
end

---@return EdnaAbility?
function Player:GetSkill(skill_id)
    return __engine.skillbook.GetSkill(self, skill_id)
end

---@param cooldowns string[]|ContentRef[]
function Player:ConsumeCooldown(cooldowns)
    if #cooldowns == 0 then
        return
    end

    if type(cooldowns[1]) == "table" then
        local ids = {}

        for _,v in pairs(cooldowns) do
            table.insert(ids, v.id)
        end

        return __engine.cooldown.Consume(self, ids)
    else
        return __engine.cooldown.Consume(self, cooldowns)
    end
end

---@param cooldowns string[]|ContentRef[]
---@param duration number
function Player:EmitCooldown(cooldowns, duration)
    if #cooldowns == 0 then
        return
    end

    if type(cooldowns[1]) == "table" then
        local ids = {}

        for _,v in pairs(cooldowns) do
            table.insert(ids, v.id)
        end

        return __engine.cooldown.Emit(self, ids, duration)
    else
        return __engine.cooldown.Emit(self, cooldowns, duration)
    end
end

function Player:Spawn()
    __engine.player.Spawn(self)
end

function Player:BeginLoadInventory()
    __engine.inventory.BeginLoadInventory(self)
end

function Player:IsAlive()
    if self:Get("hpCur") > self:Get("hpMin") then
        return true
    else
        return false
    end
end

function Player:IsInCombat()
    self:Get("isInCombat")
end

---
---@param class_item_name string
---@param clear_inventory boolean
---@param callback fun(err?: any)
function Player:ApplyClassItem(class_item_name, clear_inventory, callback)
    __engine.player.ApplyClassItem(self, class_item_name, clear_inventory, callback)
end

---@param ability EdnaAbility
---@param request AbilityRequest
---@return boolean
function Player:CastAbility(ability, request)
    -- Check if we are still executing an ability and cancel it.
    -- Return if that fails.
    if not self:CancelAbility() then
        Log:Debug("Player:CastAbility - Cancel ability failed")
        return false
    end

    -- Check player prerequisites.

    if ability:Get("requireRunningWhenActivated") and self:GetVelocity():Length() == 0 then
        Log:Debug("Player:CastAbility - Player is not running")
        return false
    end

    if ability:Get("sourceMustBeAlive") and not self:IsAlive() then
        Log:Debug("Player:CastAbility - Player is not alive")
        return false
    end

    if not ability:Get("usableInCombat") and self:IsInCombat() then
        Log:Debug("Player:CastAbility - Player is in combat")
        return false
    end

    if not ability:Get("usableOutOfCombat") and not self:IsInCombat() then
        Log:Debug("Player:CastAbility - Player is out of combat")
        return false
    end
    
    if ability:Get("usableWithClassWeapon") ~= -1 and self:Get("combatStyle") ~= ability:Get("usableWithClassWeapon") then
        Log:Debug("Player:CastAbility - Player is not using the correct weapon class")
        return false
    end

    if ability:Get("usableWithMeleeWeapon") then
        -- todo
    end

    if ability:Get("usableWithoutWeapon") then
        -- todo
    end

    if ability:Get("usableWithRangedWeapon") then
        -- todo
    end

    --- Check target prerequisites
    if not ability:Get("alwaysExecute") and ability:Get("targetType") == "Target" then
        if not request.target then
            Log:Debug("Player:CastAbility - No valid target")
            return false
        end

        if ability:Get("targetMustBeAlive") then
        end

        if ability:Get("targetMustBeDead") then
        end

        if ability:Get("targetMustBeOnGround") then
        end
    end

    local executionTime = ability:Get("executionTime")
    if request.item then
        executionTime = request.item:Get("WepAttSpeed")
    end

    if #ability:Get("externalCooldownsConsumed") == 0 and ability:Get("isAutoAttack") then
        if not self:ConsumeCooldown({[1] = "22a4f191-0183-48ec-8b17-4f9c6cb72f47"}) then
            Log:Debug("Player:CastAbility - Cooldown not ready")
            return false
        end
    else
        if not self:ConsumeCooldown(ability:Get("externalCooldownsConsumed")) then
            Log:Debug("Player:CastAbility - Cooldown not ready")
            return false
        end
    end

    if #ability:Get("externalCooldownsEmitted") == 0 and ability:Get("isAutoAttack") then
        if not self:EmitCooldown({[1] = "22a4f191-0183-48ec-8b17-4f9c6cb72f47"}, executionTime) then
            Log:Debug("Player:CastAbility - Cooldown not ready")
            return false
        end
    else
        if not self:EmitCooldown(ability:Get("externalCooldownsEmitted"), executionTime) then
            Log:Debug("Player:CastAbility - Cooldown not ready")
            return false
        end
    end

    
    local ability_type
    if request.item ~= nil then
        ability_type = "Item"
    else
        ability_type = "Skill"
    end

    Log:Debug("Player:CastAbility - Player is casting ability " .. request.ability_id)

    local invocation = AbilityInvocation.New(ability, self, ability_type, "Charge")
    invocation:SetTarget(request.target)
    invocation:SetRotation(request.target_rotation)
    invocation:SetDuration(ability:Get("CastTime"))
    invocation:Invoke()

    self.abilityState = {
        request = request,
        ability = ability,
        state = AbilityState.Casting,
        currentTimer = Timer:Start(self, ability:Get("CastTime"), 0, function () 
            self.abilityState.state = AbilityState.Channeling

            local channel_time
            if not ability:Get("ChannelIndefinitely") then
                channel_time = ability:Get("ChannelTime")
            else
                channel_time = 99999
            end

            if channel_time > 0 then
                local invocation = AbilityInvocation.New(ability, self, ability_type, "Channel")
                invocation:SetTarget(request.target)
                invocation:SetRotation(request.target_rotation)

                if ability:Get("ChannelIndefinitely") then
                    invocation:SetDuration(99999)
                else
                    invocation:SetDuration(ability:Get("ChannelTime"))
                end

                if request.item then
                    invocation:SetItem(request.item)
                end

                invocation:Invoke()

                
                local tick_time = ability:Get("TickPeriod")

                if request.item then
                    tick_time = request.item:Get("WepAttSpeed")
                end
            
                self.abilityState.currentTimer = Timer:Start(self, tick_time, channel_time, function (timer, stopping)
                    local invocation = AbilityInvocation.New(ability, self, ability_type, "Use")
                    invocation:SetTarget(request.target)
                    invocation:SetRotation(request.target_rotation)
                    invocation:SetItem(request.item)

                    local valid_targets = ability:Channel(self, invocation, request)

                    invocation:Invoke()

                    if stopping or not valid_targets then
                        timer:Stop()

                        self.abilityState.state = AbilityState.EndState

                        local invocation = AbilityInvocation.New(ability, self, ability_type, "Cancel")
                        invocation:SetDuration(ability:Get("endStateDuration"))

                        if request.target_rotation then
                            invocation:SetRotation(request.target_rotation)
                        end

                        if request.item then
                            invocation:SetItem(request.item)
                        end

                        invocation:Invoke()

                        if ability:Get("endStateDuration") > 0 then
                            self.abilityState.currentTimer = Timer:Start(self, ability:Get("endStateDuration"), 0, function (timer)
                                self.abilityState = nil
                            end)
                        else
                            self.abilityState = nil
                        end
                    end
                end)
            else
                Log.Debug("Player:CastAbility - Executing ability " .. request.ability_id)
                local invocation = AbilityInvocation.New(ability, self, ability_type, "Use")
                invocation:SetDuration(executionTime)
                invocation:SetTarget(request.target)
                invocation:SetPredictionId(request.prediction_id)
                invocation:SetComboStageId(request.combo_stage_id)
            
                if request.target_rotation then
                    invocation:SetRotation(request.target_rotation)
                end
            
                if request.item then
                    invocation:SetItem(request.item)
                end
                
                ability:Use(self, invocation, request)
        
                invocation:Invoke() 

                self.abilityState = nil
            end
        end)
    }

    return true
end

function Player:CancelAbility()
    if not self.abilityState then
        return true
    end

    if not self.abilityState.ability:Get("canBeInterrupted") then
        return false
    end

    Log.Debug("Player:CancelAbility - Cancelling ability " .. self.abilityState.request.ability_id)

    if self.abilityState.currentTimer then
        self.abilityState.currentTimer:Stop()
    end

    local ability_type
    if self.abilityState.request.item ~= nil then
        ability_type = "Item"
    else
        ability_type = "Skill"
    end

    local invocation = AbilityInvocation.New(self.abilityState.ability, self, ability_type, "Cancel")
    invocation:SetItem(self.abilityState.request.item)
    invocation:Invoke()

    return true
end

---@param message integer
function Player:ShowTutorialMessage(message)
    __engine.dialogue.ShowTutorialMessage(self, message)
end

---@param portal_id string
function Player:TravelToPortal(portal_id)
    __engine.player.TravelToPortal(self, portal_id)
end

---@param other Player|NpcOtherland
---@return Affiliation
function Player:RelationshipTo(other)
    return Relationship.AffiliationFromRank(
        __engine.faction.EntityRelationship(self, other)
    )
end

return Player