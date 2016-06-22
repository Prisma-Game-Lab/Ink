--  player.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.

require 'src/art-config'

local class = require 'lib/middleclass'
local cron = require 'lib/cron'
local anim8 = require "lib/anim8"

require "lib/bump"


Player = class('Player')

local JMP_SPD = -1000
local HOP_SPD = -500
local WALK_SPD = 800
local DASH_SPD = 1200
local GRAVITY = 2000
local dashin_counter = 0
local DASH_TIME = 0.88
local direction = { right = 1, left = -1 }
local HP_TIME_SEC = 250
local DASH_CD = 0
local WALLJUMP_CD = 0
local INV_CD = 0


local sounds = require "assets/sound/soundTest"


--[[Player:initialize
- inizializes all the variables of the class 'player'

Parameters:
  - world: the world created on the 'level' module used to move the player and do all the collision
  - x: the initial x position of the player, relative to the top left corner of the screen
  - y: the initial y position of the player, relative to the top left corner of the screen
  - w: the width of the player's hit box
  - h: the height of the player's hit box
  - speedX: the initial speed in the horizontal direction of the player 
  - speedY: the initial speed in the vertical direction of the player 
  Returns: -nothing-
]]--
function Player:initialize(world, x, y, w, h, speedX, speedY)
  self.x = x
  self.y = y
  self.w = w -- width da primeira animação
  self.h = h -- height da primeira animação
  self.speedX = speedX
  self.speedY = speedY
  self.dir = direction.right
  self.walking = false
  self.dashing = false
  self.jumping = true
  self.canWallJump = false
  self.hp = 100
  self.alive = true
  self.tipo = "player"
  print("Player :"..self.x,self.y,self.w,self.w)
  self.dash_indicator = love.graphics.newImage('assets/Dash_CD.png')
  
  self.vulnerable = true
  self.TK_HIT = false
  
  self.inkGained = 0
  
  self.deathSound = love.audio.newSource('assets/YouDied.mp3', 'static') 
  self.deathImg = love.graphics.newImage('assets/youdied.png')  
  self.hpBar = love.graphics.newImage('assets/HPBAR.png')
  self.sheet = love.graphics.newImage('assets/kaiTest/spritesheet_kai.png')
  
  local g = anim8.newGrid(264,352, self.sheet:getWidth(), self.sheet:getHeight())
  self.WalkanimationR = anim8.newAnimation(g('1-16',3), 0.05)
  self.WalkanimationL = anim8.newAnimation(g('1-16',2), 0.05)
  
  self.IdleanimationR = anim8.newAnimation(g('1-8',1),0.125)
  self.IdleanimationL = anim8.newAnimation(g('9-16',1),0.125)
  
  self.DASH = love.graphics.newImage('assets/kaiTest/spritesheet_kai2.png')
  local gd = anim8.newGrid(310,264, self.DASH:getWidth(), self.DASH:getHeight())

  self.DashanimationR = anim8.newAnimation(gd('1-11',1), 0.08)
  self.DashanimationL = anim8.newAnimation(gd('1-11',2), 0.08)
  
  self.JumpAnimationL = anim8.newAnimation(g('5-7',6), 0.5)
  self.JumpAnimationR = anim8.newAnimation(g('5-7',7), 0.5)
  
  self.WallAnimationR = anim8.newAnimation(g(1,4), 0.5)
  self.WallAnimationL = anim8.newAnimation(g(1,5), 0.5)  

  self.FallAnimationR = anim8.newAnimation(g('7-13',7), 0.16)
  self.FallAnimationL = anim8.newAnimation(g('7-13',6), 0.16)
  
  

  self.currentAnimation = self.IdleanimationL
  self.currentImage = self.sheet

  world:add(self, self.x, self.y, self.w, self.h)
end


