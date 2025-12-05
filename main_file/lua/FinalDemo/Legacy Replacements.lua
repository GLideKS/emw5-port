--Monitors

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_1UP end
end,MT_1UP_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_RING end
end,MT_RING_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_YELLOW end
end,MT_ATTRACT_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_BLUE end
end,MT_FORCE_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_BLACK end
end,MT_ARMAGEDDON_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_WHITE end
end,MT_WHIRLWIND_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_SHOES end
end,MT_SNEAKERS_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_INVIN end
end,MT_INVULN_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_EGGMAN end
end,MT_EGGMAN_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_MIXUP end
end,MT_MIXUP_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_QUESTION end
end,MT_MYSTERY_BOX)

addHook("MobjSpawn", function(mo)
	if mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_BLUE end
end,MT_ELEMENTAL_BOX)

--Enemies

addHook("MobjSpawn", function(mo)
	if mo.type == MT_CRAWLACOMMANDER and mapheaderinfo[gamemap].emw5 then mo.type = MT_OLDCRAWLACOMANDER end
end,MT_CRAWLACOMMANDER)