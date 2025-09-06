-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseQuest = require("core.base_quest")

---@class Quest: BaseQuest
local Quest = Class(BaseQuest)

Quest.id = 1350
Quest.world = "GameEntry_P"
Quest.exp_reward = 6
Quest.bit_reward = 2
Quest.questgivers = { "GE_01_Sellars" }
Quest.questreceivers = { "GE_01_Sellars" }

---@param player Player
---@param speaker NpcOtherland
---@return boolean handled
function Quest:RunOfferDialogue(player, speaker)
    if speaker.name == "GE_01_Sellars" then
        Quest:ExecuteDialogue(player, speaker, 1350, {
            { content_id = 13502, choices = { { choice_emote = "TellMore", next_index = 1 } } },
            { content_id = 13503, choices = { { choice_emote = "TellMore", next_index = 2 } } },
            { content_id = 13504, choices = {}, quest_id = self.id },
        })

        return true
    end
    
    return false
end

return Quest