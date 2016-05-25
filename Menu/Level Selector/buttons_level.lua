--  buttons_level.lua
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

buttonsl = {}

local tw = love.graphics.getWidth()
local th = love.graphics.getHeight()

local title = {}

local direction = {horizontal = 0, vertical = 1}

--[[
buttons.load
 - There is no return
]]--
function buttonsl.load()
  
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
function buttonsl.start()
  
  
  buttonsl.remove()
  buttonsl.create(3, direction.horizontal, 250, 250 , 500, 250, 750, 250)
  
  buttonsl.color = {{255,255,255}}
  
  for i = 1, #buttonsl do
    
    buttonsl[i].imageNormal = love.graphics.newImage("assets/Menu/Level Selector/Level_normal_"..i..".png")
    buttonsl[i].imageSelected = love.graphics.newImage("assets/Menu/Level Selector/Level_select_"..i..".png")
    buttonsl[i].imageCurrent = buttonsl[i].imageNormal
    
  end
  
  buttonsl.select(1)
  buttonsl.collided()
  
  
  
end

function buttonsl.update(dt)
  
end

--[[
buttons.draw
it draws the buttons and title images

]]--

function buttonsl.draw()
  for i, but in ipairs(buttonsl) do
  
    love.graphics.draw(but.imageCurrent, but.x, but.y)
  
  end


end


--[[
buttons.keypressed
it detects the key that is pressed to change the selected button

]]--

function buttonsl.keypressed(key)
  
  
  
  
  if key == "d" or key == "right" then
  
    local index = buttonsl.pressed%#buttonsl+1
  
    buttonsl.select(index)
  
  elseif key == "a" or key == "left" then
  
    local q = #buttonsl
    local index = (buttonsl.pressed-2+#buttonsl)%q+1
    
    buttonsl.select(index)
  
  end
 
 if buttonsl[1].colliding then 
   
     buttonsl.pressed = 1
   
 elseif buttonsl[2].colliding then
   
     buttonsl.pressed = 2
     
  elseif buttonsl[3].colliding then
    
    buttonsl.pressed = 2
   
   end
 
end

--[[
buttons.select
it changes the selected button
index: the index of the button to be selected

]]--

function buttonsl.select(index)
  if buttonsl.pressed ~= nil then
    local b = buttonsl[buttonsl.pressed]
    b.imageCurrent = b.imageNormal
    --b.color = {255, 255, 255}
  end
  buttonsl.pressed = index
  local b = buttonsl[buttonsl.pressed]
  b.imageCurrent = b.imageSelected
  --b.color = {255, 0, 0}
end


--[[
 buttons.remove
 it removes the buttons
 ]]--

function buttonsl.remove()
  while #buttonsl > 0 do
    table.remove(buttonsl)
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

function buttonsl.create(n, tipo, but1_pos_x, but1_pos_y, but1_w, but1_h)
  local spacing = -250
  if tipo == 0 then
    for i=1, n do
      table.insert(buttonsl, {x = but1_pos_x +(spacing + but1_w)*(i-1), y = but1_pos_y, width = but1_w, height = but1_h})
    end
  else
    for i=1, n do
      table.insert(buttonsl, {x = but1_pos_x , y = but1_pos_y + (spacing + but1_h)*(i-1), width = but1_w, height = but1_h})
    end
  end
end
function buttonsl.collided()
  --[[for i=1, #buttons do
    if(buttons.checkMouseCollision(buttons[i].x, buttons[i].y, buttons[i].height, buttons[i].width, mouse.x, mouse.y)) then
      buttons[i].colliding = true
    end
  end]]--
end

function buttonsl.checkMouseCollision(but_x, but_y, but_h, but_w, mouse_x, mouse_y)
--  return but_x < mouse_x+1 and but_y < mouse_y +1 and mouse_x < but_x+but_w and mouse_y < but_y+but_h
end

return buttons_level