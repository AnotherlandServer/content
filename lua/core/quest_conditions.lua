-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module "engine.avatar_filter"

local AvatarFilter = require("engine.avatar_filter")

---@class BaseCondition
---@field id number
---@field type string
---@field required_count number
---@field filter AvatarFilter?
---@field beacon NonClientBase?

---@class InteractCondition: BaseCondition
---@field type "interact"
---@field avatar_filter AvatarFilter

---@class DialogCondition: BaseCondition
---@field type "dialog"
---@field avatar_filter AvatarFilter

---@class RemovedCondition: BaseCondition
---@field type "removed"

---@class WaitCondition : BaseCondition
---@field type "wait"
---@field seconds number

---@alias Condition InteractCondition | DialogCondition | RemovedCondition | WaitCondition

local Conditions = {}

---@param required_count number
---@param avatar_filter AvatarFilter
---@return InteractCondition
function Conditions.Interact(required_count, avatar_filter)
    return {
        id = 0,
        type = "interact",
        required_count = required_count,
        avatar_filter = avatar_filter,
    }
end

---@param required_count number
---@param dialog_id number
---@return DialogCondition
function Conditions.Dialog(required_count, dialog_id)
    return {
        id = 0,
        type = "dialog",
        required_count = required_count,
        avatar_filter = AvatarFilter.FindByDialog(dialog_id),
    }
end

---@return RemovedCondition
function Conditions.Removed()
    return {
        id = 0,
        type = "removed",
        required_count = 0,
    }
end

---@param seconds number
---@return WaitCondition
function Conditions.Wait(seconds)
    return {
        id = 0,
        type = "wait",
        required_count = 1,
        seconds = seconds,
    }
end

return Conditions