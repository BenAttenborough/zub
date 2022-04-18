Debug = {}

-- Set your logfile in Globals
function Debug.log(str, overwrite)
   overwrite = overwrite or false
   printh(str, logfile, overwrite)
end

function Debug.dump(o)
  if type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '['..k..'] = ' .. Debug.dump(v) .. ','
     end
     return s .. '} '
  else
     return tostring(o)
  end
end

Debug.GobalString = "GlobalString"