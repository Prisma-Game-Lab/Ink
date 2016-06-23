--  buttons.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.


--[[
local variables

buttons:  a table that holds the features and functions of the start buttons

tw:  the widht of the game screen
th:  the height of the game screen

title:  a table that hold the features of the title image

direction: a table {x = 1 or 0 or -1, y = 1 or 0 or -1}, specifying the direction of the start buttons

]]--

buttons = {}

local tw = love.graphics.getWidth()
local th = love.graphics.getHeight()

local title = {}

local direction = {horizontal = 0, vertical = 1}


--[[
buttons.load
-it loads the title image and buttons form the start the menu


 - titleImg: the title image itself
 - title.width: the width of the titleImg
 - title.height: the height of the titleImg
 - title.pos: a table {x = (tw-title.width)/2, y = (th-title.height)/2} 

 - There is no return
]]--
function buttons.load()
  
  --mouse = {}
  
  --mouse.x = 0
  --mouse.y = 0
  
  titleImg = love.graphics.newImage("assets/Menu/Title.png")
  title.width = titleImg:getWidth()
  
  title.height = titleImg:getHeight()
  
  title.pos = {x = (tw-title.width)/2, 
              y = (th-title.height)/2+100
    }
  
end

--[[
 - buttons.start
 - it create and start the start buttons
 
 
 - buttons.remove: clear the table from all buttons
 - buttons.create(number of buttons, direction, width position, height position)
 - buttons.color = {{Red,Green,Blue}}; RGB definition of button color
 - buttons[i].imageNormal: the "not selected" image of a button i
 - buttons[i].selected: the "selected" image of a button i
]]--

function buttons.start()
  
  
  buttons.remove()
  buttons.create(2, direction.vertical, tw/2-140, 500, 200, 50)
  buttons.color = {{255, 255, 255}}
  for i = 1, #buttons do
    
    buttons[i].imageNormal = love.graphics.newImage("assets/Menu/button_normal_"..i..".png")
    buttons[i].imageSelected = love.graphics.newImage("assets/Menu/button_select_"..i..".png")
    buttons[i].imageCurrent = buttons[i].imageNormal
    
    end
  
  buttons.select(1)
  buttons.collided()
  
  buttons.load()
  
end

function buttons.update(dt)


end

--[[
buttons.draw
it draws the buttons and title images

]]--

function buttons.draw()

love.graphics.draw(titleImg, title.pos.x, title.pos.y - 100, 0, 1, 1)


for i, but in ipairs(buttons) do
  
    love.graphics.draw(but.imageCurrent, but.x, but.y)
  
  end

end

--[[
buttons.keypressed
it detects the key that is pressed to change the selected button

]]--

function buttons.keypressed(key)
  
  if key == "s" or key == "down" then
  
    local index = buttons.pressed%#buttons+1
  
    buttons.select(index)
  
  elseif key == "w" or key == "up" then
  
    local q = #buttons
    local index = (buttons.pressed-2+q)%q+1
    
    buttons.select(index)
  
  end
 
 if buttons[1].colliding then 
   
     buttons.pressed = 1
   
 elseif buttons[2].colliding then
   
     buttons.pressed = 2
   
   end
 
end


--[[
buttons.create
it creates and insert the buttons

parameter

n: number of images
tipo: direction in wich the button will be showed
but1_pos_x: x position of the image
but1_pos_y: y position of the image
but1_w: screen width 
but1_h: screen height


]]--

function buttons.create(n, tipo, but1_pos_x, but1_pos_y, but1_w, but1_h)
  local spacing = 75
  if tipo == 0 then
    for i=1, n do
      table.insert(buttons, {x = but1_pos_x +(spacing + but1_w)*(i-1), y = but1_pos_y, width = but1_w, height = but1_h})
    end
  else
    for i=1, n do
      table.insert(buttons, {x = 0, y = 0, width = but1_w, height = but1_h})
    end
  end
end

--[[
buttons.select
it changes the selected button
index: the index of the button to be selected

]]--
  
function buttons.select(index)
  if buttons.pressed ~= nil then
    local b = buttons[buttons.pressed]
    b.imageCurrent = b.imageNormal
    --b.color = {255, 255, 255}
  end
  buttons.pressed = index
  local b = buttons[buttons.pressed]
  b.imageCurrent = b.imageSelected
  --b.color = {255, 0, 0}
end
 
 
 --[[
 buttons.remove
 it removes the buttons
 ]]--
function buttons.remove()
  while #buttons > 0 do
    table.remove(buttons)
  end
end

function buttons.collided()
  --[[for i=1, #buttons do
    if(buttons.checkMouseCollision(buttons[i].x, buttons[i].y, buttons[i].height, buttons[i].width, mouse.x, mouse.y)) then
      buttons[i].colliding = true
    end
  end]]--
end

function buttons.checkMouseCollision(but_x, but_y, but_h, but_w, mouse_x, mouse_y)
--  return but_x < mouse_x+1 and but_y < mouse_y +1 and mouse_x < but_x+but_w and mouse_y < but_y+but_h
end

return buttons