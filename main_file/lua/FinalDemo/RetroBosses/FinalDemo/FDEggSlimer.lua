---@diagnostic disable: missing-fields
-- Final Demo Egg Slimer - Ported by Glaber and MIDIMan (accuracy fixes)
-- PLEASE LOAD RetroBossesCommon.lua, OldJetfumes.lua, EggSlimerCommon.lua, AND Pre21EggSlimerCommon.lua BEFORE THIS

freeslot(
	-- Sprites
	"SPR_FDES",
	"SPR_FDEJ",
	"SPR_OSMF",
	-- Objects
	"MT_FDEGGMOBILE2",
	"MT_FDSLIMERFUME",
	"MT_FDBOSSJUNK",
	"MT_FDBOSSSPIGOTJUNK",
	-- States
	"S_FDEGGMOBILE2_STND",
	"S_FDEGGMOBILE2_POGO1",
	"S_FDEGGMOBILE2_POGO2",
	"S_FDEGGMOBILE2_POGO3",
	"S_FDEGGMOBILE2_POGO4",
	"S_FDEGGMOBILE2_PAIN",
	"S_FDEGGMOBILE2_PAIN2",
	"S_FDEGGMOBILE2_DIE1",
	"S_FDEGGMOBILE2_DIE2",
	"S_FDEGGMOBILE2_DIE3",
	"S_FDEGGMOBILE2_DIE4",
	"S_FDEGGMOBILE2_FLEETAUNT",
	"S_FDEGGMOBILE2_FLEE1",
	"S_FDEGGMOBILE2_FLEE2",
	"S_FDSLIMERFUME1",
	"S_FDSLIMERFUME2",
	"S_FDBOSSTANK1",
	"S_FDBOSSTANK2",
	"S_FDBOSSSPIGOT"
)

-- Final Demo Egg Slimer Fume

---@param mo mobj_t
addHook("MobjThinker", function(mo)
	if not (mo and mo.valid) then return end
	if not (mo.target and mo.target.valid) then
		P_RemoveMobj(mo) -- Don't leave behind the fume for all eternity
		return
	end

	if mo.target.health > 0
	and (mo.target.health <= mo.target.info.damage or mo.target.rbPogoOnly) then
		mo.flags2 = $|MF2_DONTDRAW
	else
		mo.flags2 = $ & ~MF2_DONTDRAW
	end

	if mo.target.rbSlimerOldBehavior and mo.target.health > mo.target.info.damage then
		P_SetOrigin(mo, mo.target.x, mo.target.y, mo.target.z - FixedMul(15*FRACUNIT, mo.scale))
		return
	end

	P_MoveOrigin(mo, mo.target.x, mo.target.y, mo.target.z - FixedMul(15*FRACUNIT, mo.scale))
end, MT_FDSLIMERFUME)

mobjinfo[MT_FDSLIMERFUME] = {
	doomednum = -1,
	spawnstate = S_FDSLIMERFUME1,
	spawnhealth = 1000,
	speed = 1,
	radius = 4*FRACUNIT,
	height = 4*FRACUNIT,
	flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_NOCLIP|MF_NOCLIPHEIGHT
}

states[S_FDSLIMERFUME1] =	{SPR_OSMF,	A|FF_FULLBRIGHT,	1,	nil,	0,	0,	S_FDSLIMERFUME2}
states[S_FDSLIMERFUME2] =	{SPR_NULL,	A,					1,	nil,	0,	0,	S_FDSLIMERFUME1}

local RB_FDEGG2_NOSPEED = 1
local RB_FDEGG2_NOPOGO = 2
local RB_FDEGG2_OLDBEHAVIOR = 4

-- Final Demo Egg Slimer

---@param mo mobj_t
---@param mthing mapthing_t
addHook("MapThingSpawn", function(mo, mthing)
	if not (mo and mo.valid and mthing and mthing.valid) then return end

	-- Make the Final Demo Egg Slimer spawn 33 FRACUNITS off the ground if its map thing's z-position hasn't been set
	RB_MapThingHeightOffset(mo, mthing, 33*FRACUNIT) -- Function located in RetroBosses/RetroBossesCommon.lua

	-- Toggle the Egg Slimer's pre-1.09.4 behavior if its map thing's extra flag has been set
	if not udmf then
		if (mthing.options & MTF_EXTRA) then mo.rbSlimerOldBehavior = true end
-- 		if (mthing.options & MTF_AMBUSH) then mo.flags2 = $|MF2_AMBUSH end -- This is already handled by SRB2
	else
		local flags = mthing.args[5] or 0
		if (flags & RB_FDEGG2_OLDBEHAVIOR) then mo.rbSlimerOldBehavior = true end
		if not (flags & RB_FDEGG2_NOSPEED) then mo.flags2 = $|MF2_AMBUSH end -- Stay consistent with 2.2's UDMF implementation
	end
end, MT_FDEGGMOBILE2)

