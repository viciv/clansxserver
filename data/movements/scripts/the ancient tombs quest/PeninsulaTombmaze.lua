function onStepIn(cid, item, position, fromPosition)
	if(item.actionid == 12101) then
		local player = Player(cid)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
