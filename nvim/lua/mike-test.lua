lu = require('luaunit')
require('mike')

TestMike = {}

TestMike.tests = {
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

  -- Malformed
  { "[ abc", "[ ] [ abc" },
  { "] abc", "[ ] ] abc" },
  { "  [[] abc", "  [ ] [[] abc" },
  { "[ ]abc", "[ ] [ ]abc" },
}

TestMike.listOfNameAndInst = {}

for _, entry in pairs(TestMike.tests) do
  local line = entry[1]
  local expected = entry[2]
  table.insert(TestMike.listOfNameAndInst, { line, function()
      actual = mikemike(line)
      lu.assertEquals(actual, expected)
    end } )
end

lu.LuaUnit:runSuiteByInstances(TestMike.listOfNameAndInst, "")
