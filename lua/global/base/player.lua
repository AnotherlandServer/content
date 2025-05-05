-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local Entity = require("core.entity")
local Timer = require("core.timer")
local AbilityEvent = require("engine.ability_event")
local Relationship = require("core.relationship")
local QuestLog = require("engine.quest_log")
local HitTable = require("engine.hit_table")
local GetWorld = require("engine.world")

---@enum AbilityState
local AbilityState = {
    Casting = 0,
    Channeling = 1,
    EndState = 2,
    Done = 3,
}


local HitRatingFactor = 100;
local CritRatingFactor = 100;
local DodgeRatingFactor = 100;
local ParryRatingFactor = 100;
local BlockRatingFactor = 100;

--- Compute base stamina
local BaseStamina = {}

for i = 1, 64 do
    BaseStamina[i] = math.floor((0.15344 * (i ^ 2) + 19.23756 * i + 0.61323) + 0.5)
end

for i = 1, 64 do
    Log.Debug("Base stamina for level " .. i .. ": " .. BaseStamina[i])
end

---@class AbilityStateStore
---@field request AbilityRequest
---@field ability EdnaAbility
---@field state AbilityState
---@field currentTimer Timer

---@class Player: Entity
---@field abilityState? AbilityStateStore
---@field abilityRetrigger? Timer
---@field avatar_id string
---@field quest_log QuestLog
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

    self:RecalculateStats()
end)

---@param self Player
---@param _ any
---@param dest string
Player.AddBehavior("travel", function (self, _, dest)
    Log.Debug("Requesting travel for player " .. self.name .. " - " .. dest)
    
    local zone_name = string.match(dest, "dest=(.+)")
    
    if zone_name then
        self:TravelToZone(zone_name)
    else
        Log.Warn("Invalid destination format: " .. dest)
    end
end)

function Player:Init()
    self.cancelChannel = false
    self.quest_log = QuestLog:New(self)
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

        if request.toggle_mode ~= nil then
            Log.Debug("Toggle mode: " .. request.toggle_mode)
        end

        if request.ability_id ~= nil then
            Log.Debug("Ability id: " .. request.ability_id)
        end

        if request.reference_id ~= nil then
            Log.Debug("Reference id: " .. request.reference_id)
        end

        if request.reference_id and (request.toggle_mode == 1 or request.toggle_mode == nil) then 
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
                self:CastAbility(skill, request)
            else
                Log.Warn("No item found for " .. request.reference_id)
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

end)

function Player:RecalculateStats()
    ---@param stats any
    ---@param weapon EdnaFunction
    function AddWeaponStats(stats, weapon)
        stats.statWepMaxDmg = stats.statWepMaxDmg + weapon:Get("WepMaxDmg")
        stats.statWepMinDmg = stats.statWepMinDmg + weapon:Get("WepMinDmg")

    end
    
    ---@param stats any
    ---@param weapon ItemEdna
    function AddAutoAttribute(stats, weapon)

    end

    ---@param stats any
    ---@param item ItemEdna
    function AddItemStats(stats, item)
        stats.statHitRating = stats.statHitRating + item:Get("HitRating")
        stats.statHeavyRating = stats.statHeavyRating + item:Get("HeavyRating")
        stats.statAttackPowerRating = stats.statAttackPowerRating + item:Get("AttackPowerRating")
        stats.statSpecialRating = stats.statSpecialRating + item:Get("SpecialRating")
        stats.statParryRating = stats.statParryRating + item:Get("ParryRating")
        stats.statPeneRating = stats.statPeneRating + item:Get("PeneRating")
        stats.attributeStrength = stats.attributeStrength + item:Get("Strength")
        stats.statStamina = stats.statStamina + item:Get("Stamina")
        stats.attributeFocus = stats.attributeFocus + item:Get("Focus")
        stats.attributeDexterity = stats.attributeDexterity + item:Get("Agility")
        stats.statCritRating = stats.statCritRating + item:Get("CritHitRating")
        stats.statCritDmgRating = stats.statCritDmgRating + item:Get("CritDamageRating")


        if item.class == "ednaFunction" then
            --[[@cast item EdnaFunction]]
            AddWeaponStats(stats, item)
        end
    end

    function CalculateBaseAttributes(stats)
        local primary_stat
        local secondary_stat

        local combat_style = self:Get("combatStyle")
        if combat_style == 0 then -- Warrior
            primary_stat = "attributeStrength"
            secondary_stat = "attributeDexterity"
        elseif combat_style == 1 then -- Marksman
            primary_stat = "attributeDexterity"
            secondary_stat = "attributeFocus"
        elseif combat_style == 2 then -- Assassin
            primary_stat = "attributeDexterity"
            secondary_stat = "attributeStrength"
        elseif combat_style == 3 then -- Energizer
            primary_stat = "attributeFocus"
            secondary_stat = "attributeDexterity"
        else
            return
        end

        stats[primary_stat] = self:Get("lvl") * 3 + self:Get("lvl")
        stats[secondary_stat] = self:Get("lvl") * 2 + self:Get("lvl")
        stats.statStamina = BaseStamina[self:Get("lvl")]
    end

    function CalculateStats(stats)
        
    end

    function CalculateDerived(stats)
        stats.attributeHealth = stats.statStamina * 10
        stats.attributeHealthRegen = 0
        stats.statFinalDamageMod = 1
        stats.statFinalHealingMod = 1
        stats.statCritChance = stats.statCritRating / 100

        -- Compute hitpoints
        stats.hpMax = stats.attributeHealth

        if self:Get("hpCur") > stats.hpMax then
            stats.hpCur = stats.hpMax
        end
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
        statStamina = 0,
        statCritRating = 0,
        statCritDmgRating = 0,
        attributeDexterity = 0,
        attributeStrength = 0,
        attributeWisdom = 0,
        attributeHealth = 0,
        attributeFocus = 0,
        attributeResilience = 0,
        attributeEnergy = 0,
        attributeConstitution = 0,
        statBlockedDamageMod = 0.5,
        statCriticalDamageMod = 1.3,
    }

    CalculateBaseAttributes(stats)

    --local mainhand = self:GetItem(self:Get("weapon")[1]) --[[@as EdnaFunction]]

    --if mainhand ~= nil then
    --    AddWeaponStats(stats, mainhand)
    --end

    for _,v in pairs(self:GetEquipment()) do
        Log.Debug("Class " .. v.class)
        local Dump = require("core.dump")

        Dump(getmetatable(v))

        if v.class == "ednaModule" or v.class == "ednaFunction" then
            --[[@cast v ItemEdna]]
            AddItemStats(stats, v)
        end
    end

    CalculateStats(stats)
    CalculateDerived(stats)

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
end

