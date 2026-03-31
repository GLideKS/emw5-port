SafeFreeslot(
    "MT_EMWESPIO_SPINITEM",
    "S_EMWESPIO_SPINITEM_2113",
	"SPR_EMW5_ESPIOITEM"
)

mobjinfo[MT_EMWESPIO_SPINITEM] = {
    doomednum = -1,
    spawnstate = S_EMWESPIO_SPINITEM_2113,
    spawnhealth = 1000,
    reactiontime = 8,
    speed = 8,
    radius = 2097152,
    height = 4194304,
    mass = 16,
    flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_NOCLIP|MF_SCENERY
}

states[S_EMWESPIO_SPINITEM_2113] = {SPR_EMW5_ESPIOITEM, TR_TRANS50|0, 8, nil, nil, nil, S_NULL}