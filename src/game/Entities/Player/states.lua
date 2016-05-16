local path = getPath(...)

local states = {
	standing = "PlayerStandingState",
	jumping = "PlayerJumpState"
	--dashing
}
for i,v in pairs(states) do
	states[i] = require(path..v)
end

return states