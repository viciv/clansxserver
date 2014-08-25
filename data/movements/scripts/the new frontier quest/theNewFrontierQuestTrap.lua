
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if(item.actionid == 8007) then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 22 then
			player:setStorageValue(Storage.TheNewFrontier.Questline, 23)
			player:setStorageValue(12137, 2) --Questlog, The New Frontier Quest "Mission 07: Messengers Of Peace"
		end
		local destination = Position({x = 33170, y = 31253, z = 11})
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_POFF)
		player:say("So far for the negotiating peace. Now you have other problems to handle.", TALKTYPE_MONSTER_SAY)
	end
	return true
end