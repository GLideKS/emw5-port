freeslot("S_SPOS_MOD1", "S_SPOS_MOD2")

--Blue Crawla Mod
mobjinfo[MT_BLUECRAWLA] = {
    --$Category Enemies
    --$Name Red Crawla (EMW5)
    --$Sprite POSSA1
    doomednum = 100,
    spawnstate = S_POSS_STND,
    spawnhealth = 1,
    seestate = S_POSS_RUN1,
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

--Red Crawla Mod
mobjinfo[MT_REDCRAWLA] = {
    --$Category Enemies
    --$Name Yellow Flying Crawla (EMW5)
    --$Sprite SPOSA1
    doomednum = 101,
    spawnstate = S_SPOS_STND,
    spawnhealth = 1,
    seestate = S_SPOS_RUN1,
    seesound = sfx_none,
    reactiontime = 32,
    attacksound = sfx_none,
    painstate = S_NULL,
    painchance = 200,
    painsound = sfx_none,
    meleestate = S_NULL,
    missilestate = S_SPOS_MOD1,
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

states[S_SPOS_RUN1] = {SPR_SPOS, A, 3, A_Chase, 0, 0, S_SPOS_RUN1}
states[S_SPOS_MOD1] = {SPR_SPOS, A, 5, A_FaceTarget, 0, 0, S_SPOS_MOD2}
states[S_SPOS_MOD2] = {SPR_SPOS, A, 30, A_MoveRelative, 0, 30, S_SPOS_RUN1}

--Deton
mobjinfo[MT_DETON].seesound = sfx_mario6

--Goomba
mobjinfo[MT_GOOMBA].speed = 16
mobjinfo[MT_GOOMBA].deathsound = sfx_pop

--Blue Goomba
mobjinfo[MT_BLUEGOOMBA].speed = 24
mobjinfo[MT_BLUEGOOMBA].deathsound = sfx_pop