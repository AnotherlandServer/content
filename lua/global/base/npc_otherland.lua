-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "core.base_quest"

local Class = require("core.class")
local Timer = require("core.timer")
local NonClientBase = require("global.base.non_client_base")
local Relationship = require("core.relationship")
local Behavior = require("engine.behavior")
local Dump = require("core.dump")
local EdnaAbility = require("global.base.edna_ability")
local AbilityEvent = require("engine.ability_event")
local LootTable = require("engine.loot_table")


---@class NpcOtherland: NonClientBase
---@field isEvading boolean
---@field _targetPos Vector?
---@field _pathingState string?
---@field abilities EdnaAbility[]
---@field choosenWeapon EdnaFunction?
---@field choosenAbility EdnaAbility?
---@field threatList { [AvatarId]: { entity: Player|NpcOtherland, distance: number, damage: number, bonus: number, total: number } }
---@field threatRank AvatarId[]
---@field currentTarget Player|NpcOtherland?
local Npc = Class(NonClientBase)

--- Compute NPC base values
local HpBase = {}
local ArmorTable = {}
local ArmorPeneTable = {}
local AttackPowerTable = {}

for i = 1, 4 do
    table.insert(HpBase, 8.75 * i ^ 2 + 54.25 * i - 17.5)
end

for i = 1, 64 do
    table.insert(ArmorPeneTable, math.floor((0.5755 * i ^ 2) - 1.203 * i + 0.6275))
end

for i = 1, 64 do
    table.insert(ArmorTable, math.floor((0.5755 * i ^ 2) - 1.203 * i + 0.6275))
end

