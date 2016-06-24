--  level_playground_2.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.


--This file contains all the objects present in the level
--The objects contain the information in tables inside the corresponding table (sorted by type)

--Create a new player based on the Player class (in player.lua)

local background = 

{
  
bg = love.graphics.newImage("assets/bg2.jpg")
  
}

local sounds = 
{
  
  song = love.audio.newSource("assets/06.mp3", "stream")
  
}

local player =

{
  
name = "player",x=290,y=1270,w=160,h=245,speedx = 0, speedy = 0, tipo = "player"

}


--Create a new camera based on the Gamera library in lib
local camera = 
{

name = "camera",x = 0,y = 0,w = 2469,h = 3228,scale = 0.3

}
local plataformas = 

{
  
  love.graphics.newImage("assets/TilesTest/chao.png"),
  love.graphics.newImage("assets/TilesTest/parede.png"),
}

local enemys = 

{
  {name = "enemy1",x=545,y=1925,w=248,h=350,spdx = 0,tipo = "enemy"},
  {name = "enemy2",x=900,y=1125,w=248,h=350,spdx = 0,tipo = "enemy"}
}

local triggers = 

{
  {name = "levelend",x=3155,y=1292,w=107,h=143,tipo = "levelend"},
}

local table = {
	cellSize = {
		height = 120,
		width = 120
	},
	cellsQuant = {
		n_lines = 3,
		n_cols = 4
	},
	worldSize = {
		height = 1560,
		width = 5040
	},
	layers = {
		{
			name = 'default',
			objects = {
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 0,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 120,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 120,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 120,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 120,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 240,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 240,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 240,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 240,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 360,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 360,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 360,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 360,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 360,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 360,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 360,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 480,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 480,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 600,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 600,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 720,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 720,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 840,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 840,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 960,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 960,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1080,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1080,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1200,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1200,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1320,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1320,
						x = 4920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1440,
						x = 720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1440,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1440,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1440,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1440,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1440,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'parede',
					position = {
						y = 1440,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3600
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3720
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'chao',
					position = {
						y = 1440,
						x = 4920
					}
				}
			}
		}
	}
}

return {table = table,plataformas = plataformas,enemys = enemys,triggers = triggers, player = player,camera = camera,background = background,sounds = sounds}