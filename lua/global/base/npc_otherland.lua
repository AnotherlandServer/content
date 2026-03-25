-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "core.base_quest"
---@module "engine.behavior_config"
---@module "engine.effector"

local Class = require("core.class")
local Timer = require("core.timer")
local NonClientBase = require("global.base.non_client_base")
local Relationship = require("core.relationship")
local Behavior = require("engine.behavior")
local Dump = require("core.dump")
local EdnaAbility = require("global.base.edna_ability")
local AbilityEvent = require("engine.ability_event")
local LootTable = require("engine.loot_table")
local ActionSettings = require("engine.action_settings")


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
---@field behaviors { [string]: BehaviorConfigEntry }
---@field activeBehavior { name: string, type: string, started: number, duration: number }?
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

---@param dt number
---@return Behavior.Result, number
function Npc:ChooseAbility(dt)
    if self.choosenAbility == nil and self.choosenWeapon == nil then
        local defaultWeapons = self:Get("defaultWeapon") --[[@as ContentRef[] ]]

        if #defaultWeapons > 0 then
            local weapon = self:GetItem(defaultWeapons[1].id) --[[@as EdnaFunction?]]
            if weapon ~= nil then
                self.choosenWeapon = weapon 
                self.choosenAbility = weapon.NormalAttack

                if self.choosenWeapon == nil or self.choosenAbility == nil then
                    --Log.Err("Npc:ChooseAbility - No weapon or ability found for " .. self.name)
                    return Behavior.Result.Failure, 0
                end


                self:Set("weapon", { defaultWeapons[1].id, "00000000-0000-0000-0000-000000000000" })

                return Behavior.Result.Success, 0
            else
                Log.Err("Npc:ChooseAbility - Default weapon not found: " .. tostring(defaultWeapons[1]))
            end
        elseif #self.abilities > 0 then
            self.choosenAbility = self.abilities[1]
            self.choosenWeapon = nil

            return Behavior.Result.Success, 0
        end

        Log.Err("Npc:ChooseAbility - No ability found for " .. self.name)
        return Behavior.Result.Failure, 0
    else
        return Behavior.Result.Success, 0
    end
end

---@param dt number
---@return Behavior.Result, number
function Npc:UpdateThreatList(dt)
    local evadeRange = self:Get("evadeRange")

    -- If npc searches for enemies, we add visible hostile entities to the threat list
    if self:Get("willSearchForEnemy") then
        local interests = self:GetInterests()
        local visionRange = self:Get("visionRange")

        -- Add entities we see to threat list
        for _, interest in ipairs(interests) do
            ---@cast interest NpcOtherland|Player
            if (interest.class == "npcOtherland" or interest.class == "player") and self.threatList[interest.avatar_id] == nil then
                if interest:GetPosition():Distance(self:GetPosition()) <= visionRange then
                    local affiliation = self:RelationshipTo(interest)

                    if 
                        affiliation == Relationship.Affiliation.Hostile and 
                        interest:IsAlive() and
                        interest:Get("isUnAttackable") ~= true
                    then
                        Log.Debug("Npc:UpdateThreatList - Adding " .. interest.name .. " to threat list of " .. self.name)

                        self.threatList[interest.avatar_id] = {
                            entity = interest,
                            damage = 0,
                            bonus = 0,
                            distance = interest:GetPosition():Distance(self:GetPosition()),
                        }
                    end
                end
            end
        end
    end

    -- Update threat list
    for k, v in pairs(self.threatList) do
        if 
            (not v.entity:IsValid()) or 
            (not v.entity:IsAlive()) or 
            (v.entity:GetPosition():Distance(self:GetPosition()) > evadeRange) or
            v.entity:Get("isUnAttackable")
        then
            if v.entity.class == "player" and v.entity:IsValid() then
                local ent = v.entity ---@cast ent Player
                ent:DisannounceCombat(self)
            end

            --Log.Debug("Npc:UpdateThreatList - Removing " .. v.entity.name .. " from threat list of " .. self.name)
            self.threatList[k] = nil
        else
            v.distance = v.entity:GetPosition():Distance(self:GetPosition())
            v.total = v.damage + v.bonus
        end
    end

    -- Sort threat ranks by sum total
    self.threatRank = {}

    for k, _ in pairs(self.threatList) do
        table.insert(self.threatRank, k)
    end

    table.sort(self.threatRank, function(a, b)
        return 
            (self.threatList[a].total == self.threatList[b].total and self.threatList[a].distance < self.threatList[b].distance) or
            (self.threatList[a].total > self.threatList[b].total)
    end)

    return Behavior.Result.Success, 0
