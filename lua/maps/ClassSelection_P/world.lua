-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

local Class = require("core.class")
local BaseWorld = require("core.base_world")

---@class ClassSelection_P: BaseWorld
local ClassSelection_P = Class(BaseWorld)

function ClassSelection_P:SpawnPlayer(player)
    player:Set("tutorialMode", true)
    player:Set("firstTimeSpawn", true)

    player:RecalculateStats()
    player:Spawn()
end

function ClassSelection_P:PreLoadPlayerInventory(player)
    Log.Debug("PreLoadPlayerInventory")

    player:ApplyClassItem("Class_Preset_Tutorial_None", true, function ()
        Log.Debug("Preset applied")
        player:BeginLoadInventory()
    end)
end

return ClassSelection_P