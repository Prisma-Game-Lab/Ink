--  obj1.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.


--This file contains all the objects present in the level
--The objects contain the information in tables inside the corresponding table (sorted by type)

plataformas = 

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

enemys = 

{
  {name = "enemy1",x=545,y=1925,w=248,h=350,spdx = 0,tipo = "enemy"},
  {name = "enemy2",x=900,y=1125,w=248,h=350,spdx = 0,tipo = "enemy"}
  
}

triggers = 

{
  {name = "levelend",x=334,y=512,w=107,h=143,tipo = "levelend"},
}

return {plataformas = plataformas,enemys = enemys,triggers = triggers}