end

---@param dt number
---@return Behavior.Result, number
function Npc:UpdateTarget(dt)
    local currentTarget = self:GetTarget()
    
    local nextTarget = nil
    if #self.threatRank > 0 then
        nextTarget = self.threatList[self.threatRank[1]].entity
    end

    -- Check if we have to switch target
    if currentTarget and self.threatList[currentTarget.avatar_id] ~= nil and nextTarget ~= nil then 
        if self.threatList[nextTarget.avatar_id].total / self.threatList[currentTarget.avatar_id].total > 1.02 then
            --Log.Debug("Npc:UpdateTarget - Switching target from " .. currentTarget.name .. " to " .. nextTarget.name)
            self.currentTarget = nextTarget
            self:Set("target", nextTarget.avatar_id)
        end

        return Behavior.Result.Success, 0
    end

    -- If we have no target, find a new one
    if nextTarget ~= nil then
        self.currentTarget = nextTarget
        self:Set("target", nextTarget.avatar_id)

        return Behavior.Result.Success, 0
    end

    -- No target found
    self.currentTarget = nil
    self:Set("isInCombat", false)

    return Behavior.Result.Failure, 0
end

---@param dt number
---@return Behavior.Result, number
function Npc:GetInTargetRange(dt)
    local target = self:GetTarget()
    ---@cast target NpcOtherland|Player?

    if target == nil then
        return Behavior.Result.Failure, 0
    end

    local targetPos = target:GetPosition()
    local npcPos = self:GetPosition()
    local updatePath = false
    local floorHeight = GetWorld():GetFloorHeight(targetPos)

    if floorHeight then
        targetPos.y = floorHeight
    end

    if self._targetPos == nil or self._targetPos ~= targetPos then 
        self._targetPos = target:GetPosition()
        updatePath = true
    end

    local rangeMax = self.choosenAbility:Get("RangeMax") --[[@as number]]
    local rangeMin = self.choosenAbility:Get("RangeMin") --[[@as number]]
    local collisionExtent = self:Get("collisionExtent") --[[@as Vector]]
    local targetCollisionExtent = target:Get("collisionExtent") --[[@as Vector]]

    local touchRange = math.max(collisionExtent.x, collisionExtent.z, targetCollisionExtent.x, targetCollisionExtent.z)

    if rangeMin < touchRange then
        rangeMin = touchRange
    end

    if self._pathingState == "FINISHED" then
        if npcPos:Distance(targetPos) >= rangeMax then
            updatePath = true
        else
            return Behavior.Result.Success, 0
        end
    elseif self._pathingState ~= "FINISHED" and npcPos:Distance(targetPos) <= rangeMax then
        --Log.Debug("Npc:GetInTargetRange - Target in rage")

        self:CancelMovement()
        
        return Behavior.Result.Success, 0
    end

    if updatePath then
        -- Move to target position
        self:MoveToPosition(targetPos, self:Get("runSpeed"), self.pathing_callback)
    end

    return Behavior.Result.Running, dt
end

---@param dt number
---@return Behavior.Result, number
function Npc:DoCastAbility(dt)
    local executionTime = self.choosenAbility:Get("executionTime")

    if #self.choosenAbility:Get("externalCooldownsConsumed") == 0 then
        if not self:ConsumeCooldown({[1] = "22a4f191-0183-48ec-8b17-4f9c6cb72f47"}) then
            return Behavior.Result.Failure, 0
        end
    else
        if not self:ConsumeCooldown(self.choosenAbility:Get("externalCooldownsConsumed")) then
            return Behavior.Result.Failure, 0
        end
    end

    if #self.choosenAbility:Get("externalCooldownsEmitted") == 0 then
        self:EmitCooldown({[1] = "22a4f191-0183-48ec-8b17-4f9c6cb72f47"}, executionTime)
    else
        self:EmitCooldown(self.choosenAbility:Get("externalCooldownsEmitted"), executionTime)
    end

    local target = self:GetTarget()

    if target == nil or (target.class ~= "player" and target.class ~= "npcOtherland") then
        target = nil
    end

    --[[@cast target Player|NpcOtherland]]

    local executionTime = self:CastAbility(self.choosenAbility, self.choosenWeapon --[[@as EdnaFunction?]])

    return Behavior.Result.Running, executionTime
