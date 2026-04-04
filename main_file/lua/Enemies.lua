SafeFreeslot(
    "MT_SENKUCRAWLA",
    "MT_EMW5_DETON",
    "MT_EMW5_SKIM",
    "MT_EMW5_FLYINGCRAWLA",
    "S_SENKUCRAWLA_STND",
    "S_SENKUCRAWLA_RUN1",
    "S_SENKUCRAWLA_RUN2",
    "S_SENKUCRAWLA_RUN3",
    "S_SENKUCRAWLA_RUN4",
    "S_SENKUCRAWLA_RUN5",
    "S_SENKUCRAWLA_RUN6",
    "S_FLYINGCRAWLA_STND",
    "S_FLYINGCRAWLA_FLOAT",
    "S_FLYINGCRAWLA_FOCUS",
    "S_FLYINGCRAWLA_CHARGE",
    "S_EMW5_DETON1",
    "S_EMW5_DETON2",
    "S_EMW5_DETON3",
    "S_EMW5_DETON4",
    "S_EMW5_DETON5",
    "S_EMW5_DETON6",
    "S_EMW5_DETON7",
    "S_EMW5_DETON8",
    "S_EMW5_DETON9",
    "S_EMW5_DETON10",
    "S_EMW5_DETON11",
    "S_EMW5_DETON12",
    "S_EMW5_DETON13",
    "S_EMW5_DETON14",
    "S_EMW5_DETON15",
    "S_EMW5_SKIM1",
    "S_EMW5_SKIM2",
    "S_EMW5_SKIM3",
    "S_EMW5_SKIM4"
)
local r -- vanilla object reference

---------------EMW5 SENKU CRAWLA---------------------
mobjinfo[MT_SENKUCRAWLA] = {
    --$Category Enemies
    --$Name Red Crawla (EMW5)
    --$Sprite POSSA1
    doomednum = -1, --will be a replacement through lua
    spawnstate = S_SENKUCRAWLA_STND,
    spawnhealth = 1,
    seestate = S_SENKUCRAWLA_RUN1,
    seesound = sfx_none,
    reactiontime = 32,
    attacksound = sfx_none,
    painstate = S_NULL,
    painchance = 200,
    painsound = sfx_none,
    meleestate = S_NULL,
    missilestate = S_NULL,
    deathstate = S_XPLD1,
    deathsound = sfx_pop,
    xdeathstate = S_NULL,
    speed = 15,
    radius = 24*FRACUNIT,
    height = 32*FRACUNIT,
    mass = 100,
    damage = 0,
    activesound = sfx_none,
    raisestate = S_NULL,
    flags = MF_ENEMY|MF_SPECIAL|MF_SHOOTABLE
}

r = states[S_POSS_STND]
states[S_SENKUCRAWLA_STND] = {SPR_EMW5_SENKUCRAWLA, r.frame, r.tics, r.action, r.var1, r.var2, S_SENKUCRAWLA_STND}

for i = 1, 6 do
    local refstate = _G["S_POSS_RUN"..i] --vanilla state reference
    local customstate = _G["S_SENKUCRAWLA_RUN"..i]
    local customstate_next = _G["S_SENKUCRAWLA_RUN"..((i == 6 and 1) or i+1)]

    r = states[refstate]
    states[customstate] = {SPR_EMW5_SENKUCRAWLA, r.frame, r.tics, r.action, r.var1, r.var2, customstate_next}
end

--Red Crawla Mod
mobjinfo[MT_EMW5_FLYINGCRAWLA] = {
    --$Category Enemies
    --$Name Yellow Flying Crawla (EMW5)
    --$Sprite SPOSA1
    doomednum = -1, --will be a replacement through lua
    spawnstate = S_FLYINGCRAWLA_STND,
    spawnhealth = 1,
    seestate = S_FLYINGCRAWLA_FLOAT,
    seesound = sfx_none,
    reactiontime = 32,
    attacksound = sfx_none,
    painstate = S_NULL,
    painchance = 200,
    painsound = sfx_none,
    meleestate = S_NULL,
    missilestate = S_FLYINGCRAWLA_FOCUS,
    deathstate = S_XPLD1,
    deathsound = sfx_pop,
    xdeathstate = S_NULL,
    speed = 22,
    radius = 24*FRACUNIT,
    height = 32*FRACUNIT,
    mass = 100,
    damage = 0,
    activesound = sfx_none,
    raisestate = S_NULL,
    flags = MF_ENEMY|MF_SPECIAL|MF_SHOOTABLE|MF_NOGRAVITY|MF_SLIDEME|MF_FLOAT
}

