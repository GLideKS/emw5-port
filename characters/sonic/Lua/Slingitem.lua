freeslot("MT_EMWSONICBOOST",
         "S_BOOST_1",
		 "S_BOOST_2",
		 "S_BOOST_3",
		 "S_BOOST_4",
		 "S_BOOST_5",
		 "S_BOOST_6",
		 "SPR_BOST",
		 "sfx_boost"
)

mobjinfo[MT_EMWSONICBOOST] = {
    doomednum = -1,
	seesound = sfx_boost,
	spawnstate = S_BOOST_1,
	reactiontime = 8,
	deathstate = S_BOOST_1,
	radius = 81*FRACUNIT,
	height = 35*FRACUNIT,
	flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_BOOST_1] = {SPR_BOST, TR_TRANS30|A, 1, A_CapeChase, nil, nil, S_BOOST_2}
states[S_BOOST_2] = {SPR_BOST, TR_TRANS40|B, 1, A_CustomPower, pw_sneakers, 10, S_BOOST_3}
states[S_BOOST_3] = {SPR_BOST, TR_TRANS50|C, 1, A_CapeChase, nil, nil, S_BOOST_4}
states[S_BOOST_4] = {SPR_BOST, TR_TRANS60|D, 1, A_CapeChase, nil, nil, S_BOOST_5}
states[S_BOOST_5] = {SPR_BOST, TR_TRANS70|E, 1, A_CapeChase, nil, nil, S_BOOST_6}
states[S_BOOST_6] = {SPR_BOST, TR_TRANS80|F, 1, nil, nil, nil, S_NULL}