end

---@return Behavior.Result, number
function Npc:FindTarget()
    self.currentTarget = nil

    if #self.threatRank == 0 then
        self:Set("isInCombat", false)
        return Behavior.Result.Failure, 0
    end

    self.currentTarget = self.threatList[self.threatRank[1]].entity
    self:Set("isInCombat", true)

    return Behavior.Result.Success, 0
end

---@return Behavior.Result, number
function Npc:CheckIsInCombat()
    if self:IsInCombat() then
        return Behavior.Result.Success, 0
    else
        return Behavior.Result.Failure, 0
    end
end

---@param dt number
---@return Behavior.Result, number
function Npc:ReturnFromCombat(dt)
    local moveDest = self:Get("moveDest") --[[@as Vector]]

    if moveDest.x ~= 0.0 and moveDest.y ~= 0.0 and moveDest.z ~= 0.0 then
        if self:GetPosition():Distance(moveDest) > 0.1 then
            --Log.Debug("Npc:ReturnFromCombat - Returning to position [" .. moveDest.x .. ", " .. moveDest.y .. ", " .. moveDest.z .. "]")

            self:MoveToPosition(moveDest, self:Get("moveSpeed"), self.pathing_callback)

            return Behavior.Result.Success, dt
        else
            return Behavior.Result.Success, 0
        end
    else
        if self:GetPosition():Distance(self:Get("spawnPosition")) > 0.1 then
            --Log.Debug("Npc:ReturnFromCombat - Returning to spawn position [" .. self:Get("spawnPosition").x .. ", " .. self:Get("spawnPosition").y .. ", " .. self:Get("spawnPosition").z .. "] distance " .. self:GetPosition():Distance(self:Get("spawnPosition")))

        
            -- Return to spawn position
            self:MoveToPosition(self:Get("spawnPosition"), self:Get("walkSpeed"), self.pathing_callback)

            return Behavior.Result.Success, dt
        else
            return Behavior.Result.Success, 0
        end
    end
end

