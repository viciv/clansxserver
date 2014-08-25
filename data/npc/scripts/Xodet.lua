local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}
	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if player:getStorageValue(50079) == -1 then
				selfSay('So you ask me for a {' .. ItemType(items[player:getVocation():getId()]):getName() .. '} to begin your adventure?', cid)
				npcHandler.topic[cid] = 1
			else
				selfSay('What? I have already gave you one {' .. ItemType(items[player:getVocation():getId()]):getName() .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes')) then
		if(npcHandler.topic[cid] == 1) then
			player:addItem(items[player:getVocation():getId()], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			player:setStorageValue(50079, 1)
		end
		npcHandler.topic[cid] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, npcHandler.topic[cid]) == true) then
		selfSay('Ok then.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())