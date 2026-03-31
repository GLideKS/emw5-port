SafeFreeslot(
"MT_SHADOWSCENE2",
"S_SHADOWSC1",
"S_SHADOWSC2",
"MT_MARIASCENE2",
"S_MARIASCENE1",
"S_MARIASCENE2",
"S_MARIASCENE3",
"S_MARIASCENE4",
"S_MARIASCENE5",
"MT_EARTH",
"S_EARTH",
"MT_MARIASCENE1",
"S_MARIASC1",
"S_MARIASC2",
"S_MARIASC3",
"S_MARIASC4",
"S_MARIASC5",
"S_MARIASC6",
"MT_SHADOWSCENE1",
"S_SHADOWSCENE1",
"S_SHADOWSCENE2",
"S_SHADOWSCENE3",
"S_SHADOWSCENE4",
"S_SHADOWSCENE5",
"S_SHADOWSCENE6",
"S_SHADOWSCENE7"
)

--Shadow Scene 2
mobjinfo[MT_SHADOWSCENE2] = {
    --$Category Decoration
    --$Name Shadow Scene 2
    --$Sprite F040A2A8
    doomednum = 1792,
    spawnstate = S_SHADOWSC1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_SOLID
}

states[S_SHADOWSC1] = {SPR_EMW5_NPCSHADOW, A, 100, nil, 0, 0, S_SHADOWSC2}
states[S_SHADOWSC2] = {SPR_EMW5_NPCSHADOW, B, 1, nil, 0, 0, S_SHADOWSC2}

--Maria Scene 2
mobjinfo[MT_MARIASCENE2] = {
    --$Category Decoration
    --$Name Maria Scene 2
    --$Sprite F026A0
    doomednum = 1791,
    spawnstate = S_MARIASCENE1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_SOLID
}

states[S_MARIASCENE1] = {SPR_EMW5_DEATHMARIA, A, 285, nil, 0, 0, S_MARIASCENE2}
states[S_MARIASCENE2] = {SPR_EMW5_DEATHMARIA, B, 280, nil, 0, 0, S_MARIASCENE3}
states[S_MARIASCENE3] = {SPR_EMW5_DEATHMARIA, C, 5, nil, 0, 0, S_MARIASCENE4}
states[S_MARIASCENE4] = {SPR_EMW5_DEATHMARIA, D, 1, A_LinedefExecute, 242, 0, S_MARIASCENE5}
states[S_MARIASCENE5] = {SPR_EMW5_DEATHMARIA, D, 1, nil, 0, 0, S_MARIASCENE5}

--Earth
mobjinfo[MT_EARTH] = {
    --$Category Decoration
    --$Name Earth
    --$Sprite F065A0
    doomednum = 1794,
    spawnstate = S_EARTH,
    spawnhealth = 1,
    reactiontime = 32,
    painchance = 300,
    radius = 1572864,
    height = 2097152,
    mass = 100,
    flags = MF_SCENERY|MF_NOBLOCKMAP|MF_NOCLIP
}

states[S_EARTH] = {SPR_EMW5_EARTH, A|FF_FULLBRIGHT, 2, nil, 0, 0, S_EARTH}

--Maria Scene 1
mobjinfo[MT_MARIASCENE1] = {
    --$Category Decoration
    --$Name Maria Scene 1
    --$Sprite F021A0
    doomednum = 1474,
    spawnstate = S_MARIASC1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_SOLID
}

states[S_MARIASC1] = {SPR_EMW5_MARIA, A, 170, nil, 0, 0, S_MARIASC2}
states[S_MARIASC2] = {SPR_EMW5_MARIA, C, 200, nil, 0, 0, S_MARIASC3}
states[S_MARIASC3] = {SPR_EMW5_MARIA, D, 1, nil, 0, 0, S_MARIASC4}
states[S_MARIASC4] = {SPR_EMW5_MARIA, B, 200, nil, 0, 0, S_MARIASC5}
states[S_MARIASC5] = {SPR_EMW5_MARIA, D, 140, nil, 0, 0, S_MARIASC6}
states[S_MARIASC6] = {SPR_EMW5_MARIA, A, 1, nil, 0, 0, S_MARIASC6}

--Shadow Scene 1
mobjinfo[MT_SHADOWSCENE1] = {
    --$Category Decoration
    --$Name Shadow Scene 1
    --$Sprite F040A2A8
    doomednum = 1479,
    spawnstate = S_SHADOWSCENE1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_SOLID
}

states[S_SHADOWSCENE1] = {SPR_EMW5_NPCSHADOW, A, 320, nil, 0, 0, S_SHADOWSCENE2}
states[S_SHADOWSCENE2] = {SPR_EMW5_NPCSHADOW, E, 60, nil, 0, 0, S_SHADOWSCENE3}
states[S_SHADOWSCENE3] = {SPR_EMW5_NPCSHADOW, A, 10, nil, 0, 0, S_SHADOWSCENE4}
states[S_SHADOWSCENE4] = {SPR_EMW5_NPCSHADOW, B, 500, nil, 0, 0, S_SHADOWSCENE5}
states[S_SHADOWSCENE5] = {SPR_EMW5_NPCSHADOW, D, 500, nil, 0, 0, S_SHADOWSCENE6}
states[S_SHADOWSCENE6] = {SPR_EMW5_NPCSHADOW, B, 1, nil, 0, 0, S_SHADOWSCENE6}