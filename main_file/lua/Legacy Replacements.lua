addHook("MobjSpawn", function(mo)
	if mo.type == MT_1UP_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_1UP end
end,MT_1UP_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_RING_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_RING end
end,MT_RING_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_ATTRACT_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_YELLOW end
end,MT_ATTRACT_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_FORCE_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_BLUE end
end,MT_FORCE_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_ARMAGEDDON_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_BLACK end
end,MT_ARMAGEDDON_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_WHIRLWIND_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_WHITE end
end,MT_WHIRLWIND_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_SNEAKERS_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_SHOES end
end,MT_SNEAKERS_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_INVULN_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_INVIN end
end,MT_INVULN_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_EGGMAN_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_EGGMAN end
end,MT_EGGMAN_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_MIXUP_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_MIXUP end
end,MT_MIXUP_BOX)

addHook("MobjSpawn", function(mo)
	if mo.type == MT_MYSTERY_BOX and mapheaderinfo[gamemap].emw5 then mo.type = MT_FDBOX_QUESTION end
end,MT_MYSTERY_BOX)