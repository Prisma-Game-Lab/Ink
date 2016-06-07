--  obj1.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.


--This file contains all the objects present in the level
--The objects contain the information in tables inside the corresponding table (sorted by type)

--Create a new player based on the Player class (in player.lua)

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
  
name = "player",x=60,y=1900,w=160,h=245,speedx = 0, speedy = 0, tipo = "player"

}


--Create a new camera based on the Gamera library in lib
local camera = 
{

name = "camera",x = 0,y = 0,w = 2469,h = 3228,scale = 0.5

}
local plataformas = 

{
  
{name = "wall1",x=0,y=0,w=1,h=3060,tipo = "wall"},
{name = "wall2",x=2468,y=0,w=1,h=3060,tipo = "wall"},
{name = "plat1",x=1,y=3060,w=2469,h=168,tipo = "plat"},
{name = "plat2",x=1,y=2280,w=2095,h=100,tipo = "plat"},
--{name = "plat3",x=1,y=1472,w=82,h=80,tipo = "plat"},
{name = "plat4",x=372,y=1472,w=2097,h=80,tipo = "plat"},
{name = "plat5",x=1,y=744,w=2080,h=100,tipo = "plat"},
{name = "plat6",x=1,y=0,w=2468,h=124,tipo = "plat"}

}

local enemys = 

{
  {name = "enemy1",x=545,y=1925,w=248,h=350,spdx = 0,tipo = "enemy"},
  {name = "enemy2",x=900,y=1125,w=248,h=350,spdx = 0,tipo = "enemy"}
  
}

local triggers = 

{
  {name = "levelend",x=334,y=512,w=107,h=143,tipo = "levelend"},
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
     position = {
      y = 2160,
      x = 600
     }
    },
    {
     size = {
      height = 120,
      width = 120
     },
     name = '2',
     position = {
      y = 2160,
      x = 720
     }
    },
    {
     size = {
      height = 120,
      width = 120
     },
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '2',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
     position = {
      y = 2280,
      x = 600
     }
    },
    {
     size = {
      height = 120,
      width = 120
     },
     name = '5',
     position = {
      y = 2280,
      x = 720
     }
    },
    {
     size = {
      height = 120,
      width = 120
     },
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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
     name = '5',
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