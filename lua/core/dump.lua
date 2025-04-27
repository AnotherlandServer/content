-- Copyright (C) 2025 AnotherlandServer
--
-- This software is licensed under the MIT License.
-- For details, see the LICENSE.md file in the repository.

-- based on https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console

local function format(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. format(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

local function dump(o)
    Log.Debug(format(o))
end

return dump