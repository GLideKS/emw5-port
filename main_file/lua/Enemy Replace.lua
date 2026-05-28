local Object_OldVariant = {
	MT_BLUECRAWLA = MT_SENKUCRAWLA,
	MT_REDCRAWLA = MT_EMW5_FLYINGCRAWLA,
	MT_DETON = MT_EMW5_DETON,
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

function A_TurretFire(actor, var1, var2)
	if actor.type == MT_TURRET --Only replace it's ammo with flame thrower in EMW5 maps.
	and mapheaderinfo[gamemap].emw5 then
		super(actor, MT_EMW5_FLAMETHROWER, nil)
		return
	end

	super(actor, var1, var2)
end