freeslot(
    "MT_EMWAMY_HAMMER",
    "S_EMWAMY_HAMMER_1",
    "S_EMWAMY_HAMMER_DEATH",
    "SPR_AHMR"
)

mobjinfo[MT_EMWAMY_HAMMER] = {
    doomednum = -1,
    spawnstate = S_EMWAMY_HAMMER_1,
    spawnhealth = 1000,
    deathstate = S_EMWAMY_HAMMER_DEATH,
    reactiontime = 8,
    speed = 2228224,
    mass = 100,
    damage = 20,
    radius = 2293760,
    height = 3932160,
    painchance = 0,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE,
}

states[S_EMWAMY_HAMMER_1] = {SPR_AHMR, 0, 3, nil, nil, nil, S_EMWAMY_HAMMER_DEATH}
states[S_EMWAMY_HAMMER_1] = {SPR_AHMR, 1, 2, nil, nil, nil, S_NULL}