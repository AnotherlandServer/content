-- Copyright (C) 2026 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class Behavior
---@field tag string
---@field value any
---@field condition Behavior?
---@field cond_true Behavior?
---@field cond_false Behavior?
---@field children Behavior[]?
---@field builder? function(npc: NpcOtherland): Behavior?
local Behavior = {}

---@enum Behavior.Result
Behavior.Result = {
    Success = 0,
    Running = 1,
    Failure = 2,
}

---@param params Behavior
function NewBehavior(params)
    setmetatable(params, { __index = Behavior })
    return params
end

---@param duration number
---@return Behavior
function Behavior.Wait(duration)
    return NewBehavior({
        tag = "Wait",
        value = duration,
    })
end

---@return Behavior
function Behavior.WaitForever()
    return NewBehavior({
        tag = "WaitForever",
    })
end

---@param script function(npc: NpcOtherland, dt: number): Behavior.Result, number
---@return Behavior
function Behavior.Script(script)
    return NewBehavior({
        tag = "ActionScript",
        value = script,
    })
end


---@param behavior Behavior
---@return Behavior
function Behavior.Invert(behavior)
    return NewBehavior({
        tag = "Invert",
        value = behavior,
    })
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.Select(behaviors)
    return NewBehavior({
        tag = "Select",
        value = behaviors,
    })
end

---@param condition Behavior
---@param cond_true Behavior
---@param cond_false Behavior
---@return Behavior
function Behavior.If(condition, cond_true, cond_false)
    return NewBehavior({
        tag = "If",
        condition = condition,
        cond_true = cond_true,
        cond_false = cond_false,
    })
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.Sequence(behaviors)
    return NewBehavior({
        tag = "Sequence",
        children = behaviors,
    })
end

---@param condition Behavior
---@param behaviors Behavior[]
---@return Behavior
function Behavior.While(condition, behaviors)
    return NewBehavior({
        tag = "While",
        condition = condition,
        children = behaviors,
    })
end

---@param condition Behavior
---@param behaviors Behavior[]
---@return Behavior
function Behavior.WhileAll(condition, behaviors)
    return NewBehavior({
        tag = "WhileAll",
        condition = condition,
        children = behaviors,
    })
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.WhenAll(behaviors)
    return NewBehavior({
        tag = "WhenAll",
        children = behaviors,
    })
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.WhenAny(behaviors)
    return NewBehavior({
        tag = "WhenAny",
        children = behaviors,
    })
end

---@param behaviors Behavior[]
---@return Behavior
function Behavior.After(behaviors)
    return NewBehavior({
        tag = "After",
        children = behaviors,
    })
end

---@param fnc function(npc: NpcOtherland): Behavior
function Behavior.Builder(fnc)
    return NewBehavior({
        tag = "Builder",
        builder = fnc,
    })
end

---@param npc NpcOtherland
---@return Behavior
function Behavior:Compile(npc)
    if self.tag == "Builder" then
        return self.builder(npc)
    else
        local compiled = {}
        compiled.tag = self.tag
        compiled.value = self.value

        if self.condition then
            compiled.condition = self.condition:Compile(npc)
        end

        if self.cond_true then
            compiled.cond_true = self.cond_true:Compile(npc)
        end

        if self.cond_false then
            compiled.cond_false = self.cond_false:Compile(npc)
        end

        if self.children then
            compiled.children = {}
            for _, child in ipairs(self.children) do
                table.insert(compiled.children, child:Compile(npc))
            end
        end

        return NewBehavior(compiled)
    end
end

return Behavior