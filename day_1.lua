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
local number = 5
-- strings
local string1 = 'place text in single quotes'
local string2 = "if you have 'single quotes' in your text, use double quotes"
-- booleans
local is_lua = true
local is_python = false

--- printing
-- this displays something to the user, very useful for debugging
print('this text will be displayed')
print("don't forget your quotes, though")

--- if statements
if my_variable == 2 then
  print('if <condition> then')
  print('remember to indent lines of code inside your if statement')
elseif my_variable > 3 then
  print('elseif is pretty cool')
else
  print('my_variable is not 2 or 3')
end
if my_variable != 2 then
  print('my_variable is not equal to 2')
end
if is_lua then
  print('must be lua')
  print('we can use true/false values for if statements')
elseif not is_python then
  print("it isn't python or lua… huh")
end
