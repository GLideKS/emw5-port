freeslot(
"MT_ROCKET",
"MT_SHOOPDAWHOOP",
"MT_DEATHBALL",
"MT_ENERGYBALL",
"MT_DOOMDBALL",
"MT_BRADROCKET",
"S_EMWROCKET_1670",
"S_EMWROCKET_1671",
"S_EMWROCKET_1672",
"S_EMWROCKET_1673",
"S_EMWROCKET_1674",
"S_EMWROCKET_1675",
"S_EMWROCKET_1676",
"S_EMWROCKET_1677",
"S_EMWROCKET_1678",
"S_EMWROCKET_1679",
"S_EMWROCKET_1680",
"S_EMWROCKET_1681",
"S_EMWROCKET_1682",
"S_EMWROCKET_1683",
"S_EMWROCKET_1684",
"S_EMWROCKET_1685",
"S_EMWROCKET_1686",
"S_EMWROCKET_1687",
"S_EMWROCKET_1688",
"S_DEATHBALL_1631",
"S_DEATHBALL_1632",
"S_DEATHBALL_1633",
"S_DEATHBALL_1634",
"S_DEATHBALL_1635",
"S_DEATHBALL_1636",
"S_DEATHBALL_1637",
"S_ENERGYBALL1",
"S_ENERGYBALL2",
"S_ENERGYBALL3",
"S_ENERGYBALL4",
"S_ENERGYBALL5",
"S_ENERGYBALL6",
"S_ENERGYBALL7",
"S_ENERGYBALL8",
"S_DOOMDBALL_1887",
"S_DOOMDBALL_1888",
"S_DOOMDBALL_1580",
"S_DOOMDBALL_1581",
"S_DOOMDBALL_1582",
"S_BRADROCKET"
)

mobjinfo[MT_BRADROCKET] = {
    doomednum = -1,
    spawnstate = S_BRADROCKET,
    spawnhealth = 1000,
    seestate = 0,
    seesound = sfx_rlaunc,
    reactiontime = 8,
    attacksound = 0,
    painstate = 0,
    painchance = 0,
    painsound = 0,
    meleestate = 0,
    missilestate = 0,
    deathstate = S_EMWROCKET_1670,
    deathsound = sfx_emxpld,
    xdeathstate = 0,
    speed = 2555904,
    radius = 720896,
    height = 524288,
    mass = 100,
    damage = 20,
    activesound = 0,
    raisestate = 0,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_BRADROCKET] = {SPR_MISL, A, 1, A_DualAction, S_ROCKET, S_CYBRAKDEMONMISSILE, S_BRADROCKET}

mobjinfo[MT_ROCKET] = {
    doomednum = -1,
    spawnstate = S_ROCKET,
    spawnhealth = 1000,
    seestate = 0,
    seesound = sfx_rlaunc,
    reactiontime = 8,
    attacksound = 0,
    painstate = 0,
    painchance = 0,
    painsound = 0,
    meleestate = 0,
    missilestate = 0,
    deathstate = S_EMWROCKET_1670,
    deathsound = sfx_emxpld,
    xdeathstate = 0,
    speed = 2555904,
    radius = 720896,
    height = 524288,
    mass = 100,
    damage = 20,
    activesound = 0,
    raisestate = 0,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_EMWROCKET_1670] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|A, 2, nil, 0, 0, S_EMWROCKET_1671}
states[S_EMWROCKET_1671] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|B, 2, nil, 0, 0, S_EMWROCKET_1672}
states[S_EMWROCKET_1672] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|C, 2, nil, 0, 0, S_EMWROCKET_1673}
states[S_EMWROCKET_1673] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|D, 2, nil, 0, 0, S_EMWROCKET_1674}
states[S_EMWROCKET_1674] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|E, 2, nil, 0, 0, S_EMWROCKET_1675}
states[S_EMWROCKET_1675] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|F, 2, nil, 0, 0, S_EMWROCKET_1676}
states[S_EMWROCKET_1676] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|G, 2, nil, 0, 0, S_EMWROCKET_1677}
states[S_EMWROCKET_1677] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|H, 2, nil, 0, 0, S_EMWROCKET_1678}
states[S_EMWROCKET_1678] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|I, 2, nil, 0, 0, S_EMWROCKET_1679}
states[S_EMWROCKET_1679] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|J, 2, nil, 0, 0, S_EMWROCKET_1680}
states[S_EMWROCKET_1680] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|K, 2, nil, 0, 0, S_EMWROCKET_1681}
states[S_EMWROCKET_1681] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|L, 2, nil, 0, 0, S_EMWROCKET_1682}
states[S_EMWROCKET_1682] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|M, 2, nil, 0, 0, S_EMWROCKET_1683}
states[S_EMWROCKET_1683] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|N, 2, nil, 0, 0, S_EMWROCKET_1684}
states[S_EMWROCKET_1684] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|O, 2, nil, 0, 0, S_EMWROCKET_1685}
states[S_EMWROCKET_1685] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|P, 2, nil, 0, 0, S_EMWROCKET_1686}
states[S_EMWROCKET_1686] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|Q, 2, nil, 0, 0, S_EMWROCKET_1687}
states[S_EMWROCKET_1687] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|R, 2, nil, 0, 0, S_EMWROCKET_1688}
states[S_EMWROCKET_1688] = {SPR_EMW5_XPLODE, FF_FULLBRIGHT|S, 2, nil, 0, 0, S_NULL}