--[[Player:jump
- makes tha player jump

Parameters:
  - world: calls the created world to make the player move accordingly to the 'bump.lua' lib used
  
  returns: -nothing-
]]--
function Player:jump(world)
  if self.dashing then
    return
  end
  
  local canJump = false
    
  local actualX, actualY, cols, len = world:check(self, self.x, self.y+1)
  
  for i=1,len do
    local other = cols[i].other
    if other.tipo == "plat" then
      canJump = true
      break
    end
  end
    
  if canJump or self.canWallJump then
    
    if self.canWallJump then
      WALLJUMP_CD = 0.2
      if self.dir == direction.right then
        self:moveLeft()
      elseif self.dir == direction.left then
        self:moveRight()
      end
    end
    
    self.speedY = JMP_SPD
    self.jumping = true
  end
end

--[[Player:shortHop
- like the function above, makes the player jump, but only a short height depending on how much time he mantain pressed the button 

Parameters:
  - None
  
  returns: -nothing-
]]--
function Player:shortHop()
  if self.speedY < HOP_SPD then
    self.speedY = HOP_SPD
  end
end

--[[Player:Keypressed
- function of the LÖVE 2D engine that reads the keys pressed on the keyboard 

Parameters:
  - lvl: uses tha lvl parameter to send the world to the jump function
  - key: parameter defined by the engine

  returns: -nothing-
]]--
function Player:keypressed(lvl, key)
  if self.alive then
    if key == "up" or key == "w" or key == "space" then
      love.audio.stop(sounds.kai.walk)
      love.audio.stop(sounds.kai.wall)
      love.audio.play(sounds.kai.pulo2)
      self:jump(lvl)
      
    end

    if key == "right" then
      love.audio.play(sounds.kai.walk)
      self:moveRight()
    end
    
    if key == "left" then
      love.audio.play(sounds.kai.walk)
      self:moveLeft()
    end
    if key == 'd' then
      local r = math.random(1,3)
      print(sounds.kai.dash[r].dash)
      love.audio.play(sounds.kai.dash[r].dash)
      self:dash()  
    end
  end
end

--[[Player:keyreleased
- function from the engine, works the same way as the function above, only diference it receives the keys that were realesed instead of the pressed ones

Parameters:
  - Key: parameter defined by the engine 
  
  returns: -nothing-
]]--
function Player:keyreleased(key)
  if self.alive then
    if key == 'up' then
      self:shortHop()
    end
    
    if key == "right" then
      if self.speedX > 0 and self.dashing == false then
        love.audio.stop(sounds.kai.walk)
        self:stop()
      end
    end
    
    if key == "left" then
      if self.speedX < 0 and self.dashing == false then
        love.audio.stop(sounds.kai.walk)
        self:stop()
      end
    end
  end
end 

--[[Player:moveRight
- defines the movement of the player to the right on the horizontal 

Don't uses parameters
returns nothing
]]--
function Player:moveRight()
  if self.dashing then
    return
  end
  
  self.dir = direction.right
  self:move(self.dir*WALK_SPD)
  
  if not self.jumping then
    self.currentAnimation = self.WalkanimationR
    self.currentImage = self.sheet
  end
end

--[[Player:moveLeft
- defines the movement of the player to the left on the horizontal 

Don't uses parameters
returns nothing
]]--
function Player:moveLeft()
  if self.dashing then
    return
  end
  
  self.dir = direction.left
  self:move(self.dir*WALK_SPD)
  
  if not self.jumping then
    self.currentAnimation = self.WalkanimationL
  end
end

--[[Player:move
- defines the speed of the player on the horizontal 

Parameters:
  - spd: sets the player's actual speed for the movement 
returns nothing
]]--
function Player:move(spd)
  if self.dashing then
    return
  end
  
  self.speedX = spd
  self.walking = true
end

--[[Player:stop
- used to stop, when necessary, a movement of the player, this way seting it in the iddle animation

Don't uses parameters
returns nothing
]]--
function Player:stop()
  if self.dir == direction.right then
    self.currentImage = self.sheet
    self.currentAnimation = self.IdleanimationR
  elseif self.dir == direction.left then
    self.currentImage = self.sheet
    self.currentAnimation = self.IdleanimationL
  end
  self.speedX = 0
  self.walking = false
  self.dashing = false
end

