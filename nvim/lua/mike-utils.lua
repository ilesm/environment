
local module = {}

function module.toggle_checkbox(line)
    local spaces, list, check, body = string.match(line, "^(%s*)([+*-]? ?)([x [%]]* ?)(.*)")
    if spaces ~= nil then
        if check == "[x] " then
            check = ""
        elseif check  == "[ ] " then
            check = "[x] "
        else
            check = "[ ] " .. check
        end
        return spaces .. list .. check .. body
    end
    -- Shouldn't ever get here
    return line
end

return module


