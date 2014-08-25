local holeId = {
	294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 430, 462, 469, 470, 482,
	484, 485, 489, 924, 3135, 3136, 7933, 7938, 8170, 8286, 8285, 8284, 8281,
	8280, 8279, 8277, 8276, 8323, 8567, 8585, 8596, 8595, 8249, 8250, 8251,
	8252, 8253, 8254, 8255, 8256, 8592, 8972, 9606, 9625, 13190, 14461, 19519, 21536
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tile = toPosition:getTile()
	local ground = tile:getGround()
	if ground and isInArray(ropeSpots, ground:getId()) or tile:getItemById(14435) then
		local player = Player(cid)
		player:teleportTo({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, false)
		if itemEx.itemid == 8592 then
			if player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 22 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have successfully used your rope to climb out of the hole. Congratulations! Now continue to the east.')
			end
		end
		return true
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

		Player(cid):sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	return false
end