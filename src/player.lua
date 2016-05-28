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

local JMP_SPD = -700
local HOP_SPD = -200
local WALK_SPD = 500
local DASH_SPD = 1000
local GRAVITY = 980
local dashin_counter = 0
local DASH_TIME = 0.25
local direction = { right = 1, left = -1 }
local HP_TIME_SEC = 250

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
  self.w = IDLE_KAI_WIDTH -- width da primeira animação
  self.h = IDLE_KAI_HEIGHT -- height da primeira animação
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
  
  self.deathSound = love.audio.newSource('assets/YouDied.mp3', 'static') 
  self.deathImg = love.graphics.newImage('assets/youdied.png')  
  self.hpBar = love.graphics.newImage('assets/HPBAR.png')
  
  self.SBR = love.graphics.newImage(WALK_RIGHT_SPRITE)
  self.SBL = love.graphics.newImage(WALK_LEFT_SPRITE)
  local gr = anim8.newGrid(WALK_KAI_WIDTH, WALK_KAI_HEIGHT, self.SBR:getWidth(), self.SBR:getHeight())
  local gl = anim8.newGrid(WALK_KAI_WIDTH, WALK_KAI_HEIGHT, self.SBL:getWidth(), self.SBL:getHeight())
  self.WalkanimationR = anim8.newAnimation(gr(WALK_RIGHT_SPRITE_COLUMNS,WALK_RIGHT_SPRITE_LINE), 0.1)
  self.WalkanimationL = anim8.newAnimation(gl(WALK_LEFT_SPRITE_COLUMNS, WALK_LEFT_SPRITE_LINE), 0.1)
  
  self.SBIR = love.graphics.newImage(IDLE_RIGHT_SPRITE)
  self.SBIL = love.graphics.newImage(IDLE_LEFT_SPRITE)
  local gir = anim8.newGrid(IDLE_KAI_WIDTH, IDLE_KAI_HEIGHT, self.SBIR:getWidth(), self.SBIR:getHeight())
  local gil = anim8.newGrid(IDLE_KAI_WIDTH, IDLE_KAI_HEIGHT, self.SBIL:getWidth(), self.SBIL:getHeight())
  self.IdleanimationR = anim8.newAnimation(gir(IDLE_RIGHT_SPRITE_COLUMNS,IDLE_RIGHT_SPRITE_LINE), 0.1)
  self.IdleanimationL = anim8.newAnimation(gil(IDLE_LEFT_SPRITE_COLUMNS,IDLE_LEFT_SPRITE_LINE), 0.1) 
  
  self.DASHR = love.graphics.newImage(DASH_RIGHT_SPRITE)
  self.DASHL = love.graphics.newImage(DASH_LEFT_SPRITE)
  local gdr = anim8.newGrid(DASH_KAI_WIDTH, DASH_KAI_HEIGHT, self.DASHR:getWidth(), self.DASHR:getHeight())
  local gdl = anim8.newGrid(DASH_KAI_WIDTH, DASH_KAI_HEIGHT, self.DASHL:getWidth(), self.DASHL:getHeight())
  self.DashanimationR = anim8.newAnimation(gdr(DASH_RIGHT_SPRITE_COLUMNS,DASH_RIGHT_SPRITE_LINE), 0.033333)
  self.DashanimationL = anim8.newAnimation(gdl(DASH_LEFT_SPRITE_COLUMNS,DASH_LEFT_SPRITE_LINE), 0.033333)
  
  self.jumpImageR = love.graphics.newImage(JUMP_RIGHT_SPRITE)
  self.jumpImageL = love.graphics.newImage(JUMP_LEFT_SPRITE)
  local gjr = anim8.newGrid(JUMP_KAI_WIDTH, JUMP_KAI_HEIGHT, self.jumpImageR:getWidth(), self.jumpImageR:getHeight())
  local gjl = anim8.newGrid(JUMP_KAI_WIDTH, JUMP_KAI_HEIGHT, self.jumpImageL:getWidth(), self.jumpImageL:getHeight())
  self.JumpAnimationR = anim8.newAnimation(gjr(JUMP_RIGHT_SPRITE_COLUMNS,JUMP_RIGHT_SPRITE_LINE), 0.033333)
  self.JumpAnimationL = anim8.newAnimation(gjl(JUMP_LEFT_SPRITE_COLUMNS,JUMP_LEFT_SPRITE_LINE), 0.033333)
  
  self.fallImageR = love.graphics.newImage(FALL_RIGHT_SPRITE)
  self.fallImageL = love.graphics.newImage(FALL_LEFT_SPRITE)
  local gfr = anim8.newGrid(FALL_KAI_WIDTH, FALL_KAI_HEIGHT, self.fallImageR:getWidth(), self.fallImageR:getHeight())
  local gfl = anim8.newGrid(FALL_KAI_WIDTH, FALL_KAI_HEIGHT, self.fallImageL:getWidth(), self.fallImageL:getHeight())
  self.FallAnimationR = anim8.newAnimation(gfr(FALL_RIGHT_SPRITE_COLUMNS,FALL_RIGHT_SPRITE_LINE), 0.033333)
  self.FallAnimationL = anim8.newAnimation(gfl(FALL_LEFT_SPRITE_COLUMNS,FALL_LEFT_SPRITE_LINE), 0.033333)

  self.currentAnimation = self.IdleanimationR
  self.currentImage = self.SBIR

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
  
  if key == "up" or key == "w" or key == "space" then
    self:jump(lvl)
  end

  if key == "right" then
    self:moveRight()
  end
  
  if key == "left" then
    self:moveLeft()
  end
  if key == 'd' then
    self:dash()  
  end
  
