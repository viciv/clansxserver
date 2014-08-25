local teleport = {
	[3103] = {action = 1, {x = 32861, y = 31061, z = 9}, {x = 32859, y = 31056, z = 9}},
	[3104] = {action = 0, {x = 32856, y = 31055, z = 9}},
	[3105] = {action = 1, {x = 32888, y = 31045, z = 9}, {x = 32894, y = 31044, z = 9}},
	[3106] = {action = 0, {x = 32894, y = 31046, z = 9}},
}

local soil = {8302, 8303, 8298, 8299}
local engerysoil = 0

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if teleport[item.uid].action == 1 then
		for _, i in pairs(soil) do
			engerysoil = getTileItemById(teleport[item.uid][2], i).uid
			if engerysoil > 0 then
				break
			end
		end
		if engerysoil > 0 then
			Item(engerysoil):remove(1)
			player:teleportTo(teleport[item.uid][1])
			Position(teleport[item.uid][1]):sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
			player:say("You may not enter without a sacrifice of a elemental soil.", TALKTYPE_MONSTER_SAY)
		end
	else
		player:teleportTo(teleport[item.uid][1])
		Position(teleport[item.uid][1]):sendMagicEffect(CONST_ME_ENERGYHIT)
	end
	return true
end
