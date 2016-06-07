local class = require 'lib/middleclass'
local gamera = require 'lib/gamera'

Camera = class('Camera')

function Camera:initialize(x,y,w,h)
  self.cam = gamera.new(x,y,w,h)
  return self.cam
end

function Camera:cameraPosition(x,y,speed_x,speed_y)
  cx,cy = self.cam:getPosition()
  cx = cx + (x-cx)*speed_x
  cy = cy + (y-cy)*speed_y
  self.cam:setPosition(cx,cy)
end

function Camera:update(x,y,dt)
  self:cameraPosition(x,y,3*dt,3*dt)
  --note o dt na speed, isso eh importante 
  --esse 3 ai eh qlqr numero tem que ver qual eh o bom
  --nota o delay que rola p camera seguir, tipo um cameraman
end

function Camera:getCamera()
  return self.cam 
end

function Camera:changeScale(scale)
  self.cam:setScale(scale)
end

function Camera:getCamCorners()
  return self.cam:getVisibleCorners()
end

