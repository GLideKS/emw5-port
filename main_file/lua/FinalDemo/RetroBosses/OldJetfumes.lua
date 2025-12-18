---@diagnostic disable: missing-fields
-- Old Jetfumes

freeslot(
	-- Sprites
	"SPR_OJTF",
	-- Objects
	"MT_OLDJETFUME1",
	-- States
	"S_OLDJETFUME1",
	"S_OLDJETFUME2"
)

--- Spawn jet fumes for the boss based on var1.
---@param actor mobj_t
---@param var1 integer ID of the jet fume to spawn.
function A_OldBossJetFumes(actor, var1, var2)
	if not (actor and actor.valid) then return end

	local filler
	local jetxoff, jetyoff, jetzoff

	if var1 == 0 then -- Old Egg Mobile Jet Fumes
		jetxoff = P_ReturnThrustX(actor, actor.angle, -64*FRACUNIT)
		jetyoff = P_ReturnThrustY(actor, actor.angle, -64*FRACUNIT)
		jetzoff = 38*FRACUNIT

		filler = P_SpawnMobjFromMobj(actor, jetxoff, jetyoff, jetzoff, MT_OLDJETFUME1)
		filler.target = actor
		filler.fuse = 56

		filler = P_SpawnMobjFromMobj(
			actor,
			jetxoff + P_ReturnThrustX(actor, actor.angle-ANGLE_90, 24*FRACUNIT),
			jetyoff + P_ReturnThrustY(actor, actor.angle-ANGLE_90, 24*FRACUNIT),
			jetzoff,
			MT_OLDJETFUME1
		)
		filler.target = actor
		filler.fuse = 57

		filler = P_SpawnMobjFromMobj(
			actor,
			jetxoff + P_ReturnThrustX(actor, actor.angle+ANGLE_90, 24*FRACUNIT),
			jetyoff + P_ReturnThrustY(actor, actor.angle+ANGLE_90, 24*FRACUNIT),
			jetzoff,
			MT_OLDJETFUME1
		)
		filler.target = actor
		filler.fuse = 58

		actor.tracer = filler
	elseif var1 == 1 then -- Old Metal Sonic Jet Fumes
		filler = P_SpawnMobjFromMobj(actor, 0, 0, 0, MT_OLDJETFUME1)
		filler.target = actor
		filler.fuse = 59
		actor.tracer = filler
		filler.scale = actor.scale/2
	elseif var1 == 2 then -- Final Demo Egg Mobile Jet Fumes
		jetxoff = P_ReturnThrustX(actor, actor.angle, -56*FRACUNIT)
		jetyoff = P_ReturnThrustY(actor, actor.angle, -56*FRACUNIT)
		jetzoff = 8*FRACUNIT

		filler = P_SpawnMobjFromMobj(actor, jetxoff, jetyoff, jetzoff, MT_OLDJETFUME1)
		filler.target = actor
		filler.fuse = 60

		jetzoff = 32*FRACUNIT

		filler = P_SpawnMobjFromMobj(
			actor,
			jetxoff + P_ReturnThrustX(actor, actor.angle-ANGLE_90, 24*FRACUNIT),
			jetyoff + P_ReturnThrustY(actor, actor.angle-ANGLE_90, 24*FRACUNIT),
			jetzoff,
			MT_OLDJETFUME1
		)
		filler.target = actor
		filler.fuse = 61

		filler = P_SpawnMobjFromMobj(
			actor,
			jetxoff + P_ReturnThrustX(actor, actor.angle+ANGLE_90, 24*FRACUNIT),
			jetyoff + P_ReturnThrustY(actor, actor.angle+ANGLE_90, 24*FRACUNIT),
			jetzoff,
			MT_OLDJETFUME1
		)
		filler.target = actor
		filler.fuse = 62

		actor.tracer = filler
	end
end

-- Pre-2.2 Jet Fume

--- Helper function for getting the z offset of a jet fume based on its gravflip property.
---@param mo mobj_t
---@param jetzoff fixed_t
local function RB_GetJetZ(mo, jetzoff)
	if not (mo and mo.valid) then return 0 end

	jetzoff = FixedMul(jetzoff, mo.target.scale)

	if (mo.target.eflags & MFE_VERTICALFLIP) then
		return mo.target.z + mo.target.height - jetzoff - mo.height
	else
		return mo.target.z + jetzoff
	end
end

