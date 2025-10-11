-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class DialogueNode
---@field content_id integer
---@field quest_id? integer
---@field choices Choice[]
local DialogueNode = {}

---@alias Emote "Close"|"Approve"|"Reject"|"Next"|"TellMore"

---@class Choice
---@field choice_emote Emote
---@field next_index? integer

---@param id integer
---@return DialogueNode
function DialogueNode.Line(id)
    return setmetatable({ content_id = id, choices = {} }, { __index = DialogueNode })
end

---@param emote Emote
---@return DialogueNode
function DialogueNode:Choice(emote)
    self.choices = { { choice_emote = emote } }
    return self
end

---@param emote Emote
---@param index integer
---@return DialogueNode
function DialogueNode:Branch(emote, index)
    self.choices = { { choice_emote = emote, next_index = index } }
    return self
end

---@param quest_id integer
---@return DialogueNode
function DialogueNode:WithQuestId(quest_id)
    self.quest_id = quest_id
    return self
end

return DialogueNode