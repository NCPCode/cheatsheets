---- Lua Cheatsheet Day 1

--- comments
-- lines of code that Lua ignores


--- variables
--- store any value
--- before using a variable you have to *declare* it
local variable = 1
--- after that when you *reference* it don't use 'local'
variable = 2
variable = variable + 1


--- values
-- numbers
local number1 = 5
local number2 = 0.3
-- strings
local string1 = 'place text in single quotes'
local string2 = "if you have 'single quotes' in your text, use double quotes"
-- booleans
local is_lua = true
local is_python = false


--- printing
-- this displays something to the user, very useful for debugging
print('this text will be displayed')
print(3) -- works with any value


--- number operations
print(2 + 2) -- 4, add
print(2 - 2) -- 0, subtract
print(2 * 2) -- 4, multiply
print(2 / 2) -- 1, divide
print(2 ^ 2) -- 4, raise to the power of
print(2 % 2) -- 0, modulo


--- boolean operations
print(true == true) -- true, equality
print(true ~= false) -- true, non-equality
print(2 < 2) -- false, less than
print(2 > 2) -- false, greater than
print(2 <= 2) -- true, less than or equal to
print(2 >= 2) -- true, greater than or equal to


--- blocks
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


--- if statements
-- the code in between the 'then' and the next keyword is also in a block
if variable == 2 then
  -- this block is run if boolean is true
elseif variable > 3 then
  -- this block is run if the previous boolean is false and this boolean is true
else
  -- this block is run if none of the previous booleans are true
end