---@param mo mobj_t
addHook("MobjThinker", function(mo)
	if not (mo and mo.valid) then return end

	local jetx, jety, jetz

	if not (mo.target and mo.target.valid) -- if you have no target
	or (not (mo.target.flags & MF_BOSS) and mo.target.health <= 0) then -- or your target isn't a boss and it's popped now
		-- then remove yourself as well!
		P_RemoveMobj(mo)
		return
	end

	-- Don't interpolate the jet fumes if the Egg Slimer is using its pre-1.09.4 behavior
	local MoveFunction = P_MoveOrigin
	if mo.target.rbSlimerOldBehavior and mo.target.health > mo.target.info.damage then MoveFunction = P_SetOrigin end

	if mo.fuse < 60 then
		jetx = mo.target.x + P_ReturnThrustX(mo.target, mo.target.angle, FixedMul(-64*FRACUNIT, mo.target.scale))
		jety = mo.target.y + P_ReturnThrustY(mo.target, mo.target.angle, FixedMul(-64*FRACUNIT, mo.target.scale))
	else
		jetx = mo.target.x + P_ReturnThrustX(mo.target, mo.target.angle, FixedMul(-56*FRACUNIT, mo.target.scale))
		jety = mo.target.y + P_ReturnThrustY(mo.target, mo.target.angle, FixedMul(-56*FRACUNIT, mo.target.scale))
	end

	if mo.fuse == 56 then -- 2.0/2.1 Egg Mobile Center Fume
		jetz = RB_GetJetZ(mo, 38*FRACUNIT)

		MoveFunction(mo, jetx, jety, jetz)
	elseif mo.fuse == 57 then -- 2.0/2.1 Egg Mobile "Right" Fume
		jetz = RB_GetJetZ(mo, 12*FRACUNIT)
		MoveFunction(
			mo,
			jetx + P_ReturnThrustX(mo.target, mo.target.angle-ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jety + P_ReturnThrustY(mo.target, mo.target.angle-ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jetz
		)
	elseif mo.fuse == 58 then -- 2.0/2.1 Egg Mobile "Left" Fume
		jetz = RB_GetJetZ(mo, 12*FRACUNIT)
		MoveFunction(
			mo,
			jetx + P_ReturnThrustX(mo.target, mo.target.angle+ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jety + P_ReturnThrustY(mo.target, mo.target.angle+ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jetz
		)
	elseif mo.fuse == 59 then -- Old Metal Sonic Fume
		jetx = mo.target.x + P_ReturnThrustX(mo.target, mo.target.angle, -mo.target.radius)
		jety = mo.target.y + P_ReturnThrustY(mo.target, mo.target.angle, -mo.target.radius)
		if (mo.target.eflags & MFE_VERTICALFLIP) then
			jetz = mo.target.z + mo.target.height/2 + mo.height/2
		else
			jetz = mo.target.z + mo.target.height/2 - mo.height/2
		end
		MoveFunction(mo, jetx, jety, jetz)
	elseif mo.fuse == 60 then -- Final Demo Egg Mobile Center Fume
		jetz = RB_GetJetZ(mo, 8*FRACUNIT)
		MoveFunction(mo, jetx, jety, jetz)
	elseif mo.fuse == 61 then -- Final Demo Egg Mobile "Right" Fume
		jetz = RB_GetJetZ(mo, 32*FRACUNIT)
		MoveFunction(
			mo,
			jetx + P_ReturnThrustX(mo.target, mo.target.angle-ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jety + P_ReturnThrustY(mo.target, mo.target.angle-ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jetz
		)
	elseif mo.fuse == 62 then -- Final Demo Egg Mobile "Left" Fume
		jetz = RB_GetJetZ(mo, 32*FRACUNIT)
		MoveFunction(
			mo,
			jetx + P_ReturnThrustX(mo.target, mo.target.angle+ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jety + P_ReturnThrustY(mo.target, mo.target.angle+ANGLE_90, FixedMul(24*FRACUNIT, mo.target.scale)),
			jetz
		)
	end
	mo.fuse = $+1

	mo.momz = 0 -- Prevent the jetfume from moving vertically
end, MT_OLDJETFUME1)

mobjinfo[MT_OLDJETFUME1] = {
	doomednum = -1,
	spawnstate = S_OLDJETFUME1,
	spawnhealth = 1000,
	reactiontime = 8,
	speed = 1,
	radius = 8*FRACUNIT,
	height = 16*FRACUNIT,
	mass = 4,
	flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_NOCLIP|MF_NOCLIPHEIGHT
}

states[S_OLDJETFUME1] =	{SPR_OJTF,	A|FF_FULLBRIGHT,	1,	nil,	0,	0,	S_OLDJETFUME2}
states[S_OLDJETFUME2] =	{SPR_NULL,	A,					1,	nil,	0,	0,	S_OLDJETFUME1}
