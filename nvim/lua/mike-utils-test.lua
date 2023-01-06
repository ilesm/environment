lu = require('luaunit')
m = require('mike-utils')

local mod = {}

local tests = {

  -- Good
  { "abc", "[ ] abc" },
  { "[ ] abc", "[x] abc" },
  { "[x] abc", "abc" },
  { "+ abc", "+ [ ] abc" },
  { "+ [ ] abc", "+ [x] abc" },
  { "+ [x] abc", "+ abc" },
  { "  + abc", "  + [ ] abc" },
  { "  + [ ] abc", "  + [x] abc" },
  { "  + [x] abc", "  + abc" },
  { "  * abc", "  * [ ] abc" },
  { "  * [ ] abc", "  * [x] abc" },
  { "  * [x] abc", "  * abc" },
  { "  - abc", "  - [ ] abc" },
  { "  - [ ] abc", "  - [x] abc" },
  { "  - [x] abc", "  - abc" },
  { " [whatever]", " [ ] [whatever]" },
  { " [ ] [whatever]", " [x] [whatever]" },
  { " [x] [whatever]", " [whatever]" },

  -- Malformed
  { "[ abc", "[ ] [ abc" },
  { "[ ] [ abc", "[x] [ abc" },
  { "[x] [ abc", "[ abc" },
  { "] abc", "[ ] ] abc" },
  { "[ ] ] abc", "[x] ] abc" },
  { "[x] ] abc", "] abc" },
  { "  [[] abc", "  [ ] [[] abc" },
  { "  [ ] [[] abc", "  [x] [[] abc" },
  { "  [x] [[] abc", "  [[] abc" },
  { "[ ]abc", "[ ] [ ]abc" },
  { "[ ] [ ]abc", "[x] [ ]abc" },
  { "[x] [ ]abc", "[ ]abc" },
}

mod.listOfNameAndInst = {}

for _, entry in pairs(tests) do
  local line = entry[1]
  local expected = entry[2]
  table.insert(mod.listOfNameAndInst, { "'" .. line .. "'", function()
      actual = m.toggle_checkbox(line)
      lu.assertEquals(actual, expected)
    end } )
end

lu.LuaUnit:runSuiteByInstances(mod.listOfNameAndInst, "")
