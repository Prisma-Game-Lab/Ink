--  soundTest.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.


--This file contains all the sounds present in the level dividided by character
--The objects contain the information in tables inside the corresponding table (sorted by type)

kai = 

{
  walk =  love.audio.newSource("assets/sound/Passos Normal.mp3",static),
  pulo1 = love.audio.newSource("assets/sound/Pulo.mp3",static),
  pulo2 = love.audio.newSource("assets/sound/SSBM_Link_Jump.wav",static),
  dash = 
  {
   {dash = love.audio.newSource("assets/sound/Dash 1.mp3",static)},
   {dash = love.audio.newSource("assets/sound/Dash 2.mp3",static)},
   {dash = love.audio.newSource("assets/sound/Dash 3.mp3",static)}
  },
  wall = love.audio.newSource("assets/sound/Arrastar na Parede.mp3",static)
}

gyuki = 

{

  
}


return {kai = kai,gyuki = gyuki}