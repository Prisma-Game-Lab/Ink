local class = require "lib/class"
require "lib/bit"

local Entity = class.new("Entity")

Entity.color = {255,0,0}
Entity.collisionMask = 0
Entity.contactMask = 0
Entity.mask = 0

function Entity.new(x,y,width,height)
	local self = Entity.newObject()
	self.x=x
	self.y=y
	self.width=width
	self.height=height
	return self
end

function Entity:update(dt)
end

function Entity:draw()
	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end

Entity.filter = function(item,other)
	if bit.band(item.collisionMask,other.mask)~=0 then return 'slide' end
	if bit.band(item.contactMask,other.mask) ~=0 then return 'cross' end
	return nil
end

return Entity