-- Display the Final Demo Egg Slimer's "gibs" when it dies
---@param mo mobj_t
addHook("BossDeath", function(mo)
	if not (mo and mo.valid) then return end

	-- Delete the Egg Slimer outright in Chaos Mode
	if mo.rbChaosBoss then
		mo.health = 0
		P_RemoveMobj(mo)
		return true
	end

	A_21BossDeath(mo) -- Despite its name, this function does practically the same thing Final Demo does

	-- Spawn boss junk
	-- These values are all over the place, but it's what 1.09.4's source code uses, 
	-- so I'm keeping them for accuracy
	local mo2 = P_SpawnMobjFromMobj(
		mo,
		P_ReturnThrustX(mo, mo.angle - ANGLE_90, 32*FRACUNIT),
		P_ReturnThrustY(mo, mo.angle - ANGLE_90, 24*FRACUNIT),
		mo.info.height/2 - 8*FRACUNIT,
		MT_FDBOSSJUNK
	)
	if mo2 and mo2.valid then
		mo2.state = S_FDBOSSTANK1 -- Right tank
		mo2.angle = mo.angle
		P_InstaThrust(mo2, mo2.angle - ANGLE_90, 4*mo2.scale) -- TODO: Make this use FRACUNIT if 2.3 changes it
		P_SetObjectMomZ(mo2, 4*FRACUNIT)
	end

	mo2 = P_SpawnMobjFromMobj(
		mo,
		P_ReturnThrustX(mo, mo.angle + ANGLE_90, 32*FRACUNIT),
		P_ReturnThrustY(mo, mo.angle - ANGLE_90, 24*FRACUNIT),
		mo.info.height/2 - 8*FRACUNIT,
		MT_FDBOSSJUNK
	)
	if mo2 and mo2.valid then
		mo2.state = S_FDBOSSTANK2 -- Left tank
		mo2.angle = mo.angle
		P_InstaThrust(mo2, mo2.angle + ANGLE_90, 4*mo2.scale) -- TODO: Make this use FRACUNIT if 2.3 changes it
		P_SetObjectMomZ(mo2, 4*FRACUNIT)
	end

	mo2 = P_SpawnMobjFromMobj(mo, 0, 0, mo.info.height + 32*FRACUNIT, MT_FDBOSSSPIGOTJUNK)
	if mo2 and mo2.valid then P_SetObjectMomZ(mo2, 4*FRACUNIT) end

	return true
end, MT_FDEGGMOBILE2)

-- Allows the Egg Slimer to move in a circular path in its first phase
---@param mo mobj_t
addHook("MobjSpawn", function(mo)
	mo.watertop = mo.info.speed

	-- Force the Egg Slimer into its pogo state if there is no NiGHTS axis on the map
	if not P_GetClosestAxis(mo) then mo.rbPogoOnly = true end
end, MT_FDEGGMOBILE2)

