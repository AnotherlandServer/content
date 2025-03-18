-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

function Class(base)
    local new_class = {}

    if base then 
        setmetatable(new_class, {
            __index = base
        })
        new_class.super = base
    end

    return new_class
end

return Class