--Coded by GLide KS

-- Old spin trail

freeslot("MT_OLDTHOK", "S_OLDTHOK")

mobjinfo[MT_OLDTHOK] = {
        doomednum = -1,
        spawnstate = S_OLDTHOK,
        spawnhealth = 1,
        radius = 32*FU,
        height = 64*FU,
        flags = MF_NOBLOCKMAP|MF_NOCLIP|MF_NOCLIPHEIGHT|MF_NOGRAVITY|MF_SCENERY,
		dispoffset = 40
}
states[S_OLDTHOK] = {SPR_THOK, TR_TRANS60|B, 8, nil, nil, nil, nil}