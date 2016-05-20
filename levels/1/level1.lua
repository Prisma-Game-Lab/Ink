--  level1.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.

local level1 = {}

require "src/player"
require "src/enemy"
require "src/camera"
local bump = require 'lib/bump'
local cron = require 'lib/cron'
local anim8 = require 'lib/anim8'

--Create a new world in bump called lvl1, ikt will be used as the primary world in all collisions
local lvl1 = bump.newWorld(50)
--Create a new player based on the Player class (in player.lua)
local player = Player:new(lvl1,60,1295,30,45,0,0)
--Create a new empty list that later will be used to manage the enemies
local enemyList = {}
--Create a new camera based on the Gamera library in lib
local cam = Camera:new(0,0,2560,1440)
--Require the objects file, a .lua file that contain in tables all the informations need to add the objects to the world
local objects = require "levels/1/obj1"

function level1.load()
  song = love.audio.newSource("assets/06.mp3", "stream")
  bg = love.graphics.newImage("assets/Background1.png")
  lvlend = love.graphics.newImage('assets/portal.png')
  local ge = anim8.newGrid(107, 155, lvlend:getWidth(), lvlend:getHeight())
  Portalanimation = anim8.newAnimation(ge(1,'1-4'), 0.1)
  
  --Go through the platforms table and add the to the world one by one
  for i=1,#objects.plataformas do
    local t = objects.plataformas
    lvl1:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
  end
  --Go through the enemies table and add the to the world one by one, the are also added to the enemyList table for further management
  for i=1,#objects.enemys do
    local t = objects.enemys
    table.insert(enemyList, Enemy:new(lvl1, t[i].x, t[i].y, t[i].w,t[i].h,t[i].spdx))
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h,t[i].spdx)
    
  end
  --Go through the triggers table and add the to the world one by one
  for i=1,#objects.triggers do
    local t = objects.triggers
    lvl1:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
    
  end
  --The list of levels that can be used in the change_scene function
  levels = {level1 = level1} 
  time = 0
  love.audio.play(song)
end
--[[ 
        change_level
        -This function is based on the "change_scene" function. When it changes all the functions in game changes and use now the current level to load,update,draw,...
        Parameters:
        -new : a string with the name of the new level, this new scene must also be inside a table, normally called "levels"
    
        Inside : 
        -Change the level based on the string in the parameter and calls that scene load function
]]
function change_level(new)
    level = new
    levels[level].load()
end

--Updates all that needs to be updated in this level.
 --The player update function, any animation that is praticular to the level, check the collision of the player with anybody, updated the camera position
 --Many functions here in this update won't work if the player is currently dead
 --Only update enemies if they're alive in the moment
function level1.update(dt)
  local playerin = false
  local enemyin = false
  local levelend = false
  
  if player.alive then
  player:update(lvl1, dt)
  Portalanimation:update(dt)
  time =  time + dt
  local items, len = lvl1:queryRect(player:getX()-1,player:getY(),player:getW()+2,player:getH()+1)
  if len > 1 then
      for i=1,len,1 do
          if items[i].tipo == "player" then
            playerin = true
          elseif items[i].tipo == "enemy" then
            enemyin = true
          elseif items[i].tipo == "levelend" then
            player:die()
          end
      end
    if playerin and enemyin and not player.dashing then
      player:push(lvl1,100,-player.dir)
      print("dano")
      player:takeDamage(10)      
    end  
  end
  
  cam:update(player:getX(),player:getY(),dt)
  if player:getY() > 1440 then
    player:die()
  end
    for i,enemy in ipairs(enemyList) do
      if enemy.alive then
        enemy:update(lvl1, dt)
      end
    end
  end
end
function level1.keypressed(key)
  --[[if key == "r" then
    level1.reset()  
    change_scene("logo")
  end
  -]]
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
--[[
     -Draw the objects in the level
     -Only draw objects there are currently visible to the camera, that's why there's a camera draw on the firts line
     -There's a serie of loops to draw all the objetcs present in the obj1.lua file
     -Draw the player based on the camera
]]
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
    
    love.graphics.print(tostring(math.floor(time)),l + 550,t+10,0,0.3,0.3)
    player:draw(cam)
     
    
  end)
end

--[[ 
        level1.reset
        -Function in WORKS
        -Function that remove all objects from the current world
    
        Inside : 
        -A serie of loops that go trough all that was added and remove them.
        
        >>>NOT WORKING IN THIS BUILD
]]
function level1.reset()
  for i=1,#objects.plataformas do
    local t = objects.plataformas
    lvl1:remove(t[i])
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
  end
  
  for i, enemy in ipairs(enemyList) do
    lvl1:remove(enemy)
  end
  for i=1,#objects.triggers do
    local t = objects.triggers
    lvl1:remove(t[i])
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)    
  end
  --player:removePlayer(lvl1)
end
return level1