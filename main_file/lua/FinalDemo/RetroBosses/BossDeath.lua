function A_21BossDeath(actor, var1, var2)
	-- Stop exploding and prepare to run.
	actor.state = actor.info.xdeathstate
	if not actor.valid then return end

	actor.target = nil
	local bossid = 0
	if actor.spawnpoint and actor.spawnpoint.valid then bossid = actor.spawnpoint.args[0] end

	-- Flee! Flee! Find a point to escape to! If none, just shoot upward!
	-- scan the thinkers to find the runaway point
	for th in mobjs.iterate() do
		if th.type == MT_BOSSFLYPOINT then
			-- UDMF support for Boss IDs!
			if udmf then
				if not (th.spawnpoint and th.spawnpoint.valid and bossid == th.spawnpoint.tag) then continue end
			end

			-- If this one's closer then the last one, go for it
			if not (actor.target and actor.target.valid) or
			FixedHypot(FixedHypot(actor.x - th.x, actor.y - th.y), actor.z - th.z) <
			FixedHypot(FixedHypot(actor.x - actor.target.x, actor.y - actor.target.y), actor.z - actor.target.z) then
				actor.target = th
			end
			-- Otherwise... Don't!
		end
	end

	actor.flags = $|MF_NOGRAVITY|MF_NOCLIP
	actor.flags = $|MF_NOCLIPHEIGHT

	if actor.target and actor.target.valid then
		actor.angle = R_PointToAngle2(actor.x, actor.y, actor.target.x, actor.target.y)
		actor.flags2 = $|MF2_BOSSFLEE
		actor.momz = FixedMul(FixedDiv(actor.target.z - actor.z, FixedHypot(actor.x-actor.target.x,actor.y-actor.target.y)), FixedMul(2*FRACUNIT, actor.scale))
	else
		actor.momz = FixedMul(2*FRACUNIT, actor.scale)
	end
end

local function BossDeath(mo)
	if not mo and mo.valid then return end
	-- Despite its name, this function does practically the same thing Final Demo does
	A_21BossDeath(mo)
	return true
end

addHook("BossDeath", BossDeath, MT_DARKBRAD)
addHook("BossDeath", BossDeath, MT_METALIX)
addHook("BossDeath", BossDeath, MT_CLASSICMETAL)
addHook("BossDeath", BossDeath, MT_EMWEGG)
addHook("BossDeath", BossDeath, MT_DARKBSHRINE)