r = states[S_SPOS_STND]
states[S_FLYINGCRAWLA_STND] = {SPR_EMW5_FLYINGCRAWLA, A, r.tics, r.action, r.var1, r.var2, S_FLYINGCRAWLA_STND}
states[S_FLYINGCRAWLA_FLOAT] = {SPR_EMW5_FLYINGCRAWLA, A, 3, A_Chase, 0, 0, S_FLYINGCRAWLA_FLOAT}
states[S_FLYINGCRAWLA_FOCUS] = {SPR_EMW5_FLYINGCRAWLA, A, 5, A_FaceTarget, 0, 0, S_FLYINGCRAWLA_CHARGE}
states[S_FLYINGCRAWLA_CHARGE] = {SPR_EMW5_FLYINGCRAWLA, A, 30, A_MoveRelative, 0, 30, S_FLYINGCRAWLA_FLOAT}

---------------EMW5 DETON---------------------
mobjinfo[MT_EMW5_DETON] = {
    doomednum = -1,
    spawnstate = S_EMW5_DETON1,
    seestate = S_EMW5_DETON2,
    seesound = sfx_mario6, --emw5
    attacksound = mobjinfo[MT_DETON].attacksound,
    deathstate = mobjinfo[MT_DETON].deathstate,
    deathsound = mobjinfo[MT_DETON].deathsound,
    raisestate = mobjinfo[MT_DETON].raisestate,
    spawnhealth = mobjinfo[MT_DETON].spawnhealth,
    reactiontime = mobjinfo[MT_DETON].reactiontime,
    painchance = mobjinfo[MT_DETON].painchance,
    speed = mobjinfo[MT_DETON].speed,
    radius = mobjinfo[MT_DETON].radius,
    height = mobjinfo[MT_DETON].height,
    damage = mobjinfo[MT_DETON].damage,
    flags = mobjinfo[MT_DETON].flags
}

r = states[S_DETON1]
states[S_EMW5_DETON1] = {SPR_EMW5_DETON, r.frame, r.tics, r.action, r.var1, r.var2, S_EMW5_DETON1}

for i = 2, 15 do
    local refstate = _G["S_DETON"..i] --vanilla state reference
    local customstate = _G["S_EMW5_DETON"..i]
    local customstate_next = _G["S_EMW5_DETON"..((i == 15 and 2) or i+1)]

    r = states[refstate]
    states[customstate] = {SPR_EMW5_DETON, r.frame, r.tics, r.action, r.var1, r.var2, customstate_next}
end

---------------EMW5 SKIM---------------------
mobjinfo[MT_EMW5_SKIM] = {
    doomednum = -1, --will be a replacement through lua
    spawnstate = S_EMW5_SKIM1,
    attacksound = mobjinfo[MT_SKIM].attacksound,
    meleestate = S_EMW5_SKIM3,
    deathstate = mobjinfo[MT_SKIM].deathstate,
    deathsound = mobjinfo[MT_SKIM].deathsound,
    raisestate = mobjinfo[MT_SKIM].raisestate,
    spawnhealth = mobjinfo[MT_SKIM].spawnhealth,
    reactiontime = mobjinfo[MT_SKIM].reactiontime,
    speed = mobjinfo[MT_SKIM].speed,
    radius = mobjinfo[MT_SKIM].radius,
    height = mobjinfo[MT_SKIM].height,
    mass = mobjinfo[MT_SKIM].mass,
    flags = mobjinfo[MT_SKIM].flags,
}

for i = 1, 4 do
    local refstate = _G["S_SKIM"..i] --vanilla state reference
    local customstate = _G["S_EMW5_SKIM"..i]
    local customstate_next = _G["S_EMW5_SKIM"..(((i == 2 or i == 4) and 1) or (i+1))]

    r = states[refstate]
    states[customstate] = {SPR_EMW5_SKIM, r.frame, r.tics, r.action, r.var1, r.var2, customstate_next}
end

--TGF Skim code from SRB2 The Past. This is the only one that has watertop checks and skim behavior to float in water
--Doing this because MT_SKIM behavior is hardcoded.... ooomg STJR

