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
local HP_TIME_SEC = 60


function Player:initialize(world, x, y, w, h, speedX, speedY)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.speedX = speedX
  self.speedY = speedY
  self.dir = direction.right
  self.walking = false
  self.dashing = false
  self.jumping = true
  self.canWallJump = false
  self.hp = 100
  
  self.hpBar = love.graphics.newImage('assets/HPBAR.png')
  
  self.SBR = love.graphics.newImage('assets/SBR.png')
  self.SBL = love.graphics.newImage('assets/SBL.png')
  local gr = anim8.newGrid(30, 45, self.SBR:getWidth(), self.SBR:getHeight())
  local gl = anim8.newGrid(30, 45, self.SBL:getWidth(), self.SBL:getHeight())
  self.WalkanimationR = anim8.newAnimation(gr('1-8',1), 0.1)
  self.WalkanimationL = anim8.newAnimation(gl('1-8',1), 0.1)
  
  self.SBIR = love.graphics.newImage('assets/SBIR.png')
  self.SBIL = love.graphics.newImage('assets/SBIL.png')
  local gir = anim8.newGrid(30, 45, self.SBIR:getWidth(), self.SBIR:getHeight())
  local gil = anim8.newGrid(30, 45, self.SBIL:getWidth(), self.SBIL:getHeight())
  self.IdleanimationR = anim8.newAnimation(gir('1-4',1), 0.1)
  self.IdleanimationL = anim8.newAnimation(gil('1-4',1), 0.1) 
  
  self.DASHR = love.graphics.newImage('assets/DASHR.png')
  self.DASHL = love.graphics.newImage('assets/DASHL.png')
  local gdr = anim8.newGrid(60, 45, self.DASHR:getWidth(), self.DASHR:getHeight())
  local gdl = anim8.newGrid(60, 45, self.DASHL:getWidth(), self.DASHL:getHeight())
  self.DashanimationR = anim8.newAnimation(gdr('1-6',1), 0.033333)
  self.DashanimationL = anim8.newAnimation(gdl('1-6',1), 0.033333)
  
  self.jumpImageR = love.graphics.newImage('assets/JumpR.png')
  self.jumpImageL = love.graphics.newImage('assets/JumpL.png')
  local gjr = anim8.newGrid(self.jumpImageR:getWidth(), self.jumpImageR:getHeight(), self.jumpImageR:getWidth(), self.jumpImageR:getHeight())
  local gjl = anim8.newGrid(self.jumpImageL:getWidth(), self.jumpImageL:getHeight(), self.jumpImageL:getWidth(), self.jumpImageL:getHeight())
  self.JumpAnimationR = anim8.newAnimation(gjr(1,1), 0.033333)
  self.JumpAnimationL = anim8.newAnimation(gjl(1,1), 0.033333)
  
  self.fallImageR = love.graphics.newImage('assets/FallR.png')
  self.fallImageL = love.graphics.newImage('assets/FallL.png')
  local gfr = anim8.newGrid(self.fallImageR:getWidth(), self.fallImageR:getHeight(), self.fallImageR:getWidth(), self.fallImageR:getHeight())
  local gfl = anim8.newGrid(self.fallImageL:getWidth(), self.fallImageL:getHeight(), self.fallImageL:getWidth(), self.fallImageL:getHeight())
  self.FallAnimationR = anim8.newAnimation(gfr(1,1), 0.033333)
  self.FallAnimationL = anim8.newAnimation(gfl(1,1), 0.033333)

  self.currentAnimation = self.IdleanimationR
  self.currentImage = self.SBIR

  world:add(self, self.x, self.y, self.w, self.h)
end

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
    
    --[[  VERIFICAR SE OUTRAS ANIMAÇÕES ESTÃO COM O MESMO PROBLEMA DA DIREÇÃO DA ANIMAÇÃO 
          NÃO SER ATUALIZADA A TODO MOMENTO PELA UPDATE!! ]]--
    
    --[[if self.dir == direction.right then
      self.currentAnimation = self.JumpAnimationR
      self.currentImage = self.jumpImageR
    elseif self.dir == direction.left then
      self.currentAnimation = self.JumpAnimationL
      self.currentImage = self.jumpImageL
    end]]--
  end
end

function Player:shortHop()
  if self.speedY < HOP_SPD then
    self.speedY = HOP_SPD
  end
end

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

function Player:move(spd)
  if self.dashing then
    return
  end
  
  self.speedX = spd
  self.walking = true
end

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

function Player:draw(cam)
  self.currentAnimation:draw(self.currentImage,self.x,self.y)
  self.w,self.h = self.currentAnimation:getDimensions()
  self:drawHp(cam)
end

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
        self.speedY = 0
        
        if love.keyboard.isDown('right') or joystick1 and joystick1:isGamepadDown('dpright') then
          self:moveRight()
        elseif love.keyboard.isDown('left') or joystick1 and joystick1:isGamepadDown('dpleft') then
          self:moveLeft()
        else 
          if self.dir == direction.right then
            self.currentAnimation = self.IdleanimationR
            self.currentImage = self.SBIR
          elseif self.dir == direction.left then
            self.speedX = 0
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
      self:increaseHp(500)
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
  
  self.x = actualX
end

function Player:getX()
  return self.x
end

function Player:getY()
  return self.y
end

function Player:decreaseHp(dt)
  self.hp = self.hp - 100*dt/HP_TIME_SEC
  if self.hp <= 0 then
    
  end
end

function Player:takeDamage(dam)
  self.hp = self.hp - dam
end

function Player:increaseHp(ink)
  self.hp = math.min(100, self.hp + ink)
end

function Player:drawHp(cam)
  local camLeft, camTop = cam:getCamera():getVisible()
  
  love.graphics.setColor(255, 0, 0)  
  love.graphics.rectangle("fill", camLeft + 20, camTop + 20, 500 * math.max(0, self.hp)/100, 30)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", camLeft + 20, camTop + 20, 500, 30)
  love.graphics.setColor(255, 255, 255)
end

