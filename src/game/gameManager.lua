local path = getPath(...)
local level = require (path.."Level")

local gameManager={
}

function gameManager.load()

end

function gameManager.start()
	level.load()
end

function gameManager.update(dt)
    level.update(dt)
end

function gameManager.keypressed(key)
  if level.keypressed then
    level.keypressed(key)
  end
end

function gameManager.keyreleased(key)
  if level.keyreleased then
    level.keyreleased(key)
  end
end

function gameManager.mousepressed(x, y, button, istouch)
  if level.mousepressed then
    level.mousepressed(x, y, button, istouch)
  end
end

function gameManager.mousereleased(x, y, button, istouch)
  if level.mousereleased then
    level.mousereleased(x, y, button, istouch)
  end
end

function gameManager.mousemoved(x, y, dx, dy )
  if level.mousemoved then
    level.mousemoved(x, y, dx, dy)
  end
end

function gameManager.draw()
    level.draw()
end

return gameManager