local level1 = require ('levels/1/level1')
local game = {}

local bump = require ('lib/bump')
local cron = require ('lib/cron')
local gamera = require ('lib/gamera')
local anim8 = require ('lib/anim8')

local cur_level = ""

function game.start()
  game.load()
end

function game.load()
    levels = { level1 = level1}
    change_level("level1")
end

function change_level(new)
    cur_level = new
    levels[cur_level].load()
end

function game.update(dt)
    levels[cur_level].update(dt)
end

function game.keypressed(key)
  if levels[cur_level].keypressed then
    levels[cur_level].keypressed(key)
  end
end

function game.keyreleased(key)
  if levels[cur_level].keyreleased then
    levels[cur_level].keyreleased(key)
  end
end

function game.mousepressed(x, y, button, istouch)
  if levels[cur_level].mousepressed then
    levels[cur_level].mousepressed(x, y, button, istouch)
  end
end

function game.mousereleased(x, y, button, istouch)
  if levels[cur_level].mousereleased then
    levels[cur_level].mousereleased(x, y, button, istouch)
  end
end

function game.mousemoved(x, y, dx, dy )
  if levels[cur_level].mousemoved then
    levels[cur_level].mousemoved(x, y, dx, dy)
  end
end

function game.draw()
    levels[cur_level].draw()
end

return game