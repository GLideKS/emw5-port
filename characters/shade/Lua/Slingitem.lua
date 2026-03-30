-- Shade ringslinger item

freeslot("MT_SHADESLING",
		"S_SHADESLING",
		"S_SHADESLINGDEATH1",
		"S_SHADESLINGDEATH2"
)

mobjinfo[MT_SHADESLING] = {
        doomednum = -1,
        spawnstate = S_SHADESLING,
        spawnhealth = 1000,
        seesound = sfx_shslsh,
        reactiontime = 0,
        deathstate = S_SHADESLINGDEATH1,
        deathsound = sfx_slshit,
        speed = 39*FU,
        radius = 60*FU,
        height = 15*FU,
        mass = 100,
        damage = 20,
        flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_SHADESLING] = {SPR_EMW5_SHADESLASH, A, 3, nil, 0, 0, S_NULL}
states[S_SHADESLINGDEATH1] = {SPR_EMW5_SHADESLASH, A, 3, nil, 0, 0, S_SHADESLINGDEATH2}
states[S_SHADESLINGDEATH2] = {SPR_NULL, A, 30, nil, 0, 0, S_NULL}