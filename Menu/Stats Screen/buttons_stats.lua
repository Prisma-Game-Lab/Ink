--  buttons_stats.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.


--[[
local variables

buttonsStats:  a table that holds the features and functions of the start buttonsStats

tw:  the widht of the game screen
th:  the height of the game screen

title:  a table that hold the features of the title image

direction: a table {x = 1 or 0 or -1, y = 1 or 0 or -1}, specifying the direction of the start buttonsStats

]]--

buttonsStats = {}

local tw = love.graphics.getWidth()
local th = love.graphics.getHeight()

local title = {}
local bground = {}

local direction = {horizontal = 0, vertical = 1}


--[[
buttonsStats.load
-it loads the title image and buttonsStats form the start the menu


 - titleImg: the title image itself
 - title.width: the width of the titleImg
 - title.height: the height of the titleImg
 - title.pos: a table {x = (tw-title.width)/2, y = (th-title.height)/2} 

 - There is no return
]]--
function buttonsStats.load()
  
  --mouse = {}
  
  --mouse.x = 0
  --mouse.y = 0
  
  titleImg = love.graphics.newImage("assets/Menu/Stats Screen/Title.png")
  bgroundImg = love.graphics.newImage("assets/Menu/Stats Screen/menu_background.png")
  
  bground.width = bgroundImg:getWidth()
  
  bground.height = bgroundImg:getHeight()
  
  bground.pos = {x = bground.weight, 
              y = bground.height
    }
    
  title.width = titleImg:getWidth()
  
  title.height = titleImg:getHeight()
  
  title.pos = {x = (tw-title.width)/2, 
              y = (th-title.height)/2
    }
  
end

--[[
 - buttonsStats.start
 - it create and start the start buttonsStats
 
 
 - buttonsStats.remove: clear the table from all buttonsStats
 - buttonsStats.create(number of buttonsStats, direction, width position, height position)
 - buttonsStats.color = {{Red,Green,Blue}}; RGB definition of button color
 - buttonsStats[i].imageNormal: the "not selected" image of a button i
 - buttonsStats[i].selected: the "selected" image of a button i
]]--

function buttonsStats.start()
  
  
  buttonsStats.remove()
  buttonsStats.create(2, direction.vertical, tw/2-140, 500, 200, 50)
  buttonsStats.color = {{255, 255, 255}}
  for i = 1, #buttonsStats do
    
    buttonsStats[i].imageNormal = love.graphics.newImage("assets/Menu/Stats Screen/stats_normal_"..i..".png")
    buttonsStats[i].imageSelected = love.graphics.newImage("assets/Menu/Stats Screen/stats_select_"..i..".png")
    buttonsStats[i].imageCurrent = buttonsStats[i].imageNormal
    
    end
  
  buttonsStats.select(1)
  buttonsStats.collided()
  
  buttonsStats.load()
  
end

function buttonsStats.update(dt)


end

--[[
buttonsStats.draw
it draws the buttonsStats and title images

]]--

function buttonsStats.draw()

love.graphics.draw(bgroundImg, 0, 0, 0, 1, 1)
love.graphics.draw(titleImg, title.pos.x-20, title.pos.y, 0, 1, 1)

for i, but in ipairs(buttonsStats) do
  
    love.graphics.draw(but.imageCurrent, but.x-20, but.y)
  
  end

end

--[[
buttonsStats.keypressed
it detects the key that is pressed to change the selected button

]]--

function buttonsStats.keypressed(key)
  
  if key == "s" or key == "down" then
  
    local index = buttonsStats.pressed%#buttonsStats+1
  
    buttonsStats.select(index)
  
  elseif key == "w" or key == "up" then
  
    local q = #buttonsStats
    local index = (buttonsStats.pressed-2+q)%q+1
    
    buttonsStats.select(index)
  
  end
 
 if buttonsStats[1].colliding then 
   
     buttonsStats.pressed = 1
   
 elseif buttonsStats[2].colliding then
   
     buttonsStats.pressed = 2
   
   end
 
end


--[[
buttonsStats.create
it creates and insert the buttonsStats

parameter

n: number of images
tipo: direction in wich the button will be showed
but1_pos_x: x position of the image
but1_pos_y: y position of the image
but1_w: screen width 
but1_h: screen height


]]--

function buttonsStats.create(n, tipo, but1_pos_x, but1_pos_y, but1_w, but1_h)
  local spacing = 75
  if tipo == 0 then
    for i=1, n do
      table.insert(buttonsStats, {x = but1_pos_x +(spacing + but1_w)*(i-1), y = but1_pos_y, width = but1_w, height = but1_h})
    end
  else
    for i=1, n do
      table.insert(buttonsStats, {x = 0, y = 0, width = but1_w, height = but1_h})
    end
  end
end

--[[
buttonsStats.select
it changes the selected button
index: the index of the button to be selected

]]--
  
function buttonsStats.select(index)
  if buttonsStats.pressed ~= nil then
    local b = buttonsStats[buttonsStats.pressed]
    b.imageCurrent = b.imageNormal
    --b.color = {255, 255, 255}
  end
  buttonsStats.pressed = index
  local b = buttonsStats[buttonsStats.pressed]
  b.imageCurrent = b.imageSelected
  --b.color = {255, 0, 0}
end
 
 
 --[[
 buttonsStats.remove
 it removes the buttonsStats
 ]]--
function buttonsStats.remove()
  while #buttonsStats > 0 do
    table.remove(buttonsStats)
  end
end

function buttonsStats.collided()
  --[[for i=1, #buttonsStats do
    if(buttonsStats.checkMouseCollision(buttonsStats[i].x, buttonsStats[i].y, buttonsStats[i].height, buttonsStats[i].width, mouse.x, mouse.y)) then
      buttonsStats[i].colliding = true
    end
  end]]--
end

function buttonsStats.checkMouseCollision(but_x, but_y, but_h, but_w, mouse_x, mouse_y)
--  return but_x < mouse_x+1 and but_y < mouse_y +1 and mouse_x < but_x+but_w and mouse_y < but_y+but_h
end

return buttonsStats