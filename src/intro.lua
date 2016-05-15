local game = require "game"

local intro = {}

function intro.load()

  love.mouse.setVisible(true)
  scenes = { intro = intro, menu = menu, game = game}
  
end

function change_scene(new)
  scene = new
  scenes[scene].load()
end

function intro.update(dt)

end


function intro.keypressed(key)
  if key == "n" then
    change_scene("game")
  end

end

function intro.keyreleased(key)
  

end

function intro.mousepressed(x, y, button, istouch)
 
end

function intro.mousereleased(x, y, button, istouch)
  
end

function intro.mousemoved(x, y, dx, dy )
  
end

function intro.draw()
  love.graphics.print("INTRO GOES HERE\nPRESS N",200,200)  
end

return intro