-- Ported and modified BossThinker behavior for Final Demo Egg Slimer from 1.09.4 (and 2.0.7)
---@param mo mobj_t
addHook("BossThinker", function(mo)
	if not (mo and mo.valid) then return end

	if mo.movecount then mo.movecount = $-1 end
	if not mo.movecount then mo.flags2 = $ & ~MF2_FRET end

	if not (mo.tracer and mo.tracer.valid) and not mo.rbChaosBoss then
		local eggjet = P_SpawnMobjFromMobj(mo, 0, 0, -15*FRACUNIT, MT_FDSLIMERFUME)
		eggjet.target = mo

		mo.tracer = eggjet
	end

	if mo.health <= mo.info.damage and not (mo.target and mo.target.valid and (mo.target.flags & MF_SHOOTABLE)) then
		if mo.health <= 0 then
			-- look for a new target
			if P_LookForPlayers(mo, 0, true) and mo.info.mass then -- Bid farewell!
				S_StartSound(mo, mo.info.mass)
			end
			return
		end

		-- look for a new target
		if P_LookForPlayers(mo, 0, true) and mo.info.seesound then
			S_StartSound(mo, mo.info.seesound)
		end

		return
	end

	-- Kill the Egg Slimer if there is no axis and its map Thing parameter is set to 1
	if mo.rbPogoOnly then
		if mo.spawnpoint and mo.spawnpoint.valid
		and mo.spawnpoint.type == mo.info.doomednum
		and ((not udmf and mo.spawnpoint.extrainfo == 1)
		or (udmf and (mo.spawnpoint.args[5] & RB_FDEGG2_NOPOGO))) then
			mo.rbPogoOnly = false
		end
	end

	if mo.state == mo.info.spawnstate and mo.health > mo.info.damage
	and not mo.rbPogoOnly then
		A_FDBoss2Chase(mo, 0, 0)
	elseif mo.state == mo.info.raisestate
	or mo.state == S_FDEGGMOBILE2_POGO2
	or mo.state == S_FDEGGMOBILE2_POGO3
	or mo.state == S_FDEGGMOBILE2_POGO4
	or mo.state == mo.info.spawnstate then
		mo.flags = $ & ~MF_NOGRAVITY
		A_FDBoss2Pogo(mo, 0, 0)
		if mo.health <= mo.info.damage then
			-- Trigger the pinch phase linedef
			if mo.spawnpoint and mo.spawnpoint.valid then P_LinedefExecute(mo.spawnpoint.args[4], mo, nil) end
		end
	end

	return true
end, MT_FDEGGMOBILE2)

-- Don't let the Final Demo Egg Slimer get hit while its movecount is greater than 0
---@param special mobj_t
---@param toucher mobj_t
addHook("TouchSpecial", function(special, toucher)
	if not (special and special.valid and toucher and toucher.valid) then return end

	if special.movecount then return true end
end, MT_FDEGGMOBILE2)

addHook("MobjThinker", RB_21BossFlash, MT_FDEGGMOBILE2)

--Modified for EMW5
mobjinfo[MT_FDEGGMOBILE2] = {
	--$Name Final Demo Egg Slimer
	--$Sprite FDESA1
	--$Category Bosses/Final Demo
	--$Flags1Text Pre-1.09.4 behavior
	--$Flags4Text End level on death
	--$Flags8Text Speed up when hit
	--$Arg0 Boss ID
	--$Arg1 End level on death?
	--$Arg1Type 11
	--$Arg1Enum noyes
	--$Arg2 Death trigger tag
	--$Arg2Type 15
	--$Arg3 Victory trigger tag
	--$Arg3Type 15
	--$Arg4 Pinch trigger tag
	--$Arg4Type 15
	--$Arg5 Flags
	--$Arg5Type 12
	--$Arg5Enum {1 = "Don't speed up when hit"; 2 = "Don't pogo without axis"; 4 = "Use Pre-1.09.4 behavior";}
	doomednum = 225,
	spawnstate = S_FDEGGMOBILE2_STND,
	spawnhealth = 12,
	seestate = S_FDEGGMOBILE2_STND,
	reactiontime = 8,
	attacksound = sfx_gspray,
	painstate = S_FDEGGMOBILE2_PAIN,
	painchance = MT_OLDGOOP,
	painsound = sfx_WOAH,
	meleestate = S_FDEGGMOBILE2_STND,
	missilestate = S_FDEGGMOBILE2_STND,
	deathstate = S_FDEGGMOBILE2_DIE1,
	xdeathstate = S_FDEGGMOBILE2_FLEETAUNT,
	deathsound = sfx_cybdth,
	speed = 2*FRACUNIT,
	radius = 24*FRACUNIT,
	height = 48*FRACUNIT,
	damage = 1,
	activesound = sfx_pogo,
	flags = MF_SPECIAL|MF_SHOOTABLE|MF_NOGRAVITY|MF_BOSS|MF_GRENADEBOUNCE,
	raisestate = S_FDEGGMOBILE2_POGO1
}

states[S_FDEGGMOBILE2_STND] =	{SPR_FDES,	A,	-1,	nil,	0,	0,	S_NULL}

