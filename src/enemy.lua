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
  self.speedX = 100
  self.dir = direction.right
  self.alive = true

  self.WalkR = love.graphics.newImage('assets/enemyR.png')
  self.WalkL = love.graphics.newImage('assets/enemyL.png')
  local gr = anim8.newGrid(68, 94, self.WalkR:getWidth(), self.WalkR:getHeight())
  local gl = anim8.newGrid(68, 94, self.WalkL:getWidth(), self.WalkL:getHeight())
  self.WalkanimationR = anim8.newAnimation(gr('1-2',1), 0.4)
  self.WalkanimationL = anim8.newAnimation(gl('1-2',1), 0.4)
  
  self.currentAnimation = self.WalkanimationR
  self.currentImage = self.WalkR

  self.tipo = "enemy"
  world:add(self, self.x, self.y, self.w, self.h)
end

function Enemy:moveRight(world)
  self.dir = direction.right
  
  self.currentAnimation = self.WalkanimationR
  self.currentImage = self.WalkR
end

function Enemy:moveLeft(world)
  self.dir = direction.left
  
  self.currentAnimation = self.WalkanimationL
  self.currentImage = self.WalkL
end

function Enemy:draw()
  self.currentAnimation:draw(self.currentImage,self.x,self.y)
end

function Enemy:update(world,dt)
  self.x, self.y, cols, len = world:move(self, self.x + self.speedX * dt, self.y)
  
  self.currentAnimation:update(dt)
end

function Enemy:getX()
  return self.x
end

function Enemy:getY()
  return self.y
end

function Enemy:die(world)
  self.alive = false
  
  world:remove(self)
end