--Flamethrower
mobjinfo[MT_TURRETLASER] = {
    doomednum = -1,
    spawnstate = S_TURRETLASER,
    spawnhealth = 1000,
    seestate = 0,
    seesound = 0,
    reactiontime = 8,
    attacksound = 0,
    painstate = 0,
    painchance = 0,
    painsound = 0,
    meleestate = 0,
    missilestate = 0,
    deathstate = S_TURRETLASEREXPLODE1,
    deathsound = sfx_turhit,
    xdeathstate = 0,
    speed = 50*FRACUNIT,
    radius = 12*FRACUNIT,
    height = 24*FRACUNIT,
    mass = 100,
    damage = 1,
    activesound = 0,
    raisestate = 0,
    flags = MF_NOBLOCKMAP|MF_MISSILE|MF_NOGRAVITY|MF_FIRE
}

-- Jet Bullet
states[S_JETBULLET1] = {SPR_JBUL, A, 1, A_SmokeTrailer, MT_SPARK, 0, S_JETBULLET2}
states[S_JETBULLET2] = {SPR_JBUL, B, 1, A_SmokeTrailer, MT_SPARK, 0, S_JETBULLET1}

-- SHOOPDAWHOOP
mobjinfo[MT_SHOOPDAWHOOP] = {
    doomednum = -1,
    spawnstate = S_IVSP,
    spawnhealth = 1,
    seestate = 0,
    seesound = 0,
    reactiontime = 32,
    attacksound = 0,
    painstate = 0,
    painchance = 200,
    painsound = 0,
    meleestate = 0,
    missilestate = 0,
    deathstate = S_NULL,
    deathsound = 0,
    xdeathstate = 0,
    speed = 2949120,
    radius = 2293760,
    height = 2293760,
    mass = 100,
    damage = 1,
    activesound = 0,
    raisestate = 0,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

--Dark Brad's Death Ball
mobjinfo[MT_DEATHBALL] = {
    doomednum = -1,
    spawnstate = S_DEATHBALL_1631,
    spawnhealth = 1000,
    seestate = 0,
    seesound = sfx_brdsht,
    reactiontime = 8,
    attacksound = 0,
    painstate = 0,
    painchance = 0,
    painsound = 0,
    meleestate = 0,
    missilestate = 0,
    deathstate = S_DEATHBALL_1635,
    deathsound = sfx_erghit,
    xdeathstate = 0,
    speed = 3604480,
    radius = 13107200,
    height = 13107200,
    mass = 1000000,
    damage = 30000*FRACUNIT,
    activesound = 0,
    raisestate = 0,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

--Deathball
states[S_DEATHBALL_1631] = {SPR_EMW5_DEATHBALL_1, FF_FULLBRIGHT|FF_TRANS50|A, 2, A_PlaySound, sfx_emw001, 0, S_DEATHBALL_1632}
states[S_DEATHBALL_1632] = {SPR_EMW5_DEATHBALL_2, FF_FULLBRIGHT|FF_TRANS50|A, 2, nil, 0, 0, S_DEATHBALL_1633}
states[S_DEATHBALL_1633] = {SPR_EMW5_DEATHBALL_3, FF_FULLBRIGHT|FF_TRANS50|A, 2, nil, 0, 0, S_DEATHBALL_1634}
states[S_DEATHBALL_1634] = {SPR_EMW5_DEATHBALL_4, FF_FULLBRIGHT|FF_TRANS50|A, 2, nil, 0, 0, S_DEATHBALL_1631}
states[S_DEATHBALL_1635] = {SPR_EMW5_DEATHBALL_DEATH, FF_FULLBRIGHT|FF_TRANS50|A, 1, A_Explode2, 0, 0, S_DEATHBALL_1636}
states[S_DEATHBALL_1636] = {SPR_EMW5_DEATHBALL_DEATH, FF_FULLBRIGHT|FF_TRANS50|A, 50, A_PlaySound, sfx_erghit, 0, S_DEATHBALL_1637}
states[S_DEATHBALL_1637] = {SPR_EMW5_DEATHBALL_DEATH, FF_FULLBRIGHT|FF_TRANS50|A, 1, nil, 0, 0, S_NULL}

--Dark Brad's Energy Ball
mobjinfo[MT_ENERGYBALL] = {
    doomednum = -1,
    spawnstate = S_ENERGYBALL1,
    spawnhealth = 1000,
    seestate = 0,
    seesound = 0,
    reactiontime = 8,
    attacksound = 0,
    painstate = 0,
    painchance = 0,
    painsound = 0,
    meleestate = 0,
    missilestate = 0,
    deathstate = S_ENERGYBALL3,
    deathsound = 0,
    xdeathstate = 0,
    speed = 2293725,
    radius = 1310700,
    height = 1310700,
    mass = 0,
    damage = 0,
    activesound = 0,
    raisestate = 0,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_ENERGYBALL1] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|A, 1, nil, 0, 0, S_ENERGYBALL2}
states[S_ENERGYBALL2] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|B, 1, nil, 0, 0, S_ENERGYBALL1}
states[S_ENERGYBALL3] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|C, 1, A_Explode, 0, 0, S_ENERGYBALL4}
states[S_ENERGYBALL4] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|D, 1, A_Explode, 0, 0, S_ENERGYBALL5}
states[S_ENERGYBALL5] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|E, 1, A_Explode, 0, 0, S_ENERGYBALL6}
states[S_ENERGYBALL6] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|F, 1, nil, 0, 0, S_ENERGYBALL7}
states[S_ENERGYBALL7] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|G, 1, nil, 0, 0, S_ENERGYBALL8}
states[S_ENERGYBALL8] = {SPR_EMW5_BLUEENERGYBALL, FF_FULLBRIGHT|H, 1, nil, 0, 0, S_NULL}

