-- Shade Spin Item

freeslot("MT_SHADESPIN",
		"S_SHADESPIN_1",
		"S_SHADESPIN_2",
		"S_SHADESPIN_3",
		"S_SHADESPIN_4",
		"S_SHADESPIN_5",
		"S_SHADESPIN_6",
		"SPR_SHDS")

mobjinfo[MT_SHADESPIN] = {
    doomednum = -1,
    spawnstate = S_SHADESPIN_1,
    spawnhealth = 1000,
    reactiontime = 8,
    speed = 8,
    radius = 32*FU,
    height = 64*FU,
    mass = 16,
    damage = 0,
    flags = MF_NOGRAVITY|MF_NOBLOCKMAP|MF_FLOAT|MF_NOCLIP|MF_SCENERY,
    raisestate = MT_THOK
}

states[S_SHADESPIN_1] = {SPR_SHDS, TR_TRANS60|A, 1, nil, 0, 0, S_SHADESPIN_2}
states[S_SHADESPIN_2] = {SPR_SHDS, TR_TRANS60|B, 1, nil, 0, 0, S_SHADESPIN_3}
states[S_SHADESPIN_3] = {SPR_SHDS, TR_TRANS60|C, 1, nil, 0, 0, S_SHADESPIN_4}
states[S_SHADESPIN_4] = {SPR_SHDS, TR_TRANS60|D, 1, nil, 0, 0, S_SHADESPIN_5}
states[S_SHADESPIN_5] = {SPR_SHDS, TR_TRANS60|F, 1, nil, 0, 0, S_SHADESPIN_6}
states[S_SHADESPIN_6] = {SPR_SHDS, TR_TRANS60|G, 1, nil, 0, 0, S_NULL}