for i = 1, 64 do
    table.insert(AttackPowerTable, math.floor((0.171305 * i ^ 2) - 0.27783 * i + 0.10653))
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function ChooseAbility(npc, dt)
    if npc.choosenAbility == nil and npc.choosenWeapon == nil then
        local defaultWeapons = npc:Get("defaultWeapon") --[[@as ContentRef[] ]]

        if #defaultWeapons > 0 then
            local weapon = npc:GetItem(defaultWeapons[1].id) --[[@as EdnaFunction?]]
            if weapon ~= nil then
                npc.choosenWeapon = weapon 
                npc.choosenAbility = weapon.NormalAttack

                if npc.choosenWeapon == nil or npc.choosenAbility == nil then
                    --Log.Err("Npc:ChooseAbility - No weapon or ability found for " .. npc.name)
                    return Behavior.Result.Failure, 0
                end


                npc:Set("weapon", { defaultWeapons[1].id, "00000000-0000-0000-0000-000000000000" })

                return Behavior.Result.Success, 0
            else
                Log.Err("Npc:ChooseAbility - Default weapon not found: " .. tostring(defaultWeapons[1]))
            end
        elseif #npc.abilities > 0 then
            npc.choosenAbility = npc.abilities[1]
            npc.choosenWeapon = nil
        end

        Log.Err("Npc:ChooseAbility - No ability found for " .. npc.name)
        return Behavior.Result.Failure, 0
    else
        return Behavior.Result.Success, 0
    end
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function UpdateThreatList(npc, dt)
    local interests = npc:GetInterests()
    local visionRange = npc:Get("visionRange")

    -- Add nearby interests to the threat list
    for _, interest in ipairs(interests) do
         ---@cast interest NpcOtherland|Player
        if (interest.class == "npcOtherland" or interest.class == "player") and npc.threatList[interest.avatar_id] == nil then
            if interest:GetPosition():Distance(npc:GetPosition()) <= visionRange then
                local affiliation = npc:RelationshipTo(interest)
                if affiliation == Relationship.Affiliation.Hostile and interest:Get("alive") then
                    npc.threatList[interest.avatar_id] = {
                        entity = interest,
                        distance = 0,
                        damage = 0,
                        bonus = 0,
                    }
                end
            end
        end
    end

    -- Update threat list
    for k, v in pairs(npc.threatList) do
        if not v.entity:Get("alive") then
            npc.threatList[k] = nil
        else
            local distance = v.entity:GetPosition():Distance(npc:GetPosition())
            v.distance = distance
            v.total = v.damage + v.bonus - (v.distance * 0.5) 
        end
    end

    -- Sort threat ranks by sum total
    npc.threatRank = {}

    for k, _ in pairs(npc.threatList) do
        table.insert(npc.threatRank, k)
    end

    table.sort(npc.threatRank, function(a, b)
        return npc.threatList[a].total > npc.threatList[b].total
    end)

    return Behavior.Result.Success, 0
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function UpdateTarget(npc, dt)
    local currentTarget = npc:GetTarget()
    
    local nextTarget = nil
    if #npc.threatRank > 0 then
        nextTarget = npc.threatList[npc.threatRank[1]].entity
    end

    -- Check if we have to switch target
    if currentTarget and npc.threatList[currentTarget.avatar_id] ~= nil and nextTarget ~= nil then 
        if npc.threatList[nextTarget.avatar_id].total / npc.threatList[currentTarget.avatar_id].total > 1.02 then
            --Log.Debug("Npc:UpdateTarget - Switching target from " .. currentTarget.name .. " to " .. nextTarget.name)
            npc.currentTarget = nextTarget
            npc:Set("target", nextTarget.avatar_id)
        end

        return Behavior.Result.Success, 0
    end

    -- If we have no target, find a new one
    if nextTarget ~= nil then
        npc.currentTarget = nextTarget
        npc:Set("target", nextTarget.avatar_id)

        return Behavior.Result.Success, 0
    end

    -- No target found
    npc.currentTarget = nil
    npc:Set("isInCombat", false)

    return Behavior.Result.Failure, 0
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function GetInTargetRange(npc, dt)
    local target = npc:GetTarget()
    ---@cast target NpcOtherland|Player?

    if target == nil then
        return Behavior.Result.Failure, 0
    end

    local targetPos = target:GetPosition()
    local npcPos = npc:GetPosition()
    local updatePath = false

    if npc._targetPos == nil or npc._targetPos ~= targetPos then 
        npc._targetPos = target:GetPosition()
        updatePath = true
    end

    local rangeMax = npc.choosenAbility:Get("RangeMax") --[[@as number]]
    local rangeMin = npc.choosenAbility:Get("RangeMin") --[[@as number]]
    local collisionExtent = npc:Get("collisionExtent") --[[@as Vector]]
    local targetCollisionExtent = target:Get("collisionExtent") --[[@as Vector]]

    local touchRange = math.max(collisionExtent.x, collisionExtent.z, targetCollisionExtent.x, targetCollisionExtent.z)

    if rangeMin < touchRange then
        rangeMin = touchRange
    end

    if npc._pathingState == "FINISHED" then
        if npcPos:Distance(targetPos) >= rangeMax then
            updatePath = true
        else
            return Behavior.Result.Success, 0
        end
    elseif npc._pathingState ~= "FINISHED" and npcPos:Distance(targetPos) <= rangeMax then
        --Log.Debug("Npc:GetInTargetRange - Target in rage")

        npc:CancelMovement()
        
        return Behavior.Result.Success, 0
    end

    if updatePath then
        -- Move to target position
        npc:MoveToPosition(targetPos, npc:Get("runSpeed"), function(state, pos)
            npc._pathingState = state
        end)
    end

    return Behavior.Result.Running, dt
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function CastAbility(npc, dt)
    local executionTime = npc.choosenAbility:Get("executionTime")

    if #npc.choosenAbility:Get("externalCooldownsConsumed") == 0 and npc.choosenAbility:Get("isAutoAttack") then
        if not npc:ConsumeCooldown({[1] = "22a4f191-0183-48ec-8b17-4f9c6cb72f47"}) then
            return Behavior.Result.Failure, 0
        end
    else
        if not npc:ConsumeCooldown(npc.choosenAbility:Get("externalCooldownsConsumed")) then
            return Behavior.Result.Failure, 0
        end
    end

    if #npc.choosenAbility:Get("externalCooldownsEmitted") == 0 and npc.choosenAbility:Get("isAutoAttack") then
        npc:EmitCooldown({[1] = "22a4f191-0183-48ec-8b17-4f9c6cb72f47"}, executionTime)
    else
        npc:EmitCooldown(npc.choosenAbility:Get("externalCooldownsEmitted"), executionTime)
    end

    local target = npc:GetTarget()

    if target == nil then
        --Log.Debug("Npc:CastAbility - No target found")
    else
        --Log.Debug("Npc:CastAbility - Target found " .. target.name)
    end

    if target == nil or (target.class ~= "player" and target.class ~= "npcOtherland") then
        target = nil
    end

    --[[@cast target Player|NpcOtherland]]

    local executionTime = npc:CastAbility(npc.choosenAbility, npc.choosenWeapon --[[@as EdnaFunction?]])

    return Behavior.Result.Running, executionTime
end

---@param npc NpcOtherland
---@return Behavior.Result, number
function FindTarget(npc)
    npc.currentTarget = nil

    if #npc.threatRank == 0 then
        npc:Set("isInCombat", false)
        return Behavior.Result.Failure, 0
    end

    npc.currentTarget = npc.threatList[npc.threatRank[1]].entity
    npc:Set("isInCombat", true)

    return Behavior.Result.Success, 0
end

