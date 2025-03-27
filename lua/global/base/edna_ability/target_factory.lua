-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

---@module '_effector_defs'

---@class TargetFactory
local TargetFactory = {}

---comment
---@param source Entity
---@param settings any
---@return TargetFactory
function TargetFactory.New(source, settings)
    local instance = {}

    setmetatable(instance, {
        __index = TargetFactory
    })

    return instance
end

---comment
---@param request TargetFactoryDef
function TargetFactory:FindTargets(request)

end

return TargetFactory