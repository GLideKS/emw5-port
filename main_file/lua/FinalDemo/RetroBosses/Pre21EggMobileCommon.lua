-- Pre-2.1 Egg Mobile Commonalities
-- THIS IS REQUIRED FOR EITHER THE Final Demo OR 2.0 EGG MOBILE TO WORK

--- MapThingSpawn hook code for the pre-2.1 Egg Mobiles.
---@param mo mobj_t
---@param mthing mapthing_t
rawset(_G, "RB_Pre21EggMobileMapThingSpawn", function(mo, mthing)
    if not (mo and mo.valid and mthing and mthing.valid) then return end

    RB_MapThingHeightOffset(mo, mthing, 33*FRACUNIT)

    -- Spawn a spike ball shield if the ambush flag is set
	if (not udmf and (mthing.options & MTF_AMBUSH))
	or (udmf and mthing.args[5]) then
		local spikemobj
		for i = 0, 3, 1 do
			spikemobj = P_SpawnMobj(mo.x, mo.y, mo.z, MT_SPIKEBALL)
			spikemobj.target = mo
			if i == 0 then
				spikemobj.angle = 0
			elseif i == 1 then
				spikemobj.angle = ANGLE_90
			elseif i == 2 then
				spikemobj.angle = ANGLE_180
			elseif i == 3 then
				spikemobj.angle = ANGLE_270
			end
		end
	end
end)

---@param mo mobj_t
local function nomissile(mo)
	if not (mo and mo.valid) then return end

	-- possibly choose another target
	if multiplayer and P_RandomByte() < 2 then
		if P_LookForPlayers(mo, 0, true, false) then
			return -- got a new target
		end
	end

	--chase towards player
	mo.movecount = $-1
	if mo.movecount < 0 or not P_Move(mo, mo.info.speed) then
		P_NewChaseDir(mo)
	end
end

--- Port of A_Boss1Chase from pre-2.1.
---@param actor mobj_t
---@param var1 integer If set to 1, this forces the Egg Mobile to be 33 FRACUNITs off the ground (1.09-2.0 behavior).
function A_FDBoss1Chase(actor, var1, var2)
	if not (actor and actor.valid) then return end

	local delta

	if actor.reactiontime then actor.reactiontime = $-1 end

	-- Use the 1.09-2.0 variant if var1 is not 0
	if var1 ~= 0 then
		if actor.z < actor.floorz+33*FRACUNIT then
			actor.z = actor.floorz+33*FRACUNIT
		end
	end

	-- turn towards movement direction if not there yet
	if actor.movedir < NUMDIRS then -- NUMDIRS should be 8
		actor.angle = $ & (7 * (2^29))
		delta = actor.angle - (actor.movedir * (2^29))

		if delta > 0 then
			actor.angle = $-ANGLE_45
		elseif delta < 0 then
			actor.angle = $+ANGLE_45
		end
	end

	-- do not attack twice in a row
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
			-- Trigger the pinch phase linedef
			if actor.spawnpoint and actor.spawnpoint.valid then P_LinedefExecute(actor.spawnpoint.args[4], actor, nil) end
			actor.state = actor.info.raisestate
		end

		actor.flags2 = $|MF2_JUSTATTACKED
		actor.reactiontime = 2*TICRATE
		return
	end

	nomissile(actor)
end
