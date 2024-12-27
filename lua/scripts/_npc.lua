-- Copyright (C) 2024 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

NPC.based_on = "_script"

function NPC:Init()
    self:AddBehavior("dovendorexecute", self.DoVendorExecute)
end

---MetaMorph vendor execute
---@param player Player
---@param ... any
function NPC:DoVendorExecute(player, ...)
    local params = { ... }

    -- Apply metamorph customization parameters
    player:Set("customizationGender", params[1])
    player:Set("customizationHeight", params[2])
    player:Set("customizationFat", params[3])
    player:Set("customizationSkinny", params[4])
    player:Set("customizationMuscular", params[5])
    player:Set("customizationBustSize", params[6])
    player:Set("race", params[7])
    player:Set("customizationBrowAngle", params[8])
    player:Set("customizationEyeBrowPos", params[9])
    player:Set("customizationEyePosSpacing", params[10])
    player:Set("customizationEyePos", params[11])
    player:Set("customizationEyeSizeLength", params[12])
    player:Set("customizationEyeSizeWidth", params[13])
    player:Set("customizationEyesPretty", params[14])
    player:Set("customizationMouthPos", params[15])
    player:Set("customizationMouthWidth", params[16])
    player:Set("customizationMouthLowerLipThic", params[17])
    player:Set("customizationMouthUpperLipThic", params[18])
    player:Set("customizationMouthExpression", params[19])
    player:Set("customizationNosePosLength", params[20])
    player:Set("customizationNosePosWidth", params[21])
    player:Set("customizationNosePortude", params[22])
    player:Set("customizationEarSize", params[23])
    player:Set("customizationEarElf", params[24])
    player:Set("customizationCheekBone", params[25])
    player:Set("customizationCheek", params[26])
    player:Set("customizationChinPortude", params[27])
    player:Set("customizationJawChubby", params[28])


end