function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 5938) then
		if(itemEx.itemid == 5663) then
			doSendMagicEffect(toPosition, CONST_ME_LOSEENERGY)
			doTransformItem(item.uid, 5939)
		end
	end
	return true
end