states[S_FDEGGMOBILE2_POGO1] = {SPR_FDES, B, 1,	nil, 0, 0, S_FDEGGMOBILE2_POGO2}
-- Replace A_Boss2PogoSFX with A_21Boss2PogoSFX if it gets replaced or removed
states[S_FDEGGMOBILE2_POGO2] = {SPR_FDES,	A,	1,	A_Boss2PogoSFX,	12*FRACUNIT,	5*FRACUNIT,	S_FDEGGMOBILE2_POGO3}
states[S_FDEGGMOBILE2_POGO3] = {SPR_FDES,	B,	1,	nil, 0, 0, S_FDEGGMOBILE2_POGO4}
states[S_FDEGGMOBILE2_POGO4] =	{SPR_FDES,	C,	-1,	nil,	0,	0,	S_NULL}

function A_FDBoss2TakeDamage(actor, var1, var2)
	if not (actor and actor.valid) then return end

	if actor.rbSlimerOldBehavior then
		-- Replace A_Boss2TakeDamage with A_21Boss2TakeDamage if it changes in the future
		A_Boss2TakeDamage(actor, 24, 0)
		return
	end

	-- Replace A_Boss2TakeDamage with A_21Boss2TakeDamage if it changes in the future
	A_Boss2TakeDamage(actor, 24+TICRATE, 0)
end

freeslot("sfx_meet")

states[S_FDEGGMOBILE2_PAIN] =	{SPR_FDES,	D,	24,	A_FDBoss2TakeDamage,	0,	0,	S_FDEGGMOBILE2_STND}
states[S_FDEGGMOBILE2_PAIN2] =	{SPR_FDES,	D,	24,	A_FDBoss2TakeDamage,	0,	0,	S_FDEGGMOBILE2_POGO4}

states[S_FDEGGMOBILE2_DIE1] =	{SPR_FDES,	E,	8,	A_Fall,			0,	0,						S_FDEGGMOBILE2_DIE2}
states[S_FDEGGMOBILE2_DIE2] =	{SPR_FDES,	E,	8,	A_BossScream,	0,	MT_BOSSEXPLODE,			S_FDEGGMOBILE2_DIE3}
states[S_FDEGGMOBILE2_DIE3] =	{SPR_FDES,	E,	8,	A_Repeat,		12,	S_FDEGGMOBILE2_DIE2,	S_FDEGGMOBILE2_DIE4}
states[S_FDEGGMOBILE2_DIE4] =	{SPR_FDES,	E,	-1,	A_BossDeath,	0,	0,						S_NULL}

states[S_FDEGGMOBILE2_FLEETAUNT] =	{SPR_FDES,	F,	1,	A_PlaySound,    sfx_meet, 0,	S_FDEGGMOBILE2_FLEE1}
states[S_FDEGGMOBILE2_FLEE1] =	{SPR_FDES,	F,	5,	nil,    0,  0,	S_FDEGGMOBILE2_FLEE2}
states[S_FDEGGMOBILE2_FLEE2] =	{SPR_FDES,	G,	5,	nil,	0,	0,	S_FDEGGMOBILE2_FLEE1}

-- Final Demo Egg Slimer "Gibs"

mobjinfo[MT_FDBOSSJUNK] = {
	doomednum = -1,
	spawnstate = S_INVISIBLE, -- Invisible unless its state is altered
	spawnhealth = 1,
	reactiontime = 8,
	radius = 8*FRACUNIT,
	height = 64*FRACUNIT,
	flags = MF_NOBLOCKMAP
}

mobjinfo[MT_FDBOSSSPIGOTJUNK] = {
	doomednum = -1,
	spawnstate = S_FDBOSSSPIGOT,
	spawnhealth = 1,
	reactiontime = 8,
	radius = 8*FRACUNIT,
	height = 24*FRACUNIT,
	flags = MF_NOBLOCKMAP
}

states[S_FDBOSSTANK1] =		{SPR_FDEJ,	A,	35,	nil,	0,	0,	S_NULL}
states[S_FDBOSSTANK2] =		{SPR_FDEJ,	B,	35,	nil,	0,	0,	S_NULL}
states[S_FDBOSSSPIGOT] =	{SPR_FDEJ,	C,	35,	nil,	0,	0,	S_NULL}
