local class = require 'lib/middleclass'
local cron = require 'lib/cron'
local anim8 = require "lib/anim8"

require "lib/bump"


Enemy = class('Enemy')

local WALK_SPD = 500
local GRAVITY = 980
local direction = { right = 1, left = -1 }

function Enemy:initialize(world, x, y, w, h, speedX, speedY)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.speedX = 10
  self.dir = direction.right
    
  self.SBR = love.graphics.newImage('assets/SBR.png')
  self.SBL = love.graphics.newImage('assets/SBL.png')
  local gr = anim8.newGrid(30, 45, self.SBR:getWidth(), self.SBR:getHeight())
  local gl = anim8.newGrid(30, 45, self.SBL:getWidth(), self.SBL:getHeight())
  self.WalkanimationR = anim8.newAnimation(gr('1-8',1), 0.1)
  self.WalkanimationL = anim8.newAnimation(gl('1-8',1), 0.1)
  
  self.currentAnimation = self.WalkanimationR
  self.currentImage = self.SBR

  world:add(self,self.x,self.y,self.w,self.h)
end

function Enemy:moveRight(world)
  
  self.dir = direction.right
  
  self.currentAnimation = self.WalkanimationR
  self.currentImage = self.SBR
  
  --self.c2:update(dt)
  self.x, self.y, cols, len = world:move(self, self.x + self.speedX, self.y)
  
end

function Enemy:moveLeft(world)

  self.dir = direction.left
  
  self.currentAnimation = self.WalkanimationL
  self.currentImage = self.SBL

  self.x, self.y, cols, len = world:move(self, self.x + self.speedX, self.y)
end

function Enemy:draw()
  self.currentAnimation:draw(self.currentImage,self.x,self.y)
end

function Enemy:update(world,dt)

end

function Enemy:getX()
  return self.x
end

function Enemy:getY()
  return self.y
end