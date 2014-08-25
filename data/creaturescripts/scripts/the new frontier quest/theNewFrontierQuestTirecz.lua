
function onKill(cid, target)
	local monster = Monster(target)
	if monster then
		if string.lower(monster:getName()) == "tirecz" then
			Game.setStorageValue(Storage.TheNewFrontier.Mission09, -1)
			clearArena({x = 33053, y = 31024, z = 3}, {x = 33074, y = 31044, z = 3})
			local spectators = Game.getSpectators(Position({x = 33063, y = 31034, z = 3}), false, true, 10, 10, 10, 10)
			for _, spectator in ipairs(spectators) do
				spectator:teleportTo({x = 33053, y = 31022, z = 7})
				spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				spectator:say("You have won! As new champion take the ancient armor as reward before you leave.", TALKTYPE_MONSTER_SAY)
				if spectator:getStorageValue(Storage.TheNewFrontier.Questline) == 25 then
					spectator:setStorageValue(Storage.TheNewFrontier.Mission09, 2) --Questlog, The New Frontier Quest "Mission 09: Mortal Combat"
					spectator:setStorageValue(Storage.TheNewFrontier.Questline, 26)
				end
			end
		end
	end
	return true
end