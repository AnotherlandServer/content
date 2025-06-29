-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class Behavior
local Behavior = {}

---@enum Behavior.Result
Behavior.Result = {
    Success = 0,
    Running = 1,
    Failure = 2,
}

---@param duration number
---@return Behavior
function Behavior.Wait(duration)
    return {
        tag = "Wait",
        value = duration,
    }
end

---@return Behavior
function Behavior.WaitForever()
    return {
        tag = "WaitForever",
    }
end

---@param script function(npc: NpcOtherland, dt: number): Behavior.Result, number
---@return Behavior
function Behavior.Script(script)
    return {
        tag = "ActionScript",
        value = script,
    }
end


---@param behavior Behavior
---@return Behavior
function Behavior.Invert(behavior)
    return {
        tag = "Invert",
        value = behavior,
    }
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.Select(behaviors)
    return {
        tag = "Select",
        value = behaviors,
    }
end

---@param condition Behavior
---@param cond_true Behavior
---@param cond_false Behavior
---@return Behavior
function Behavior.If(condition, cond_true, cond_false)
    return {
        tag = "If",
        condition = condition,
        cond_true = cond_true,
        cond_false = cond_false,
    }
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.Sequence(behaviors)
    return {
        tag = "Sequence",
        children = behaviors,
    }
end

---@param condition Behavior
---@param behaviors Behavior[]
---@return Behavior
function Behavior.While(condition, behaviors)
    return {
        tag = "While",
        condition = condition,
        children = behaviors,
    }
end

---@param condition Behavior
---@param behaviors Behavior[]
---@return Behavior
function Behavior.WhileAll(condition, behaviors)
    return {
        tag = "WhileAll",
        condition = condition,
        children = behaviors,
    }
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.WhenAll(behaviors)
    return {
        tag = "WhenAll",
        children = behaviors,
    }
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.WhenAny(behaviors)
    return {
        tag = "WhenAny",
        children = behaviors,
    }
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.After(behaviors)
    return {
        tag = "After",
        children = behaviors,
    }
end

return Behavior