function Player:CalculateHealCaused(base)

end

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

    Log:Debug("Player:CastAbility - Player is casting ability " .. ability.name)

    local target = request.target
    if target == nil then
        local targetType = ability:Get("targetType")

        Log.Debug("Player:CastAbility - Target type " .. targetType)

        if targetType == "Self" then
            target = self
        else
            Log.Warn("Player:CastAbility - Unknown target type " .. targetType)
        end
    end

    if ability:Get("activationType") == "heldDown" and ability:Get("ChannelTime") == 0 and ability:Get("ChannelIndefinitely") == false and ability:Get("isAutoAttack") == true then
        Log.Debug("Player:CastAbility - Starting retrigger timer " .. ability.name .. " after " .. executionTime .. "secs")

        self.abilityRetrigger = Timer:Start(self, executionTime + 0.1, 0, function (timer)
            Log.Debug("Player:CastAbility - Retriggering ability " .. ability.name)

            local target = self:GetTarget()

            if target == nil then
                Log.Debug("Player:CastAbility - No target found")
            else
                Log.Debug("Player:CastAbility - Target found " .. target.name)
            end

            if target == nil or (target.class ~= "player" and target.class ~= "npcOtherland") then
                target = nil
            end

            --[[@cast target Player|NpcOtherland]]

            ---@type AbilityRequest
            local request = {
                target = target,
                item = request.item,
                ability_id = request.ability_id,
                reference_id = request.reference_id,
                combo_stage_id = request.combo_stage_id,
                prediction_id = 0,
                toggle_mode = request.toggle_mode,
            }

            self:CastAbility(ability, request)
        end)
    end

    local event = AbilityEvent.New(self, "Charge")
    event:SetAbility(ability)
    event:SetTarget(target)
    event:SetRotation(request.target_rotation)
    event:SetDuration(ability:Get("CastTime"))

    if request.item then
        event:SetEffectSource(request.item)
    else
        event:SetEffectSource(ability)
    end

    event:Fire()

    self.abilityState = {
        request = request,
        ability = ability,
        state = AbilityState.Casting,
        currentTimer = Timer:Start(self, ability:Get("CastTime"), 0, function () 
            self.abilityState.state = AbilityState.Channeling

            local channel_time
            if ability:Get("ChannelIndefinitely") then
                channel_time = 99999
            else
                channel_time = ability:Get("ChannelTime")
            end

            if channel_time > 0 then
                local event = AbilityEvent.New(self, "Channel")
                event:SetAbility(ability)
                event:SetTarget(target)
                event:SetRotation(request.target_rotation)
                event:SetDuration(channel_time)

                if request.item then
                    event:SetEffectSource(request.item)
                else
                    event:SetEffectSource(ability)
                end

                event:Fire()

                
                local tick_time = ability:Get("TickPeriod")

                if request.item then
                    tick_time = request.item:Get("WepAttSpeed")
                end
            
                self.abilityState.currentTimer = Timer:Start(self, tick_time, channel_time, function (timer, stopping)
                    local event = AbilityEvent.New(self, "Use")
                    event:SetAbility(ability)
                    event:SetTarget(target)
                    event:SetRotation(request.target_rotation)
                    event:SetEffectSource(request.item)

                    local had_effects = ability:Channel(self, event, request)

                    event:Fire()

                    if stopping or (ability:Get("ChannelIndefinitely") and not had_effects) then
                        timer:Stop()

                        self.abilityState.state = AbilityState.EndState

                        local event = AbilityEvent.New(self, "Cancel")
                        event:SetAbility(ability)
                        event:SetDuration(ability:Get("endStateDuration"))

                        if request.target_rotation then
                            event:SetRotation(request.target_rotation)
                        end

                        if request.item then
                            event:SetEffectSource(request.item)
                        else
                            event:SetEffectSource(ability)
                        end

                        event:Fire()

                        if ability:Get("endStateDuration") > 0 then
                            self.abilityState.currentTimer = Timer:Start(self, ability:Get("endStateDuration"), 0, function (timer)
                                self.abilityState.state = AbilityState.Done
                            end)
                        else
                            self.abilityState.state = AbilityState.Done
                        end
                    end
                end)
            else
                Log.Debug("Player:CastAbility - Executing ability " .. request.ability_id)
                local event = AbilityEvent.New(self, "Use")
                event:SetAbility(ability)
                event:SetDuration(executionTime)
                event:SetTarget(target)
                event:SetPredictionId(request.prediction_id)
                event:SetComboStageId(request.combo_stage_id)
            
                if request.target_rotation then
                    event:SetRotation(request.target_rotation)
                end
            
                if request.item then
                    event:SetEffectSource(request.item)
                else
                    event:SetEffectSource(ability)
                end
                
                ability:Use(self, event, request)
        
                event:Fire() 

                self.abilityState.state = AbilityState.Done
            end
        end)
    }

    return true
