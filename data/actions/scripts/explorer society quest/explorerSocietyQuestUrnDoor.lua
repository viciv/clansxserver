function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3002) then
		if(getPlayerStorageValue(cid, 90) >= 27) then
			if(item.itemid == 3542) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 3543)
			end
		end
	end
	return true
end