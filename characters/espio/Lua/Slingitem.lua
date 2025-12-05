freeslot(
    "MT_EMWESPIO_NINJASTAR",
    "S_EMWESPIO_NINJASTAR_1761",
    "S_EMWESPIO_NINJASTAR_1762",
    "S_EMWESPIO_NINJASTAR_1763"
)

mobjinfo[MT_EMWESPIO_NINJASTAR] = {
    doomednum = -1,
    spawnstate = S_EMWESPIO_NINJASTAR_1761,
    seesound = sfx_thok,
    spawnhealth = 1000,
    reactiontime = 6,
    speed = 2359296,
    mass = 16,
    painchance = 400,
    radius = 1638400,
    height = 983040,
    flags = MF_NOBLOCKMAP|MF_MISSILE
}

states[S_EMWESPIO_NINJASTAR_1761] = {SPR_F047, 0, 1, nil, nil, nil, S_EMWESPIO_NINJASTAR_1762}
states[S_EMWESPIO_NINJASTAR_1762] = {SPR_F047, 1, 1, nil, nil, nil, S_EMWESPIO_NINJASTAR_1763}
states[S_EMWESPIO_NINJASTAR_1763] = {SPR_F047, 0, 1, A_MoveRelative, 3, nil, S_EMWESPIO_NINJASTAR_1761}
