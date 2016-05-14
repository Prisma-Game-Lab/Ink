local path = getPath(...)
require (path.."MovingEntity")
require (path..'Mask')

Player = class_extends(MovingEntity,"Player")

Player.movSpeed = 200
Player.jumpForce = 500
Player.localGravity = 700
Player.mask = Mask.Player
Player.collisionMask = Obstacle.mask

Player.color = {0,0,255}

function Player.new(x,y,width,height)
	local self = Player.newObject(x,y,width,height)
	self.isOnFloor = false
	return self
end

function Player:update(dt)
	self.speed.y = self.speed.y + self.localGravity*dt
	if love.keyboard.isDown('left') then
		self.speed.x = -self.movSpeed
	elseif love.keyboard.isDown('right') then
		self.speed.x = self.movSpeed
	else
		self.speed.x = 0
	end
	self.super:update(dt)
end

function Player:touchedFloor()
	self.isOnFloor = true
	self.speed.y = 0
end

function Player:keypressed(key)
	if key=='space' then
		self.isOnFloor = false
		self.speed.y = -self.jumpForce
	end
end