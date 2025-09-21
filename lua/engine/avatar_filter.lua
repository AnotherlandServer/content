-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "core.entity"

---@class AvatarFilter
---@field type "Content"|"Instance"|"QuestTags"|"LootItem"|"Dialog"
---@field filter string|number
---@field private fnc fun(ent: Entity, filter: string|number): boolean
local AvatarFilter = {}

---@param contentId string
---@return AvatarFilter
function AvatarFilter.FindByContentId(contentId)
    return setmetatable({
        type = "Content",
        filter = contentId,
        fnc = TestContent
    }, { __index = AvatarFilter })
end

---@param instanceId string
---@return AvatarFilter
function AvatarFilter.FindByInstanceId(instanceId)
    return setmetatable({
        type = "Instance",
        filter = instanceId,
        fnc = TestInstance
    }, { __index = AvatarFilter })
end

---@param tags string[]
---@return AvatarFilter
function AvatarFilter.FindByQuestTags(tags)
    return setmetatable({
        type = "QuestTags",
        filter = table.concat(tags, "|"),
        fnc = TestQuestTags
    }, { __index = AvatarFilter })
end

---@param itemId string
---@return AvatarFilter
function AvatarFilter.FindByLootItem(itemId)
    return setmetatable({
        type = "LootItem",
        filter = itemId,
        fnc = TestLootItem
    }, { __index = AvatarFilter })
end

---@param dialogId number
---@return AvatarFilter
function AvatarFilter.FindByDialog(dialogId)
    return setmetatable({
        type = "Dialog",
        filter = dialogId,
        fnc = TestDialog
    }, { __index = AvatarFilter })
end

---@param ent Player|NonClientBase
---@return boolean
function AvatarFilter:TestEntity(ent)
    return self.fnc(ent, self.filter)
end

---@param ent Player|NonClientBase
---@param filter string
---@return boolean
function TestContent(ent, filter)
    return ent.template_guid == filter
end

---@param ent Player|NonClientBase
---@param filter string
function TestInstance(ent, filter)
    return ent.placement_guid == filter
end

---@param ent Player|NonClientBase
---@param filter string
function TestQuestTags(ent, filter)
    return false
end

---@param ent Player|NonClientBase
---@param filter string
function TestLootItem(ent, filter)
    return false
end

---@param ent Player|NonClientBase
---@param filter number
function TestDialog(ent, filter)
    local dialogs = ent:Get("Dialogs")

    if dialogs then
        for _, dialog in ipairs(dialogs) do
            if dialog == filter then
                return true
            end
        end
    end
end

return AvatarFilter