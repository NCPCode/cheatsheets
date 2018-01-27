-- Introduction

-- The first steps we’ll take with pbLua will introduce some very simple scripts that will let us interact with the NXT brick. We’ll cover some of the basic syntax of Lua at the same time so that you get an understanding of what the language can do.

-- Note that some of the examples we’ll be going over are not the best way to do things. For instance, the busy-wait function will prevent any other code from running until the condition clears. In later tutorials, we’ll be showing ways around this problem using the build-in cooperative multitasking feature of Lua.

-- As a reminder, there is an excellent online version of Programming in Lua that is a complete description of Lua along with many programming examples.

-- By the end of this tutorial, you’ll be able to read the current millisecond tick count, check which button is pressed, and use them to write a simple Lua function that shows how long a button was pressed.

-- Running the Examples – where is the IDE?

-- I’m assuming that you have pbLua Firmware installed on the brick, and you have managed to get connected to the NXT using a terminal emulator.

-- Running the examples is simple, simply copy the text from the example code and paste it into the terminal emulator. The terminal emulator sends the text to the NXT just as if you typed it yourself, and the NXT compiles and the code right on the brick!

-- This explains where the IDE is – there isn’t one because we don’t need one. It’s what makes pbLua special because you can program the NXT using any device that can connect to the NXT via Bluetooth or a USB port. No need for fancy IDEs at all.

-- Later on, we’ll show how to put the code you use the most into a file so that you can execute it all from the front panel of the NXT – no need for any connection at all!

-- Hello World!

-- The canonical first program that every programmer writes is “Hello World!”, like this:

-- Hello World! for pbLua
-- it's me
print( "Hello World!" )
-- Yes, it’s as simple as that – print() is a built-in part of pbLua and it sends the string parameter to the console. If you have no console connected, it does nothing.

-- The pbLua Display API has a number of functions that can be used to show text on the display, which we will get into in the next tutorial.

-- The nxt Table

-- If you’ve done any reading about Lua online or better yet, purchased the latest Programming in Lua book then you’ll know that tables are not just a data structure, they are the data structure. All of the NXT specific API calls are in the nxt table, which is automatically loaded when the NXT boots.

-- The other standard tables that are loaded are the string and base tables. Let’s move on and look at one of the simplest NXT specific API calls – reading the millisecond timer.

-- Reading the Timer

-- Once the NXT is turned on, the firmware sets up a timer that fires off once every millisecond. When the timer fires, the firmware does a number of things including:

-- Increment the tick counter
-- Update the display (if necessary)
-- Update the state of the front panel buttons
-- Update the Bluetooth state machine
-- Update the motor state
-- It’s a simple task to read the timer and print the result like this:

-- Reading the NXT millisecond timer

print( nxt.TimerRead() )
-- You can use the following short form at the console to avoid having to type the print() function every time like this:

-- Reading the NXT millisecond timer using the short form of print

-- =nxt.TimerRead()
-- The next thing you’ll probably want to do is take the current timer value and store it in a variable, like this:

-- Reading the NXT millisecond timer and storing it in a variable

cur = nxt.TimerRead()

-- And now print the saved result...

print( cur )

-- or equivalently at the console...

-- =cur
-- And finally, we can write a simple function that will read the current timer value, wait some number of milliseconds, and then print the value again – which is basically implementing a busy-wait loop.

-- Implementing a simple busy-wait loop

function BusyWait( n )
  local start, stop
  start = nxt.TimerRead()

  repeat
    stop = nxt.TimerRead()
  until start+n < stop
end

-- And use it like this:

function testBusyWait( n )
  print( nxt.TimerRead() )
  BusyWait( n )
  print( nxt.TimerRead() )
end
-- Note that the print() statements around the BusyWait() take some time, so the difference between TimerRead() results may be larger than n.

-- Reading the Buttons

-- The NXT has 4 buttons on the front panel which the millisecond timer handler reads and debounces for us. The hardware is set up so that only one button can be read at one time, and the values reported by each button shown in the table below:

-- Hex
-- Decimal
-- Description
-- 0x0	0	No Button Pressed
-- 0x1	1	Grey Button Pressed
-- 0x2	2	Right Button Pressed
-- 0x4	4	Left Button Pressed
-- 0x8	8	Orange Button Pressed
-- Reading the button state is done like this:

-- Reading the NXT front panel buttons

print( nxt.ButtonRead() )
-- When no button is pressed, the nxt.ButtonRead() function returns 0. It’s pretty straightforward to combine what we know about the timer and the buttons to write a little function that detects when a button is pressed.

-- The interesting thing about this function is that it returns two values, which is another one of the very cool features of the Lua language.

-- Detecting a button press...

function WaitButtonPress()
  repeat
    b = nxt.ButtonRead()
  until b ~= 0

  return b, nxt.TimerRead()
end

-- and using the function

b,t = WaitButtonPress()

print( "Button -> " .. b .. " Time -> " .. t )
-- There, that’s pretty simple! Now let’s combine these ideas to make another function that tells us how long a button is pressed.

-- How Long Was The Button Pressed?

-- So far, we have a way to tell the current time, and a way to tell if a button is pressed. Now we just need a way to tell when the button is released and we can put it together in a simple function that will print out how long the button was pressed for.

-- Note the name of the button return value in the call to WaitButtonRelese(). The "_" is the idiom for a result that will not be used.

-- Detecting a button release...

function WaitButtonRelease()
  local b

  repeat
    b = nxt.ButtonRead()
  until b == 0

  return b, nxt.TimerRead()
end

-- A function that combines these operations:

function TimeButtonPress()
  local b, s = WaitButtonPress()
  _,e = WaitButtonRelease()

  print( "Button -> " .. b .. " Time -> " .. s )
  print( "Released at Time -> " .. e )
  print( "Total Time Pressed -> " .. e-s )
end
-- A Refined Version of the Button Test Code

-- If you are an experienced programmer, you’ll notice that there is a big similarity between the WaitButtonPress() and WaitButtonRelease() routines. Here’s another way to write them as one function…

-- Detecting button state...

function WaitButtonState( s )
  repeat
    b = nxt.ButtonRead()
  until b == s

  return b, nxt.TimerRead()
end


-- A function that combines these operations:

function TimeButtonPress()
  b,s = WaitButtonState( 8 )
  _,e = WaitButtonState( 0 )

  print( "Button -> " .. b .. "Time -> " .. s )
  print( "Released at Time -> " .. e )
  print( "Total Time Pressed -> " .. e-s )
end
-- This example has the advantage of detecting how long a specific button has been pressed, in this case the orange one.

-- If you’ve followed along this far, lets move on to the next tutorial for some really interesting examples using the LCD display.


-- Share This: by Follow Us: by
