local Object_OldVariant = {
	MT_BLUECRAWLA = MT_SENKUCRAWLA,
	MT_REDCRAWLA = MT_EMW5_FLYINGCRAWLA,
	MT_DETON = MT_EMW5_DETON,
	MT_SKIM = MT_EMW5_SKIM,
	MT_CRAWLACOMMANDER = MT_OLDCRAWLACOMANDER
}

for i, v in pairs(Object_OldVariant) do
	print(i)
	addHook("MobjSpawn", function(mo)
		if mapheaderinfo[gamemap].emw5 then
			mo.type = v
			P_SetMobjStateNF(mo, mobjinfo[v].spawnstate)
			mo.flags = mobjinfo[v].flags
			return true
		end
	end, _G[i])
end

--Ammo replacing
addHook("MapLoad", function()
    if mapheaderinfo[gamemap].emw5 then
        states[S_TURRETFIRE].var1 = MT_EMW5_FLAMETHROWER --Turret's laser to flame thrower
    else
        states[S_TURRETFIRE].var1 = 0
    end
end)