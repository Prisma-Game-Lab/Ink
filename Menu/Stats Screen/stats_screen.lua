require "Menu/Stats Screen/buttons_Stats"
local level = require "src/level_manager"
local level_selector = require "Menu/Level Selector/level_selector"

local statScreen = {}

function statScreen.load()
  
  
  background_img = love.graphics.newImage("Assets/Menu/background_character_select.png")
  
end

function statScreen.start(playersInf, winner)
  buttonsStats.load()
  buttonsStats.start()
  --love.audio.stop(audioManager.musicPlaying)
  --audioManager.playEndMatchSound() 
end

function statScreen.update(dt)
  buttonsStats.update(dt)
end

function statScreen.draw()
  buttonsStats.draw()
end

function statScreen.keypressed(key)
  buttonsStats.keypressed(key)
  if key == "return" then
    if buttonsStats.pressed == 1 then
      level_selector.choosed_level = 1
      change_scene("game",level_selector.choosed_level)
    elseif buttonsStats.pressed == 2 then
      love.event.push("quit")    
    end
  end
end
function statScreen.gamepadpressed(joystick, button)
end
return statScreen
