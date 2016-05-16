local class = require "lib/class"
local PlayerJumpState = class.extends(require(getPath(...)..'PlayerControlState'),"JumpState")

local handler = {
	touchedFloor = function(state)
		state.player:changeToState("standing")
	end
}

function  PlayerJumpState.new()
	local self = PlayerJumpState.newObject()
	self.eventHandler = table.sum(self.eventHandler,handler)
	return self
end

function PlayerJumpState:enter(player, withForce)
	-- V' = raiz( g^2.t + V^2 ) - gt
	self.super:enter(player)
	if withForce then
		self.hasForce = true
		self.timer = 0.34
		local g = player.localGravity
		self.newForce = math.sqrt(g*g*self.timer+player.jumpForce*player.jumpForce)-g*self.timer
		player.speed.y =  -self.newForce -- -player.jumpForce
	else
		self.hasForce = false
	end
end

function PlayerJumpState:update(dt)
	local p = self.player
	if self.hasForce then
		if love.keyboard.isDown(p.keys.jump) and self.timer>0 then
			self.timer = self.timer-dt
			p.speed.y = -self.newForce  -- -p.jumpForce
		else
			self.hasForce = false
		end
	end
	self.super:update(dt)
end

function PlayerJumpState:keypressed(key)

end

function PlayerJumpState:keyreleased(key)

end

return PlayerJumpState