---@param name string
---@return Behavior
function Npc.RunBehavior(name)
    return Behavior.Script(
        ---@param npc NpcOtherland
        ---@param dt number
        ---@return integer
        ---@return integer
        function (npc, dt)
            if npc:IsRunningBehavior() and npc.activeBehavior.type == name then
                return Behavior.Result.Running, dt
            end

            if npc.behaviors[name] == nil then
                return Behavior.Result.Failure, 0
            end

            local totalWeight = 0
            for _, child in ipairs(npc.behaviors[name].allowedChildren or {}) do
                totalWeight = totalWeight + (child.weight or 1)
            end

            local randomWeight = math.random() * totalWeight

            local selectedChild = nil ---@type AllowedChild?
            for _, child in ipairs(npc.behaviors[name].allowedChildren or {}) do
                local weight = child.weight or 1
                if randomWeight <= weight then
                    selectedChild = child
                    break
                end
                randomWeight = randomWeight - weight
            end

            if not selectedChild then
                return Behavior.Result.Failure, 0
            end

            local params = {}

            for _, setting in ipairs(selectedChild.settings or {}) do
                params[setting.settingName] = setting.settingValue
            end

            local behavior = Npc._BEHAVIOR[selectedChild.behaviorName]

            if behavior then
                npc.activeBehavior = {
                    name = selectedChild.behaviorName,
                    type = name,
                    started = GetWorld():CurrentTime(),
                    duration = behavior(npc, npc, params),
                }
            else
                Log.Warn("Npc.RunBehavior - No behavior found for " .. selectedChild.behaviorName)
            end
            
            return Behavior.Result.Success, 0
        end
    )
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
            Behavior.Script(Npc.UpdateThreatList),
            Behavior.If(
                Behavior.Script(Npc.CheckIsInCombat),
                Behavior.Sequence({
                    Behavior.Script(Npc.ChooseAbility),
                    Behavior.Script(Npc.UpdateTarget),
                    Behavior.Script(Npc.GetInTargetRange),
                    Behavior.Script(Npc.DoCastAbility),
                }),
                Behavior.If(
                    Behavior.Script(Npc.FindTarget),
                    Behavior.Wait(0),
                    Behavior.Sequence({
                        Behavior.Script(Npc.ReturnFromCombat),
                        Npc.RunBehavior("FreeTime"),
                    })
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

    self.behaviors = {}
    self.behaviors["FreeTime"] = self:FindBehavior("FreeTime")

    if self.behaviors["FreeTime"] == nil then
        self.behaviors["FreeTime"] = {
            behaviorName = "FreeTime",
            allowedChildren = {
                {
                    behaviorName = "RandomWalk",
                    weight = 1,
                    settings = {}
                },
                {
                    behaviorName = "Wait",
                    weight = 10,
                    settings = {}
                }
            },
            settings = {}
        }
    end

    self.abilities = __engine.ability.GetAbilities(self)

    NonClientBase.Init(self)

    self:InstallBehavior(BehaviorTree:Compile(self))

    self.pathing_callback = function(state, pos)
        self._pathingState = state
    end
end

---@return BehaviorConfigEntry?
function Npc:FindBehavior(behaviorName)
    local config = self:Get("behaviorConfig") --[[@as BehaviorConfig?]]

    if type(config) ~= "table" or type(config.configurations) ~= "table" then
        return nil
    end

    for _, behavior in ipairs(config.configurations) do
        if behavior.behaviorName == behaviorName then
            return behavior
        end
    end

    return nil
end

function Npc:IsRunningBehavior()
    if 
        self.activeBehavior ~= nil and
        (self.activeBehavior.started + self.activeBehavior.duration) > GetWorld():CurrentTime()
    then
        return true
    end

    return false
end

Npc:On("Spawned",
    ---@param self NpcOtherland
    function(self)
        local lvl = self:Get("lvl")
        local generalDifficulty = self:Get("generalDifficulty")

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

        local spawnPos = self:GetPosition()
        local floorHeight = GetWorld():GetFloorHeight(spawnPos)
        if floorHeight then
            spawnPos.y = floorHeight
        end

        self:Set("spawnPosition", spawnPos)
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
    ---@param source Player|NpcOtherland
    ---@param damage EffectAmount
    function(self, source, damage)
        if self:Get("alive") then
            if not self.threatList[source.avatar_id] then
                self.threatList[source.avatar_id] = {
                    entity = source,
                    distance = 0,
                    damage = damage.amount,
                    bonus = 0,
                }
            else
                self.threatList[source.avatar_id].damage = self.threatList[source.avatar_id].damage + damage.amount
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

Npc:On("OnDeath",
    ---@param self NpcOtherland
    ---@param source Player|NpcOtherland
    function(self, source)
        -- Notify players of death
        for _, v in pairs(self.threatList) do
            if v.entity and v.entity.class == "player" then
                local ent = v.entity ---@cast ent Player
                ent:DisannounceCombat(self)
            end
        end
    end)

---MetaMorph vendor execute
---@param instigator Player
---@param ... any
function Npc:DoVendorExecute(instigator, ...)
    local params = { ... }

    -- Apply metamorph customization parameters
    instigator:Set("customizationGender", params[1])
    instigator:Set("customizationHeight", params[2])
    instigator:Set("customizationFat", params[3])
    instigator:Set("customizationSkinny", params[4])
    instigator:Set("customizationMuscular", params[5])
    instigator:Set("customizationBustSize", params[6])
    instigator:Set("race", params[7])
    instigator:Set("customizationBrowAngle", params[8])
    instigator:Set("customizationEyeBrowPos", params[9])
    instigator:Set("customizationEyePosSpacing", params[10])
    instigator:Set("customizationEyePos", params[11])
    instigator:Set("customizationEyeSizeLength", params[12])
    instigator:Set("customizationEyeSizeWidth", params[13])
    instigator:Set("customizationEyesPretty", params[14])
    instigator:Set("customizationMouthPos", params[15])
    instigator:Set("customizationMouthWidth", params[16])
    instigator:Set("customizationMouthLowerLipThic", params[17])
    instigator:Set("customizationMouthUpperLipThic", params[18])
    instigator:Set("customizationMouthExpression", params[19])
    instigator:Set("customizationNosePosLength", params[20])
    instigator:Set("customizationNosePosWidth", params[21])
    instigator:Set("customizationNosePortude", params[22])
    instigator:Set("customizationEarSize", params[23])
    instigator:Set("customizationEarElf", params[24])
    instigator:Set("customizationCheekBone", params[25])
    instigator:Set("customizationCheek", params[26])
    instigator:Set("customizationChinPortude", params[27])
    instigator:Set("customizationJawChubby", params[28])
end

---@param instigator Entity
---@param params { gestureName: string }
function Npc:Gesture(instigator, params)
    local action = ActionSettings.Actions[params.gestureName];
    if action then
       self:PlayAnimation(action.name, action.duration)
       return action.duration
    else
        Log.Warn("Npc:Gesture - No action found for gesture " .. params.gestureName)
        return 0
    end
end

---@param instigator Entity
---@param params any
function Npc:Wait(instigator, params)
    return 1
end

function Npc:RandomWalk()
    local radius = self:Get("spawnLeashRadius")
    local pos = self:Get("spawnPosition")

    local randomRadius = math.random() * radius
    local randomPoint = __engine.navigation.GetRandomPointAroundCircle(pos, radius)

    self:Set("moveDest", randomPoint)
    self:Set("moveSpeed", self:Get("walkSpeed"))

    -- todo: compute a better estimate
    return (self:GetPosition():Distance(randomPoint) / self:Get("walkSpeed") * 1.5)
end

Npc:AddBehavior("dovendorexecute", Npc.DoVendorExecute)
Npc:AddBehavior("Gesture", Npc.Gesture)
Npc:AddBehavior("Wait", Npc.Wait)
Npc:AddBehavior("RandomWalk", Npc.RandomWalk)

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

---@param node NonClientBase|string
function Npc:WalkToNode(node)
    local targetNode = nil --- @type NonClientBase?

    if type(node) == "string" then
        targetNode = GetWorld():GetEntityByName(node) --[[@as NonClientBase?]]
    else
        targetNode = node
    end

    if targetNode then
        Log.Debug("Npc:WalkToNode - Walking to node " .. targetNode.name .. " at position [" .. targetNode:GetPosition().x .. ", " .. targetNode:GetPosition().y .. ", " .. targetNode:GetPosition().z .. "]")

        local targetPos = targetNode:GetPosition()
        local floorHeight = GetWorld():GetFloorHeight(targetPos)
        if floorHeight then
            targetPos.y = floorHeight
        end

        self:Set("moveDest", targetPos)
        self:Set("moveSpeed", self:Get("walkSpeed"))
    end
end

function Npc:IsAlive()
    return self:Get("alive")
end

---@param kind InterruptionKind
---@param source Player|NpcOtherland|nil
function Npc:Interrupt(kind, source)
    __engine.interrupt.FireInterrupt(kind, self, source)
end

---@param kind InterruptionKind
---@param source Player|NpcOtherland|nil
function Npc:OnInterrupt(kind, source)
end

---@param buff_id string|ContentRef
---@param instigator? Player|NpcOtherland
---@param duration? number
---@param delay? number
---@param stacks? integer
---@return string
function Npc:AddBuff(buff_id, instigator, duration, delay, stacks)
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
function Npc:AddBuffByName(buff_name, instigator, duration, delay, stacks)
    if instigator == nil then
        instigator = self
    end

    return __engine.buffs.AddBuffByName(self, instigator, buff_name, duration, delay, stacks)
end

---@param reference_type BuffReference
---@param buff_id string|ContentRef
---@return boolean
function Npc:RemoveBuff(reference_type, buff_id)
    if type(buff_id) == "table" then
        return __engine.buffs.RemoveBuff(self, reference_type, buff_id.id)
    else
        return __engine.buffs.RemoveBuff(self, reference_type, buff_id)
    end
end

---@param reference_type BuffReference
---@param buff_id string|ContentRef
---@return boolean
function Npc:HasBuff(reference_type, buff_id)
    if type(buff_id) == "table" then
        return __engine.buffs.HasBuff(self, reference_type, buff_id.id)
    else
        return __engine.buffs.HasBuff(self, reference_type, buff_id)
    end
end

return Npc