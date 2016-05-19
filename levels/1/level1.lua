local level1 = {}

require "src/player"
require "src/enemy"
require "src/camera"
local bump = require 'lib/bump'
local cron = require 'lib/cron'
local anim8 = require 'lib/anim8'

local lvl1 = bump.newWorld(50)
local player = Player:new(lvl1,60,1295,30,45,0,0)

local enemyList = {}


local cam = Camera:new(0,0,2560,1440)

local objects = require "levels/1/obj1"
--cam1:setScale(0.5)

function level1.load()
  bg = love.graphics.newImage("assets/Background1.png")
  lvlend = love.graphics.newImage('assets/portal.png')
  local ge = anim8.newGrid(107, 155, lvlend:getWidth(), lvlend:getHeight())
  Portalanimation = anim8.newAnimation(ge(1,'1-4'), 0.1)
  
  for i=1,#objects.plataformas do
    local t = objects.plataformas
    lvl1:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
  end
  
  for i=1,#objects.enemys do
    local t = objects.enemys
    table.insert(enemyList, Enemy:new(lvl1, t[i].x, t[i].y, t[i].w,t[i].h,t[i].spdx))
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h,t[i].spdx)
    
  end
  for i=1,#objects.triggers do
    local t = objects.triggers
    lvl1:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
    
  end
  
  levels = {level1 = level1} 
  
  for i,enemy in ipairs(enemyList) do
    if enemy.alive then
      enemy:moveRight(lvl1)
    end
  end
end

function change_level(new)
    level = new
    levels[level].load()
end

function level1.update(dt)
  if player.alive then
  player:update(lvl1, dt)
  player:decreaseHp(dt)
  Portalanimation:update(dt)
  
  cam:update(player:getX(),player:getY(),dt)
  
    for i,enemy in ipairs(enemyList) do
      if enemy.alive then
        enemy:update(lvl1, dt)
      end
    end
  end
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
    
    for i,enemy in ipairs(enemyList) do
      if enemy.alive then
        enemy:draw()
      end
    end
    love.graphics.setColor(112,112,112)
    for i=1,#objects.plataformas,1 do
      local t = objects.plataformas
      love.graphics.rectangle("fill",t[i].x,t[i].y,t[i].w,t[i].h)   
    end
    love.graphics.setColor(255,255,255) --Com (0,0,0) fica foda !!!
    for i=1,#objects.triggers,1 do
      local t = objects.triggers
      if t[i].tipo == "levelend" then
      Portalanimation:draw(lvlend,t[i].x,t[i].y)
      end
    end
    
    player:draw(cam)
     
    
  end)
end

return level1