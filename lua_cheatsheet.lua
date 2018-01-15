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
2 + 2 -- 4, add
2 - 2 -- 0, subtract
2 * 2 -- 4, multiply
2 / 2 -- 1, divide
2 ^ 2 -- 4, raise to the power of
2 % 2 -- 0, modulo


------------------------------------------------------------------------
---- string operations
------------------------------------------------------------------------
'hello ' .. 'world' -- hello world, string concatination
string.len('abc') -- 3, string length
string.lower('ABC') -- abc, convert all string to lowercase
string.upper('abc') -- ABC, convert all string to uppercase
string.reverse('abc') -- cba, reverse a string


------------------------------------------------------------------------
---- boolean operations
------------------------------------------------------------------------
true == true -- true, equality
true ~= false -- true, non-equality
2 < 2 -- false, less than
2 > 2 -- false, greater than
2 <= 2 -- true, less than or equal to
2 >= 2 -- true, greater than or equal to


------------------------------------------------------------------------
---- blocks
------------------------------------------------------------------------
-- a group of code in between a 'do' and 'end'
do
  -- this is in a block
  do
    do
      -- this is in a very nested block
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
---- scope and nil
------------------------------------------------------------------------
-- nil represents the lack of value
-- any variable that hasn't been declared is nil
print(new_variable == nil) -- true
-- you can also assign nil to a variable to 'delete' it

-- any local variable declared in a scope cannot be used outside of it
local outer_scope = 1
do
  local inner_scope = 1
end
print(outer_scope) -- 1
print(inner_scope) -- nil


------------------------------------------------------------------------
---- global variables
------------------------------------------------------------------------
-- they can be used in any scope
-- they are a special variable that is not declared with 'local'
do
  global_variable = 1
end
print(global_variable) -- 1

-- forgetting to use 'local' essentially means declaring a global variable, so
-- be careful not to declare global variables when you don't mean to


------------------------------------------------------------------------
---- tables
------------------------------------------------------------------------
-- tables are Lua's only collection type

-----------------------------------
-- arrays
-----------------------------------
-- they can be used as arrays, or ordered lists of values
local favoriteFruit = { 'apple', 'banana', 'tomato' }

--- accessing
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

--- inserting
-- table.insert(table, index, value)
table.insert(favoriteFruit, 2, 'grape') -- favoriteFruit is now { 'banana', 'grape', 'tomato', 'cherry' }

--- concatinating: combining all of the elements of the table into a string
-- table.concat(table, seperator)
table.concat(favoriteFruit, ' yes! ') -- this returns 'banana yes! grape yes! tomato yes! cherry'
-- notice how this is the only operation that returns a value - all of the other operations modify the table but don't return anything


-----------------------------------
-- dictionaries
-----------------------------------
-- tables can also be used as dictionaries, or a collection of key-value pairs
-- { key = value, ... }
local fruitColors = { apple = 'red', banana = 'yellow', tomato = 'red' }
-- keys are basically variable names

--- accessing
print(fruitColors['apple']) -- 'red'
fruitColors['banana'] = 'purple'

--- adding
fruitColors['grape'] = 'purple' -- fruitColors is now { 'apple' = 'purple', 'banana' = 'yellow', 'tomato' = 'red', 'grape' = 'purple' }

--- removing
fruitColors['grape'] = nil

-- lua arrays are really just dictionaries with numbered indexes, so these are the same:
{'a', 'b', 'c'}
{[1] = 'a', [2] = 'b', [3] = 'c'}
-- those square brackets are necessary because a number is not a valid variable name

------------------------------------------------------------------------
---- looping through tables
------------------------------------------------------------------------
--- use ipairs for arrays
-- ipairs goes through every item in the table and assigns i to its index and v to its value
-- for i, v in ipairs(table) do
for i, v in ipairs({'a', 'b', 'c'}) do
  print(i, v) -- 1 'a'   THEN   2 'b'   THEN   3 'c'
end
-- i and v are just variables, so you can call them anything

--- use pairs for dictionaries
-- pairs is like ipairs but it does not guarantee an order
for k, v in pairs({'a' = 'apple', 'b' = 'bear', 'c' = 'coral'}) do
  print(k, v) -- a apple   THEN   b bear   THEN   c coral
end

-- pairs is really ipairs but because arrays have numbered keys it has a set order
