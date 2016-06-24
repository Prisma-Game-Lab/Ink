--  level_manager.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.

local level_manager = {}

require "src/player"
require "src/enemy"
require "src/camera"
require "src/save_game"
--require "src/stats_screen"
require "lib/middleclass"
local bump = require 'lib/bump'
local cron = require 'lib/cron'
local anim8 = require 'lib/anim8'
--require 'lib/dialogbox'
local lselect =  require 'Menu/level selector/level_selector'

local direction = { right = 1, left = -1 }



--Require the current_level file, a .lua file that contain in tables all the informations need to add the current_level to the world


--Create a new world in bump called lvl, ikt will be used as the primary world in all collisions
local lvl = nil
--Create a new player based on the Player class (in player.lua)
--local player = Player:new(lvl,60,2400,160,245,0,0)
--Create a new empty list that later will be used to manage the enemies
local enemyList = {}
--Create a new camera based on the Gamera library in lib
--local cam = Camera:new(0,0,2469,3228)

local gameRunning = false

--local dlgBox = DialogBox:new(cam, "Welcome to Samuel's Drift\n MUAHAHAHA", "bottom", 4, 0.5)

local levels = 
{
require "levels/1/demofinal",
}

local overlay = require "levels/1/Teste_Overlays"

local level_id = 0
function level_manager.load(level)
  -- Cria um mundo zerado
  lvl = bump.newWorld(50)
  
  level_id = level
  current_level = levels[level_id]
  print("level", level_id, #levels)
  
  obj_l1 = current_level.table.layers[1].objects
  --over = table.layers[2]
  
  print("World W:"..current_level.table.worldSize.width)
  print("World H:"..current_level.table.worldSize.height)
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
   --print(current_level.player)
   
   
   cam = Camera:new(current_level.camera.x, current_level.camera.y, current_level.table.worldSize.width, current_level.table.worldSize.height)
   cam:changeScale(current_level.camera.scale)
   
   
  level_manager.isFinished = false
  lvlend = love.graphics.newImage('assets/portal.png')
  local ge = anim8.newGrid(107, 155, lvlend:getWidth(), lvlend:getHeight())
  Portalanimation = anim8.newAnimation(ge(1,'1-4'), 0.1)
  
  --Go through the objects table and add the to the world one by one
  
  for k=1, #obj_l1 do
   print(k.." "..obj_l1[k].name.." H".. obj_l1[k].size.height.." W".. obj_l1[k].size.width.." X".. obj_l1[k].position.x.." Y"..    obj_l1[k].position.y)
   if string.find(obj_l1[k].name, "chao") then
   lvl:add(obj_l1[k],obj_l1[k].position.x,obj_l1[k].position.y,obj_l1[k].size.width,obj_l1[k].size.height)
   end
  end
  
  --Go through the enemies table and add the to the world one by one, the are also added to the enemyList table for further management
  enemyList = {}
  for i=1,#current_level.enemys do
    local t = current_level.enemys
    local e = Enemy:new(lvl, t[i].x, t[i].y, t[i].w,t[i].h,t[i].spdx)
    table.insert(enemyList, e)
  end
  
  --Go through the triggers table and add the to the world one by one
  for i=1,#current_level.triggers do
    local t = current_level.triggers
    lvl:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
    print(t[i].name,t[i].x,t[i].y,t[i].w,t[i].h)
    
  end
  --The list of levels that can be used in the change_scene function
  levels.level_manager = level_manager
  time = 0
  player = Player:new(lvl,current_level.player.x,current_level.player.y,current_level.player.w,current_level.player.h,current_level.player.speedx,current_level.player.speedy)
  
  VUL_CLOCK = cron.after(3,player.change_vul)
  HIT_CLOCK = cron.after(1,player.change_hit)

  --print(current_level.sounds)
  --love.audio.play(current_level.sounds.song)
  
end

function computePlayerCollisions(actualX, actualY, cols, len)
  local canWallJump = false
  
  -- percorre a lista de colisões
  for i=1,len do
    local other = cols[i].other
    if string.find(other.name, "plat_") then
      other.tipo = "plat" 
    elseif string.find(other.name, "wall_")  then
      other.tipo = "wall" 
    elseif string.find(other.name, "chao")  then
      other.tipo = "plat"
    elseif string.find(other.name, "parede")  then
      other.tipo = "wall"
    end
    --print(other.tipo)
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
      if player.x == actualX and not (player.speedX == 0) then
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
            player.currentImage = player.idle_sheet
            player.offsetx = 0
            player.offsety = 0
          elseif player.dir == direction.left then
            player.currentAnimation = player.IdleanimationL
            player.currentImage = player.idle_sheet
            player.offsetx = 0
            player.offsety = 0
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
      other:dying()
      lvl:remove(other)
      player:increaseHp(20)
      player:gainInk(20)
    end
  end
  
  if canWallJump then
    -- seta a animação e o estado do player  
    if player.dir == direction.right then
        --love.audio.play(sounds.kai.wall)
        player.currentAnimation = player.WallAnimationR
        player.currentImage = player.wall_sheet
        player.offsetx = 65
        player.offsety = -40
      elseif player.dir == direction.left then
        --love.audio.play(sounds.kai.wall)
        player.currentAnimation = player.WallAnimationL
        player.currentImage = player.wall_sheet
        player.offsetx = 45
        player.offsety = -40
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
    
    if gameRunning then
      time =  time + dt
    end
    
    -- update do player
    player:update(dt)
    
    -- update da animação do portal
    Portalanimation:update(dt)
    
    -- update da posição da câmera
    cam:update(player:getX(),player:getY(),dt)
    
    -- update dos inimigos
    for i,enemy in ipairs(enemyList) do
      if enemy.alive and not enemy.dyingstate then
        enemy:update(dt)
        enemy.x, enemy.y, cols, len = lvl:move(enemy, enemy.x + enemy.speedX * dt, enemy.y)
      elseif enemy.dyingstate then
        enemy:update(dt)
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
      
      if playerin and enemyin and not player.dashing and player.vulnerable then
        player:change_hit()
        player:takeDamage(50)
        player:change_vul()
        --player:move(-player.dir*1000)
      end
    end
    
    --print(player.TK_HIT)

  else 
    love.audio.stop(current_level.sounds.song)
    gameRunning = false
    player.can_move = false
  end 
  if level_manager.isFinished then
    print("YOU WIN")
  end
  if not player.vulnerable then
  VUL_CLOCK:update(dt)
elseif player.vulnerable then
  VUL_CLOCK:reset()
end
 --player:push(lvl,2000,player.dir,dt)
  if not player.TK_HIT then
   HIT_CLOCK:reset()
 elseif player.TK_HIT then
   HIT_CLOCK:update(dt)
   player:push(lvl,500,player.dir,dt)
  end

  
end
function level_manager.keypressed(key)
  if key == "r" then
    level_manager.load(level_id)
    gameRunning = false
    player.can_move = false
  end
  
  if key == "m" then
    change_scene("menu")
    gameRunning = false 
    player.can_move = false
    end
  
  if key == "w" or key == "a" or key == "s" or key == "d" or key == "return" or key == "up" or key == "down" or key == "right" or key == "left" then
    gameRunning = true
    player.can_move = true
  end
    
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
    love.graphics.draw(current_level.background.bg,0,0)
    
  
    --love.graphics.setColor(112,112,112)
    

    for k=1, #obj_l1 do
    --love.graphics.rectangle("line",obj_l1[k].position.x,obj_l1[k].position.y,obj_l1[k].size.width,obj_l1[k].size.height)
    if string.find(obj_l1[k].name, "plat_") then
        local index = tonumber(string.match(obj_l1[k].name, "%d+"))
        --print("index : "..index)
          love.graphics.draw(current_level.plataformas[index],obj_l1[k].position.x,obj_l1[k].position.y)
    elseif string.find(obj_l1[k].name, "wall_") then
      --love.graphics.draw(current_level.plataformas[17],obj_l1[k].position.x,obj_l1[k].position.y)
    elseif string.find(obj_l1[k].name, "chao") then
      --love.graphics.rectangle("line",obj_l1[k].position.x,obj_l1[k].position.y,obj_l1[k].size.width,obj_l1[k].size.height)
      love.graphics.draw(current_level.plataformas[1],obj_l1[k].position.x,obj_l1[k].position.y)
    elseif string.find(obj_l1[k].name, "parede") then
      love.graphics.draw(current_level.plataformas[2],obj_l1[k].position.x,obj_l1[k].position.y)
    elseif string.find(obj_l1[k].name, "janela") then
      love.graphics.draw(current_level.plataformas[3],obj_l1[k].position.x,obj_l1[k].position.y)
    elseif string.find(obj_l1[k].name, "pergaminho") then
      --love.graphics.draw(current_level.plataformas[4],obj_l1[k].position.x,obj_l1[k].position.y)
    end
    
   end
     for i,enemy in ipairs(enemyList) do
      if enemy.alive then
        enemy:draw()
      end
    end
    
    for i=1,#current_level.triggers,1 do
      local t = current_level.triggers
      if t[i].tipo == "levelend" then
      Portalanimation:draw(lvlend,t[i].x,t[i].y)
      end
    end
    
    love.graphics.print(string.sub(tostring(time), 1, 4),l + 550,t+10,0,1,1)
    player:draw(cam)
   -- dlgBox:draw(cam)
   
   if level_manager.isFinished then
     showStats(i)
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



return level_manager