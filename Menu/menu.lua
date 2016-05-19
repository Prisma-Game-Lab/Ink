local buttons = require "Menu/buttons"
local game = require "src/game"
local menu = {}

local tw = love.graphics.getWidth()
local th = love.graphics.getHeight()

function menu.load()
  buttons.load()
end

function menu.start()
  love.graphics.setColor(255, 255, 255)
  buttons.start()
end

function menu.update(dt)
  buttons.update(dt)
end

function menu.draw()
  buttons.draw()
end

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