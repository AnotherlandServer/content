-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class QuestLog
---@field player Player
local QuestLog = {}

---@enum QuestState
QuestLog.QuestState = {
    AVAILABLE = "AVAILABLE",
    IN_PROGRESS = "IN_PROGRESS",
    COMPLETED = "COMPLETED",
    FINISHED = "FINISHED",
    UNAVAILABLE = "UNAVAILABLE",
}

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

---@param questId integer
function QuestLog:MarkQuestFailed(questId)
    __engine.questlog.MarkQuestFailed(self.player, questId)
end

---@param questId integer
---@return QuestState
function QuestLog:GetQuestState(questId)
    return __engine.questlog.GetQuestState(self.player, questId)
end

return QuestLog