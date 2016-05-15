--  RPG_Logo.lua
--  PUC Arena
--  Created by Pietro Ribeiro Pepe
--  Copyright © 2016 Rio PUC Games. All rights reserved.

--[[
RPG Logo animation (based on 1280x720)
Load with the time for each animation and an optional callback:
 - t1: logo fadeIn time
 - t2: logo wait time
 - t3: logo fadeOut
 - callback: a function to be called when logo presentation is over
 
 This script calls the callback when the animation ends or when the ENTER key is pressed
 To know when it is finished from other script you can access RPG_Logo.finish
 ]]
 
local RPG_Logo={}
local logoDist = 0.9
local letterDist = 0.03
local fadeMax = 240
local endLogo

local getScale, fadeIn, wait, fadeOut, step

function RPG_Logo.load(t1,t2,t3,callback)
  RPG_Logo.logo=love.graphics.newImage("/RPG_Full_Logo/logo.png")
  RPG_Logo.width=RPG_Logo.logo:getWidth()
  RPG_Logo.height=RPG_Logo.logo:getHeight()
  RPG_Logo.scale = getScale(RPG_Logo.width,RPG_Logo.height,0.5,0.6)
  RPG_Logo.width = RPG_Logo.scale*RPG_Logo.width
  RPG_Logo.height = RPG_Logo.scale*RPG_Logo.height
  
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()
  
  RPG_Logo.pos={
    x=(w-RPG_Logo.width)/2,
    y=(h-RPG_Logo.height)/2
  }
  
  RPG_Logo.a1=t1
  RPG_Logo.a2=t2
  RPG_Logo.a3=t3
  RPG_Logo.a4=t4
  RPG_Logo.fadeOut = fadeMax
  RPG_Logo.finish=false
  RPG_Logo.callback = callback

  RPG_Logo.vel1 = fadeMax/t1
  RPG_Logo.vel2 = fadeMax/t3
  RPG_Logo.fade = 0
  step = fadeIn
  
  RPG_Logo.icad = love.graphics.newImage("/RPG_Full_Logo/icad.png")
  local w1 = RPG_Logo.icad:getWidth()
  local h1 = RPG_Logo.icad:getHeight()
  
  RPG_Logo.vislab = love.graphics.newImage("/RPG_Full_Logo/vislab.png")
  local w2 = RPG_Logo.vislab:getWidth()
  local h2 = RPG_Logo.vislab:getHeight()
  
  local ss = getBiScale(w1,w2,h1,h2,0.25)
  RPG_Logo.icad_scale = ss.s1
  RPG_Logo.vislab_scale = ss.s2
  
  RPG_Logo.icad_vis_width = ss.s1*w1
  RPG_Logo.icad_height = ss.s1*h1
  RPG_Logo.icadPos = {
    x=w*0.875-RPG_Logo.icad_vis_width/2,
    y=h*0.9-(RPG_Logo.icad_height+ss.s2*h2)
  }
  
  RPG_Logo.puc = love.graphics.newImage("/RPG_Full_Logo/puc.jpg")
  w1 = RPG_Logo.puc:getWidth()
  h1 = RPG_Logo.puc:getHeight()
  RPG_Logo.puc_scale = getScale(w1,h1,0.17)
  RPG_Logo.pucPos = {
    x=w*0.125-RPG_Logo.puc_scale*w1/2,
    y=0.9*h-RPG_Logo.puc_scale*h1
    }
end

function getScale(width,height,s1,s2)
  if s2 == nil then s2 = s1 end
  local w = love.graphics.getWidth()*s1
  local h = love.graphics.getHeight()*s2
  local sw,sh = w/width, h/height
  local s = sw < sh and sw or sh
  return s
end

function getBiScale(w1,w2,h1,h2,scale1,scale2)
  if scale2 == nil then scale2 = scale1 end
  local w = love.graphics.getWidth()*scale1
  local h = love.graphics.getHeight()*scale2
  local s1,s2 = w/w1, w/w2
  local tot = s1*h1+s2*h2
  if tot>h then
    s1 = s1*h/tot
    s2 = s2*h/tot
  end
  return {s1=s1,s2=s2}
end

function RPG_Logo.start()
end

function RPG_Logo.update(dt)
  
  step(dt)
  
end

function fadeIn(dt)
  RPG_Logo.a1 = RPG_Logo.a1-dt
  if RPG_Logo.a1<0 then
    RPG_Logo.fade = fadeMax
    step = wait
  else
    RPG_Logo.fade = RPG_Logo.fade + dt*RPG_Logo.vel1
  end
end
function wait(dt)
  RPG_Logo.a2 = RPG_Logo.a2-dt
  if RPG_Logo.a2<0 then
    step = fadeOut
  end
end
function fadeOut(dt)
  RPG_Logo.a3 = RPG_Logo.a3-dt
  if RPG_Logo.a3<0 then
    RPG_Logo.fade = 0
    endLogo()
  else    
    RPG_Logo.fade = RPG_Logo.fade - dt*RPG_Logo.vel1
  end
end

function RPG_Logo.draw()
  love.graphics.setColor(255,255,255,RPG_Logo.fade)
  love.graphics.draw(RPG_Logo.logo,RPG_Logo.pos.x,RPG_Logo.pos.y,0,RPG_Logo.scale,RPG_Logo.scale)
  love.graphics.draw(RPG_Logo.icad,RPG_Logo.icadPos.x,RPG_Logo.icadPos.y,0,RPG_Logo.icad_scale,RPG_Logo.icad_scale)
  love.graphics.draw(RPG_Logo.vislab,RPG_Logo.icadPos.x,RPG_Logo.icadPos.y+RPG_Logo.icad_height,0,RPG_Logo.vislab_scale,RPG_Logo.vislab_scale)
  love.graphics.draw(RPG_Logo.puc,RPG_Logo.pucPos.x,RPG_Logo.pucPos.y,0,RPG_Logo.puc_scale,RPG_Logo.puc_scale)
  love.graphics.setColor(255,255,255)
end

function RPG_Logo.keypressed(key)
  if key=="return" then
    endLogo()
  end
end

function RPG_Logo.gamepadpressed(joystick,button)
end

function endLogo()
  RPG_Logo.finish = true
  if RPG_Logo.callback ~= nil then
    RPG_Logo.callback()
	end
end

return RPG_Logo