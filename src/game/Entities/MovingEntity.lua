local path = getPath(...)
local Entity = require (path..'Entity')
local class = require 'lib/class'

local MovingEntity = class.extends(Entity,"MovingEntity")

function MovingEntity.new(x,y,width,height,speed)
	local self = MovingEntity.newObject(x,y,width,height)
	self.speed = speed or {x=0,y=0}
	self.lastPos = {x=0,y=0}
	return self
end

function MovingEntity:update(dt)
	self.super:update(dt)
	self.lastPos.x = self.x
	self.lastPos.y = self.y
	self.x=self.x+self.speed.x*dt
	self.y=self.y+self.speed.y*dt
end

return MovingEntity