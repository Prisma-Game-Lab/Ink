--  level_manager.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.

local level_manager = {}

require "src/player"
require "src/enemy"
require "src/camera"
require "lib/middleclass"
local bump = require 'lib/bump'
local cron = require 'lib/cron'
local anim8 = require 'lib/anim8'
--require 'lib/dialogbox'
local lselect =  require 'Menu/level selector/level_selector'

local direction = { right = 1, left = -1 }

--Require the current_level file, a .lua file that contain in tables all the informations need to add the current_level to the world


--Create a new world in bump called lvl, ikt will be used as the primary world in all collisions
local lvl = bump.newWorld(50)
--Create a new player based on the Player class (in player.lua)
--local player = Player:new(lvl,60,2400,160,245,0,0)
--Create a new empty list that later will be used to manage the enemies
local enemyList = {}
--Create a new camera based on the Gamera library in lib
--local cam = Camera:new(0,0,2469,3228)


--local dlgBox = DialogBox:new(cam, "Welcome to Samuel's Drift\n MUAHAHAHA", "bottom", 4, 0.5)

local levels = 
{
 
require "levels/1/obj1",
require "levels/1/leveltest",
require "levels/3/leveltest2",
require "levels/2/level2",
require "levels/3/level3"

}

function level_manager.load(level)
  i=level
  print(i)
  current_level = levels[i]
  obj_l1 = levels[i].table.layers[1].objects
  print("World W:"..levels[i].table.worldSize.width)
  print("World H:"..levels[i].table.worldSize.height)
   --[[if i == 1 then
     current_level = levels.level1
     curr_level = 1
   elseif i == 2 then
     current_level = levels.level2
     curr_level = 2
   elseif i == 3 then
     current_level = levels.level3
     curr_level = 3
   end]]--
   print(current_level.player)
   player = Player:new(lvl,current_level.player.x,current_level.player.y,current_level.player.w,current_level.player.h,current_level.player.speedx,player.speedy)
   
   
   cam = Camera:new(current_level.camera.x,current_level.camera.y,levels[i].table.worldSize.width,levels[i].table.worldSize.height)
   cam:changeScale(current_level.camera.scale)
   
   
   
  --song = love.audio.newSource("assets/06.mp3", "stream")
  --bg = love.graphics.newImage("assets/cenario01.png")
  lvlend = love.graphics.newImage('assets/portal.png')
  local ge = anim8.newGrid(107, 155, lvlend:getWidth(), lvlend:getHeight())
  Portalanimation = anim8.newAnimation(ge(1,'1-4'), 0.1)
  
  --Go through the objects table and add the to the world one by one
  
  for k=1, #obj_l1 do
   print(k.." "..obj_l1[k].name.." H".. obj_l1[k].size.height.." W".. obj_l1[k].size.width.." X".. obj_l1[k].position.x.." Y"..    obj_l1[k].position.y)
   lvl:add(obj_l1[k],obj_l1[k].position.x,obj_l1[k].position.y,obj_l1[k].size.width,obj_l1[k].size.height)
  end
  
  --Go through the enemies table and add the to the world one by one, the are also added to the enemyList table for further management
  for i=1,#current_level.enemys do
    local t = current_level.enemys
    table.insert(enemyList, Enemy:new(lvl, t[i].x, t[i].y, t[i].w,t[i].h,t[i].spdx))
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h,t[i].spdx)
    
  end
  
  --Go through the triggers table and add the to the world one by one
  for i=1,#current_level.triggers do
    local t = current_level.triggers
    lvl:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
    
  end
  --The list of levels that can be used in the change_scene function
  levels = {level_manager = level_manager} 
  time = 0
  --print(current_level.sounds)
  --love.audio.play(current_level.sounds.song)
  
end

