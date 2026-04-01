--Coded by GLide KS

-- Old smoke for metalemw

SafeFreeslot("MT_OLD_SMOKE", "S_OLD_SMOKE")

mobjinfo[MT_OLD_SMOKE] = {
        doomednum = -1,
        spawnstate = S_OLD_SMOKE,
        spawnhealth = 1,
        radius = 32*FU,
        height = 64*FU,
        flags = MF_NOBLOCKMAP|MF_NOCLIP|MF_NOCLIPHEIGHT|MF_NOGRAVITY|MF_SCENERY,
		dispoffset = 40
}

states[S_OLD_SMOKE] = {SPR_OLD_THOK, TR_TRANS60|1, 8, nil, nil, nil, nil}