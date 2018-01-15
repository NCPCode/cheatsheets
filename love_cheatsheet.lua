------------------------------------------------------------------------
---- useful links
------------------------------------------------------------------------
-- love2d wiki: https://love2d.org/wiki/Main_Page
-- love2d forums: https://love2d.org/forums/


------------------------------------------------------------------------
---- structure
------------------------------------------------------------------------
-- each love program must have 2 files: main.lua and conf.lua

-----------------------------------
-- conf.lua
-----------------------------------
-- used for setting various settings.
-- the only requirement is that it must have the love.conf function
-- you can omit lines in the function that you don't need

function love.conf(t)
    -- THESE ARE THE THREE IMPORTANT ONES
    t.window.title = "Untitled"         -- The window title (string)
    t.window.width = 800                -- The window width (number)
    t.window.height = 600               -- The window height (number)

    t.identity = nil                    -- The name of the save directory (string)
    t.version = "0.10.2"                -- The LÖVE version this game was made for (string)
    t.console = false                   -- Attach a console (boolean, Windows only)
    t.accelerometerjoystick = true      -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
    t.externalstorage = false           -- True to save files (and read from the save directory) in external storage on Android (boolean)
    t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)

    t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
    t.window.borderless = false         -- Remove all border visuals from the window (boolean)
    t.window.resizable = false          -- Let the window be user-resizable (boolean)
    t.window.minwidth = 1               -- Minimum window width if the window is resizable (number)
    t.window.minheight = 1              -- Minimum window height if the window is resizable (number)
    t.window.fullscreen = false         -- Enable fullscreen (boolean)
    t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
    t.window.vsync = true               -- Enable vertical sync (boolean)
    t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
    t.window.display = 1                -- Index of the monitor to show the window in (number)
    t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
    t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
    t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)

    t.modules.audio = true              -- Enable the audio module (boolean)
    t.modules.event = true              -- Enable the event module (boolean)
    t.modules.graphics = true           -- Enable the graphics module (boolean)
    t.modules.image = true              -- Enable the image module (boolean)
    t.modules.joystick = true           -- Enable the joystick module (boolean)
    t.modules.keyboard = true           -- Enable the keyboard module (boolean)
    t.modules.math = true               -- Enable the math module (boolean)
    t.modules.mouse = true              -- Enable the mouse module (boolean)
    t.modules.physics = true            -- Enable the physics module (boolean)
    t.modules.sound = true              -- Enable the sound module (boolean)
    t.modules.system = true             -- Enable the system module (boolean)
    t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
    t.modules.touch = true              -- Enable the touch module (boolean)
    t.modules.video = true              -- Enable the video module (boolean)
    t.modules.window = true             -- Enable the window module (boolean)
    t.modules.thread = true             -- Enable the thread module (boolean)
end


-----------------------------------
-- main.lua
-----------------------------------
-- this is the main file that runs the game

-- love.load is run one time when the game starts
-- for setting constants and global variables
function love.load()
end

-- love.update is run every frame
-- for updating game logic
function love.update()
end

-- love.draw is run every frame after love.update
-- for drawing the game's elements
function love.draw()
end


------------------------------------------------------------------------
---- drawing
------------------------------------------------------------------------
-- draws a rectangle - (outline/fill, x, y, width, height)
love.graphics.rectangle('fill', 0, 0, 10, 10)

-- draws a circle - (outline/fill, x, y, radius)
love.graphics.circle('fill', 0, 0, 10)

-- prints text - (text, x, y)
love.graphics.print('Hello, world!', 0, 0)


------------------------------------------------------------------------
---- input
------------------------------------------------------------------------
-- returns whether a key is down - (key)
love.keyboard.isDown('a')


------------------------------------------------------------------------
---- random
------------------------------------------------------------------------
-- returns a random number - (bottom range (included), top range (not included))
love.math.random(10, 100)
