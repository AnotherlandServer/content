-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Behavior = require("engine.behavior")

local Utility = {}

---@param mode "walk"|"run"
---@return Behavior
function Utility.ReturnFromCombat(mode)
    return Behavior.Script(
        ---@param self NpcOtherland
        ---@param dt number
        ---@return Behavior.Result, number
        function (self, dt)
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
                    local speed
                    
                    if mode == "walk" then
                        speed = self:Get("walkSpeed")
                    else
                        speed = self:Get("runSpeed")
                    end
                
                    -- Return to spawn position
                    self:MoveToPosition(self:Get("spawnPosition"), speed, self.pathing_callback)

                    return Behavior.Result.Success, dt
                else
                    return Behavior.Result.Success, 0
                end
            end
        end
    )
end

return Utility