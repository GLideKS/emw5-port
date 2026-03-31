---@diagnostic disable: missing-fields
-- Old Egg Slimer Goop
-- THIS IS REQUIRED FOR EITHER ALL VERSIONS OF THE EGG SLIMER TO WORK

SafeFreeslot(
    -- Sprites
    "SPR_OGOP",
    -- Objects
    "MT_OLDGOOP",
    -- States
    "S_OLDGOOP1",
    "S_OLDGOOP2",
    "S_OLDGOOP3"
)

-- Egg Slimer Goop

-- TODO: Use an MobjHitFloor hook if it gets merged
---@param mo mobj_t
addHook("MobjThinker", function(mo)
	if not (mo and mo.valid) then return end

	if mo.z <= mo.floorz and mo.state ~= mo.info.meleestate then
		mo.state = mo.info.meleestate
		mo.momx = 0
		mo.momy = 0
		mo.momz = 0
		mo.z = mo.floorz
		if mo.info.painsound then S_StartSound(mo, mo.info.painsound) end
	end
end, MT_OLDGOOP)

mobjinfo[MT_OLDGOOP] = {
	doomednum = -1,
	spawnstate = S_OLDGOOP1,
	spawnhealth = 1000,
	reactiontime = 8,
	painsound = sfx_ghit,
	meleestate = S_OLDGOOP3,
	speed = 1,
	radius = 4*FRACUNIT,
	height = 4*FRACUNIT,
	mass = DMG_WATER,
	flags = MF_PAIN
}

states[S_OLDGOOP1] = {SPR_OGOP,	A,	2,	nil,	0,	0,	S_OLDGOOP2}
states[S_OLDGOOP2] = {SPR_OGOP,	B,	2,	nil,	0,	0,	S_OLDGOOP1}
states[S_OLDGOOP3] = {SPR_OGOP,	C,	-1,	nil,	0,	0,	S_NULL}