local function TGFCheckInWater(mo, sector)
	if not (mo and mo.valid
	and sector and sector.valid) then
		return
	end

	local inWater = false
	local highestRover = nil
	local verticalFlip = (mo.eflags & MFE_VERTICALFLIP) or (mo.flags2 & MF2_OBJECTFLIP)

	for rover in sector.ffloors() do
		if rover and rover.valid
		and (rover.flags & FF_EXISTS)
		and (rover.flags & FF_SWIMMABLE) then
			if highestRover and highestRover.valid
			and (not verticalFlip and rover.topheight < highestRover.topheight) then
			//or (verticalFlip and rover.bottomheight > highestRover.bottomheight))
				continue
			end

			if P_InsideANonSolidFFloor(mo, rover)
			or (not verticalFlip and mo.z >= rover.topheight) then
			//or (verticalFlip and mo.z + mo.height <= rover.bottomheight)
				mo.watertop = rover.topheight
				mo.waterbottom = rover.bottomheight
				inWater = true
			end

			highestRover = rover
		end
	end

	return {inWater, mo.watertop, mo.waterbottom}
end

addHook("MobjThinker", function(mo)
	if not (mo and mo.valid) then return end
	if mo.health <= 0 then return end

	local speed = FixedMul(mo.info.speed, mo.scale)
	local targetAngle = mo.angle

	local offset = {x = 0, y = 0}

	local inWater = false
	local stillInWater = false

	// This currently doesn't have support for slopes,
	// but it doesn't need it for SRB2TP
	local inWaterResult = TGFCheckInWater(mo, R_PointInSubsector(mo.x, mo.y).sector)
	local stillInWaterResult = TGFCheckInWater(mo, R_PointInSubsector(mo.x + offset.x, mo.y + offset.y).sector)

	mo.watertop = inWaterResult[2]
	mo.waterbottom = inWaterResult[3]

	inWater = inWaterResult[1]
	stillInWater = stillInWaterResult[1]

	// Attempt to redefine mo.floorz and mo.ceilingz
	if mo.watertop <= mo.floorz then
		mo.watertop = mo.floorz
	end
	if mo.waterbottom <= mo.ceilingz then
		mo.waterbottom = mo.ceilingz
	end

	// Make the skim follow the z-position of the lowest possible floor or watertop
	if inWater then
		if mo.target and mo.target.valid and stillInWater then
			//P_TryMove(mo, mo.x + offset.x, mo.y + offset.y, false)
			P_InstaThrust(mo, targetAngle, speed)
		else
			mo.momx = 0
			mo.momy = 0
		end
		if verticalFlip then mo.z = mo.waterbottom - mo.height
		else mo.z = mo.watertop end
	else
		if verticalFlip then mo.z = mo.ceilingz - mo.height
		else mo.z = mo.floorz end
		mo.momx = 0
		mo.momy = 0
		mo.momz = 0
	end
end, MT_EMW5_SKIM)

local function SRB2TP_UnsolidEnemies(tmthing, thing)
	if not (tmthing and tmthing.valid
	and thing and thing.valid) then
		return
	end

	// Allow the tmthing to be hit by a deton
	if thing.type == MT_DETON then return end

	// tmthing flags should not need to be checked if the object already has MF_ENEMY or MF_BOSS
	if (thing.flags & MF_ENEMY|MF_BOSS) then
		return false
	end
end

addHook("MobjMoveCollide", SRB2TP_UnsolidEnemies, MT_EMW5_SKIM)

--Goomba
local oldgoombaspeed = mobjinfo[MT_GOOMBA].speed
local oldgoombasound = mobjinfo[MT_GOOMBA].deathsound

addHook("MobjSpawn", function(mo)
    if mapheaderinfo[gamemap].emw5 then --Only change Object properties if it's on EMW5
        mobjinfo[mo.type].speed = 16
        mobjinfo[mo.type].deathsound = sfx_pop
    else
        mobjinfo[mo.type].speed = oldgoombaspeed
        mobjinfo[mo.type].deathsound = oldgoombasound
    end
end, MT_GOOMBA)

--Blue Goomba
local oldbgoombaspeed = mobjinfo[MT_BLUEGOOMBA].speed
local oldbgoombasound = mobjinfo[MT_BLUEGOOMBA].deathsound

addHook("MobjSpawn", function(mo)
    if mapheaderinfo[gamemap].emw5 then --Only change Object properties if it's on EMW5
        mobjinfo[mo.type].speed = 16
        mobjinfo[mo.type].deathsound = sfx_pop
    else
        mobjinfo[mo.type].speed = oldbgoombaspeed
        mobjinfo[mo.type].deathsound = oldbgoombasound
    end
end, MT_BLUEGOOMBA)