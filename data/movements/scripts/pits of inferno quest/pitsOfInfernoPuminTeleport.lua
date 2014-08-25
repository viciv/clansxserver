function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(Storage.pitsOfInferno.Pumin) >= 9 then
		player:teleportTo(Position(32786, 32308, 15))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "To enter Pumin's domain you must gain permission from the bureaucrats.")
	end
	return true
end
