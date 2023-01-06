
local module = {}

function module.toggle_checkbox(line)

    -- If it's a completely empty (new) line then set up a new list item.
    if #line == 0 then
        return "    + [ ] "
    end

    local spaces, list, check, body = string.match(line, "^(%s*)([+*-]? ?)(%[?[ x]?]? ?)(.*)")
    if spaces ~= nil then
        if check == "[x] " then
            check = ""
        elseif check  == "[ ] " then
            check = "[x] "
        else
            check = "[ ] " .. check    
        end
        return spaces .. list .. check .. body
    else
        -- The pattern will match any line so we shouldn't get here.
        return line
    end
end

return module


