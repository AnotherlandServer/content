-- Copyright (C) 2024 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

PLAYER.based_on = "_script"

function PLAYER:Init()
    self:AddBehavior("requestselectweapon", self.Behavior_RequestSelectWeapon)
end

function PLAYER:Behavior_RequestSelectWeapon(player, id)
    Log.Debug("Requesting weapon selection for player " .. self.name .. " - " .. id)
    self:Set("weapon", { id, "00000000-0000-0000-0000-000000000000" })
end