end

function Player:CancelAbility()
    if self.abilityRetrigger ~= nil then
        self.abilityRetrigger:Stop()
        self.abilityRetrigger = nil
    end

    if not self.abilityState then
        return true
    end

    if not self.abilityState.ability:Get("canBeInterrupted") and self.abilityState.state ~= AbilityState.Done then
        return false
    end

    Log.Debug("Player:CancelAbility - Cancelling ability " .. self.abilityState.request.ability_id)

    if self.abilityState.currentTimer then
        self.abilityState.currentTimer:Stop()
    end

    local event = AbilityEvent.New(self, "Cancel")
    event:SetAbility(self.abilityState.ability)

    if self.abilityState.request.item then
        event:SetEffectSource(self.abilityState.request.item)
    else
        event:SetEffectSource(self.abilityState.ability)
    end

    event:Fire()

    self.abilityState = nil

    return true
end

---@param message integer
function Player:ShowTutorialMessage(message)
    __engine.dialogue.ShowTutorialMessage(self, message)
end

function Player:ConfirmTravel()
    __engine.player.ConfirmTravel(self)
end

---@param zone string
function Player:TravelToZone(zone)
    __engine.player.TravelToZone(self, zone)
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

---@enum (key) BuffReference
local BuffReference = {
    TemplateId = 0,
    InstanceId = 1,
    Name = 2,
}

---@param buff_id string|ContentRef
---@param instigator? Player|NpcOtherland
---@param duration? number
---@param delay? number
---@param stacks? integer
---@return string
function Player:AddBuff(buff_id, instigator, duration, delay, stacks)
    if instigator == nil then
        instigator = self
    end

    if type(buff_id) == "table" then
        return __engine.buffs.AddBuff(self, instigator, buff_id.id, duration, delay, stacks)
    else
        return __engine.buffs.AddBuff(self, instigator, buff_id, duration, delay, stacks)
    end
end

---@param buff_name string
---@param instigator? Player|NpcOtherland
---@param duration? number
---@param delay? number
---@param stacks? integer
---@return string
function Player:AddBuffByName(buff_name, instigator, duration, delay, stacks)
    if instigator == nil then
        instigator = self
    end

    return __engine.buffs.AddBuffByName(self, instigator, buff_name, duration, delay, stacks)
end

---@param reference_type BuffReference
---@param buff_id string|ContentRef
---@return boolean
function Player:RemoveBuff(reference_type, buff_id)
    if type(buff_id) == "table" then
        return __engine.buffs.RemoveBuff(self, reference_type, buff_id.id)
    else
        return __engine.buffs.RemoveBuff(self, reference_type, buff_id)
    end
end

---@param reference_type BuffReference
---@param buff_id string|ContentRef
---@return boolean
function Player:HasBuff(reference_type, buff_id)
    if type(buff_id) == "table" then
        return __engine.buffs.HasBuff(self, reference_type, buff_id.id)
    else
        return __engine.buffs.HasBuff(self, reference_type, buff_id)
    end
end

---@return Vector
function Player:GetPosition()
    return __engine.movement.GetPosition(self)
end

---@return Quaternion
function Player:GetRotation()
    return __engine.movement.GetRotation(self)
end

---@return Vector
function Player:GetVelocity()
    return __engine.movement.GetVelocity(self)
end

---@return Entity[]
function Player:GetInterests()
    return __engine.interests.GetInterests(self)
end

---@return Entity?
function Player:GetTarget()
    return GetWorld():GetEntityById(self:Get("target"))
end

return Player