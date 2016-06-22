--[[
showStats
it shows the statistics of the player in the level

parameters:
curr_level: the current level that the player is playing


--]]


function showStats(level_id)
  love.graphics.setColor(155, 155, 155, 100)
  x1,y1,x2,y2,x3,y3,x4,y4 = cam:getCamCorners()
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  love.graphics.rectangle('fill', x1 + (2*w/4), y1+h/2, w, h)
  love.graphics.setColor(155, 0, 0, 255)
  love.graphics.printf("Level: " ..tostring(level_id).. "\n\nInk Ganho: " ..math.floor(player.inkGained).. "\n\nTempo: " ..string.sub(time,1,4).. "\n", x1 + (2*w/4), y1+h/2 + 50, w, 'center')
  love.graphics.setColor(155, 155, 155)
  
end