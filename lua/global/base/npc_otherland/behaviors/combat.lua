-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Behavior = require("engine.behavior")

---@param npc NpcOtherland
---@return Behavior.Result, number
function ChooseAbility(npc)
    if npc.choosenAbility ~= nil or npc.channelingAbility ~= nil then
        return Behavior.Result.Success, 0
    end

    if #npc.abilities > 0 then
        if npc:TryChooseAbility(npc.abilities[math.random(1, #npc.abilities)]) then
            return Behavior.Result.Success, 0
        end
    end

    if npc.rangeWeapon then 
        npc.choosenAbility = npc.rangeWeapon.NormalAttack
        npc.choosenWeapon = npc.rangeWeapon
    elseif npc.meleeWeapon then
        npc.choosenAbility = npc.meleeWeapon.NormalAttack
        npc.choosenWeapon = npc.meleeWeapon
    end

    if npc.choosenWeapon then
        local prev_weapon = npc:Get("weapon") --[[@as ContentRef[]]

        npc:Set("weapon", { [1] = npc.choosenWeapon.template_guid, [2] = "00000000-0000-0000-0000-000000000000" })
        
        if prev_weapon[1] ~= npc.choosenWeapon.template_guid then
            npc:RecalculateAttributes()
        end

        return Behavior.Result.Success, 0
    else
        return Behavior.Result.Failure, 0
    end
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
            npc:StopChanneling()

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

    npc:StopChanneling()

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
    local floorHeight = GetWorld():GetFloorHeight(targetPos)

    if floorHeight then
        targetPos.y = floorHeight
    end

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
    elseif npc._pathingState == "PATHFINDING_FAILED" or npc._pathingState == "INVALID_POSITION" or npc._pathingState == "TARGET_NOT_FOUND" then
        npc.isEvading = true
        return Behavior.Result.Failure, 0
    end

    if updatePath then
        if npc.channelingAbility and not npc.channelingAbility:Get("allowPlayerMoveWhileChanneling") then
            npc:StopChanneling()
        end

        -- Move to target position
        npc:MoveToPosition(targetPos, npc:Get("runSpeed"), npc.pathing_callback)
    end

    return Behavior.Result.Running, dt
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function DoCastAbility(npc, dt)
    if npc.executionTime == nil then
        if npc.channelingAbility then
            return Behavior.Result.Running, dt
        end

        if npc.choosenAbility == nil then
            return Behavior.Result.Failure, 0
        end

        if not npc.choosenAbility:ConsumeResources(npc, npc.choosenWeapon) then
            npc.choosenAbility = nil
            npc.choosenWeapon = nil

            --Log.Debug("Npc:DoCastAbility - Cooldown not ready")
            return Behavior.Result.Failure, 0
        end

        local target = npc:GetTarget()

        if target == nil or (target.class ~= "player" and target.class ~= "npcOtherland") then
            target = nil
        end

        --[[@cast target Player|NpcOtherland]]

        npc.executionTime = npc:CastAbility(npc.choosenAbility, npc.choosenWeapon --[[@as EdnaFunction?]])

        --Log.Debug("Npc:DoCastAbility - " .. npc.name .. " casted ability " .. npc.choosenAbility.name .. " on target " .. (target and target.name or "none") .. " with weapon " .. (npc.choosenWeapon and npc.choosenWeapon.name or "none") .. ", execution time " .. npc.executionTime)

        if npc.channelingAbility == nil then
            npc.choosenAbility = nil
            npc.choosenWeapon = nil
        end
    end

    if npc.executionTime ~= nil then
        if npc.executionTime < dt then
            local remaining = npc.executionTime --[[@as number]]
            npc.executionTime = nil
            return Behavior.Result.Success, remaining
        end

        npc.executionTime = npc.executionTime - dt
        return Behavior.Result.Running, dt
    else
        return Behavior.Result.Failure, 0
    end
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function InCombatCondition(npc, dt)
    if npc:IsInCombat() and not npc:IsInCC() then
        return Behavior.Result.Running, 0
    else
        return Behavior.Result.Failure, 0
    end
end

return Behavior.While(
    Behavior.Script(InCombatCondition),
    {
        Behavior.Script(ChooseAbility),
        Behavior.Script(UpdateTarget),
        Behavior.Script(GetInTargetRange),
        Behavior.Script(DoCastAbility),
    }
)