local class = require 'lib/middleclass'
local cron = require 'lib/cron'
local anim8 = require "lib/anim8"

require "lib/bump"


Enemy = class('Enemy')

local WALK_SPD = 500
local GRAVITY = 980
local direction = { right = 1, left = -1 }

function Enemy:initialize(world, x, y, w, h, spdX)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.speedX = spdX
  self.dir = direction.right
  self.alive = true
  self.tipo = "enemy"
  
  self.idle = love.graphics.newImage('assets/enemyTest/enemy_idleT2.png')
  self.death = love.graphics.newImage('assets/enemyTest/inimigo_morte.png')
  
  local gi = anim8.newGrid(248,350, self.idle:getWidth(), self.idle:getHeight())
  self.IndleanimationR = anim8.newAnimation(gi('1-4',2), 0.1)
  self.IndleanimationL = anim8.newAnimation(gi('4-1',1), 0.1)
  
  local gd = anim8.newGrid(620,880, self.death:getWidth(), self.death:getHeight())
  self.deathAnimationR = anim8.newAnimation(gd('10-1',1), 0.25)
  self.deathAnimationL = anim8.newAnimation(gd('1-10',2), 0.25)   
  
  
  self.currentAnimation = self.IndleanimationL
  self.currentImage = self.idle

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
  if self.alive then
  self.currentAnimation:draw(self.currentImage,self.x,self.y)
  elseif not self.alive then
  self.currentAnimation:draw(self.currentImage,self.x,self.y,0,0.4,0.4)
  end
end

function Enemy:update(world,dt)
  if self.speedX  > 0 then
    self.currentAnimation = self.WalkanimationR
    self.currentImage = self.WalkR
  elseif self.speedX < 0 then
    self.currentAnimation = self.WalkanimationL
    self.currentImage = self.WalkL
  end
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
function Enemy:deathAnimation()
  if self.dir == 1 then
  self.currentAnimation = self.deathAnimationR
  self.currentImage = self.death
  elseif self.dir == -1 then
  self.currentAnimation = self.deathAnimationL
  self.currentImage = self.death
  end
end