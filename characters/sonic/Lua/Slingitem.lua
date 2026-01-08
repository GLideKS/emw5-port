freeslot("MT_EMWSONICBOOST",
         "S_BOOST_1",
		 "S_BOOST_2",
		 "S_BOOST_3",
		 "S_BOOST_4",
		 "S_BOOST_5",
		 "S_BOOST_6"
)

mobjinfo[MT_EMWSONICBOOST] = {
    doomednum = -1,
	seesound = sfx_snbost,
	spawnstate = S_BOOST_1,
	reactiontime = 1,
	painchance = 15,
	deathstate = S_BOOST_1,
	radius = 5308416,
	height = 2293760,
	mass = 16,
	speed = 65536,
	flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_BOOST_1] = {SPR_EMW5_SONICBOOST, TR_TRANS50|FF_FULLBRIGHT|A, 1, A_CapeChase, nil, nil, S_BOOST_2}
states[S_BOOST_2] = {SPR_EMW5_SONICBOOST, TR_TRANS50|FF_FULLBRIGHT|B, 1, A_CustomPower, pw_sneakers, 10, S_BOOST_3}
states[S_BOOST_3] = {SPR_EMW5_SONICBOOST, TR_TRANS50|FF_FULLBRIGHT|C, 1, A_CapeChase, nil, nil, S_BOOST_4}
states[S_BOOST_4] = {SPR_EMW5_SONICBOOST, TR_TRANS50|FF_FULLBRIGHT|D, 1, A_CapeChase, nil, nil, S_BOOST_5}
states[S_BOOST_5] = {SPR_EMW5_SONICBOOST, TR_TRANS80|FF_FULLBRIGHT|E, 1, A_CapeChase, nil, nil, S_BOOST_6}
states[S_BOOST_6] = {SPR_EMW5_SONICBOOST, TR_TRANS90|FF_FULLBRIGHT|F, 1, nil, nil, nil, S_NULL}