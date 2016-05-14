local path = getPath(...)
require (path.."Entities.Obstacle")
require (path.."Entities.Player")
require (path.."Entities.Bullet")
local Bump = require "lib/bump"
local world = Bump.newWorld()
local floor, player -- Floor nao vai entrar, só para teste
local bullets = {}
local time = 2.2
local timer = time

local Level = {
	
}

------------------------------------------
-- Auxiliary functions
------------------------------------------
local function move(entity)
	entity.x,entity.y,c,q = world:move(entity,entity.x,entity.y,Entity.filter)
	return c,q
end
local function add(entity)
	world:add(entity,entity.x,entity.y,entity.width,entity.height)
end

function Level.load(id)
	--load based on txt of the id or something....
	--for now we are loading always the same thing
	local w,h = love.graphics.getDimensions()
	--adicionamos o piso a variavel floor e posteriormente ao mundo (world)
	--claro que na pratica usariamos listas(tabelas) para armazenarem todos os objetos.
	--(da maneira que está sendo feita com bullets)
	floor = Obstacle.new(0,h*0.7,w,h*0.3)
	world:add(floor,floor.x,floor.y,floor.width,floor.height)
	--adicionamos o jogador a variavel player e posteriormente ao mundo (world)
	player = Player.new(0,0,h*0.16/2,h*0.16)
	world:add(player,player.x,player.y,player.width,player.height)
end

function Level.update(dt)
	player:update(dt)
	local c,q
	--Solicita a bump a movimentacao do personagem para o lugar para o qual ele atualizou
	--em update. A funcao NAO altera as posicoes x e y da table player, por isso é importante
	--ter player.x e player.y recebendo os retornos da funcao (:move retorn a posicao para a qual
	--de fato o objeto se mexeu)
	c,q = move(player)
	--Caso teve alguma colisao informa que o jogador tocou o chao, zerando sua velocidade
	--(claro que isso atende somente as necessidades desse exercicio. Para um jogo é mais
	--complicado. Pois precisa-se saber se ele tocou com o "pé" ou com a "cabeça".
	--Há varias formas de fazer isso, mas para essa demonstração não vem ao caso).
	if q>0 then
		player:touchedFloor()
	end
	timer = timer-dt
	--Trecho para spawnar bullet. Podemos usar a lib cron para cuidar desse comportamento timer
	if timer<0 then
		timer = time
		local b = Bullet.new(-30,floor.y-50,30,30)
		table.insert(bullets,b)
		add(b)
	end
	for i=#bullets,1,-1 do
		local b = bullets[i]
		b:update(dt)
		--Da mesma maneira que foi feito com player, solicitamos ao bump a movimentacao de cada
		--bullet existente. repare que na função de filter, é passado Cross quando o objeto em
		--questao é o player. Isso porque cross representa contato sem colisao, e queremos
		--sim saber quando um bullet encosta no jogador, para efetuar as operacoes necessarias,
		--como decrescimo de hp, efeitos sonoros, etc.
		cs,q = move(b)
		--Aqui vemos se teve algum contato (se fosse nil ao inves de cross o q seria sempre zero).
		--Caso teve contato da bullet com o player, removemos a bullet e resetamos a posicao do
		--player.
		if q>0 then
			player.x=0
			player.y=0
			--Repare que aqui foi usado :update ao inves de :move. Isso porque :update considera
			--colisoes e contatos. update nao. update "força" um "teleporte" do dado objeto.
			world:update(player,player.x,player.y)
			world:remove(b)
			table.remove(bullets,i)
		end
	end
end

function Level.draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
	floor:draw()
	for i,v in pairs(bullets) do v:draw() end
	player:draw()
end

function Level.keypressed(key)
	player:keypressed(key)
end

return Level