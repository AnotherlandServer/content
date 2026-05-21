-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

--- @module "core.base_quest"
--- @module "global.base.structure"
--- @module "global.base.oa_buff_2"
--- @module "engine.interruption"

local Class = require("core.class")
local Entity = require("core.entity")
local Timer = require("core.timer")
local AbilityEvent = require("engine.ability_event")
local Relationship = require("core.relationship")
local QuestLog = require("engine.quest_log")
local GetWorld = require("engine.world")
local Interaction = require("engine.interaction")
local AvatarFilter = require("engine.avatar_filter")
local Coefficients = require("settings.coefficients")
local AttributesContainer = require("engine.attributes")
local dump = require("core.dump")

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
---@field attributes AttributesContainer
---@field abilityRetrigger? Timer
---@field avatar_id AvatarId
---@field quest_log QuestLog
---@field activeInteraction? Timer
---@field enemies { [AvatarId]: Player|NpcOtherland }
---@field ccEffects { CCEffect: boolean }
-----@field channelAbility? EdnaAbility
-----@field channelRequest? AbilityRequest
-----@field channelTimer? Timer
-----@field executionTimer? Timer
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

    self:RecalculateAttributes()
end)

---@param self Player
---@param _ any
---@param dest string
Player.AddBehavior("travel", function (self, _, dest)
    Log.Debug("Requesting travel for player " .. self.name .. " - " .. dest)
    
    local zone_name = string.match(dest, "dest=(.+)")
    
    if zone_name then
        self:RunCinematic("PortalDepartDefault")
        self:TravelToZone(zone_name)
    else
        Log.Warn("Invalid destination format: " .. dest)
    end
end)

---@param self Player
---@param _ any
---@param variant string
Player.AddBehavior("respawnnow", function (self, _, variant)
    Log.Debug("Requesting respawn for player " .. self.name .. " - variant " .. variant)

    if variant == "NearestPortal" then
        local portals = GetWorld():FindEntitiesByClass("portal")
        ---@cast portals Portal[]

        local nearest_portal = nil ---@type Portal?

        for _,v in pairs(portals) do
            if nearest_portal == nil then
                nearest_portal = v
            else
                local dist1 = (self:GetPosition() - nearest_portal:GetPosition()):Length()
                local dist2 = (self:GetPosition() - v:GetPosition()):Length()

                if dist2 < dist1 then
                    nearest_portal = v
                end
            end
        end

        if nearest_portal then
            Log.Debug("Nearest Portal: " .. nearest_portal.name .. " - " .. nearest_portal.placement_guid)

            local exitPoint = nearest_portal:Get("exitPoint") ---@type string
            local respawnPos = nearest_portal:GetPosition()
            local respawnRot = nearest_portal:GetRotation()

            if string.len(exitPoint) > 0 then
                -- Lookup exit node
                local exitPoint = GetWorld():FindEntitiesWithFilter(AvatarFilter.FindByInstanceId(exitPoint)) ---@type Structure[]
                
                if #exitPoint > 0 then
                    respawnPos = exitPoint[1]:GetPosition()
                    respawnRot = exitPoint[1]:GetRotation()
                end
            end

            self:RunCinematic("PortalDepartDefault")

            Timer:SingleShot(self, 3, function()
                self:Set("isUnAttackable", true)
                __engine.combat.FireReviveEvent(self, 0, self, nil, {
                    type = "Normal",
                    amount = self:Get("hpMax") / 2
                })
                self:Respawn(respawnPos, respawnRot)
            end)
        else
            Log.Warn("No portals found for respawn")
        end
    elseif variant == "Corpse" or variant == "Premium" then
        self:Set("cooldownPassed", false)
        self:RunCinematic("PortalDepartDefault")

        Timer:SingleShot(self, 2, function()
            self:Set("isUnAttackable", true)
            __engine.combat.FireReviveEvent(self, 0, self, nil, {
                type = "Normal",
                amount = self:Get("hpMax") / 2
            })
            self:Respawn(self:GetPosition(), self:GetRotation())
        end)

        Timer:SingleShot(self, 30, function()
            self:Set("cooldownPassed", true)
        end)
    end
end)

