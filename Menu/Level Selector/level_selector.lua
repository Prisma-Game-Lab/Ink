local buttons = require "Menu/Level Selector/buttons_level"
local game = require "src/game"

local level_selector = {}

--[[local variables used to get the title image file's width and height]]--

local tw = love.graphics.getWidth()
local th = love.graphics.getHeight()


--[[
level_selector.load

it loads the buttons of the elevel selector

it has no return

]]--
function level_selector.load()
  
  buttonsl.load()
  
end

--[[sets the background color and starts the buttons onscreen, drawing from the function buttons.start in the buttons.lua file]]--


function level_selector.start()
  love.graphics.setColor(255, 255, 255)
  buttonsl.start()
end

--[[calls the function update from the buttons.lua file]]--

function level_selector.update(dt)
  buttonsl.update(dt)
end

--[[draws the "play game" and "quit" buttons onscreen]]--

function level_selector.draw()
  buttonsl.draw()
end

function level_selector.keypressed(key)
  buttonsl.keypressed(key)
  if key == "return" and buttonsl.pressed == 1 then
    change_scene("game")
  elseif key == "return" and buttonsl.pressed == 2 then
    love.event.push("game")
    elseif key == "return" and buttonsl.pressed == 3 then
    love.event.push("game")
  end
  
end

function love.keyreleased(key)

end

function love.mousepressed(x, y, button, istouch)
  
end

function love.mousereleased(x, y, button, istouch)
 
end

function love.mousemoved(x, y, dx, dy )

end

return level_selector
