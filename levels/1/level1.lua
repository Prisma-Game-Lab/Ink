local level1 = {}

require "src/player"
require "src/camera"
local bump = require 'lib/bump'
local cron = require 'lib/cron'
local anim8 = require 'lib/anim8'

local lvl1 = bump.newWorld(50)
local player = Player:new(lvl1,60,1295,30,45,0,0)

local cam = Camera:new(0,0,2560,1440)

local objects = require "levels/1/obj1"
--cam1:setScale(0.5)

function level1.load()
  bg = love.graphics.newImage("assets/Background1.png")
  
  for i=1,#objects.plataformas do
    local t = objects.plataformas
    lvl1:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
    print(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
  end
  
  levels = {level1 = level1} 
end

function change_level(new)
    level = new
    levels[level].load()
end

function level1.update(dt)
  player:update(lvl1,dt)
  cam:update(player:getX(),player:getY(),dt)
end

function level1.keypressed(key)
  if player.keypressed then
    player:keypressed(lvl1, key)
  end
  
end

function level1.keyreleased(key)
  if player.keyreleased then
    player:keyreleased(key)
  end
end

function level1.mousepressed(x, y, button, istouch)
  

end

function level1.mousereleased(x, y, button, istouch)
  

end

function level1.mousemoved(x, y, dx, dy )
  
 
end

function level1.draw()
  cam:getCamera():draw(function(l,t,w,h)
    --DRAW STUFF HERE
    love.graphics.draw(bg,0,0)
    love.graphics.print("LEVEL 1",0,0)

    player:draw()

    for i=1,#objects.plataformas,1 do
      local t = objects.plataformas
      love.graphics.rectangle("fill",t[i].x,t[i].y,t[i].w,t[i].h)
    end
  end)
end

return level1