---@param npc NpcOtherland
---@return Behavior.Result, number
function IsInCombat(npc)
    if npc:IsInCombat() then
        return Behavior.Result.Success, 0
    else
        return Behavior.Result.Failure, 0
    end
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function ReturnFromCombat(npc, dt)
    local moveDest = npc:Get("moveDest") --[[@as Vector]]

    if moveDest.x ~= 0.0 and moveDest.y ~= 0.0 and moveDest.z ~= 0.0 then
        if npc:GetPosition():Distance(moveDest) > 0.1 then
            npc:MoveToPosition(moveDest, npc:Get("moveSpeed"), function(state, pos)
                npc._pathingState = state
            end)

            return Behavior.Result.Running, dt
        else
            return Behavior.Result.Success, 0
        end
    else
        if npc:GetPosition():Distance(npc:Get("spawnPosition")) > 0.1 then
        
            -- Return to spawn position
            npc:MoveToPosition(npc:Get("spawnPosition"), npc:Get("walkSpeed"), function(state, pos)
                npc._pathingState = state

                if state == "FINISHED" then
                    npc:Set("orientation", npc:Get("spawnRotation"))
                    npc:Set("rot", npc:Get("spawnRotation"))
                end
            end)

            return Behavior.Result.Running, dt
        else
            return Behavior.Result.Success, 0
        end
    end

    
end

local BehaviorTree = Behavior.Sequence({
    Behavior.If(
        Behavior.Script(function(npc)
            if npc.isEvading then
                return Behavior.Result.Success, 0
            else
                return Behavior.Result.Failure, 0
            end
        end),
        Behavior.Wait(0),
        Behavior.Sequence({
            Behavior.Script(UpdateThreatList),
            Behavior.If(
                Behavior.Script(IsInCombat),
                Behavior.Sequence({
                    Behavior.Script(ChooseAbility),
                    Behavior.Script(UpdateTarget),
                    Behavior.Script(GetInTargetRange),
                    Behavior.Script(CastAbility),
                }),
                Behavior.If(
                    Behavior.Script(FindTarget),
                    Behavior.Wait(0),
                    Behavior.Script(ReturnFromCombat)
                )
            )
        })
    ),
})

local NpcAbilityMetatable = {
    __index = EdnaAbility,
}

function Npc:Init()
    self.isEvading = false
    self.abilities = {}
    self.threatList = {}
    self.threatRank = {}

    local abilityCount = __engine.ability.GetNpcAbilityCount(self)

    for i = 1, abilityCount do
        local ability = {
            __npc = self,
            __npc_ability_idx = i - 1,
        }
        setmetatable(ability, NpcAbilityMetatable)

        local info = __engine.ability.GetNpcAbilityInfo(self, i - 1)
        for k, v in pairs(info) do
            ability[k] = v
        end

        self.abilities[i] = ability
    end

    NonClientBase.Init(self)

    self:InstallBehavior(BehaviorTree)
end

Npc:On("Spawned",
    ---@param self NpcOtherland
    function(self)
        local lvl = self:Get("lvl")
        local generalDifficulty = self:Get("generalDifficulty")

        --Log.Debug("GD " .. generalDifficulty)

        self.threatList = {}
        self.threatRank = {}

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
        self:Set("statHitChance", math.max(generalDifficulty, 1))
        self:Set("statFinalDamageMod", math.max(generalDifficulty, 1))

        self:Set("spawnPosition", self:GetPosition())
        self:Set("spawnRotation", self:GetRotation() * Vector.Z)

        local defaultWeapons = self:Get("defaultWeapon") --[[@as ContentRef[] ]]
        if #defaultWeapons > 0 then
            local weapons = {}

            if defaultWeapons[1] then
                table.insert(weapons, defaultWeapons[1].id)
            else
                table.insert(weapons, "00000000-0000-0000-0000-000000000000")
            end

            if defaultWeapons[2] then
                table.insert(weapons, defaultWeapons[2].id)
            else
                table.insert(weapons, "00000000-0000-0000-0000-000000000000")
            end

            self:Set("weapon", weapons)
        end

        self:CancelBehavior()
    end)

Npc:On("InterestRemoved",
    ---@param self NpcOtherland
    ---@param other NonClientBase
    function(self, other)
        if self.currentTarget == other then
            self.currentTarget = nil
        end

        self.threatList[other.avatar_id] = nil
    end)

