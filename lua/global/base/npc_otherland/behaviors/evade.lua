-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Behavior = require("engine.behavior")
local Utility = require("global.base.npc_otherland.behaviors.utility")

---@param npc NpcOtherland
---@param dt number
---@return Behavior.Result, number
function EvadeCondition(npc, dt)
    if npc.isEvading and not npc:IsInCC() then
        return Behavior.Result.Running, 0
    else
        return Behavior.Result.Failure, 0
    end
end

return Behavior.WhileAll(
    Behavior.Script(EvadeCondition),
    {
        Utility.ReturnFromCombat("run"),
        Behavior.Script(function (npc)
            npc.isEvading = false
            return Behavior.Result.Success, 0
        end)
    }
)