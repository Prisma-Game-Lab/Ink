--  obj1.lua
--  Project Nanquim
--  Created by RPG Programming Team
--  Copyright © 2016 Rio PUC Games. All rights reserved.


--This file contains all the objects present in the level
--The objects contain the information in tables inside the corresponding table (sorted by type)

plataformas = 

{
  
{name = "wall1",x=0,y=0,w=50,h=1440,tipo = "wall"},
{name = "wall2",x=2510,y=0,w=50,h=1440,tipo = "wall"},
{name = "plat1",x=50,y=1340,w=1300,h=100,tipo = "plat"},
{name = "plat2",x=1750,y=1340,w=760,h=100,tipo = "plat"},
{name = "plat3",x=50,y=950,w=2150,h=100,tipo = "plat"},
{name = "plat4",x=400,y=560,w=2110,h=100,tipo = "plat"},
{name = "plat5",x=50,y=200,w=550,h=100,tipo = "plat"},
{name = "plat6",x=960,y=200,w=1200,h=100,tipo = "plat"}

}

enemys = 

{
  {name = "enemy1",x=2410,y=1240,w=68,h=94,spdx = -100,tipo = "enemy"},
  {name = "enemy2",x=800,y=850,w=68,h=94,spdx = 50,tipo = "enemy"}
  
}

triggers = 

{
  {name = "levelend",x=140,y=40,w=107,h=143,tipo = "levelend"},
}

return {plataformas = plataformas,enemys = enemys,triggers = triggers}