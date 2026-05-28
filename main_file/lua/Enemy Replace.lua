function A_TurretFire(actor, var1, var2)
	if actor.type == MT_TURRET --Only replace it's ammo with flame thrower in EMW5 maps.
	and mapheaderinfo[gamemap].emw5 then
		super(actor, MT_EMW5_FLAMETHROWER, nil)
		return
	end

	super(actor, var1, var2)
end