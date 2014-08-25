local breakChance = 60

local rustyItems = {   
	[9808] = {2464, 2465, 2483, 2463, 2476}, 
	[9809] = {2464, 2465, 2483, 2463, 2476, 8891, 2487}, 
	[9810] = {2465, 2463, 2476, 8891, 2487, 2466, 2492, 2472}, 
	[9811] = {2468, 2648, 2478, 2647, 2477}, 
	[9812] = {2468, 2648, 2478, 2647, 2477, 2488}, 
	[9813] = {2468, 2648, 2478, 2647, 2477, 2488, 2470}, 
	[9814] = {2511, 2510, 2530, 2509, 2513, 2515}, 
	[9815] = {2511, 2510, 2530, 2509, 2513, 2515, 2516, 2519}, 
	[9816] = {2511, 2510, 2530, 2509, 2513, 2515, 2516, 2519, 2520, 2514}, 
	[9817] = {2643, 3982, 5462, 7457},   
	[9818] = {2643, 3982, 5462, 7457, 2195}, 
	[9819] = {2643, 3982, 5462, 7457, 2195, 2645}, 
	[9820] = {2458, 2460, 2480, 2481, 2457, 2491}, 
	[9821] = {2458, 2460, 2480, 2481, 2457, 2491, 2497}, 
	[9822] = {2458, 2460, 2480, 2481, 2457, 2491, 2497, 2475, 2498} 
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local iEx = Item(itemEx.uid)
	if rustyItems[itemEx.itemid] ~= nil then
		if math.random(100) <= breakChance then
			iEx:remove()
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You broke it.")
			player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
		else         
			local newId = rustyItems[itemEx.itemid][math.random(#rustyItems[itemEx.itemid])]
			iEx:transform(newId)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You removed the rust, revealing a "..ItemType(newId):getName())
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
		Item(item.uid):remove(1)
		return true
	end
	return false
end
