local intro = {}

function intro.load(callback)
	print(callback)
  love.mouse.setVisible(true)
  intro.callback = callback
end

function intro.start()

end

function intro.update(dt)

end

function intro.keypressed(key)
  if key == "n" then
    intro.callback()
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