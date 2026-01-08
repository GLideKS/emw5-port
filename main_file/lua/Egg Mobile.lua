freeslot(
"MT_EMWEGG",
"MT_EMWEGG_LINEDEF",
"S_EMWEGG_1519",
"S_EMWEGG_1520",
"S_EMWEGG_1521",
"S_EMWEGG_1522",
"S_EMWEGG_1523",
"S_EMWEGG_1524",
"S_EMWEGG_1525",
"S_EMWEGG_1526",
"S_EMWEGG_1527",
"S_EMWEGG_1528",
"S_EMWEGG_1529",
"S_EMWEGG_1530",
"S_EMWEGG_1531",
"S_EMWEGG_1532",
"S_EMWEGG_1533",
"S_EMWEGG_1534",
"S_EMWEGG_1535",
"S_EMWEGG_1536",
"S_EMWEGG_1537",
"S_EMWEGG_1538",
"S_EMWEGG_1539",
"S_EMWEGG_1540",
"S_EMWEGG_1541",
"S_EMWEGG_LINEDEF1",
"S_EMWEGG_LINEDEF2"
)

--Eggman
mobjinfo[MT_EMWEGG] = {
    --$Category Bosses
    --$Name Egg Mobile (EMW5)
    --$Sprite F039A1
    doomednum = 1468,
    spawnstate = S_EMWEGG_1520,
    spawnhealth = 11,
    seestate = S_EMWEGG_1521,
    seesound = 0,
    reactiontime = 8,
    attacksound = 0,
    painstate = S_EMWEGG_1522,
    painchance = 600,
    painsound = sfx_woah,
    meleestate = S_EMWEGG_1524,
    missilestate = S_EMWEGG_1524,
    deathstate = S_EMWEGG_1526,
    deathsound = sfx_cybdth,
    xdeathstate = S_EMWEGG_1540,
    speed = 12,
    radius = 1769445,
    height = 4587450,
    mass = 100,
    damage = 0,
    activesound = 0,
    raisestate = 0,
    flags = MF_SPECIAL|MF_SHOOTABLE|MF_BOSS|MF_NOGRAVITY|MF_SLIDEME|MF_FLOAT|MF_BOUNCE
}

states[S_EMWEGG_1520] = {SPR_EMW5_EGGMOBILE, A, 1, A_Look, 0, 0, S_EMWEGG_1520}
states[S_EMWEGG_1521] = {SPR_EMW5_EGGMOBILE, A, 1, A_Chase, 0, 0, S_EMWEGG_1521}
states[S_EMWEGG_1522] = {SPR_EMW5_EGGMOBILE, G, 20, A_Pain, 0, 0, S_EMWEGG_1523}
states[S_EMWEGG_1523] = {SPR_EMW5_EGGMOBILE, B, 10, A_FaceTarget, 0, 0, S_EMWEGG_1519}
states[S_EMWEGG_1519] = {SPR_EMW5_EGGMOBILE, C, 5, A_FireShot, MT_ROCKET, 15, S_EMWEGG_1520}
states[S_EMWEGG_1524] = {SPR_EMW5_EGGMOBILE, B, 15, A_FaceTarget, 0, 0, S_EMWEGG_1525}
states[S_EMWEGG_1525] = {SPR_EMW5_EGGMOBILE, C, 5, A_FireShot, MT_ROCKET, 15, S_EMWEGG_1520}
states[S_EMWEGG_1526] = {SPR_EMW5_EGGMOBILE, H, 4, A_Fall, 0, 0, S_EMWEGG_1527}
states[S_EMWEGG_1527] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1528}
states[S_EMWEGG_1528] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1529}
states[S_EMWEGG_1529] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1530}
states[S_EMWEGG_1530] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1531}
states[S_EMWEGG_1531] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1532}
states[S_EMWEGG_1532] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1533}
states[S_EMWEGG_1533] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1534}
states[S_EMWEGG_1534] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1535}
states[S_EMWEGG_1535] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1536}
states[S_EMWEGG_1536] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1537}
states[S_EMWEGG_1537] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1538}
states[S_EMWEGG_1538] = {SPR_EMW5_EGGMOBILE, H, 4, A_BossScream, 0, 0, S_EMWEGG_1539}
states[S_EMWEGG_1539] = {SPR_EMW5_EGGMOBILE, H, -1, A_BossDeath, 0, 0, S_NULL}
states[S_EMWEGG_1540] = {SPR_EMW5_EGGMOBILE, I, 4, nil, 0, 0, S_EMWEGG_1541}
states[S_EMWEGG_1541] = {SPR_EMW5_EGGMOBILE, I, 4, nil, 0, 0, S_EMWEGG_1540}