--[[Player:dash
- makes the player dash in a higher speed than its normal, and function as an attack as well, but also reduces the player's HP

Don't uses parameters
returns nothing
]]--
function Player:dash()
  if DASH_CD == 0 then
  if not self.dashing and not self.canWallJump then
    dashin_counter = 0
    self:stop()
    self:move(self.speedX + self.dir*DASH_SPD)
    
    self.walking = false
    self.dashing = true
    
    if self.dir == direction.right then
      self.currentAnimation = self.DashanimationR
      self.currentImage = self.DASH
    elseif self.dir == direction.left then
      self.currentAnimation = self.DashanimationL
      self.currentImage = self.DASH
    end
    
    self.hp = self.hp - 5
  end
  end
end

--[[Player:draw
- used to draw the player 

Parameters:
  - cam: an instance of the class camera used in the game to follow the player 
  
  returns nothing
]]--
function Player:draw(cam)
  local camLeft, camTop = cam:getCamera():getVisible()
  local wI,hI = self.currentAnimation:getDimensions()
  local ofx,ofy = wI-self.w,hI-self.h
  
  self.currentAnimation:draw(self.currentImage,self.x-ofx+80,self.y-ofy)-- Player ANIMATION BOX
  
  if not self.vulnerable then
    love.graphics.setColor(153,0,0)
  else love.graphics.setColor(255,255,255)
    end
  
   if self.dashing and self.dir == 1 and not self.canWallJump  then 
    for i=1,8 do
    self.currentAnimation:draw(self.currentImage,self.x-ofx+80-(self.dir*20*i),self.y-ofy)
    love.graphics.setColor(255,255-(32*i),255-(32*i),232-(32*i))
    end
  elseif self.dashing and self.dir == -1 and not self.canWallJump  then    
     for i=1,8 do
    self.currentAnimation:draw(self.currentImage,self.x-ofx+80-(self.dir*20*i),self.y-ofy)
    love.graphics.setColor(255,255-(32*i),255-(32*i),232-(32*i))
    end    
  end
  
  love.graphics.rectangle("line",self.x,self.y,self.w,self.h) -- Player HITBOX
  
  self:drawHp(cam)
  if not self.alive then
    --love.graphics.draw(self.deathImg,camLeft,camTop + 360)
  end
end

--[[Player:update
- used to make the game loop updating by the time its parameters

Parameters:
  - world: uses the world to define the players movements by the 'bump.lua' lib
  - dt: time parameter used to the lesser delta time of the PC
  
  returns nothing
]]--
function Player:update(dt)
 
  self.currentAnimation:update(dt)
  
  if love.keyboard.isDown('right') and WALLJUMP_CD == 0 then
    self:moveRight()
  elseif love.keyboard.isDown('left') and WALLJUMP_CD == 0 then
    self:moveLeft()
  end
  
  WALLJUMP_CD = WALLJUMP_CD - dt
    if WALLJUMP_CD < 0 then
      WALLJUMP_CD = 0
    end

  if self.dashing then
    if dashin_counter > DASH_TIME then
      -- se acabou o dash --
      -- para o dash
      self.dashing = false
      self:stop()
      DASH_CD = 0.5
      
      -- atualiza para moveRight ou moveLeft se a tecla left ou right estiverem pressionadas
      if love.keyboard.isDown('right') or joystick1 and joystick1:isGamepadDown('dpright') then
        self:moveRight()
      elseif love.keyboard.isDown('left') or joystick1 and joystick1:isGamepadDown('dpleft') then
        self:moveLeft()
      end 
    else
      -- se o dash ainda não acabou
      -- atualiza o contador de tempo e não sofre a ação da gravidade
      dashin_counter = dashin_counter + dt
      self.speedY = 0
    end
  else
    DASH_CD = DASH_CD - dt
    if DASH_CD < 0 then
      DASH_CD = 0 
    end
    -- se o player não está dando dash ele sofre a ação da gravidade
    self.speedY = self.speedY + GRAVITY*dt
  end

  if self.speedY > 0 and not self.canWallJump then
    -- speedY > 0 significa que estamos caindo, então atualizamos a animação
    if self.dir == direction.right then
      self.currentAnimation = self.FallAnimationR
      self.currentImage = self.sheet
    elseif self.dir == direction.left and not self.canWallJump  then
      self.currentAnimation = self.FallAnimationL
      self.currentImage = self.sheet
    end
  elseif self.speedY < 0 then
    -- speedY < 0 significa que estamos pulando, então atualizamos a animação
    if self.dir == direction.right then
      self.currentAnimation = self.JumpAnimationR
      self.currentImage = self.sheet
    elseif self.dir == direction.left then
      self.currentAnimation = self.JumpAnimationL
      self.currentImage = self.sheet
    end
  end
  
  self:decreaseHp(dt)
