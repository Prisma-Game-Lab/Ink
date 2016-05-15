local path = getPath(...)
local Entity = require (path..'Entity')
local class = require 'lib/class'
require (path..'Mask')

local Obstacle = class.extends(Entity,"obstacle")
Obstacle.mask = Mask.Obstacle

function Obstacle.new(x,y,width,height)
	local self = Obstacle.newObject(x,y,width,height)
	return self
end

function Obstacle:draw()
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end

return Obstacle