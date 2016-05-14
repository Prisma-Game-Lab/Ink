local path = getPath(...)
local gameManager = require (path.."game.gameManager")
local intro = require (path.."intro")

local game = {}
local scenes
local scene

function game.load()
    --game.mouse.setVisible(false)
    --game.keyboard.setKeyRepeat( true )
    scenes = { intro = intro, menu = menu, game = gameManager}
    intro.load(function() game.change_scene("game") end)
end

function game.start()
  game.change_scene("intro")
end

function game.change_scene(new,...)
    scene = new
    scenes[scene].start(...)
end

function game.update(dt)
    scenes[scene].update(dt)
end

function game.keypressed(key)
  if scenes[scene].keypressed then
    scenes[scene].keypressed(key)
  end
end

function game.keyreleased(key)
  if scenes[scene].keyreleased then
    scenes[scene].keyreleased(key)
  end
end

function game.mousepressed(x, y, button, istouch)
  if scenes[scene].mousepressed then
    scenes[scene].mousepressed(x, y, button, istouch)
  end
end

function game.mousereleased(x, y, button, istouch)
  if scenes[scene].mousereleased then
    scenes[scene].mousereleased(x, y, button, istouch)
  end
end

function game.mousemoved(x, y, dx, dy )
  if scenes[scene].mousemoved then
    scenes[scene].mousemoved(x, y, dx, dy)
  end
end

function game.draw()
    scenes[scene].draw()
end

return game

--[[ Esse tipo de estruturacao para level talvez nao seja aproveitada
local level1 = require "levels/1/level1"
local game = {}

local bump = require 'libs/bump'
local cron = require 'libs/cron'
local gamera = require 'libs/gamera'
local anim8 = require 'libs/anim8'

function game.load()
    levels = { level1 = level1}
    change_level("level1")
end
function change_level(new)
    level = new
    levels[level].load()
end
function game.update(dt)
    levels[level].update(dt)
end
function game.keypressed(key)
  if levels[level].keypressed then
    levels[level].keypressed(key)
  end
end
function game.keyreleased(key)
  if levels[level].keyreleased then
    levels[level].keyreleased(key)
  end
end
function game.mousepressed(x, y, button, istouch)
  if levels[level].mousepressed then
    levels[level].mousepressed(x, y, button, istouch)
  end
end
function game.mousereleased(x, y, button, istouch)
  if levels[level].mousereleased then
    levels[level].mousereleased(x, y, button, istouch)
  end
end
function game.mousemoved(x, y, dx, dy )
  if levels[level].mousemoved then
    levels[level].mousemoved(x, y, dx, dy)
  end
end
function game.draw()
    levels[level].draw()
end

return game]]