local class = require "lib/class"

local PlayerControlState = class.extends(require(getPath(...)..'PlayerState'),"ControlState")

--- Functions to handle events
local handler = {}

function  PlayerControlState.new()
	local self = PlayerControlState.newObject()
	self.eventHandler = handler
	return self
end

function PlayerControlState:update(dt)
	self.super:update(dt)
	local p = self.player
	p.speed.y = p.speed.y + p.localGravity*dt
	if love.keyboard.isDown('left') then
		p.speed.x = -p.movSpeed
	elseif love.keyboard.isDown('right') then
		p.speed.x = p.movSpeed
	else
		p.speed.x = 0
	end
end

return PlayerControlState