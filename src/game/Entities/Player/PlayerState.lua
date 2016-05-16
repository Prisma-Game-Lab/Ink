local class = require "lib/class"

local PlayerState = class.new("BaseState")

--- Functions to handle events
local handler = {}

function  PlayerState.new()
	local self = PlayerState.newObject()
	self.eventHandler = handler
	return self
end

function PlayerState:enter(player)
	self.player = player
end

function PlayerState:update(dt)

end

function PlayerState:keypressed(key)

end

function PlayerState:keyreleased(key)

end

function PlayerState:exit()

end

function PlayerState:event(event)
	print(event)
	if self.eventHandler[event] then
		self.eventHandler[event](self) --try later self:eventHandler[event]()
	end
end

return PlayerState