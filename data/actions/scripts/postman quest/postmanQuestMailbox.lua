local doors = {
	5290,
	5105,
	1225,
	5114,
	1223,
	5123,
	7049,
	7040,
	9177,
	10791,
	12204,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7815) then
		if(getPlayerStorageValue(cid, 250) >= 45) then
			if(isInArray(doors, item.itemid)) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	end
	return true
end