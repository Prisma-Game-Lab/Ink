local path = getPath(...)
local MovingEntity = require (path..'MovingEntity')
require (path..'Mask')
local class = require 'lib/class'

local Bullet = class.extends(MovingEntity,"Bullet")

Bullet.movSpeed = 300
Bullet.mask = Mask.Enemy
Bullet.contactMask = Mask.Player

function Bullet.new(x,y,width,height)
	local self = Bullet.newObject(x,y,width,height,{x=Bullet.movSpeed,y=0})
	return self
end

return Bullet