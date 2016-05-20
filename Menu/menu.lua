--  menu.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.

local buttons = require "Menu/buttons"
local game = require "src/game"
local menu = {}

--[[local variables used to get the title image file's width and height]]--

local tw = love.graphics.getWidth()
local th = love.graphics.getHeight()

--[[load the functions necessary to make the title screen work aka the "play game" and "quit" buttons]]--

function menu.load()
  buttons.load()
end

--[[sets the background color and starts the buttons onscreen, drawing from the function buttons.start in the buttons.lua file]]--

function menu.start()
  love.graphics.setColor(255, 255, 255)
  buttons.start()
end

--[[calls the function update from the buttons.lua file]]--

function menu.update(dt)
  buttons.update(dt)
end

--[[draws the "play game" and "quit" buttons onscreen]]--

function menu.draw()
  buttons.draw()
end

--[[changes the scene to the game or exits the game if the player presses "enter" on the "play game" and "quit" buttons respectively]]--

function menu.keypressed(key)
  buttons.keypressed(key)
  if key == "return" and buttons.pressed == 1 then
    change_scene("game")
  elseif key == "return" and buttons.pressed == 2 then
    love.event.push("quit")
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

return menu