-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Behavior = require("engine.behavior")
local Utility = require("global.base.npc_otherland.behaviors.utility")
local Dump = require("core.dump")

---@param npc NpcOtherland
---@param dt number
function TestAggro(npc, dt)
    npc.currentTarget = nil

    if #npc.threatRank == 0 then
        npc:Set("isInCombat", false)
    else
        npc.currentTarget = npc.threatList[npc.threatRank[1]].entity
        npc:Set("isInCombat", true)
    end
end

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function FreeTimeCondition(npc, dt)
    TestAggro(npc, dt)

    if not npc:IsInCombat() and not npc:IsInCC() then
        return Behavior.Result.Running, 0
    else
        return Behavior.Result.Failure, 0
    end
end


---@param name string
---@return Behavior
function RunBehavior(name)
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

            local behavior = npc._BEHAVIOR[selectedChild.behaviorName]

            if behavior then
                npc.activeBehavior = {
                    name = selectedChild.behaviorName,
                    type = name,
                    started = GetWorld():CurrentTime(),
                    duration = behavior(npc, npc, params),
                }

                return Behavior.Result.Success, 0
            else
                Log.Warn("Npc.RunBehavior - No behavior found for " .. selectedChild.behaviorName)
                return Behavior.Result.Success, 0
            end

        end
    )
end

return Behavior.While(
    Behavior.Script(FreeTimeCondition),
    {
        Utility.ReturnFromCombat("walk"),
        RunBehavior("FreeTime"),
    }
)