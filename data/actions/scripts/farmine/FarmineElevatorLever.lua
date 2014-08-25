local config = {
	[9118] = {destination = {x=32991, y=31539, z=4}},
	[9119] = {destination = {x=32991, y=31539, z=1}},
	[9121] = {destination = {x=32993, y=31547, z=4}} -- levers in farmine
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local Startposition = {x = toPosition.x - 1, y = toPosition.y, z = toPosition.z} -- Startposition of elevator always left of lever
	local Elevatoruser = Tile(Position(Startposition)):getTopCreature() -- get player who stand on the Startposition elevator
	
	if Elevatoruser == nil or not Elevatoruser:isPlayer() then -- creature and player check
		Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
		return true
	end
	
	local lever = config[item.actionid]
	if lever and item.itemid == 1945 then
		Elevatoruser:teleportTo(lever.destination)
		Position(lever.destination):sendMagicEffect(CONST_ME_TELEPORT)
		
	-- if lever outdoor then select the farminestage
	elseif item.actionid == 9120 and item.itemid == 1945 then 
		if Player(Elevatoruser):getStorageValue(12135) == 7 then --if The New Frontier Quest "Mission 05: Getting Things Busy" complete then Stage 3
			Elevatoruser:teleportTo({x=33061, y=31527, z=10})
			Position({x=33061, y=31527, z=10}):sendMagicEffect(CONST_ME_TELEPORT)
			Item(item.uid):transform(1946)
			return true
		elseif Player(Elevatoruser):getStorageValue(12133) == 3 then --if The New Frontier Quest "Mission 03: Strangers in the Night" complete then Stage 2
			Elevatoruser:teleportTo({x=33061, y=31527, z=12})
			Position({x=33061, y=31527, z=12}):sendMagicEffect(CONST_ME_TELEPORT)
			Item(item.uid):transform(1946)
			return true
		else --if nothing done Stage 1
			Elevatoruser:teleportTo({x=33061, y=31527, z=14})
			Position({x=33061, y=31527, z=14}):sendMagicEffect(CONST_ME_TELEPORT)
			Item(item.uid):transform(1946)
			return true
		end
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end