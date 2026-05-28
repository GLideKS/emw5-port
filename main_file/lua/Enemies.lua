SafeFreeslot(
    "MT_SENKUCRAWLA",
    "MT_EMW5_DETON",
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