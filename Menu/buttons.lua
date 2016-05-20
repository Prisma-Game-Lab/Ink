buttons = {}

local tw = love.graphics.getWidth()
local th = love.graphics.getHeight()

local title = {}

local direction = {horizontal = 0, vertical = 1}

function buttons.load()
  
  mouse = {}
  
  mouse.x = 0
  mouse.y = 0
  
  titleImg = love.graphics.newImage("assets/Menu/Title.png")
  title.width = titleImg:getWidth()
  
  title.height = titleImg:getHeight()
  
  title.pos = {x = (tw-title.width)/2, 
              y = (th-title.height)/2
    }
  
end

function buttons.start()
  
  buttons.remove()
  buttons.create(2, direction.vertical, tw/2-150, 500, 200, 50)
  buttons.color = {{255, 255, 255}}
  for i = 1, #buttons do
    
    buttons[i].imageNormal = love.graphics.newImage("assets/Menu/button_normal_"..i..".png")
    buttons[i].imageSelected = love.graphics.newImage("assets/Menu/button_select_"..i..".png")
    buttons[i].imageCurrent = buttons[i].imageNormal
    
    end
  
  buttons.select(1)
  buttons.collided()
  
end

function buttons.update(dt)


end

function buttons.draw()

--love.graphics.draw(titleImg, title.pos.x, title.pos.y - 100, 0, 1, 1)
for i, but in ipairs(buttons) do
  
    love.graphics.draw(but.imageCurrent, but.x, but.y)
  
  end

end

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

function buttons.create(n, tipo, but1_pos_x, but1_pos_y, but1_w, but1_h)
  local spacing = 75
  if tipo == 0 then
    for i=1, n do
      table.insert(buttons, {x = but1_pos_x +(spacing + but1_w)*(i-1), y = but1_pos_y, width = but1_w, height = but1_h})
    end
  else
    for i=1, n do
      table.insert(buttons, {x = but1_pos_x , y = but1_pos_y + (spacing + but1_h)*(i-1), width = but1_w, height = but1_h})
    end
  end
end
  
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
  return but_x < mouse_x+1 and but_y < mouse_y +1 and mouse_x < but_x+but_w and mouse_y < but_y+but_h
end

return buttons