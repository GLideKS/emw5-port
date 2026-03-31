--Coded by GLide KS

-- Old smoke for metalemw

SafeFreeslot("MT_OLDSMOKE", "S_OLDSMOKE")

mobjinfo[MT_OLDSMOKE] = {
        doomednum = -1,
        spawnstate = S_OLDSMOKE,
        spawnhealth = 1,
        radius = 32*FU,
        height = 64*FU,
        flags = MF_NOBLOCKMAP|MF_NOCLIP|MF_NOCLIPHEIGHT|MF_NOGRAVITY|MF_SCENERY,
		dispoffset = 40
}
states[S_OLDSMOKE] = {SPR_THOK, TR_TRANS20|C, 8, nil, nil, nil, nil}