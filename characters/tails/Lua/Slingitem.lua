freeslot("MT_TAILSBOMB",
         "S_TAILSBOMB_1"
	)

mobjinfo[MT_TAILSBOMB] = {
    doomednum = -1,
	spawnstate = S_TAILSBOMB_1,
    spawnhealth = 1000,
	reactiontime = 8,
	deathstate = S_EMWROCKET_1670,
	deathsound = sfx_FRE012,
	painchance = 15,
	mass = 16,
	damage = 0,
	radius = 4259840,
	height = 4259840,
	flags = MF_MISSILE
}

states[S_TAILSBOMB_1] = {SPR_FBXM, A, 1, nil, nil, nil, S_TAILSBOMB_1}