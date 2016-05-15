local level1 = {}

local bump = require 'libs/bump'
local cron = require 'libs/cron'
local gamera = require 'libs/gamera'
local anim8 = require 'libs/anim8'

local lvl1 = bump.newWorld(50)
local cam1 = gamera.new(0,720,2560,1440)

local objects = require "levels/1/obj1"
--cam1:setScale(0.5)

function level1.load()
  bg = love.graphics.newImage("assets/Background1.png")
  
for i=1,#objects.plataformas,1 do
  
   local t = objects.plataformas
   lvl1:add(t[i],t[i].x,t[i].y,t[i].w,t[i].h)
   
end
   
  levels = {level1 = level1}
    
    
end
function change_level(new)
  
    level = new
    levels[level].load()
    
end
function level1.update(dt)
  

end
function level1.keypressed(key)
  

end
function level1.keyreleased(key)
  

end
function level1.mousepressed(x, y, button, istouch)
  

end
function level1.mousereleased(x, y, button, istouch)
  

end
function level1.mousemoved(x, y, dx, dy )
  
 
end
function level1.draw()
  --love.graphics.print(tostring(objects.plataformas[1].h),100,100)
  
cam1:draw(function(l,t,w,h)
   --DRAW STUFF HERE
  love.graphics.draw(bg,0,0)
  love.graphics.print("LEVEL 1",0,0)
  
for i=1,#objects.plataformas,1 do
  
  
  local t = objects.plataformas
  love.graphics.rectangle("fill",t[i].x,t[i].y,t[i].w,t[i].h)
   
end
  
  
   --love.graphics.rectangle("fill",t[i].x,t[i].y,t[i].w,t[i].h)
   
   


  
 

end)

end

return level1