end

--[[Player:keyreleased
- function from the engine, works the same way as the function above, only diference it receives the keys that were realesed instead of the pressed ones

Parameters:
  - Key: parameter defined by the engine 
  
  returns: -nothing-
]]--
function Player:keyreleased(key)
  if key == 'up' then
    self:shortHop()
  end
  
  if key == "right" then
    if self.speedX > 0 and self.dashing == false then
      self:stop()
    end
  end
  
  if key == "left" then
    if self.speedX < 0 and self.dashing == false then
      self:stop()
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
    self.currentImage = self.SBR
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
    self.currentImage = self.SBL
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
    self.currentAnimation = self.IdleanimationR
    self.currentImage = self.SBIR
  elseif self.dir == direction.left then
    self.currentAnimation = self.IdleanimationL
    self.currentImage = self.SBIL
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
  if not self.dashing and not self.canWallJump then
    self:move(self.speedX + self.dir*DASH_SPD)
    
    self.walking = false
    self.dashing = true
    
    if self.dir == direction.right then
      self.currentAnimation = self.DashanimationR
      self.currentImage = self.DASHR
    elseif self.dir == direction.left then
      self.currentAnimation = self.DashanimationL
      self.currentImage = self.DASHL
    end
    
    self.hp = self.hp - 5
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
  self.currentAnimation:draw(self.currentImage,self.x,self.y)
  self.w,self.h = self.currentAnimation:getDimensions()
  self:drawHp(cam)
  if not self.alive then
    love.graphics.draw(self.deathImg,camLeft,camTop + 360)
  end
end

--[[Player:update
- used to make the game loop updating by the time its parameters

Parameters:
  - world: uses the world to define the players movements by the 'bump.lua' lib
  - dt: time parameter used to the lesser delta time of the PC
  
  returns nothing
]]--
function Player:update(world,dt)
 
  if self.dashing and dashin_counter > DASH_TIME then
    self.dashing = false
    self:stop()
    dashin_counter = 0
    if love.keyboard.isDown('right') or joystick1 and joystick1:isGamepadDown('dpright') then
      self:moveRight()
    elseif love.keyboard.isDown('left') or joystick1 and joystick1:isGamepadDown('dpleft') then
      self:moveLeft()
    end 
  end
  
  self.currentAnimation:update(dt)
  
  if self.dashing then
    dashin_counter = dashin_counter + dt
    self.speedY = 0
  else
    self.speedY = self.speedY + GRAVITY*dt
  end
  
  actualX, self.y, cols, len = world:move(self, self.x + self.speedX*dt, self.y + self.speedY*dt)
  
  local tempWallJump = false
  for i=1,len do
    local other = cols[i].other
    
    for l=1,len do
      local oother = cols[l].other
      if other.tipo == "plat" and oother.tipo == "wall" then
        tempWallJump = true
      end
    end
    
    if other.tipo == "plat" then
      if (self.y + self.h - 1 > other.y and self.y + self.h - 1 < other.y + other.h) or (self.y - 1 > other.y and self.y - 1 < other.y + other.h) then
        self.speedY = 100
        tempWallJump = true
      else
        -- Se foi uma colisão vertical
        self.speedY = 0
        
        if love.keyboard.isDown('right') or joystick1 and joystick1:isGamepadDown('dpright') then
          self:moveRight()
        elseif love.keyboard.isDown('left') or joystick1 and joystick1:isGamepadDown('dpleft') then
          self:moveLeft()
        else
          self.speedX = 0        
          if self.dir == direction.right then  
            self.currentAnimation = self.IdleanimationR
            self.currentImage = self.SBIR
          elseif self.dir == direction.left then
            self.currentAnimation = self.IdleanimationL
            self.currentImage = self.SBIL
          end
        end
        self.jumping = false
        break
      end
    elseif other.tipo == "wall" and self.jumping or self.speedY > 100 then
      self.speedY = 100
      tempWallJump = true
    elseif other.tipo == "enemy" and self.dashing then
      other:die(world)
      self:increaseHp(20)
    end
  end
  
  self.canWallJump = tempWallJump

  if self.speedY > 0 then
    if self.dir == direction.right then
      self.currentAnimation = self.FallAnimationR
      self.currentImage = self.fallImageR
    elseif self.dir == direction.left then
      self.currentAnimation = self.FallAnimationL
      self.currentImage = self.fallImageL
    end
  elseif self.speedY < 0 then -- Executa a animação do personagem pulando atualizando a direção.
    if self.dir == direction.right then
      self.currentAnimation = self.JumpAnimationR
      self.currentImage = self.jumpImageR
    elseif self.dir == direction.left then
      self.currentAnimation = self.JumpAnimationL
      self.currentImage = self.jumpImageL
    end
  end
  
  self:decreaseHp(dt)
  self.x = actualX
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
function Player:push(world,amount,dir)
  print("push") 
  self.x, self.y, cols, len = world:move(self, self.x +(dir*amount), self.y-10) 
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
end

