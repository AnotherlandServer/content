-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class QuestLog
---@field player Player
local QuestLog = {}

---@param player Player
---@return QuestLog
function QuestLog:New(player)
    local instance = {}

    setmetatable(instance, {
        __index = self,
    })

    instance.player = player

    return instance
end

---@param questId integer
function QuestLog:MarkQuestAvailable(questId)
    __engine.questlog.MarkQuestAvailable(self.player, questId)
end

---@param questId integer
function QuestLog:MarkQuestCompleted(questId)
    __engine.questlog.MarkQuestCompleted(self.player, questId)
end

---@param questId integer
function QuestLog:MarkQuestFinished(questId)
    __engine.questlog.MarkQuestFinished(self.player, questId)
end

---@param questId integer
function QuestLog:MarkQuestInProgress(questId)
    __engine.questlog.MarkQuestInProgress(self.player, questId)
end

return QuestLog