--EMW5 Bosses shares a lot of behaviors from final demo egg mobile, mostly Dark Brad and Metal Sonics

// The Egg Mobile originally bounced off of players instead of going through them in "SKULLFLY" mode
local function BounceSkullFly(tmthing, thing)
	if not (tmthing and tmthing.valid and thing and thing.valid) then return end

	-- Only bounce off of objects if the Final Demo Egg Mobile is in "SKULLFLY" mode
	if not (tmthing.flags2 & MF2_SKULLFLY) then return end

	-- Don't let spikeballs interrupt the Egg Mobile's movement
	if thing.type == MT_SPIKEBALL then return end

	tmthing.momx = -$
	tmthing.momy = -$
	tmthing.momz = -$
	return false
end

// Ported BossThinker behavior for Final Demo Egg Mobile from 1.09.4
local function FDBossThinker(mo)
	if not (mo and mo.valid) then return end

	if mo.health < mo.info.damage+1 and (leveltime & 1) and mo.health > 0 then
		P_SpawnMobj(mo.x, mo.y, mo.z, MT_SMOKE) -- Replace MT_SMOKE with MT_21SMOKE if necessary
	end
	if mo.flags2 & MF2_SKULLFLY then
		-- TODO: Make this use a larger version of MT_THOK for better compatibility
		local spawnmobj = P_SpawnMobj(mo.x, mo.y, mo.z, mo.info.painchance)
		spawnmobj.target = mo
		spawnmobj.color = SKINCOLOR_GREY
	end

	if states[mo.state].nextstate == mo.info.spawnstate and mo.tics == 1 then
		mo.flags2 = $ & ~MF2_FRET
		if not (mo.flags2 & MF2_SKULLFLY) then
			mo.momx = 0
			mo.momy = 0
			mo.momz = 0
		end
	end

	--Fixes bosses not reacting sometimes
	if mo.state == mobjinfo[mo.type].spawnstate then P_LookForPlayers(mo, 0, true) end

	--Jet fumes doesn't exists in EggmanWay 5
	--if not mo.tracer then A_OldBossJetFumes(mo, 2, 0) end

	if not (mo.target and mo.target.valid and (mo.target.flags & MF_SHOOTABLE)) then
		if mo.health <= 0 then
			if P_LookForPlayers(mo, 0, true) and mo.info.mass then -- Bid farewell!
				S_StartSound(mo, mo.info.mass)
			end
			return true
		end

		-- look for a new target
		if P_LookForPlayers(mo, 0, true) and mo.info.seesound then
			S_StartSound(mo, mo.info.seesound)
		end

		return true
	end

	-- The pre-1.09 Egg Mobile doesn't always float 33 FRACUNITs above the ground,
	-- but we don't have an option for pre-1.09 behavior, so just use the 1.09-2.0 behavior.
	if mo.state == mo.info.spawnstate then A_FDBoss1Chase(mo, 1, 0) end

	if mo.state == mo.info.meleestate
	or (mo.state == mo.info.missilestate and mo.health > mo.info.damage) then
		mo.angle = R_PointToAngle2(mo.x, mo.y, mo.target.x, mo.target.y)
	end

	return true
end

--Death Behavior
local function BossDeath(mo)
	if not mo and mo.valid then return end

	-- Delete the Egg Mobile outright in Chaos Mode
	if mo.rbChaosBoss then
		mo.health = 0
		P_RemoveMobj(mo)
		return true
	end

	-- Despite its name, this function does practically the same thing Final Demo does
	A_21BossDeath(mo)

	return true
end

--Hook everything for each boss
addHook("MapThingSpawn", RB_Pre21EggMobileMapThingSpawn, MT_METALIX)
addHook("MapThingSpawn", RB_Pre21EggMobileMapThingSpawn, MT_CLASSICMETAL)
addHook("MapThingSpawn", RB_Pre21EggMobileMapThingSpawn, MT_EMWEGG)
addHook("MobjMoveCollide", BounceSkullFly, MT_METALIX)
addHook("MobjMoveCollide", BounceSkullFly, MT_CLASSICMETAL)
addHook("MobjMoveCollide", BounceSkullFly, MT_EMWEGG)
addHook("BossThinker", FDBossThinker, MT_METALIX)
addHook("BossThinker", FDBossThinker, MT_CLASSICMETAL)
addHook("BossThinker", FDBossThinker, MT_EMWEGG)
addHook("MobjThinker", RB_21BossFlash, MT_METALIX)
addHook("MobjThinker", RB_21BossFlash, MT_CLASSICMETAL)
addHook("MobjThinker", RB_21BossFlash, MT_EMWEGG)
addHook("MobjThinker", RB_21BossFlash, MT_GUARDIANBODY)
addHook("MobjThinker", RB_21BossFlash, MT_GUARDIANHEAD)
addHook("MobjThinker", RB_21BossFlash, MT_GUARDLEFTHAND)
addHook("MobjThinker", RB_21BossFlash, MT_GUARDRIGHTHAND)
addHook("BossDeath", BossDeath, MT_DARKBRAD)
addHook("BossDeath", BossDeath, MT_METALIX)
addHook("BossDeath", BossDeath, MT_CLASSICMETAL)
addHook("BossDeath", BossDeath, MT_EMWEGG)
addHook("BossDeath", BossDeath, MT_GUARDIANHEAD)
addHook("BossDeath", BossDeath, MT_GUARDLEFTHAND)
addHook("BossDeath", BossDeath, MT_GUARDRIGHTHAND)
addHook("BossDeath", BossDeath, MT_DARKBSHRINE)