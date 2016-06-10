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
  
name = "player",x=60,y=1900,w=120,h=238,speedx = 0, speedy = 0, tipo = "player"

}


--Create a new camera based on the Gamera library in lib
local camera = 
{

name = "camera",x = 0,y = 0,w = 2469,h = 3228,scale = 0.3

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
  {name = "levelend",x=4560,y=1920,w=120,h=120,tipo = "levelend"},
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
		height = 2160,
		width = 4800
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
						x = 4680
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
						x = 4680
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_2',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
					name = 'plat_2',
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
						y = 1320,
						x = 4680
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
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
					name = 'wall_1',
					position = {
						y = 1560,
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
						y = 1560,
						x = 3000
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 1560,
						x = 3600
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
						x = 4440
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
						x = 4680
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
					name = 'wall_1',
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
					name = 'wall_1',
					position = {
						y = 1680,
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
						y = 1680,
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
						y = 1680,
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
						y = 1680,
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
						y = 1680,
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
						y = 1680,
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
						y = 1680,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
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
						x = 4440
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
						x = 4680
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
					name = 'wall_1',
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
					name = 'wall_1',
					position = {
						y = 1800,
						x = 4440
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
						x = 4680
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
					name = 'wall_1',
					position = {
						y = 1920,
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
						y = 1920,
						x = 4440
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
						x = 4680
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
					name = 'plat_2',
					position = {
						y = 2040,
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
						y = 2040,
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
						y = 2040,
						x = 360
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
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
						y = 2040,
						x = 960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
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
					name = 'wall_1',
					position = {
						y = 2040,
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
						y = 2040,
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
						y = 2040,
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
						y = 2040,
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
						y = 2040,
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
						y = 2040,
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
						y = 2040,
						x = 1920
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
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
					name = 'plat_2',
					position = {
						y = 2040,
						x = 2160
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
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
					name = 'plat_2',
					position = {
						y = 2040,
						x = 2400
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 2520
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 2640
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 2760
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 2880
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 3840
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 3960
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 4080
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 4200
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 4320
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
						x = 4440
					}
				},
				{
					size = {
						height = 120,
						width = 120
					},
					name = 'plat_2',
					position = {
						y = 2040,
						x = 4560
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
						x = 4680
					}
				}
			}
		}
	}
}

return {table = table,plataformas = plataformas,enemys = enemys,triggers = triggers, player = player,camera = camera,background = background,sounds = sounds}