--Coded by GLide KS

-- Old spin trail

SafeFreeslot("MT_OLD_THOK", "MT_OLD_SMOKE", "S_OLD_THOK", "SPR_OLD_THOK")

states[S_OLD_THOK] = {SPR_OLD_THOK, TR_TRANS60|0, 8, nil, nil, nil, nil}

mobjinfo[MT_OLD_THOK] = {
        doomednum = -1,
        spawnstate = S_OLD_THOK,
        spawnhealth = 1,
        radius = 32*FU,
        height = 64*FU,
        flags = MF_NOBLOCKMAP|MF_NOCLIP|MF_NOCLIPHEIGHT|MF_NOGRAVITY|MF_SCENERY,
		dispoffset = 40
}

--Old smoke trail
mobjinfo[MT_OLD_SMOKE] = {
        doomednum = -1,
        spawnstate = S_OLD_THOK,
        spawnhealth = 1,
        radius = 32*FU,
        height = 64*FU,
        flags = MF_NOBLOCKMAP|MF_NOCLIP|MF_NOCLIPHEIGHT|MF_NOGRAVITY|MF_SCENERY,
		dispoffset = 40
}

addHook("MobjSpawn", function(mo)
    mo.translation = "Grayscale"
end, MT_OLD_SMOKE)