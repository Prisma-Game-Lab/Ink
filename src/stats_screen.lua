function showStats(curr_level)
  love.graphics.setColor(155, 155, 155, 100)
  x1,y1,x2,y2,x3,y3,x4,y4 = cam:getCamCorners()
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  love.graphics.rectangle('fill', x1 + w/2, y1+h/2, 1000, 700)
  love.graphics.setColor(155, 0, 0, 255)
  love.graphics.printf("Level: " ..tostring(curr_level).. "\n\nHP: " ..math.floor(player.hp).. "\n\nTime: " ..string.sub(time,1,4).. "\n", x1 + w/2, y1+h/2 + 50, 1000, 'center')
  love.graphics.setColor(155, 155, 155)
  
end