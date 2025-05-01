-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class Relationship
local Relationship = {}

---@enum Affiliation
Relationship.Affiliation = {
    Hostile = 0,
    Neutral = 1,
    Friendly = 2,
    Honored = 3,
    Revered = 4,
    Exalted = 5,
}

---@param rank integer
---@return Affiliation
function Relationship.AffiliationFromRank(rank)
    if rank < 0 then
        return Relationship.Affiliation.Hostile
    elseif rank < 1000 then
        return Relationship.Affiliation.Neutral
    elseif rank < 6000 then
        return Relationship.Affiliation.Friendly
    elseif rank < 18000 then
        return Relationship.Affiliation.Honored
    elseif rank < 40000 then
        return Relationship.Affiliation.Revered
    else
        return Relationship.Affiliation.Exalted
    end
end

return Relationship