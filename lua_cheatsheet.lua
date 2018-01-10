------------------------------------------------------------------------
---- useful links
------------------------------------------------------------------------
-- lua style guide: http://lua-users.org/wiki/LuaStyleGuide
-- condensed cheatsheet: http://lua-users.org/files/wiki_insecure/users/thomasl/luarefv51.pdf
-- lua learnxinyminutes: https://learnxinyminutes.com/docs/lua


------------------------------------------------------------------------
---- comments
------------------------------------------------------------------------
-- single-line
--[[
      multi-line
--]]


------------------------------------------------------------------------
---- variables
------------------------------------------------------------------------
-- before using a variable you must declare it
local variable = 1
-- after that when you reference it don't use 'local'
variable = 2
variable = variable + 1


------------------------------------------------------------------------
---- values
------------------------------------------------------------------------
-- numbers
local number1 = 5
local number2 = 0.3
-- strings
local string1 = 'place text in single quotes'
local string2 = "if you have 'single quotes' in your text, use double quotes"
-- booleans
local isLua = true
local isPython = false


------------------------------------------------------------------------
---- printing
------------------------------------------------------------------------
print('this text will be displayed')
print(3) -- works with any value


------------------------------------------------------------------------
---- number operations
------------------------------------------------------------------------
print(2 + 2) -- 4, add
print(2 - 2) -- 0, subtract
print(2 * 2) -- 4, multiply
print(2 / 2) -- 1, divide
print(2 ^ 2) -- 4, raise to the power of
print(2 % 2) -- 0, modulo


------------------------------------------------------------------------
---- boolean operations
------------------------------------------------------------------------
print(true == true) -- true, equality
print(true ~= false) -- true, non-equality
print(2 < 2) -- false, less than
print(2 > 2) -- false, greater than
print(2 <= 2) -- true, less than or equal to
print(2 >= 2) -- true, greater than or equal to


------------------------------------------------------------------------
---- blocks
------------------------------------------------------------------------
-- a group of code in between a 'do' and 'end'
do
  print('I am in a block')
  do
    do
      print('I am in a very nested block')
    end
  end
end
-- indenting in a block is not required but recommended


------------------------------------------------------------------------
---- if statements
------------------------------------------------------------------------
-- the code in between the 'then' and the next keyword is also in a block
if variable == 2 then
  -- this block is run if boolean is true
elseif variable > 3 then
  -- this block is run if the previous boolean is false and this boolean is true
else
  -- this block is run if none of the previous booleans are true
end


------------------------------------------------------------------------
---- loops
------------------------------------------------------------------------
--- for loops
-- repeates a block a certain number of times
for i = 1, 100 do
  print(i) -- 1, 2, 3, 4, 5, 6, ... 100
end
-- you can also control the step
for i = 100, 1, -1 do
  print(i) -- 100, 99, 98, 97, ... 1
end

--- while loops
-- repeates a block while a boolean is true
local number = 100
while number != 1 do
  number = number - 1
end


------------------------------------------------------------------------
---- functions
------------------------------------------------------------------------
-- a block that you can run from anywhere
--- declare
function myFunction()
  print('I have been run!')
end
--- run
myFunction() -- I have been run!


--- parameters
-- you can give additional information to a function
function fancyPrint(string) -- 'string' is now a local variable
  print('!!!' + string + '!!!')
end

fancyPrint('what a cool thing') -- !!!what a cool thing!!!


--- return
-- you can also pass information out of a function
function fancyModify(string)
  return '!!!' + string + '!!!'
end

local result = fancyModify('boring string')
print(result) -- !!!boring string!!!


------------------------------------------------------------------------
---- tables
------------------------------------------------------------------------
--- accessing
-- a way to store multiple values
local favoriteFruit = { 'apple', 'banana', 'tomato' }
-- access an item using its position in the table
print(favoriteFruit[1]) -- apple
favoriteFruit[1] = 'orange' -- favoriteFruit is now { 'orange', 'banana', 'tomato' }

--- adding
-- find the length of the table using #
print(#favoriteFruit) -- 3
-- use this to add to the table
favoriteFruit[# + 1] = 'cherry' -- favoriteFruit is now { 'orange', 'banana', 'tomato', 'cherry' }

--- removing
-- table.remove(table, index)
table.remove(favoriteFruit, 1) -- favoriteFruit is now { 'banana', 'tomato', 'cherry' }
