local path = getPath(...)
local MovingEntity = require (path.."MovingEntity")
local class = require 'lib/class'
require (path..'Mask')
local states = require(path..'Player.states')

local Player = class.extends(MovingEntity,"Player")

Player.movSpeed = 200
Player.jumpForce = 500
Player.localGravity = 700
Player.mask = Mask.Player
Player.collisionMask = Mask.Obstacle

Player.color = {0,0,255}

Player.keys = {
	jump = 'space'
}

function Player.new(x,y,width,height)
	local self = Player.newObject(x,y,width,height)
	self.isOnFloor = false
	self:changeToState("standing")
	return self
end

function Player:update(dt)
	self.state:update(dt)
	self.super:update(dt) --Run MovingEntityUpdate
end

function Player:changeToState(key,...)
	local s = states[key].new()
	s:enter(self,...)
	self.state = s
end

function Player:is_in_state(key)
	return self.state:is_a(states[key])
end

function Player:touchedFloor(didTouch)
	if didTouch then self.state:event("touchedFloor")
	else self.state:event("notTouchedFloor") end
end

function Player:keypressed(key)
	self.state:keypressed(key)
end

return Player