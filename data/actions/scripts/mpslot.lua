local conf = {
maxSlotCount=2,
ignoredIds={}
}

function choose(...)
   local arg = {...}
   return arg[math.random(1,#arg)]
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
   if item.uid == 0 or item.itemid == 0 then return false end
   toPosition.stackpos = 255
  if isInArray(conf.ignoredIds, itemEx.itemid) or
     isItemStackable(itemEx.uid) or
     itemEx.itemid == 0 or
     itemEx.type > 1 or
     not(isArmor(itemEx.uid) or isWeapon(itemEx.uid) or isShield(itemEx.uid)) then
  return false
  end
  if isCreature(itemEx.uid) then
  return false
  end
   local nam = Item(itemEx.uid):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
   function getper()
     local n = 1
     for i=1,10 do
       n = n+math.random(0,10)
       if n < 8*i then
         break
       end
     end
     return n
   end
   function getSlotCount(nam)
     local c = 0
     for _ in nam:gmatch('%[(.-)%]') do
       c = c+1
     end
     return c
   end
   if getSlotCount(nam) < conf.maxSlotCount then
     local l = choose('mp')
     local p = getper()
     doSendMagicEffect(toPosition,30)
     nam = nam..' ['..l..'.+'..p..'%]'
     doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,l..'.+'..p..'%')
     doSetItemSpecialDescription(itemEx.uid, nam)
     doRemoveItem(item.uid,1)
   else
     doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Slot limit reached.")
   end
   return true
end