end

--[[Player:getX
- used to return the actual x position of the player
Don't uses parameters
]]--
function Player:getX()
  return self.x
end

--[[Player:getY
- used to return the actual y position of the player
Don't uses parameters
]]--
function Player:getY()
  return self.y
end

--[[Player:getW
- used to return the actual width of the player
Don't uses parameters
]]--
function Player:getW()
  return self.w
end

--[[Player:getH
- used to return the actual height of the player
Don't uses parameters
]]--
function Player:getH()
  return self.h
end

--[[Player:decreaseHp
- used to decrease the player's Hp by the variation of time 

Parameters:
  - dt: parameter used to get the lesser delta time of the PC
  
  returns nothing
]]--
function Player:decreaseHp(dt)
  self.hp = self.hp - 100*dt/HP_TIME_SEC
  if self.hp <= 0 then
    self:die()
  end
end

--[[Player:takeDamage
- used to make the player take damage from any sources 

Parameters:
  - dam: used to quantify the damage taken by the player and reduce its Hp
  
  returns nothing
]]--
function Player:takeDamage(dam)
  self.hp = self.hp - dam
end

--[[Player:increaseHp
- used to increase the players Hp according to the parameter 'ink'

Parameters:
  - ink: parameter used to quantify how much Hp the player will receive
  
  returns nothing
]]--
function Player:increaseHp(ink)
  self.hp = math.min(100, self.hp + ink)
end
--[[Player:die
- used to determine if the player is going to die

Don't uses parameters
returns nothing
]]--
function Player:die()
  self.alive = false
  love.audio.play(self.deathSound)
end

--[[Player:push
- used to make the player go back a little when collinding with a foe

Parameters:
  - world: used by the 'bump.lua' lib to move the player 
  - amount: defines how much the player will move
  - dir: defines the direction of the movement
  
  returns nothing
]]--
function Player:push(world,speed,dir,dt)
  print("push") 
  self.x, self.y, cols, len = world:move(self, self.x +(dir*speed*dt), self.y-10*dt) 
end
--[[Player:removePlayer
- still doesn't do anything, but its meant to remove the player from its actual world(in case of death or something else)

Parameters:
  - world: used by the 'bump.lua' lib to define objects in the world
  
  returns nothing
]]--
function Player:removePlayer(world)
  world:remove(self)
end
--[[Player:drawHp
- used to draw players Hp based on it actual size

Parameters:
  - cam: used define the drawing position of the Hp bar according to the camera
  
  returns nothing
]]--
function Player:drawHp(cam)
  local camLeft, camTop = cam:getCamera():getVisible()
  
  love.graphics.setColor(155, 0, 0)  
  love.graphics.rectangle("fill", camLeft + 20, camTop + 20, 500 * math.max(0, self.hp)/100, 30)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", camLeft + 20, camTop + 20, 500, 30)
  love.graphics.setColor(255, 255, 255)
  if DASH_CD == 0 then
  love.graphics.draw(self.dash_indicator,camLeft+650,camTop + 20,0,0.2,0.2)
  end

end


function Player:change_vul()
  if player.vulnerable then
    player.vulnerable = false
  elseif not player.vulnerable then
    player.vulnerable = true
    end
  end
  
  function Player:change_hit()
  if player.TK_HIT then
    player.TK_HIT = false
  elseif not player.TK_HIT then
    player.TK_HIT = true
    end
  end
  
  function Player:gainInk(ink)
    self.inkGained = self.inkGained + ink
  end
  