--Doomsday Deathball
mobjinfo[MT_DOOMDBALL] = {
    --$Category Hazards
    --$Name Doomsday Deathball
    --$Sprite F025A0
    doomednum = 3459,
    spawnstate = S_DOOMDBALL_1887,
    spawnhealth = 1000,
    seestate = 0,
    seesound = sfx_brdsht,
    reactiontime = 8,
    attacksound = 0,
    painstate = 0,
    painchance = 0,
    painsound = 0,
    meleestate = 0,
    missilestate = 0,
    deathstate = S_DOOMDBALL_1580,
    deathsound = sfx_erghit,
    xdeathstate = 0,
    speed = 3866624,
    radius = 1310720,
    height = 1572864,
    mass = 1000000,
    damage = 1000000,
    activesound = 0,
    raisestate = 0,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

--Doomsday Deathball Launcher
states[S_DOOMDBALL_1887] = {SPR_EMW5_DEATHBALL_4, FF_FULLBRIGHT|FF_TRANS50|A, 2, A_MoveRelative, 0, 60, S_DOOMDBALL_1888}
states[S_DOOMDBALL_1888] = {SPR_EMW5_DEATHBALL_4, FF_FULLBRIGHT|FF_TRANS50|A, 2, A_MoveRelative, 0, 41, S_DEATHBALL_1631}
states[S_DOOMDBALL_1580] = {SPR_EMW5_DEATHBALL_DEATH, FF_FULLBRIGHT|FF_TRANS50|A, 1, A_LinedefExecute, 242, 0, S_DOOMDBALL_1581}
states[S_DOOMDBALL_1581] = {SPR_EMW5_DEATHBALL_DEATH, FF_FULLBRIGHT|FF_TRANS50|A, 50, A_PlaySound, sfx_erghit, 0, S_DOOMDBALL_1582}
states[S_DOOMDBALL_1582] = {SPR_EMW5_DEATHBALL_DEATH, FF_FULLBRIGHT|FF_TRANS50|A, 1, nil, 0, 0, S_NULL}