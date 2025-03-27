-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@class Class
---@field GetClass fun(): Class
---@field GetBaseClass fun(): Class

function Class(base)
    local new_class = {}

    if base then 
        setmetatable(new_class, {
            __index = base
        })
    end

    function new_class:GetClass()
        return new_class
    end

    function new_class:GetBaseClass()
        if not base then
            return nil
        else
            return base:GetClass()
        end
    end

    return new_class
end

return Class