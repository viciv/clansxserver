local config = {
	[7844] = {
		[1] = {female = 269, male = 268, msg = "nightmare"}, 
		[2] = {female = 279, male = 278, msg = "brotherhood"}
	},
	[7845] = {
		[1] = {female = 269, male = 268, addon = 1, msg = "first nightmare"}, 
		[2] = {female = 279, male = 278, addon = 1, msg = "first brotherhood"}, 
		storageValue = 2
	},
	[7846] = {
		[1] = {female = 269, male = 268, addon = 2, msg = "second nightmare"}, 
		[2] = {female = 279, male = 278, addon = 2, msg = "second brotherhood"}, 
		storageValue = 3
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[item.itemid]
	if not targetItem then
		return true
	end

	local player = Player(cid)
	local choice = targetItem[1]
	if player:getStorageValue(Storage['OutfitQuest']['BrotherhoodOutfit']) > player:getStorageValue(Storage['OutfitQuest']['NightmareOutfit']) then
		choice = targetItem[2]
	end
	
	if choice['addon'] then
		if player:hasOutfit(player:getSex() == 0 and choice['female'] or choice['male']) then
			if not player:hasOutfit(player:getSex() == 0 and choice['female'] or choice['male'], choice['addon']) then
				if player:getStorageValue(Storage['OutfitQuest']['NightmareOutfit']) >= targetItem['storageValue'] or player:getStorageValue(Storage['OutfitQuest']['BrotherhoodOutfit']) >= targetItem['storageValue'] then
					player:addOutfitAddon(choice['female'], choice['addon'])
					player:addOutfitAddon(choice['male'], choice['addon'])
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. choice['msg'] .. ' addon!')
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
					Item(item.uid):remove(1)
				else
					return false
				end
			else
				player:sendCancelMessage('You have already obtained this addon!')
			end
		else
			return false
		end
	else
		if not player:hasOutfit(player:getSex() == 0 and choice['female'] or choice['male']) then
			if player:getStorageValue(Storage['OutfitQuest']['NightmareOutfit']) >= 1 or player:getStorageValue(Storage['OutfitQuest']['BrotherhoodOutfit']) >= 1 then
				player:addOutfit(choice['female'])
				player:addOutfit(choice['male'])
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. choice['msg'] .. ' outfit!')
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				Item(item.uid):remove(1)
			else
				return false
			end
		else
			player:sendCancelMessage('You have already obtained this outfit!')
		end
	end
	return true
end