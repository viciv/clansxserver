local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local t = {}

local config = {
	["blue cloth"] = {value = 1, message = {"Brought the 50 pieces of blue cloth?", "Good. Get me 50 pieces of green cloth now."}, itemid = 5912, count = 50},
	["green cloth"] = {value = 2, message = {"Brought the 50 pieces of green cloth?", "Good. Get me 50 pieces of red cloth now."}, itemid = 5910, count = 50},
	["red cloth"] = {value = 3, message = {"Brought the 50 pieces of red cloth?", "Good. Get me 50 pieces of brown cloth now."}, itemid = 5911, count = 50},
	["brown cloth"] = {value = 4, message = {"Brought the 50 pieces of brown cloth?", "Good. Get me 50 pieces of yellow cloth now."}, itemid = 5913, count = 50},
	["yellow cloth"] = {value = 5, message = {"Brought the 50 pieces of yellow cloth?", "Good. Get me 50 pieces of white cloth now."}, itemid = 5914, count = 50},
	["white cloth"] = {value = 6, message = {"Brought the 50 pieces of white cloth?", "Good. Get me 10 spools of yarn now."}, itemid = 5909, count = 50},
	["spools of yarn"] = {value = 7, message = {"Brought the 10 spools of yarn?", "Thanks. That's it, you're done. Good job, player. I keep my promise. Here's my old assassin head piece."}, itemid = 5886, count = 10}
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, "addon") then
		local player = Player(cid)
		if player:hasOutfit(player:getSex() == 0 and 156 or 152) and player:getStorageValue(Storage.OutfitQuest.AssassinFirstAddon) < 1 then
			npcHandler:say("Vescu gave you an assassin outfit? Haha. Noticed it lacks the head piece? You look a bit silly. Want my old head piece?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif config[msg] and npcHandler.topic[cid] == 0 then
		if Player(cid):getStorageValue(Storage.OutfitQuest.AssassinFirstAddon) == config[msg].value then
			npcHandler:say(config[msg].message[1], cid)
			npcHandler.topic[cid] = 3
			t[cid] = msg
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({"Thought so. Could use some help anyway. Listen, I need stuff. Someone gave me a strange assignment - sneak into Thais castle at night and shroud it with cloth without anyone noticing it. ...", "I wonder why anyone would want to shroud a castle, but as long as long as the guy pays, no problem, I'll do the sneaking part. Need a lot of cloth though. ...", "Gonna make it colourful. Bring me 50 pieces of {blue cloth}, 50 pieces of {green cloth}, 50 pieces of {red cloth}, 50 pieces of {brown cloth}, 50 pieces of {yellow cloth} and 50 pieces of {white cloth}. ...", "Besides, gonna need 10 {spools of yarn}. Understood?"}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			local player = Player(cid)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1)
			player:setStorageValue(Storage.OutfitQuest.AssassinFirstAddon, 1)
			npcHandler:say("Good. Start with the blue cloth. I'll wait.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			local player, targetTable = Player(cid), config[t[cid]]
			if player:getItemCount(targetTable.itemid) >= targetTable.count then 
				player:removeItem(targetTable.itemid, targetTable.count)
				player:setStorageValue(Storage.OutfitQuest.AssassinFirstAddon, math.max(0, player:getStorageValue(Storage.OutfitQuest.AssassinFirstAddon)) + 1)
				if player:getStorageValue(Storage.OutfitQuest.AssassinFirstAddon) == 8 then
					player:addOutfitAddon(156, 1)
					player:addOutfitAddon(152, 1)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:setStorageValue(Storage.OutfitQuest.AssassinFirstAddon, 9)
				end
				npcHandler:say(targetTable.message[2], cid)
			else
				npcHandler:say("You don't have the required items.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] > 0 then
		npcHandler:say("Maybe another time.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

local function onReleaseFocus(cid)
	t[cid] = nil
end

npcHandler:setMessage(MESSAGE_GREET, "What the... I mean, of course I sensed you.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:addModule(FocusModule:new())
