//Code from SRB2 the Past

local function nomissile(actor)
	if not (actor and actor.valid) then return end
	
	// possibly choose another target
	if multiplayer and P_RandomByte() < 2
		if P_LookForPlayers(actor, 0, true, false)
			return // got a new target
		end
	end
	
	//chase towards player
	actor.movecount = $-1
	if actor.movecount < 0 or not P_Move(actor, actor.info.speed)
		P_NewChaseDir(actor)
	end
end

local function FD_Boss1Chase(actor, var1, var2)
	if not (actor and actor.valid) then return end
	
	local delta
	
	if actor.reactiontime then actor.reactiontime = $-1 end
	
	// turn towards movement direction if not there yet
	if actor.movedir < NUMDIRS then // NUMDIRS should be 8
		actor.angle = $ & (7 * (2^29))
		delta = actor.angle - (actor.movedir * (2^29))
		
		if delta > 0 then
			actor.angle = $-ANGLE_45
		elseif delta < 0 then
			actor.angle = $+ANGLE_45
		end
	end
	
	// do not attack twice in a row
	if (actor.flags2 & MF2_JUSTATTACKED) then
		actor.flags2 = $ & ~MF2_JUSTATTACKED
		P_NewChaseDir(actor)
		return
	end
	
	if actor.movecount then
		nomissile(actor)
		return
	end
	
	if not P_CheckMissileRange(actor) then
		nomissile(actor)
		return
	end
	
	if actor.reactiontime <= 0 then
		if actor.health > actor.info.damage then
			if (P_RandomByte() & 1) then
				actor.state = actor.info.missilestate
			else
				actor.state = actor.info.meleestate
			end
		else
			actor.state = actor.info.raisestate
		end
		
		actor.flags2 = $|MF2_JUSTATTACKED
		actor.reactiontime = 2*TICRATE
		return
	end
end

// Make the Final Demo Egg Mobile spawn 33 FRACUNITS off the ground if its z-position hasn't been set
local function Spawn33FU(mobj, mapthing)
	if not (mobj and mobj.valid
	and mapthing and mapthing.valid)
		return
	end
	
	local offset
	
	if mapthing.z ~= 0
		offset = mapthing.z
	else
		offset = 33*FRACUNIT
	end
	
	if (mapthing.options & MTF_OBJECTFLIP)
		if offset ~= 0
			mobj.z = mobj.z - offset
		else
			mobj.z = mobj.ceilingz
		end
	else
		if offset ~= 0
			mobj.z = mobj.z + offset
		else
			mobj.z = mobj.floorz
		end
	end
end

// The Egg Mobile originally bounced off of players instead of going through them in "SKULLFLY" mode
local function BounceSkullFly(tmthing, thing)
	if not (tmthing and tmthing.valid
	and thing and thing.valid) then
		return
	end
	
	// Only bounce off of objects if the Final Demo Egg Mobile is in "SKULLFLY" mode
	if not (tmthing.flags2 & MF2_SKULLFLY) then return end
	
	// Don't let spikeballs interrupt the Egg Mobile's movement
	if thing.type == MT_SPIKEBALL then return end
	
	tmthing.momx = -$
	tmthing.momy = -$
	tmthing.momz = -$
	return false
end

// Ported BossThinker behavior for Final Demo Egg Mobile from 1.09.4
local function FDBossThinker(mobj)
	if not (mobj and mobj.valid) then return end
	
	if mobj.health < mobj.info.damage+1 and (leveltime & 1) and mobj.health > 0 then
		P_SpawnMobj(mobj.x, mobj.y, mobj.z, MT_SMOKE) // Replace MT_SMOKE with MT_21SMOKE if necessary
	end
	if mobj.flags2 & MF2_SKULLFLY then
		local spawnmobj
		spawnmobj = P_SpawnMobj(mobj.x, mobj.y, mobj.z, mobj.info.painchance)
		spawnmobj.target = mobj
		spawnmobj.color = SKINCOLOR_GREY
	end
	
	if states[mobj.state].nextstate == mobj.info.spawnstate and mobj.tics == 1 then
		mobj.flags2 = $ & ~MF2_FRET
		if not (mobj.flags2 & MF2_SKULLFLY) then
			mobj.momx = 0
			mobj.momy = 0
			mobj.momz = 0
		end
	end
	
	if not (mobj.target and mobj.target.valid and (mobj.target.flags & MF_SHOOTABLE)) then
		if mobj.health <= 0 then
			if P_LookForPlayers(mobj, 0, true) and mobj.info.mass then // Bid farewell!
				S_StartSound(mobj, mobj.info.mass)
			end
			return true
		end
		
		// look for a new target
		if P_LookForPlayers(mobj, 0, true) then
			S_StartSound(mobj, mobj.info.seesound)
			FD_Boss1Chase(mobj, 1, 0)
		end
		
		return true
	end
	
	if mobj.state == mobj.info.spawnstate then FD_Boss1Chase(mobj, 1, 0) end
	
	if mobj.state == mobj.info.meleestate
	or (mobj.state == mobj.info.missilestate and mobj.health > mobj.info.damage) then
		mobj.angle = R_PointToAngle2(mobj.x, mobj.y, mobj.target.x, mobj.target.y)
	end
	
	return true
end

addHook("MapThingSpawn", Spawn33FU, MT_METALIX)
addHook("MapThingSpawn", Spawn33FU, MT_CLASSICMETAL)
addHook("MapThingSpawn", Spawn33FU, MT_EMWEGG)
addHook("MobjMoveCollide", BounceSkullFly, MT_METALIX)
addHook("MobjMoveCollide", BounceSkullFly, MT_CLASSICMETAL)
addHook("MobjMoveCollide", BounceSkullFly, MT_EMWEGG)
addHook("BossThinker", FDBossThinker, MT_METALIX)
addHook("BossThinker", FDBossThinker, MT_CLASSICMETAL)
addHook("BossThinker", FDBossThinker, MT_EMWEGG)