function computePlayerCollisions(actualX, actualY, cols, len)
  local canWallJump = false
  
  -- percorre a lista de colisões
  for i=1,len do
    local other = cols[i].other
    if other.name == "2" or other.name == "5" then
      other.tipo = "plat" 
    elseif other.name == "floor"  then
      other.tipo = "wall" 
    end
    print(other.tipo)
    for l=1,len do
      local oother = cols[l].other
      
      -- resolve o bug de colidir com a parede e o chão ao mesmo tempo, no canto da tela
      if other.tipo == "plat" and oother.tipo == "wall" then
        canWallJump = true
      end
    end
    
    if other.tipo == "plat" then
      -- colisão com plataformas
      
      -- checa se é uma colisão lateral
      if player.x == actualX and player.speedX > 0 then
        -- se foi uma colisão lateral diminui a speedY para o walljump
        player.speedY = 100
        canWallJump = true
      else
        -- se foi uma colisão vertical
        -- batemos no chão, não temos mais velocidade de queda
        player.speedY = 0
        
        -- checa se o botão de mover está pressionado (MELHORAR)
        if love.keyboard.isDown('right') or joystick1 and joystick1:isGamepadDown('dpright') then
          player:moveRight()
        elseif love.keyboard.isDown('left') or joystick1 and joystick1:isGamepadDown('dpleft') then
          player:moveLeft()
        else
          player.speedX = 0
          if player.dir == direction.right then  
            player.currentAnimation = player.IdleanimationR
            player.currentImage = player.sheet
          elseif player.dir == direction.left then
            player.currentAnimation = player.IdleanimationL
            player.currentImage = player.sheet
          end
        end
        
        -- não estamos mais pulando
        player.jumping = false
        break
      end
    elseif other.tipo == "wall" and player.jumping or player.speedY > 0 then
      -- se batemos numa parede, e estamos pulando ou caindo
      player.speedY = 100
      canWallJump = true
    elseif other.tipo == "enemy" and player.dashing then
      -- se batemos em um inimigo dando dash
      other:deathAnimation()
      other:die()
      lvl:remove(other)
      player:increaseHp(20)
    end
  end
  
  if canWallJump then
    -- seta a animação e o estado do player  
    if player.dir == direction.right then
        --love.audio.play(sounds.kai.wall)
        player.currentAnimation = player.WallAnimationR
        player.currentImage = player.sheet
      elseif player.dir == direction.left then
        --love.audio.play(sounds.kai.wall)
        player.currentAnimation = player.WallAnimationL
        player.currentImage = player.sheet
      end
  end
  
  player.canWallJump = canWallJump
  player.x = actualX
  player.y = actualY
end

--[[ 
        change_level
        -This function is based on the "change_scene" function. When it changes all the functions in game changes and use now the current level to load,update,draw,...
        Parameters:
        -new : a string with the name of the new level, this new scene must also be inside a table, normally called "levels"
    
        Inside : 
        -Change the level based on the string in the parameter and calls that scene load function
]]
--[[function change_level(new)
    level = new
    levels[level].load()
end]]--

--Updates all that needs to be updated in this level.
 --The player update function, any animation that is praticular to the level, check the collision of the player with anybody, updated the camera position
 --Many functions here in this update won't work if the player is currently dead
 --Only update enemies if they're alive in the moment
function level_manager.update(dt)
  --dlgBox:update(dt)

  local playerin = false
  local enemyin = false
  local levelend = false
  
  if player.alive then
    time =  time + dt
    
    -- update do player
    player:update(dt)
    
    -- update da animação do portal
    Portalanimation:update(dt)
  
    -- update da posição da câmera
    cam:update(player:getX(),player:getY(),dt)
  
    -- update dos inimigos
    for i,enemy in ipairs(enemyList) do
      if enemy.alive then
        enemy:update(dt)
        enemy.x, enemy.y, cols, len = lvl:move(enemy, enemy.x + enemy.speedX * dt, enemy.y)
      end
    end
    
    actualX, actualY, cols, len = lvl:move(player, player.x + player.speedX * dt, player.y + player.speedY * dt)
    
    computePlayerCollisions(actualX, actualY, cols, len)
    
    -- Gambiarra para fazer com que o player tome dano --
    local items, len = lvl:queryRect(player:getX()-1,player:getY(),player:getW()+2,player:getH()+1)
    if len > 1 then
      for i=1,len,1 do
          if items[i].tipo == "player" then
            playerin = true
          elseif items[i].tipo == "enemy" then
            enemyin = true
          elseif items[i].tipo == "levelend" then
            player:die()
            level_manager.isFinished = true
          end
      end
      
      if playerin and enemyin and not player.dashing then
        player:push(lvl,100,-player.dir)
        print("dano")
        player:takeDamage(10)
      end
    end

  else 
    love.audio.stop(current_level.sounds.song) 
    --savefile = io.open("D:\\Users\\rudaf\\Documents\\Zero Brane Projects\\Project Nanquim\\branches\\level_loader\\savegame\\SAVE01.txt","w")
           
    
    --io.output(savefile)
    --io.write("Level "..curr_level.."\n",player.hp,"\n",time,"\n")
  end 
