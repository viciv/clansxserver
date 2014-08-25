function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pos = getPlayerPosition(cid)
	if (item.itemid >= 14767 or item.itemid <= 14771) then
		if pos.x < toPosition.x then
			doTeleportThing(cid, {x=toPosition.x+1,y=toPosition.y,z=toPosition.z})
			doSendMagicEffect({x=toPosition.x+1,y=toPosition.y,z=toPosition.z}, CONST_ME_TELEPORT)
		elseif pos.x > toPosition.x then
			doTeleportThing(cid, {x=toPosition.x-1,y=toPosition.y,z=toPosition.z})
			doSendMagicEffect({x=toPosition.x-1,y=toPosition.y,z=toPosition.z}, CONST_ME_TELEPORT)
		end
	end
	return true
end