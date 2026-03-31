SafeFreeslot("MT_KNUXPUNCH",
         "S_KNUXPUNCH_1",
		 "S_KNUXPUNCH_2",
		 "S_KNUXPUNCH_3",
		 "SPR_EMW5_KNUXPUNCH"
)

mobjinfo[MT_KNUXPUNCH] = {
    doomednum = -1,
	seesound = sfx_thok,
	spawnstate = S_KNUXPUNCH_1,
    spawnhealth = 1000,
	reactiontime = 8,
	deathstate = S_KNUXPUNCH_1,
	radius = 30*FRACUNIT,
	height = 30*FRACUNIT,
    speed = 40*FRACUNIT,
	flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_KNUXPUNCH_1] = {SPR_EMW5_KNUXPUNCH, A, 2, nil, nil, nil, S_KNUXPUNCH_2}
states[S_KNUXPUNCH_2] = {SPR_EMW5_KNUXPUNCH, A, 1, nil, nil, nil, S_KNUXPUNCH_3}
states[S_KNUXPUNCH_3] = {SPR_EMW5_KNUXPUNCH, A, 1, nil, nil, nil, S_NULL}