function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pos = getPlayerPosition(cid)
	if (item.itemid >= 14755 or item.itemid <= 14760) then
		if pos.y < toPosition.y then
			doTeleportThing(cid, {x=toPosition.x,y=toPosition.y+1,z=toPosition.z})
			doSendMagicEffect({x=toPosition.x,y=toPosition.y+1,z=toPosition.z}, CONST_ME_TELEPORT)
		elseif pos.y > toPosition.y then
			doTeleportThing(cid, {x=toPosition.x,y=toPosition.y-1,z=toPosition.z})
			doSendMagicEffect({x=toPosition.x,y=toPosition.y-1,z=toPosition.z}, CONST_ME_TELEPORT)
		end
	end
	return true
end