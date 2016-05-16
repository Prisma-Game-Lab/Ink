local class = require "lib/class"

local PlayerStandingState = class.extends(require(getPath(...)..'PlayerControlState'),"StandState")

local handler = {
	notTouchedFloor = function(state)
		state.player:changeToState("jumping",false)
	end
}

function  PlayerStandingState.new()
	local self = PlayerStandingState.newObject()
	self.eventHandler = table.sum(self.eventHandler,handler)
	return self
end

function PlayerStandingState:enter(player)
	self.super:enter(player)
	player.speed.y = 0
end

function PlayerStandingState:update(dt)
	self.player.speed.y = 0
	self.super:update(dt)
end

function PlayerStandingState:keypressed(key)
	local keys = self.player.keys
	if key==keys.jump then
		self.player:changeToState("jumping",true)
	end
end

function PlayerStandingState:keyreleased(key)

end

return PlayerStandingState