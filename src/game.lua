local level_manager = require ('src/level_manager')
local game = {}

local bump = require ('lib/bump')
local cron = require ('lib/cron')
local gamera = require ('lib/gamera')
local anim8 = require ('lib/anim8')
local lselect = require 'Menu/level selector/level_selector'



local cur_level = ""

function game.start(level)
  game.load(level)
  
  print(level)
end

function game.load(level)
  level_manager.load(level)
        
end



function game.update(dt)
    level_manager.update(dt)
end

function game.keypressed(key)
  if level_manager.keypressed then
    level_manager.keypressed(key)
  end
end

function game.keyreleased(key)
  if level_manager.keyreleased then
    level_manager.keyreleased(key)
  end
end

function game.mousepressed(x, y, button, istouch)
  if level_manager.mousepressed then
    level_manager.mousepressed(x, y, button, istouch)
  end
end

function game.mousereleased(x, y, button, istouch)
  if level_manager.mousereleased then
    level_manager.mousereleased(x, y, button, istouch)
  end
end

function game.mousemoved(x, y, dx, dy )
  if level_manager.mousemoved then
    level_manager.mousemoved(x, y, dx, dy)
  end
end

function game.draw()
    level_manager.draw()
end

return game