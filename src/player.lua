local class = require 'lib/middleclass'
local cron = require 'lib/cron'
local anim8 = require "lib/anim8"

require "lib/bump"


Player = class('Player')

local JMP_SPD = -500
local HOP_SPD = -200
local WALK_SPD = 500
local DASH_SPD = 1000
local GRAVITY = 900

local direction = { right = 1, left = -1 }


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
  local gdr = anim8.newGrid(60, 50, self.DASHR:getWidth(), self.DASHR:getHeight())
  local gdl = anim8.newGrid(60, 50, self.DASHL:getWidth(), self.DASHL:getHeight())
  self.DashanimationR = anim8.newAnimation(gdr('1-6',1), 0.033333)
  self.DashanimationL = anim8.newAnimation(gdl('1-6',1), 0.033333)
  
  self.jumpImage = love.graphics.newImage('assets/Jump.png')  
  self.fallImage = love.graphics.newImage('assets/Fall.png')

  self.currentAnimation = self.IdleanimationR
  self.currentImage = self.SBIR

  world:add(self,self.x,self.y,self.w,self.h)
end

function Player:jump(world)
  local canJump = false
    
  local actualX, actualY, cols, len = world:check(self, self.x, self.y+1)

  for i=1,len do
    local other = cols[i].other
    if other.tipo == "plat" then
      canJump = true
      break
    end
  end
    
  if canJump then 
    self.speedY = JMP_SPD
  end
end

function Player:shortHop()
  if self.speedY < HOP_SPD then
    self.speedY = HOP_SPD
  end
end

function Player:moveRight()
  self.dir = direction.right
  self:move(self.dir*WALK_SPD)  
  self.currentAnimation = self.WalkanimationR
  self.currentImage = self.SBR
end

function Player:moveLeft()
  self.dir = direction.left
  self:move(self.dir*WALK_SPD)
  self.currentAnimation = self.WalkanimationL
  self.currentImage = self.SBL
end

function Player:move(spd)
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
  self:move(self.dir*(self.speedX + DASH_SPD))
  self.walking = false
  self.dashing = true   
  
end

function Player:draw()
  self.currentAnimation:draw(self.currentImage,self.x,self.y)  
  self.w,self.h = self.currentAnimation:getDimensions()
end

function Player:update(cam,world,dt)
  self.currentAnimation:update(dt)
  self.speedY = self.speedY + GRAVITY*dt
  actualX, self.y, cols, len = world:move(self, self.x + self.speedX*dt, self.y + self.speedY*dt)
  for i=1,len do
    local other = cols[i].other
    if other.tipo == "plat" then
      if actualX == self.x + self.speedX * dt then
        self.speedY = 0
        break
      end
    end
  end
  self.x = actualX
  cam:setPosition(self.x, self.y)
end