---@param self Player
Player.AddBehavior("promptcooldown", function (self)
    --self:ConsumeCooldown({[1] = "7daff75b-6078-419b-aa75-c06799b21bf8"})
    --self:EmitCooldown({[1] = "7daff75b-6078-419b-aa75-c06799b21bf8"}, 1)   
end)

---@param self Player
Player.AddBehavior("disableinvulnerability", function (self)
    self:Set("isUnAttackable", false)
end)

---@param self Player
---@param _ any
---@param message string
Player.AddBehavior("requestchatmessage", function (self, _, message)
    self:SendMessage("Normal", message)
end)

function Player:Init()
    self.quest_log = QuestLog:New(self)
    self.enemies = {}
    self.attributes = AttributesContainer:New()
    self.ccEffects = {}

    self:Set("isInCombat", false)
end

Player:On("OnAbilityRequest",     
    ---@param self Player
    ---@param request AbilityRequest
    function (self, request)
        if request.target then
            --Log.Debug("Ability request for player " .. self.name .. " - target " .. request.target.name)
        else
            --Log.Debug("Ability request for player " .. self.name)
        end

        if request.combo_stage_id ~= nil then
            --Log.Debug("Combo id: " .. request.combo_stage_id)
        end

        if request.toggle_mode ~= nil then
            --Log.Debug("Toggle mode: " .. request.toggle_mode)
        end

        if request.ability_id ~= nil then
            --Log.Debug("Ability id: " .. request.ability_id)
        end

        if request.reference_id ~= nil then
            --Log.Debug("Reference id: " .. request.reference_id)
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

Player:On("OnInteractionStart",
    ---@param self Player
    ---@param target Player|NonClientBase
    ---@param interaction Interaction
    function (self, target, interaction)
        if self.activeInteraction then
            self.activeInteraction:Stop()
            self.activeInteraction = nil
        end

        self.activeInteraction = Timer:Start(self, interaction.duration, 0, function (timer)
            Interaction.CastComplete(self, target):Send()
        end)
    end)

Player:On("OnCastCompleted", 
    ---@param self Player
    ---@param target Player|NonClientBase
    ---@param interaction Interaction
    function (self, target, interaction)
        if self.activeInteraction then
            self.activeInteraction:Stop()
            self.activeInteraction = nil
        end
    end)

Player:On("OnCastInterrupted", 
    ---@param self Player
    ---@param target Player|NonClientBase
    ---@param interaction Interaction
    function (self, target, interaction)
        self:Interrupt("Cancellation", self)
    end)

Player:On("OnDamage", 
    ---@param self Player
    ---@param source? Player|NpcOtherland
    ---@param amount EffectAmount
    function (self, source, amount)
        if source and source.avatar_id ~= self.avatar_id then
            self:AnnounceCombat(source)
            self:Set("attackedBy", source.avatar_id)
        end
    end)

Player:On("RecalculateAttributes",
    ---@param self Player
    function (self)
        Log.Debug("Recalculating attributes for player " .. self.name)

        self.attributes = AttributesContainer:NewDefault()

        self.attributes.BlockedDamage_Reduction = Coefficients.PlayerBaseBlockedDamageReduction
        self.attributes.CriticalDamage_Mod = Coefficients.PlayerBaseCritDamageMod

        -- Compute primary, secondary and stamina attributes
        self.attributes[self:GetPrimaryStat()] = self:Get("lvl") * 3 + self:Get("lvl")
        self.attributes[self:GetSecondaryStat()] = self:Get("lvl") * 2 + self:Get("lvl")
        self.attributes.Stamina = BaseStamina[self:Get("lvl")]

        for _, item in pairs(self:GetEquipment()) do
            if item.class == "ednaModule" or (item.class == "ednaFunction" and item.placement_guid == self:Get("weapon")[1]) then
                --[[@cast item ItemEdna]]
                self.attributes:AddAttributes(item.attributes)

                Log.Debug("Adding item " .. item.name .. ". Movement_Mod = " .. self.attributes.Movement_Mod)

                if item.class == "ednaFunction" then
                    self.attributes:Modify("Add", "WepMaxDmg", item:Get("WepMaxDmg"))
                    self.attributes:Modify("Add", "WepMinDmg", item:Get("WepMinDmg"))
                end
            end
        end

        local buffs = self:GetBuffs() ---@type OaBuff[]
        for _,buff in pairs(buffs) do
            self.attributes:AddAttributes(buff.attributes)

            Log.Debug("Adding buff " .. buff.name .. ". Movement_Mod = " .. self.attributes.Movement_Mod)
        end

        self.attributes:Modify("Add", "FinalDamage_Mod", self.attributes.AttackPower / 250)
        self.attributes:Modify("Add", "FinalHealing_Mod", self.attributes.AttackPower / 250)
        self.attributes:Modify("Add", "CritRating_Mod", self.attributes.CritRating / 100)

        self:Set("hpMax", self.attributes.Stamina * Coefficients.HealthPerStamina)

        if self:Get("hpCur") > self:Get("hpMax") then
            self:Set("hpCur", self:Get("hpMax"))
        end

        for k,v in pairs(self.attributes) do 
            Log.Debug("attr[" .. k .. "] = " .. v)
        end

        self:Set("moveSpeed", 292.0 * self.attributes.Movement_Mod)
        Log.Warn("Move Speed: " .. self:Get("moveSpeed"))

        self:Set("statAttackPower", self.attributes.AttackPower)
        self:Set("statAttackPowerBonus", self.attributes.AttackPower_Mod)
        self:Set("statHitRating", self.attributes.HitRating)
        self:Set("statHitChance", self.attributes.Hit_Chance)
        self:Set("statCritRating", self.attributes.CritRating)
        self:Set("statCritDmgRating", self.attributes.CritRating_Mod)
        self:Set("statCritChance", self.attributes.Crit_Chance)
        self:Set("statBlockRating", self.attributes.BlockRating)
        self:Set("statBlockChance", self.attributes.Block_Chance)
        self:Set("statBendRating", self.attributes.BendRating)
        self:Set("statBendChance", self.attributes.Bend_Chance)
        self:Set("statReflectRating", self.attributes.ReflectRating)
        self:Set("statReflectChance", self.attributes.Reflect_Chance)
        self:Set("statWepMinDmg", self.attributes.WepMinDmg)
        self:Set("statWepMaxDmg", self.attributes.WepMaxDmg)

        self:Set("statArmorRating", self.attributes.ArmorRating)
        self:Set("statArmorReduction", self.attributes.Armor_Reduction)

        self:Set("statHeavyEnergyPerHit", self.attributes.HeavyEnergyPerHit_Mod)
        self:Set("statSpecialEnergyPerHit", self.attributes.SpecialEnergyPerHit_Mod)
        self:Set("statThreatMod", self.attributes.Threat_Mod)
        self:Set("statAttackRangePhysAdd", self.attributes.AttackRangePhysAdd)

        self:Set("statHasteClassSkills", self.attributes.ClassSkillCooldown_Reduction)
        self:Set("statCriticalDamageMod", self.attributes.CriticalDamage_Mod)
        self:Set("statCriticalChanceReduction", self.attributes.CriticalChance_Reduction)
        self:Set("statBlockedDamageMod", self.attributes.BlockedDamage_Reduction)
        self:Set("statFinalDamageMod", self.attributes.FinalDamage_Mod)
        self:Set("statAnyDmgReduction", self.attributes.AnyDmg_Reduction)

        self:Set("statFinalHealingMod", self.attributes.FinalHealing_Mod)
        self:Set("statHealingReceivedMod", self.attributes.HealingReceived_Mod)
        self:Set("statExtraHealthRegen", self.attributes.ExtraHealthRegen)

        self:Set("statAoE_MaxSubTargets", self.attributes.AoE_MaxSubTargets)
        self:Set("statAoE_SubTargetsDamageMod", self.attributes.AoE_SubTargetsDamage_Scale)

        self:Set("statXpMod", self.attributes.Xp_Mod)
        self:Set("statFreeFallDistanceMod", self.attributes.FreeFallDistance_Mod)
        self:Set("statDamagePercPerMeterMod", self.attributes.DamagePercPerMeter_Mod)
        self:Set("statTCMax", self.attributes.ExtraSomaCapacity)

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

Player:On("InterestRemoved",
    ---@param self Player
    ---@param ent Entity
    function (self, ent)
        if ent.class == "Player" or ent.class == "NpcOtherland" then
            --[[@cast ent Player|NpcOtherland]]
            self:DisannounceCombat(ent)
        end
    end)

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

---@param cooldowns (string|ContentRef|integer)[]
---@return boolean
function Player:ConsumeCooldowns(cooldowns)
    if #cooldowns == 0 then
        return true
    end

    
    local ids = {}
    
    for _,v in pairs(cooldowns) do
        if type(v) == "string" then
            table.insert(ids, v)
        elseif type(v) == "table" and v.id then
            table.insert(ids, v.id)
        elseif type(v) == "number" then
            table.insert(ids, v)
        else
            Log.Warn("Invalid cooldown type: " .. type(v))
        end
    end

    Log.Debug("Consuming cooldowns for player " .. self.name .. ": " .. table.concat(ids, ", "))

    return __engine.cooldown.Consume(self, ids)
end

---@param cooldowns (string|ContentRef|integer)[]
---@param duration number
function Player:EmitCooldown(cooldowns, duration)
    if #cooldowns == 0 then
        return
    end

    local ids = {}

    for _,v in pairs(cooldowns) do
        if type(v) == "string" then
            table.insert(ids, v)
        elseif type(v) == "table" and v.id then
            table.insert(ids, v.id)
        elseif type(v) == "number" then
                table.insert(ids, v)
        else
            Log.Warn("Invalid cooldown type: " .. type(v))
        end
    end

    return __engine.cooldown.Emit(self, ids, duration)
end

function Player:Spawn()
    if not self:Get("cooldownPassed") then
        Timer:SingleShot(self, 60, function()
            self:Set("cooldownPassed", true)
        end)
    end

    -- Fallback in case the player logged out during post-death invulnerability
    self:Set("isUnAttackable", false)

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

---@param source Player|NpcOtherland
function Player:AnnounceCombat(source)
    if self.enemies[source.avatar_id] == nil then
        self.enemies[source.avatar_id] = source

        if not self:IsInCombat() then
            __engine.interrupt.TriggerInterruption("EnterCombat", self, source)
            self:Set("isInCombat", true)
        end
    end
end

---@param source Player|NpcOtherland
function Player:DisannounceCombat(source)
    if self.enemies[source.avatar_id] ~= nil then
        self.enemies[source.avatar_id] = nil
    end

    if next(self.enemies) == nil then
        __engine.interrupt.TriggerInterruption("LeaveCombat", self)
        self:Set("isInCombat", false)
    end
end

function Player:IsInCombat()
    return self:Get("isInCombat")
end

---
---@param class_item_name string
---@param clear_inventory boolean
---@param callback fun(err?: any)|nil
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
        --Log.Debug("Player:CastAbility - Cancel ability failed")
        return false
    end

    -- Check player prerequisites.

    if ability:Get("requireRunningWhenActivated") and self:GetVelocity():Length() == 0 then
        --Log.Debug("Player:CastAbility - Player is not running")
        return false
    end

    if ability:Get("sourceMustBeAlive") and not self:IsAlive() then
        --Log.Debug("Player:CastAbility - Player is not alive")
        return false
    end

    if not ability:Get("usableInCombat") and self:IsInCombat() then
        --Log.Debug("Player:CastAbility - Player is in combat")
        return false
    end

    if not ability:Get("usableOutOfCombat") and not self:IsInCombat() then
        --Log.Debug("Player:CastAbility - Player is out of combat")
        return false
    end
    
    if ability:Get("usableWithClassWeapon") ~= -1 and self:Get("combatStyle") ~= ability:Get("usableWithClassWeapon") then
        --Log.Debug("Player:CastAbility - Player is not using the correct weapon class")
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

    local needBuffGroupsToExecute = ability:Get("needBuffGroupsToExecute") --[[@as ContentRef[] ]]
    if #needBuffGroupsToExecute then
        local buffs = self:GetBuffs()
        local buffGroups = {}

        for _, buff in pairs(buffs) do
            local buffGroup = buff:Get("buffGroup") --[[@as ContentRef?]]
            if buffGroup then
                buffGroups[buffGroup.id] = true
            end
        end

        for _, v in pairs(needBuffGroupsToExecute) do
            if not buffGroups[v.id] then
                Log.Debug("Player:CastAbility - Missing buff group: " .. v)
                return false
            end
        end
    end

    local removeActiveBuffGroupsAndQuit = ability:Get("removeActiveBuffGroupsAndQuit") --[[@as ContentRef[] ]]
    if #removeActiveBuffGroupsAndQuit then
        local buffs = self:GetBuffs()
        local removed = false

        for _, buff in pairs(buffs) do
            local buffGroup = buff:Get("buffGroup") --[[@as ContentRef?]]
            if buffGroup then
                for _, removeGroup in pairs(removeActiveBuffGroupsAndQuit) do
                    if removeGroup.id == buffGroup.id then
                        buff:Expire()
                        removed = true
                    end

                end
            end
        end

        if removed then
            Log.Debug("Player:CastAbility - Stopping execution due to remove active buffs.")
            return false
        end
    end

    --- Check target prerequisites
    if not ability:Get("alwaysExecute") and ability:Get("targetType") == "Target" then
        if not request.target then
            --Log.Debug("Player:CastAbility - No valid target")
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

    if not ability:ConsumeResources(self, request.item) then
        Log.Debug("Player:CastAbility - Cooldown not ready")
        return false
    end

    --Log.Debug("Player:CastAbility - Player is casting ability " .. ability.name)

    local target = request.target
    if target == nil then
        local targetType = ability:Get("targetType")

        --Log.Debug("Player:CastAbility - Target type " .. targetType)

        if targetType == "Self" then
            target = self
        else
            --Log.Warn("Player:CastAbility - Unknown target type " .. targetType)
        end
    end

    if ability:Get("activationType") == "heldDown" and ability:Get("ChannelTime") == 0 and ability:Get("ChannelIndefinitely") == false and ability:Get("isAutoAttack") == true then
        --Log.Debug("Player:CastAbility - Starting retrigger timer " .. ability.name .. " after " .. executionTime .. "secs")

        self.abilityRetrigger = Timer:Start(self, executionTime + 0.1, 0, function (timer)
            --Log.Debug("Player:CastAbility - Retriggering ability " .. ability.name)

            local target = self:GetTarget()

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

                    if request.item then
                        event:SetEffectSource(request.item)
                    else
                        event:SetEffectSource(ability)
                    end

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
                --Log.Debug("Player:CastAbility - Executing ability " .. request.ability_id)
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

        return true
    end

    if not self.abilityState then
        return true
    end

    if not self.abilityState.ability:Get("canBeInterrupted") and self.abilityState.state < AbilityState.Channeling then
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
---@param movie string|nil
function Player:TravelToZone(zone, movie)
    __engine.player.TravelToZone(self, zone, movie)
end

---@param portal_id string
function Player:TravelToPortal(portal_id)
    __engine.player.TravelToPortal(self, portal_id)
end

---@param position Vector
---@param rotation Quaternion
function Player:Respawn(position, rotation)
    __engine.player.Respawn(self, position, rotation)
end

---@param cinematic string
---@param level string|nil
function Player:RunCinematic(cinematic, level)
    __engine.player.RunCinematic(self, cinematic, level)
end

---@param event string
function Player:TriggerRemoteEvent(event)
    __engine.player.TriggerRemoteEvent(self, event)
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
    return GetWorld():GetEntityByAvatarId(self:Get("target"))
end

---@return string
function Player:GetPrimaryStat()
    if self:Get("combatStyle") == 0 then
        return "Strength"
    elseif self:Get("combatStyle") == 1 then
        return "Dexterity"
    elseif self:Get("combatStyle") == 2 then
        return "Dexterity"
    elseif self:Get("combatStyle") == 3 then
        return "Focus"
    end

    -- Fallback
    return "Strength"
end

---@return string
function Player:GetSecondaryStat()
    if self:Get("combatStyle") == 0 then
        return "Dexterity"
    elseif self:Get("combatStyle") == 1 then
        return "Focus"
    elseif self:Get("combatStyle") == 2 then
        return "Strength"
    elseif self:Get("combatStyle") == 3 then
        return "Dexterity"
    end

    -- Fallback
    return "Dexterity"
end

---@return number
function Player:GetBaseDamage()
    return 
        self.attributes[self:GetPrimaryStat()] * 0.5 + 
        self.attributes[self:GetSecondaryStat()] * 0.5
end

---@return number, number
function Player:GetWeaponDamage()
    return self:Get("statWepMinDmg"), self:Get("statWepMaxDmg")
end

function Player:GetPeneBonus()
    return self:Get("statPeneBonus")
end

function Player:HasQuestAvailable(questId)
    local state = self.quest_log:GetQuestState(questId)
    return state == QuestLog.QuestState.AVAILABLE
end

function Player:HasQuestInProgress(questId)
    local state = self.quest_log:GetQuestState(questId)
    return state == QuestLog.QuestState.IN_PROGRESS
end

function Player:HasQuestCompleted(questId)
    local state = self.quest_log:GetQuestState(questId)
    return state == QuestLog.QuestState.COMPLETED
end

function Player:HasQuestFinished(questId)
    local state = self.quest_log:GetQuestState(questId)
    return state == QuestLog.QuestState.FINISHED
end

---@param target NonClientBase
---@param quest BaseQuest
---@param state QuestMarker
function Player:UpdateQuestMarker(target, quest, state)
    Log.Debug("Player:UpdateQuestMarker - " .. self.name .. " - " .. target.name .. " - " .. state)

    __engine.questlog.UpdateQuestMarker(self, target, quest, state)
end

---@param type "interact"
---@param target Player|NonClientBase
function Player:RequestInteraction(type, target)
    if type == "interact" then
        target:RequestInteraction(self, type)
    end
end

---@param type "Normal"|"Combat"|"Console"|"Clan"|"Party"|"Xp"|"Loot"|"Quest"|"PopUp"|"IllegalZone"
---@param message string
function Player:SendMessage(type, message)
    __engine.player.SendMessage(self, message, type)
end

---@param kind InterruptionKind
---@param source Player|NpcOtherland|nil
function Player:Interrupt(kind, source)
    __engine.interrupt.FireInterrupt(kind, self, source)
end

---@param kind InterruptionKind
---@param source Player|NpcOtherland|nil
function Player:OnInterrupt(kind, source)
    if self.activeInteraction then
        Interaction.CastInterrupt(self, self):Send()

        self.activeInteraction:Stop()
        self.activeInteraction = nil
    end

    if self.abilityState and self.abilityState.ability then
        if kind == "Movement" then
            if self.abilityState.state == AbilityState.Channeling and not self.abilityState.ability:Get("allowMoveWhileChanneling") then
                self:CancelAbility()
            elseif self.abilityState.state == AbilityState.Casting and not self.abilityState.ability:Get("allowMoveWhileCharging") then
                self:CancelAbility()
            elseif self.abilityState.state == AbilityState.EndState and not self.abilityState.ability:Get("allowMoveWhileEndState") then
                self:CancelAbility()
            end
        end

    end
end

---@return OaBuff[]
function Player:GetBuffs()
    return __engine.buffs.GetBuffs(self)
end

function Player:ChangeStance(id, rank)
    __engine.player.ChangeStance(self, id, rank)
end

function Player:RecalculateAttributes()
    __engine.attributes.RecalculateAttributes(self)
end

return Player