end
function level_manager.keypressed(key)
  --if key == "r" then
    --level_manager.reset()  
    --change_scene("logo")
  --end
  
  if player.keypressed then
    player:keypressed(lvl, key)
  end
  
end

function level_manager.keyreleased(key)
  if player.keyreleased then
    player:keyreleased(key)
  end
end

function level_manager.mousepressed(x, y, button, istouch)
  

end

function level_manager.mousereleased(x, y, button, istouch)
  

end

function level_manager.mousemoved(x, y, dx, dy )
  
 
end
--[[
     -Draw the current_level in the level
     -Only draw current_level there are currently visible to the camera, that's why there's a camera draw on the firts line
     -There's a serie of loops to draw all the objetcs present in the obj1.lua file
     -Draw the player based on the camera
]]
function level_manager.draw()
  cam:getCamera():draw(function(l,t,w,h)
    --DRAW STUFF HERE
    --love.graphics.draw(current_level.background.bg,0,0)
    
    for i,enemy in ipairs(enemyList) do
      if enemy.alive then
        enemy:draw()
      end
    end
    love.graphics.setColor(112,112,112)
    

    for k=1, #obj_l1 do
    love.graphics.rectangle("line",obj_l1[k].position.x,obj_l1[k].position.y,obj_l1[k].size.width,obj_l1[k].size.height)
    if obj_l1[k].name == "2" then
    love.graphics.draw(current_level.plataformas[2],obj_l1[k].position.x,obj_l1[k].position.y)
    elseif obj_l1[k].name == "5" then
    love.graphics.draw(current_level.plataformas[5],obj_l1[k].position.x,obj_l1[k].position.y)
    elseif obj_l1[k].name == "floor" then
    love.graphics.draw(current_level.plataformas[6],obj_l1[k].position.x,obj_l1[k].position.y)
    end
   end
    
    love.graphics.setColor(255,255,255) --Com (0,0,0) fica foda !!!
    for i=1,#current_level.triggers,1 do
      local t = current_level.triggers
      if t[i].tipo == "levelend" then
      Portalanimation:draw(lvlend,t[i].x,t[i].y)
      end
    end
    
    love.graphics.print(string.sub(tostring(time), 1, 4),l + 550,t+10,0,0.3,0.3)
    player:draw(cam)
   -- dlgBox:draw(cam)
   
   if level_manager.isFinished then
     level_manager.showStats()
   end
   
    
  end)
end

--[[ 
        level_manager.reset
        -Function in WORKS
        -Function that remove all current_level from the current world
    
        Inside : 
        -A serie of loops that go trough all that was added and remove them.
        
        >>>NOT WORKING IN THIS BUILD
]]
function level_manager.reset()
  for i=1,#current_level.plataformas do
    local t = current_level.plataformas
    lvl:remove(t[i])
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
  end
  
  for i, enemy in ipairs(enemyList) do
    local t = current_level.enemys
    lvl:remove(enemy)
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h,t[i].spdx)
  end
  for i=1,#current_level.triggers do
    local t = current_level.triggers
    lvl:remove(t[i])
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)    
  end
  player:removePlayer(lvl)
  love.audio.stop(current_level.sounds.song) 
  
end

function level_manager.showStats()
  love.graphics.setColor(155, 155, 155, 100)
  x1,y1,x2,y2,x3,y3,x4,y4 = cam:getCamCorners()
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  love.graphics.rectangle('fill', x1 + w/2, y1+h/2, 1000, 700)
  love.graphics.setColor(155, 0, 0, 255)
  love.graphics.printf("Level: " ..tostring(curr_level).. "\n\nHP: " ..math.floor(player.hp).. "\n\nTime: " ..string.sub(time,1,4).. "\n", x1 + w/2, y1+h/2 + 50, 1000, 'center')
  love.graphics.setColor(155, 155, 155)
  
end

return level_manager