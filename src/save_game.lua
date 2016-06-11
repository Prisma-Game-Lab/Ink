--i=0
local tableIO = require 'lib/tableIO'
--local temp = require 'savegame\\SAVE'..i..'.txt'

--file = io.open("savegame\\SAVE0.lua", "r+")
--[[while temp ~= nil and i<=8 do
  i=i+1
  temp = require 'savegame\\SAVE'..i..'/txt'
end--]]


--[[
saveFile

it saves, at the end of the level, the level name, hp, and time that the player ended the level

Parameters

curr:  it's the current level being played
time: the time that the player ended the current level
hp: the amount of hp that the player ended the level


--]]


function saveFile(curr,time,hp)
  
  
  
  local infoToBeSaved =
  {
    
    curr_level = curr,
    
    round_time = time,
    
    player_hp = hp

    }
    
    
    
    tableIO.save(infoToBeSaved,'savegame\\SAVE0.lua')
    
  end

  
  
  --[[
  loadFile
  
  it should load the file with the levels and the records of the player
  
  
  
  --]]
  
  function loadFile(save_file)
    
    
       local sFile = require 'savegame\\SAVE'..save_file..'.txt'
       return sFile
    end