Npc:On("OnDamage",
    ---@param self NpcOtherland
    ---@param damage number
    ---@param source Player|NpcOtherland
    function(self, damage, source)
        --Log.Debug("Npc:OnDamage - " .. self.name .. " took " .. damage .. " damage from " .. source.name)
        if self:Get("alive") then
            if not self.threatList[source.avatar_id] then
                self.threatList[source.avatar_id] = {
                    entity = source,
                    distance = 0,
                    damage = damage,
                    bonus = 0,
                }
            else
                self.threatList[source.avatar_id].damage = self.threatList[source.avatar_id].damage + damage
            end
        else
            if source and source.class == "player" then 
                ---@cast source Player
                
                local loot = LootTable:New(self:Get("lootTable")):GetRandomLoot()

                for _, entry in ipairs(loot) do
                    self:DropItem(source, nil, entry.item, entry.count)
                end
            end

            self.threatList = {}
        end
    end)

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

---@param other NpcOtherland|Player
---@return Affiliation
function Npc:RelationshipTo(other)
    return Relationship.AffiliationFromRank(
        __engine.faction.EntityRelationship(self, other)
    )
end

---@param pos Vector
---@param speed number
---@param callback? function(state: string, pos: Vector)
function Npc:MoveToPosition(pos, speed, callback)
    __engine.navigation.MoveToPosition(self, pos, speed, callback)
end

function Npc:CancelMovement()
    __engine.navigation.CancelMovement(self)
end

---@param behavior Behavior
function Npc:InstallBehavior(behavior)
    __engine.ai.InstallBehavior(self, behavior)
end

function Npc:CancelBehavior()
    __engine.ai.CancelBehavior(self)
end

function Npc:IsInCombat()
    return self:Get("isInCombat")
end

---@return Entity[]
function Npc:GetInterests()
    return __engine.interests.GetInterests(self)
end

---@return Player|NpcOtherland?
function Npc:GetTarget()
    return self.currentTarget
end

---@param cooldowns string[]|ContentRef[]
function Npc:ConsumeCooldown(cooldowns)
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
function Npc:EmitCooldown(cooldowns, duration)
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

---@param ability EdnaAbility
---@param weapon EdnaFunction?
---@return number
function Npc:CastAbility(ability, weapon)
    --Log.Debug("Npc:CastAbility - Executing ability " .. ability.name)

    local executionTime = ability:Get("executionTime")
    if weapon then
        executionTime = weapon:Get("WepAttSpeed")
    end

    local target = self:GetTarget()

    local event = AbilityEvent.New(self, "Charge")
    event:SetAbility(ability)
    event:SetDuration(ability:Get("CastTime"))
    event:SetTarget(target)    

    if weapon ~= nil then
        event:SetEffectSource(weapon)
    else
        event:SetEffectSource(ability)
    end

    event:Fire()

    Timer:Start(self, ability:Get("CastTime"), 0, function ()
        local event = AbilityEvent.New(self, "Use")
        event:SetAbility(ability)
        event:SetDuration(executionTime)
        event:SetTarget(target)

        if target ~= nil then
            local targetPos = target:GetPosition()
            local npcPos = self:GetPosition()

            local direction = (targetPos - npcPos):Normalize()
            self:Set("orientation", direction)
            self:Set("rot", direction)
            event:SetRotation(Quaternion.FromRotationArc(Vector.Z, direction))
        end

        --if weapon ~= nil then
        --    event:SetEffectSource(weapon)
        --else
            event:SetEffectSource(ability)
        --end
        
        ability:Use(self, event, {
            ability_id = "00000000-0000-0000-0000-000000000000",
            prediction_id = 0,
            target = target,
            item = weapon,
        })

        event:Fire()
    end)

    return ability:Get("CastTime") + executionTime
end

---@param item_id string
---@return ItemBase
function Npc:GetItem(item_id)
    return __engine.inventory.GetItem(self, item_id)
end

---@return EdnaFunction?, EdnaFunction?
function Npc:GetWeapon()
    local mainhand = self:GetItem(self:Get("weapon")[1]) --[[@as EdnaFunction?]]
    local offhand = self:GetItem(self:Get("weapon")[2]) --[[@as EdnaFunction?]]

    return mainhand, offhand
end

---@return number
function Npc:GetBaseDamage()
    return 0
end

---@return number, number
function Npc:GetWeaponDamage()
    local mindmg = 0
    local maxdmg = 0

    local mainhand, offhand = self:GetWeapon()
    if mainhand ~= nil then
        mindmg = mindmg + mainhand:Get("WepMinDmg")
        maxdmg = maxdmg + mainhand:Get("WepMaxDmg")
    end

    if offhand ~= nil then
        mindmg = mindmg + offhand:Get("WepMinDmg")
        maxdmg = maxdmg + offhand:Get("WepMaxDmg")
    end

    return mindmg, maxdmg
end

function Npc:GetPeneBonus()
    return ArmorPeneTable[self:Get("lvl")] or 0
end

return Npc