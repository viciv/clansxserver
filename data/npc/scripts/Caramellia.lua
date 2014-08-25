local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local random_texts = {
	'Can I finally have some peace...?',
	'Please leave me alone in my mourning.'
}

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 10)
		if(math.random(100) < 20) then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

keywordHandler:addKeyword({'mourning'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All is lost. With {Winfred} dead, my love has died and I'm only an empty shell without hope or purpose."})
keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We put all our hope in this far away colony. Sadly, we never made it there and I will never know what our life would have been like in Port Hope."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I guess he was the one that put my father up to the whole thing. He spied on Winfred and me and it was certainly him that suggested my {imprisonment} in this tower."})
keywordHandler:addKeyword({'imprisonment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This forsaken place seems as remote from the rest of the world as my heart is."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Please leave me alone in my mourning."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The bustling streets of Thais are all but a faint memory to me."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin is a lovely and green city as far as I remember."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My father wanted me to marry a wealthy Venorean. He understood so little about love and the ways of the heart."})
keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city of the elves is an exotic wonder."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city is like the dwarfs that built it. Stony, never-changing and hard to understand for an outsider."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "winfred") then
		npcHandler:say({'He was my one and only true love. He was a mere commoner and so my {father} forbid me to see him ...',
		'We met anyway, we had plans to flee to {Port Hope} and to start a new life there ...',
		'A {druid}, in service of my father, had spied on us. So they brought me here and locked me into this {tower}. The druid cast a spell on the plants at the entrance which kept everyone from entering the tower ...',
		'I could see Winfred from the window but he could not come to me. One day he disappeared. I knew immediately that something horrible had happened to him.'}, cid)
	elseif msgcontains(msg, "father") then
		npcHandler:say({'He wasn\'t a bad man. He was only misguided by false friends who told him what society expected of him ...',
		'By trying to uphold a respectable image in society, he ruined not only my life but also his own.'}, cid)
	elseif msgcontains(msg, "tower") then
		npcHandler:say({'Once, this tower has been my prison but after the death of Winfred it has become my refuge from the rest of the world. ...',
		'I welcome the loneliness here because it mirrors the state of my heart.'}, cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|. Please leave me alone in my {mourning}.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
