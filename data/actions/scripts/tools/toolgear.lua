local lava = {
	{x = 32808, y = 32336, z = 11, stackpos = 0},
	{x = 32809, y = 32336, z = 11, stackpos = 0},
	{x = 32810, y = 32336, z = 11, stackpos = 0},
	{x = 32808, y = 32334, z = 11, stackpos = 0},
	{x = 32807, y = 32334, z = 11, stackpos = 0},
	{x = 32807, y = 32335, z = 11, stackpos = 0},
	{x = 32807, y = 32336, z = 11, stackpos = 0},
	{x = 32807, y = 32337, z = 11, stackpos = 0},
	{x = 32806, y = 32337, z = 11, stackpos = 0},
	{x = 32805, y = 32337, z = 11, stackpos = 0},
	{x = 32805, y = 32338, z = 11, stackpos = 0},
	{x = 32805, y = 32339, z = 11, stackpos = 0},
	{x = 32806, y = 32339, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32807, y = 32338, z = 11, stackpos = 0},
	{x = 32808, y = 32338, z = 11, stackpos = 0},
	{x = 32808, y = 32337, z = 11, stackpos = 0},
	{x = 32809, y = 32337, z = 11, stackpos = 0},
	{x = 32810, y = 32337, z = 11, stackpos = 0},
	{x = 32811, y = 32337, z = 11, stackpos = 0},
	{x = 32811, y = 32338, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32339, z = 11, stackpos = 0},
	{x = 32809, y = 32339, z = 11, stackpos = 0},
	{x = 32809, y = 32338, z = 11, stackpos = 0},
	{x = 32811, y = 32336, z = 11, stackpos = 0},
	{x = 32811, y = 32335, z = 11, stackpos = 0},
	{x = 32810, y = 32335, z = 11, stackpos = 0},
	{x = 32809, y = 32335, z = 11, stackpos = 0},
	{x = 32808, y = 32335, z = 11, stackpos = 0},
	{x = 32809, y = 32334, z = 11, stackpos = 0},
	{x = 32809, y = 32333, z = 11, stackpos = 0},
	{x = 32810, y = 32333, z = 11, stackpos = 0},
	{x = 32811, y = 32333, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32334, z = 11, stackpos = 0},
	{x = 32811, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32334, z = 11, stackpos = 0},
	{x = 32813, y = 32334, z = 11, stackpos = 0},
	{x = 32814, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32333, z = 11, stackpos = 0},
	{x = 32810, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32335, z = 11, stackpos = 0},
	{x = 32813, y = 32335, z = 11, stackpos = 0},
	{x = 32814, y = 32335, z = 11, stackpos = 0},
	{x = 32814, y = 32333, z = 11, stackpos = 0},
	{x = 32813, y = 32333, z = 11, stackpos = 0}
}

local holeId = {
	294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 430, 462, 469, 470, 482,
	484, 485, 489, 924, 3135, 3136, 7933, 7938, 8170, 8286, 8285, 8284, 8281,
	8280, 8279, 8277, 8276, 8323, 8567, 8585, 8596, 8595, 8249, 8250, 8251,
	8252, 8253, 8254, 8255, 8256, 8972, 9606, 9625, 13190, 14461, 19519, 21536
}

