require "Menu/Stats Screen/buttons_Stats"
local level = require "src/level_manager"
local level_selector = require "Menu/Level Selector/level_selector"

local perga = love.graphics.newImage("Assets/Menu/Stats Screen/menu_background.png")
local stats_title = love.graphics.newImage("Assets/Menu/Stats Screen/Title.png")


function showStats(level_id)
  love.graphics.setColor(155, 155, 155, 100)
  x1,y1,x2,y2,x3,y3,x4,y4 = cam:getCamCorners()
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  --love.graphics.rectangle('fill', x1 + (2*w/4), y1+h/2, w, h)
  love.graphics.setColor(255,255,255)
  draw(x1,y1)
  love.graphics.setColor(162, 30, 29, 255)
  love.graphics.printf("\n\n\n\t   " ..string.sub(time,1,4).. "\t\t        " ..math.floor(player.inkGained).. "\n", x1 + (2*w/4), y1+h/2 + 50, w)
  
  love.graphics.printf("Obrigado Por Jogar",x1 + (2*w/4)-150, y1+h/2 +550, w,'center',0,1.2,1.2)
  
  love.graphics.printf("Aperte 'm' para ir ao menu",x1 + (2*w/4)+100, y1+h/2 +700,w)
  
  
  love.graphics.setColor(155, 155, 155)
  
end


function draw(x, y)
  love.graphics.draw(perga,x,y,0,2,2)
  love.graphics.draw(stats_title,x,y,0,2,2)  
  end