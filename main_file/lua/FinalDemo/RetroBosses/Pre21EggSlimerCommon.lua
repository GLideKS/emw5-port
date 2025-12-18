-- Pre-2.1 Egg Slimer Commonalities
-- THIS IS REQUIRED FOR EITHER THE Final Demo OR 2.0 EGG SLIMER TO WORK

-- Mimics the A_Boss2Chase behavior of versions pre-2.1
--- Port of A_Boss2Chase from pre-2.1.
---@param actor mobj_t
function A_FDBoss2Chase(actor, var1, var2)
	if not (actor and actor.valid) then return end

	local radius
	local reversed = false
	local speedvar = 0

	-- When reactiontime hits zero, he will go the other way
	if actor.reactiontime then actor.reactiontime = $ - 1 end

	if actor.reactiontime <= 0 then
		reversed = true
		actor.reactiontime = 2*TICRATE + P_RandomByte()
	end

	actor.target = P_GetClosestAxis(actor)

	if not (actor.target and actor.target.valid) then -- This should NEVER happen.
		print("Error: Boss2 has no target!")
		A_BossDeath(actor, 0, 0)
		return
	end

	-- Use a hardcoded radius if the Egg Slimer is set to use its pre-1.09.4 behavior
	-- Otherwise, use the radius of the closest axis
	if actor.rbSlimerOldBehavior then
		radius = 384*FRACUNIT
	else
		radius = actor.target.radius
	end

	if reversed then
		actor.watertop = -$
	end

	if not actor.rbSlimerOldBehavior then
		if (actor.flags2 & MF2_AMBUSH) then
			speedvar = actor.health
		else
			speedvar = actor.info.spawnhealth
		end

		actor.target.angle = $ + FixedAngle(FixedDiv(FixedMul(actor.watertop, actor.info.spawnhealth*(FRACUNIT/4)*3), speedvar*FRACUNIT)) -- Don't use FixedAngleC!
	else
		actor.target.angle = $ + FixedMul(actor.watertop, ANG1)
	end

	local fa = actor.target.angle
	local fc = FixedMul(cos(fa), radius)
	local fs = FixedMul(sin(fa), radius)
	actor.angle = R_PointToAngle2(actor.x, actor.y, actor.target.x + fc, actor.target.y + fs)

	-- Emulate the choppiness of the original boss
	if actor.rbSlimerOldBehavior and (leveltime & 1) then
		P_SetOrigin(actor, actor.target.x + fc, actor.target.y + fs, actor.target.z + 64*FRACUNIT)
	elseif not actor.rbSlimerOldBehavior then
		P_MoveOrigin(actor, actor.target.x + fc, actor.target.y + fs, actor.z)
	end

	-- Put goop spraying code here
	if (actor.rbSlimerOldBehavior and leveltime % 14 == 1)
	or (not actor.rbSlimerOldBehavior and leveltime % (speedvar*15/10)-1 == 0) then
		local ns = 3 * FRACUNIT
		local goop
		local fa2
		-- actor.movedir is used to determine the last
		-- direction goo was sprayed in. There are 8 possible
		-- directions to spray. (45-degree increments)

		actor.movedir = $+1
		actor.movedir = $%NUMDIRS -- NUMDIRS should be 8
		fa2 = FixedAngle((actor.movedir*45)*FRACUNIT)

		goop = P_SpawnMobjFromMobj(actor, 0, 0, actor.info.height + 56*FRACUNIT, MT_OLDGOOP)
		if goop and goop.valid then
			goop.renderflags = $|RF_FULLBRIGHT -- Goop was fullbright pre-2.1
			goop.momx = FixedMul(sin(fa2), ns)
			goop.momy = FixedMul(cos(fa2), ns)
			goop.momz = 4*FRACUNIT
			goop.fuse = 30*TICRATE+P_RandomByte()
			if actor.info.attacksound then
				S_StartSound(actor, actor.info.attacksound)
			end

			if (P_RandomByte() & 1) then
				goop.momx = $*2
				goop.momy = $*2
			elseif (P_RandomByte() > 128) then
				goop.momx = $*3
				goop.momy = $*3
			end
		end

		actor.flags2 = $|MF2_JUSTATTACKED
	end
end

--- Port of A_Boss2Pogo from pre-2.1.
---@param actor mobj_t
function A_FDBoss2Pogo(actor, var1, var2)
	if not (actor and actor.valid) then return end

	if actor.z <= actor.floorz + 8*FRACUNIT and actor.momz <= 0 then
		actor.state = actor.info.raisestate
	elseif actor.momz < 0 and actor.reactiontime then
		local ns = 3*FRACUNIT
		local goop
		local fa
		for i = 0, 7, 1 do
			actor.movedir = $+1
			actor.movedir = $%NUMDIRS -- NUMDIRS should be 8
			fa = FixedAngle((actor.movedir*45)*FRACUNIT)

			goop = P_SpawnMobjFromMobj(actor, 0, 0, actor.info.height + 56*FRACUNIT, actor.info.painchance)
			if goop and goop.valid then
				goop.renderflags = $|RF_FULLBRIGHT -- Goop was fullbright pre-2.1
				goop.momx = FixedMul(sin(fa), ns)
				goop.momy = FixedMul(cos(fa), ns)
				goop.momz = 4*FRACUNIT

				-- Make the goop's fuse shorter if the Egg Slimer started the level in its pogo state
				if actor.rbPogoOnly then
					goop.fuse = 15*TICRATE
				else
					goop.fuse = 30*TICRATE+P_RandomByte()
				end
			end
		end
		actor.reactiontime = 0
		if actor.info.attacksound then
			S_StartSound(actor, actor.info.attacksound)
		end
		actor.flags2 = $|MF2_JUSTATTACKED
	end
end
