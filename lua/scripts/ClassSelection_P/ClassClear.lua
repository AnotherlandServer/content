-- Copyright (C) 2024 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

function SCRIPT:TriggerAction(player)
    player:Reset("combatStyle")
    player:Reset("classData")
    player:Reset("currentClassSkills")
    player:Reset("heavySpecialSkillData")
end