local holes = {468, 481, 483, 7932}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local tile = toPosition:getTile()
	local ground = tile:getGround()
	local targetItem = Item(itemEx.uid)
	if ground and isInArray(ropeSpots, ground:getId()) or tile:getItemById(14435) then
		player:teleportTo({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, false)
	elseif isInArray(holeId, itemEx.itemid) then
		toPosition.z = toPosition.z + 1
		tile = toPosition:getTile()
		if tile then
			local thing = tile:getTopVisibleThing()
			if thing:isItem() and thing:getType():isMovable() then
				return thing:moveTo({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1})
			elseif thing:isCreature() and thing:isPlayer() then
				return thing:teleportTo({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1})
			end
		end
	elseif (itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 354 or itemEx.itemid == 355) then
		targetItem:transform(392)
		targetItem:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif itemEx.itemid == 3621 and itemEx.actionid == 12026 then
		local chakoyas = {"chakoya toolshaper", "chakoya tribewarden", "chakoya windcaller"}
		if player:getStorageValue(Storage.TheIceIslands.Mission02) > 0 and player:getStorageValue(Storage.TheIceIslands.PickAmount) < 3 and player:getStorageValue(Storage.TheIceIslands.Questline) == 3  then
			player:setStorageValue(Storage.TheIceIslands.PickAmount, player:getStorageValue(Storage.TheIceIslands.PickAmount) + 1)
			player:setStorageValue(Storage.TheIceIslands.Mission02, player:getStorageValue(Storage.TheIceIslands.Mission02) + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			Game.createMonster(chakoyas[math.random(3)], toPosition)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			tile:getItemById(7185):transform(7186) 
			addEvent(function(toPosition) local tile = toPosition:getTile() if tile then local thing = tile:getItemById(7186) if thing and thing:isItem() then thing:transform(7185) end end end, 60 * 1000, toPosition)			
			if player:getStorageValue(Storage.TheIceIslands.PickAmount) >= 2 then
				player:setStorageValue(Storage.TheIceIslands.Questline, 4)
				player:setStorageValue(Storage.TheIceIslands.Mission02, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			end
		end
	elseif itemEx.itemid == 7200 then
		targetItem:transform(7236)
		targetItem:decay()
		toPosition:sendMagicEffect(CONST_ME_HITAREA)
	elseif isInArray(holes, itemEx.itemid) then
		targetItem:transform(itemEx.itemid + 1)
		targetItem:decay()
	elseif itemEx.itemid == 231 or itemEx.itemid == 9059 then
		local rand = math.random(100)
		if itemEx.actionid == 100 and rand <= 20 then
			targetItem:transform(489)
			targetItem:decay()
		elseif rand == 1 then
			Game.createItem(2159, 1, toPosition)
		elseif rand > 95 then
			Game.createMonster("Scarab", toPosition)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif itemEx.actionid == 4654 and player:getStorageValue(9925) == 1 and player:getStorageValue(9926) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(9926, 1)
	elseif itemEx.actionid == 4668 and player:getStorageValue(9943) == 1 and player:getStorageValue(9944) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(9944, 1)
	elseif itemEx.actionid == 50118 then
		local position = Position(32717, 31492, 11)
		if Tile(position):getItemById(7131) then
			Game.createItem(8749, 1, position)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	elseif itemEx.itemid == 8749 then
		local tile = Tile(Position(32699, 31492, 11))
		if tile:getItemById(8749) then
			tile:getItemById(8749):remove()
			toPosition:sendMagicEffect(CONST_ME_POFF)
			Tile(Position(32699, 31494, 11)):getItemById(8642):setActionId(50119)
		end
	elseif isInArray({2782, 19433}, itemEx.itemid) then
		targetItem:transform(itemEx.itemid == 19433 and 19431 or itemEx.itemid - 1)
		targetItem:decay()
	elseif itemEx.itemid == 2739 and item.itemid == 10513 then
		targetItem:transform(2737)
		targetItem:decay()
		Game.createItem(2694, 1, toPosition)
	elseif item.itemid == 10515 then
		if itemEx.uid == 3071 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe01) < 1 then
				doSetMonsterOutfit(cid, "skeleton", 3 * 1000)
				fromPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe01, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
				for x = -1, 1 do
					for y = -1, 1 do
						Position({x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z}):sendMagicEffect(CONST_ME_YELLOWENERGY)
					end
				end
			end
		elseif itemEx.uid == 3072 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe02) < 1 then
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe02, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
				for x = -1, 1 do
					for y = -1, 1 do
						if math.random(2) == 2 then
							Game.createMonster("rat", {x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z})
							Position({x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z}):sendMagicEffect(CONST_ME_TELEPORT)
						end
					end
				end
			end
		elseif itemEx.uid == 3073 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe03) < 1 then
				player:say("You have used the crowbar on a grate.", TALKTYPE_MONSTER_SAY)
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe03, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		elseif itemEx.uid == 3074 then -- In Service Of Yalahar Quest
			if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe04) < 1 then
				doSetMonsterOutfit(cid, "bog raider", 5 * 1000)
				player:say("You have used the crowbar on a knot.", TALKTYPE_MONSTER_SAY)
				player:setStorageValue(Storage.InServiceofYalahar.SewerPipe04, 1)
				player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		elseif itemEx.itemid == 5539 and itemEx.actionid == 12127 and player:getStorageValue(Storage.TheApeCity.Mission07) <= 3 then -- The Ape City - Mission 7: Destroying Casks With Crowbar
			toPosition:sendMagicEffect(CONST_ME_POFF)
			player:setStorageValue(Storage.TheApeCity.Mission07, player:getStorageValue(Storage.TheApeCity.Mission07) + 1) -- The Ape City Questlog - Mission 7: Destroying Casks With Crowbar
			if player:getStorageValue(Storage.TheApeCity.Mission07) == 4 then
				player:setStorageValue(Storage.TheApeCity.Questline, 17)
			end
			player:say("You destroyed a cask.", TALKTYPE_MONSTER_SAY)
			targetItem:transform(2249)
			addEvent(function(toPosition) toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN) end, 30 * 1000, toPosition)
			addEvent(function(toPosition) local tile = toPosition:getTile() if tile then local thing = tile:getItemById(2249) if thing and thing:isItem() then thing:transform(5539) end end end, 30 * 1000, toPosition)
		elseif (itemEx.actionid == 100 and itemEx.itemid == 2593) then -- Postman Quest
			if player:getStorageValue(250) == 3 then
				player:setStorageValue(250, 4)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
		end
	elseif itemEx.itemid == 1304 then
		if itemEx.uid == 1022 then --The Pits of Inferno Quest
			for i = 1, #lava do
				Game.createItem(5815, 1, lava[i])
			end
			targetItem:transform(2256)
			toPosition:sendMagicEffect(CONST_ME_SMOKE)
		elseif itemEx.actionid == 50058 then -- naginata quest
			local stoneStorage = Game.getStorageValue(itemEx.actionid)
			if stoneStorage ~= 5 then
				Game.setStorageValue(itemEx.actionid, math.max(0, stoneStorage or 0) + 1)
			elseif stoneStorage == 5 then
				Item(itemEx.uid):remove()
				Game.setStorageValue(itemEx.actionid)
			end
			
			toPosition:sendMagicEffect(CONST_ME_POFF)
			doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -31, -39, CONST_ME_NONE)
		end
	elseif itemEx.itemid == 9025 and itemEx.actionid == 101 then --The Banshee Quest
		targetItem:transform(392)
		targetItem:decay()
		toPosition:sendMagicEffect(CONT_ME_POFF)
	elseif itemEx.actionid == 50090 then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar) == 1 then -- The Hidden City of Beregar Quest
			player:teleportTo(Position(32566, 31338, 10))
		end
	elseif itemEx.actionid == 50114 then
		if Tile(Position(32617, 31513, 9)):getItemById(1027) and Tile(Position(32617, 31514, 9)):getItemById(1205) then
			Tile(Position(32619, 31514, 9)):getItemById(5709):remove()
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You can't remove this pile since it's currently holding up the tunnel.")
		end
	elseif itemEx.actionid == 50127 then
		local positions = {
			Position(32551, 31379, 15),
			Position(32551, 31378, 15),
			Position(32551, 31377, 15),
			Position(32551, 31376, 15),
			Position(32551, 31375, 15),
			Position(32551, 31374, 15),
			Position(32551, 31373, 15),
			Position(32550, 31373, 15),
			Position(32550, 31374, 15),
			Position(32550, 31375, 15),
			Position(32550, 31376, 15),
			Position(32550, 31377, 15),
			Position(32550, 31378, 15),
			Position(32550, 31379, 15)
		}
		local tile = Tile(Position(32551, 31379, 15))
		if tile:getItemById(9341) then
			tile:getItemById(9341):remove()
		end
		if tile:getItemById(1304) then
			tile:getItemById(1304):remove()
		end
		for i = 1, #positions do
			local ground = Tile(psoitions[i]):getGround()
			if ground and ground:getId() == 598 then
				ground:transform(5815)
			end
		end
		local portal = Game.createItem(1387, 1, Position(32551, 31376, 15))
		if portal then
			portal:setActionId(50126)
		end
	else
		return false
	end

	-- TODO: Add jamming, sickle, spoon and kitchen knife

	return true
end
