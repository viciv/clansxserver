function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
		if itemEx.itemid == 9738 then  
			local ret = Game.createMonster("Tormented Ghost", fromPosition)
    		local ret2 = Game.createMonster("Tormented Ghost", fromPosition)    
          	ret:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	ret2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	toPosition:sendMagicEffect(12)
          	Item(item.uid):remove()
			player:say("The ghost charm is charging.", TALKTYPE_MONSTER_SAY)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9738 ).uid, 9739) 
    	elseif itemEx.itemid == 9739 then 
			local ret = Game.createMonster("Tormented Ghost", fromPosition)
    		local ret2 = Game.createMonster("Tormented Ghost", fromPosition)  
          	ret:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	ret2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	toPosition:sendMagicEffect(12)
          	Item(item.uid):remove()
			player:say("The ghost charm is charging.", TALKTYPE_MONSTER_SAY)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9739 ).uid, 9740)
    	elseif itemEx.itemid == 9740 then 
			local ret = Game.createMonster("Tormented Ghost", fromPosition)
    		local ret2 = Game.createMonster("Tormented Ghost", fromPosition)  
          	ret:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	ret2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	toPosition:sendMagicEffect(12)
          	Item(item.uid):remove()
			player:say("The ghost charm is charging.", TALKTYPE_MONSTER_SAY)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9740).uid, 9773)
    	elseif itemEx.itemid == 9773 then
			local ret = Game.createMonster("Tormented Ghost", fromPosition)
    		local ret2 = Game.createMonster("Tormented Ghost", fromPosition)  
          	ret:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	ret2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
          	toPosition:sendMagicEffect(12)
          	Item(item.uid):remove()
			player:setStorageValue(Storage.InServiceofYalahar.Questline, 37)
			player:setStorageValue(Storage.InServiceofYalahar.Mission06, 3) -- StorageValue for Questlog "Mission 06: Frightening Fuel"
			player:removeItem(9737, 1)
			player:say("The ghost charm is charged.", TALKTYPE_MONSTER_SAY)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9773).uid, 9742) 
          end  
          return true
end  