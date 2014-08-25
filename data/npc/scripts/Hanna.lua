local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "addon") or msgcontains(msg, "outfit") then
		if player:getStorageValue(Storage.OutfitQuest.CitizenHatAddon) < 1 then
			npcHandler:say("Pretty, isn't it? My friend Amber taught me how to make it, but I could help you with one if you like. What do you say?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "hat") then
		if player:getStorageValue(Storage.OutfitQuest.CitizenHatAddon) == 1 then
			npcHandler:say("Oh, you're back already? Did you bring a legion helmet, 100 chicken feathers and 50 honeycombs?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then	
			npcHandler:say({"Okay, here we go, listen closely! I need a few things...",
							"a basic hat of course, maybe a legion helmet would do. Then about 100 chicken feathers...",
							"and 50 honeycombs as glue. That's it, come back to me once you gathered it!"}, cid, 0, 1, 3500)
			npcHandler.topic[cid] = 0
			player:setStorageValue(Storage.OutfitQuest.CitizenHatAddon, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
		elseif npcHandler.topic[cid] == 2 then
			if player:getItemCount( 5890) >= 100 and player:getItemCount( 5902) >= 50 and player:getItemCount( 2480) >= 1  then
				npcHandler:say("Great job! That must have taken a lot of work. Okay, you put it like this... then glue like this... here!", cid)
				player:removeItem(5890, 100)
				player:removeItem(5902, 50)
				player:removeItem(2480, 1)
				player:setStorageValue(Storage.OutfitQuest.CitizenHatAddon, 2)
				player:addOutfitAddon(136, 2)
				player:addOutfitAddon(128, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] > 0 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())