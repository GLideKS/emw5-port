local Object_OldVariant = {
	--Monitors
	MT_1UP_BOX = MT_FDBOX_1UP,
	MT_RING_BOX = MT_FDBOX_RING,
	MT_ATTRACT_BOX = MT_FDBOX_YELLOW,
	MT_FORCE_BOX = MT_FDBOX_BLUE,
	MT_ARMAGEDDON_BOX = MT_FDBOX_BLACK,
	MT_WHIRLWIND_BOX = MT_FDBOX_WHITE,
	MT_SNEAKERS_BOX = MT_FDBOX_SHOES,
	MT_INVULN_BOX = MT_FDBOX_INVIN,
	MT_EGGMAN_BOX = MT_FDBOX_EGGMAN,
	MT_MIXUP_BOX = MT_FDBOX_MIXUP,
	MT_MYSTERY_BOX = MT_FDBOX_QUESTION,
	MT_ELEMENTAL_BOX = MT_FDBOX_BLUE,
}

for i, v in pairs(Object_OldVariant) do
	print(i)
	addHook("MobjSpawn", function(mo)
		if mapheaderinfo[gamemap].emw5 then
			mo.type = v
			P_SetMobjStateNF(mo, mobjinfo[v].spawnstate)
			return true
		end
	end, _G[i])
end