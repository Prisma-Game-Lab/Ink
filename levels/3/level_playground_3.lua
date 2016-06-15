local background = 

{
  
bg = love.graphics.newImage("assets/cenario01.png")
  
}

local sounds = 
{
  
  song = love.audio.newSource("assets/06.mp3", "stream")
  
}


local player =

{
  
name = "player",x=60,y=1900,w=120,h=240,speedx = 0, speedy = 0, tipo = "player"

}


--Create a new camera based on the Gamera library in lib
local camera = 
{

name = "camera",x = 0,y = 0,w = 2469,h = 3228,scale = 0.5

}
local plataformas = 

{
  love.graphics.newImage("assets/TilesDemo/plat_1.png"),
  love.graphics.newImage("assets/TilesDemo/plat_2.png"),
  love.graphics.newImage("assets/TilesDemo/plat_3.png"),
  love.graphics.newImage("assets/TilesDemo/plat_4.png"),
  love.graphics.newImage("assets/TilesDemo/plat_5.png"),
  love.graphics.newImage("assets/TilesDemo/plat_6.png"),
  love.graphics.newImage("assets/TilesDemo/plat_7.png"),
  love.graphics.newImage("assets/TilesDemo/plat_8.png"),
  love.graphics.newImage("assets/TilesDemo/plat_9.png"),
  love.graphics.newImage("assets/TilesDemo/plat_10.png"),
  love.graphics.newImage("assets/TilesDemo/plat_11.png"),
  love.graphics.newImage("assets/TilesDemo/plat_12.png"),
  love.graphics.newImage("assets/TilesDemo/plat_13.png"),
  love.graphics.newImage("assets/TilesDemo/plat_14.png"),
  love.graphics.newImage("assets/TilesDemo/plat_15.png"),
  love.graphics.newImage("assets/TilesDemo/plat_16.png"),
  love.graphics.newImage("assets/TilesDemo/wall_1.png")
  
}

local enemys = 

{
  {name = "enemy1",x=545,y=1925,w=248,h=350,spdx = 0,tipo = "enemy"},
  {name = "enemy2",x=900,y=1125,w=248,h=350,spdx = 0,tipo = "enemy"}
  
}

local triggers = 

{
  {name = "levelend",x=600,y=512,w=107,h=143,tipo = "levelend"},
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
		height = 2400,
		width = 2400
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_2',
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
					name = 'plat_13',
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
					name = 'plat_14',
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
					name = 'plat_15',
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
					name = 'plat_2',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_2',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_1',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_3',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'plat_6',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'plat_6',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_5',
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
					name = 'plat_5',
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
					name = 'plat_1',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_16',
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
					name = 'plat_5',
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
					name = 'wall_1',
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
					name = 'wall_1',
					position = {
						y = 1560,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1560,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1560,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_4',
					position = {
						y = 1560,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1560,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 1560,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 1680,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1680,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1680,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1680,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 1680,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 1800,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1800,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1800,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 1800,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 1800,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 1800,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 1800,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_3',
					position = {
						y = 1800,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1800,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 1800,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 1920,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1920,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 1920,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 1920,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 2040,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2040,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2040,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 2040,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 2160,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_3',
					position = {
						y = 2160,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_1',
					position = {
						y = 2160,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2160,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2160,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2160,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 2160,
						x = 2280
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 2280,
						x = 0
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 120
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 240
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_6',
					position = {
						y = 2280,
						x = 480
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_4',
					position = {
						y = 2280,
						x = 840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1320
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1560
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1680
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1800
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 2040
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_5',
					position = {
						y = 2280,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'wall_1',
					position = {
						y = 2280,
						x = 2280
					}
				}
			}
		}
	}
}

return {table = table,plataformas = plataformas,enemys = enemys,triggers = triggers, player = player,camera = camera,background = background,sounds = sounds}