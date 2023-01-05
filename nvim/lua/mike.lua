

function mikemike (line)
    spaces, list, check, body = string.match(line, "^(%s*)([+*-]? ?)([x [%]]* ?)(.*)")
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
    return "1" .. line
end


