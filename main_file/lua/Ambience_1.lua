freeslot(
"MT_SEAWEED",
"S_SEAWEED1",
"S_SEAWEED2",
"S_SEAWEED3",
"S_SEAWEED4",
"MT_WATERFALL",
"S_WATERF1",
"S_WATERF2",
"S_WATERF3",
"S_WATERF4",
"S_WATERF5",
"MT_SCENFISH",
"S_SFISH1",
"S_SFISH2",
"S_SFISH3",
"S_SFISH4",
"S_SFISH5",
"MT_SONIC",
"S_SONIC1",
"S_SONIC2",
"S_SONIC3",
"S_SONIC4",
"S_SONIC5",
"S_SONIC6",
"S_SONIC7",
"S_SONIC8",
"MT_TAILS",
"S_TAILS1",
"S_TAILS2",
"S_TAILS3",
"S_TAILS4",
"S_TAILS5",
"S_TAILS6",
"S_TAILS7",
"S_TAILS8",
"MT_KNUX",
"S_KNUX1",
"S_KNUX2",
"S_KNUX3",
"S_KNUX4",
"S_KNUX5",
"S_KNUX6",
"S_KNUX7",
"S_KNUX8",
"MT_GRASS",
"S_GRASS_1950",
"S_GRASS_1951",
"S_GRASS_1952",
"S_GRASS_1953",
"S_GRASS_1954",
"S_GRASS_1955",
"S_GRASS_1956",
"S_GRASS_1957",
"S_GRASS_1958",
"S_GRASS_1959",
"S_GRASS_1960",
"S_GRASS_1961",
"S_GRASS_1962",
"S_GRASS_1963",
"S_GRASS_1964",
"S_GRASS_1965",
"MT_BARREL",
"S_BARREL1",
"S_BARREL2",
"MT_ELECSTAND",
"S_ELECSTAND1",
"MT_UNDERWATERBUSH",
"S_UNDERWATERBUSH",
"MT_SHORTTREE",
"S_SHORTTREE",
"MT_YOUNGTREE",
"S_YOUNGTREE",
"MT_LARGETREE",
"S_LARGETREE",
"MT_FLOWERS",
"S_FLOWER1",
"S_FLOWER2",
"S_FLOWER3",
"S_FLOWER4",
"S_FLOWER5",
"S_FLOWER6",
"S_FLOWER7",
"S_FLOWER8",
"MT_HUGETREE",
"S_HUGETREE",
"MT_CONTAINER",
"S_CONTAINER",
"MT_CHEAPTTREE",
"S_CHEAPTTREE",
"MT_CHEAPLTREE",
"S_CHEAPLTREE",
"MT_CHEAPBUSH",
"S_CHEAPBUSH",
"MT_POLE",
"S_POLE",
"MT_STALAGMITE",
"S_STALAGMITE",
"MT_BRAD",
"S_BRAD",
"MT_SMETALFLYBY",
"MT_SMETALFLYBY1",
"S_SMETALFLYBY1",
"S_SMETALFLYBY2",
"S_SMETALFLYBY3",
"S_SMETALFLYBY4",
"MT_DEADEGG",
"S_DEADEGG",
"MT_DEADTAILS",
"S_DEADTAILS",
"MT_REALLYDTAILS",
"S_RDTAILS",
"MT_DEADHOG",
"S_DEADHOG",
"MT_DEADGHZTREE",
"S_DEADGHZTREE",
"MT_DEADGHZFLOWER",
"S_DEADGHZFLOWER",
"MT_DEADGHZPLANT",
"S_DEADGHZPLANT",
"MT_FLYBYSOUNDS",
"S_FLYBYSOUNDS1",
"S_FLYBYSOUNDS2",
"S_FLYBYSOUNDS3",
"S_FLYBYSOUNDS4",
"S_FLYBYSOUNDS5",
"S_FLYBYSOUNDS6",
"MT_EXPLOSIONLIGHT",
"S_EXPLOSIONLIGHT1",
"S_EXPLOSIONLIGHT2",
"S_EXPLOSIONLIGHT3",
"MT_SCENERYEXPLOSION",
"MT_SCENERYEXPLOSION2",
"S_SCENERYEXPLOSION",
"S_SCENERYEXPLOSION2",
"MT_DEADTREE",
"S_DEADTREE",
"MT_DIEINGTREE",
"S_DIEINGTREE",
"MT_WARPEDTREE",
"S_WARPEDTREE",
"MT_METALTAUNT",
"S_METALLOOK",
"S_METALSAYS"
)

--SpinFire Smoke
states[S_SPINFIRE1] = {SPR_SFLM, A|FF_FULLBRIGHT, 2, A_SmokeTrailer, MT_SMOKE, 0, S_SPINFIRE2}
states[S_SPINFIRE4] = {SPR_SFLM, D|FF_FULLBRIGHT, 2, A_SmokeTrailer, MT_SMOKE, 0, S_SPINFIRE5}

--Sea Weed
mobjinfo[MT_SEAWEED] = {
    --$Category Decoration
    --$Name Sea Weed
    --$Sprite F007A0
    doomednum = 592,
    spawnstate = S_SEAWEED1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1572864,
    height = 6291456,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_SEAWEED1] = {SPR_EMW5_VINE, A, 7, nil, 0, 0, S_SEAWEED2}
states[S_SEAWEED2] = {SPR_EMW5_VINE, B, 7, nil, 0, 0, S_SEAWEED3}
states[S_SEAWEED3] = {SPR_EMW5_VINE, C, 7, nil, 0, 0, S_SEAWEED4}
states[S_SEAWEED4] = {SPR_EMW5_VINE, D, 7, nil, 0, 0, S_SEAWEED1}

--Waterfall
mobjinfo[MT_WATERFALL] = {
    --$Category Decoration
    --$Name Waterfall
    --$Sprite F042A0
    doomednum = 853,
    spawnstate = S_WATERF1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_WATERF1] = {SPR_EMW5_WATERSPLASH, A, 2, nil, 0, 0, S_WATERF2}
states[S_WATERF2] = {SPR_EMW5_WATERSPLASH, B, 2, nil, 0, 0, S_WATERF3}
states[S_WATERF3] = {SPR_EMW5_WATERSPLASH, C, 2, nil, 0, 0, S_WATERF4}
states[S_WATERF4] = {SPR_EMW5_WATERSPLASH, D, 1, A_RandomState, S_WATERF1, S_WATERF5, S_WATERF5}
states[S_WATERF5] = {SPR_EMW5_WATERSPLASH, D, 2, nil, 0, 0, S_WATERF1}

--SceneryFish
mobjinfo[MT_SCENFISH] = {
    --$Category Decoration
    --$Name Fish
    --$Sprite F002A1
    doomednum = 598,
    spawnstate = S_SFISH1,
    spawnhealth = 1,
    reactiontime = 2,
    painchance = 3072,
    deathstate = S_XPLD1,
    deathsound = sfx_pop,
    speed = 76214,
    radius = 1310720,
    height = 3072864,
    mass = 100,
    flags = MF_BOUNCE|MF_NOCLIPTHING
}

states[S_SFISH1] = {SPR_EMW5_FISH, B, 7, A_ChangeAngleRelative, 0, 360, S_SFISH2}
states[S_SFISH2] = {SPR_EMW5_FISH, A, 7, A_MoveRelative, 0, 2, S_SFISH3}
states[S_SFISH3] = {SPR_EMW5_FISH, A, 7, A_MoveRelative, 0, 2, S_SFISH4}
states[S_SFISH4] = {SPR_EMW5_FISH, A, 7, A_MoveRelative, 0, 2, S_SFISH5}
states[S_SFISH5] = {SPR_EMW5_FISH, A, 1, A_RandomState, S_SFISH1, S_SFISH4, S_SFISH1}

--SonicClone
mobjinfo[MT_SONIC] = {
    --$Category Decoration
    --$Name Sonic (NPC)
    --$Sprite F003A1
    doomednum = 594,
    spawnstate = S_SONIC1,
    spawnhealth = 1,
    reactiontime = 2,
    painchance = 3072,
    deathstate = S_XPLD1,
    deathsound = sfx_pop,
    speed = 262144,
    radius = 1310720,
    height = 1572864,
    mass = 100,
    flags = MF_BOUNCE|MF_NOCLIPTHING|MF_ENEMY
}

states[S_SONIC1] = {SPR_EMW5_NPCSONIC, A, 4, A_ChangeAngleRelative, 0, 360, S_SONIC2}
states[S_SONIC2] = {SPR_EMW5_NPCSONIC, B, 4, A_MoveRelative, 0, 9, S_SONIC3}
states[S_SONIC3] = {SPR_EMW5_NPCSONIC, C, 4, A_MoveRelative, 0, 9, S_SONIC4}
states[S_SONIC4] = {SPR_EMW5_NPCSONIC, D, 4, A_MoveRelative, 0, 9, S_SONIC5}
states[S_SONIC5] = {SPR_EMW5_NPCSONIC, E, 4, A_MoveRelative, 0, 9, S_SONIC6}
states[S_SONIC6] = {SPR_EMW5_NPCSONIC, F, 4, A_MoveRelative, 0, 9, S_SONIC7}
states[S_SONIC7] = {SPR_EMW5_NPCSONIC, G, 4, A_MoveRelative, 0, 9, S_SONIC8}
states[S_SONIC8] = {SPR_EMW5_NPCSONIC, H, 4, A_MoveRelative, 0, 9, S_SONIC1}

--TailsClone
mobjinfo[MT_TAILS] = {
    --$Category Decoration
    --$Name Tails (NPC)
    --$Sprite F005A1
    doomednum = 595,
    spawnstate = S_TAILS1,
    spawnhealth = 1,
    reactiontime = 2,
    painchance = 3072,
    deathstate = S_XPLD1,
    deathsound = sfx_pop,
    speed = 262144,
    radius = 1310720,
    height = 1572864,
    mass = 100,
    flags = MF_BOUNCE|MF_NOCLIPTHING|MF_ENEMY
}

states[S_TAILS1] = {SPR_EMW5_NPCTAILS, A, 4, A_ChangeAngleRelative, -360, 360, S_TAILS2}
states[S_TAILS2] = {SPR_EMW5_NPCTAILS, B, 4, A_MoveRelative, 0, 5, S_TAILS3}
states[S_TAILS3] = {SPR_EMW5_NPCTAILS, C, 4, A_MoveRelative, -360, 5, S_TAILS4}
states[S_TAILS4] = {SPR_EMW5_NPCTAILS, D, 4, A_MoveRelative, 0, 5, S_TAILS5}
states[S_TAILS5] = {SPR_EMW5_NPCTAILS, E, 4, A_MoveRelative, 0, 5, S_TAILS6}
states[S_TAILS6] = {SPR_EMW5_NPCTAILS, F, 4, A_MoveRelative, 0, 5, S_TAILS7}
states[S_TAILS7] = {SPR_EMW5_NPCTAILS, G, 4, A_MoveRelative, 0, 5, S_TAILS8}
states[S_TAILS8] = {SPR_EMW5_NPCTAILS, H, 4, A_MoveRelative, 0, 5, S_TAILS1}

--KnuxClone
mobjinfo[MT_KNUX] = {
    --$Category Decoration
    --$Name Knuckles (NPC)
    --$Sprite F004A1
    doomednum = 593,
    spawnstate = S_KNUX1,
    spawnhealth = 1,
    reactiontime = 2,
    painchance = 3072,
    deathstate = S_XPLD1,
    deathsound = sfx_pop,
    speed = 262144,
    radius = 1310720,
    height = 1572864,
    mass = 100,
    flags = MF_BOUNCE|MF_NOCLIPTHING|MF_ENEMY
}

states[S_KNUX1] = {SPR_EMW5_NPCKNUX, A, 4, A_ChangeAngleRelative, 0, 360, S_KNUX2}
states[S_KNUX2] = {SPR_EMW5_NPCKNUX, B, 4, A_MoveRelative, 0, 7, S_KNUX3}
states[S_KNUX3] = {SPR_EMW5_NPCKNUX, C, 4, A_MoveRelative, 0, 7, S_KNUX4}
states[S_KNUX4] = {SPR_EMW5_NPCKNUX, D, 4, A_MoveRelative, 0, 7, S_KNUX5}
states[S_KNUX5] = {SPR_EMW5_NPCKNUX, E, 4, A_MoveRelative, 0, 7, S_KNUX6}
states[S_KNUX6] = {SPR_EMW5_NPCKNUX, F, 4, A_MoveRelative, 0, 7, S_KNUX7}
states[S_KNUX7] = {SPR_EMW5_NPCKNUX, G, 4, A_MoveRelative, 0, 7, S_KNUX8}
states[S_KNUX8] = {SPR_EMW5_NPCKNUX, H, 4, A_MoveRelative, 0, 7, S_KNUX1}

--Grass
mobjinfo[MT_GRASS] = {
    --$Category Decoration
    --$Name Grass (random)
    --$Sprite F072A0
    doomednum = 1467,
    spawnstate = S_GRASS_1950,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2293760,
    height = 8519680,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_GRASS_1950] = {SPR_EMW5_GRASS, A, 1, nil, 0, 0, S_GRASS_1951}
states[S_GRASS_1951] = {SPR_EMW5_GRASS, A, 1, A_RandomState, S_GRASS_1952, S_GRASS_1959, S_GRASS_1951}
states[S_GRASS_1952] = {SPR_EMW5_GRASS, A, 1, A_RandomState, S_GRASS_1953, S_GRASS_1956, S_GRASS_1952}
states[S_GRASS_1953] = {SPR_EMW5_GRASS, A, 1, A_RandomState, S_GRASS_1954, S_GRASS_1955, S_GRASS_1953}
states[S_GRASS_1954] = {SPR_EMW5_GRASS, A, -1, nil, 0, 0, S_NULL}
states[S_GRASS_1955] = {SPR_EMW5_GRASS, B, -1, nil, 0, 0, S_NULL}
states[S_GRASS_1956] = {SPR_EMW5_GRASS, A, 1, A_RandomState, S_GRASS_1957, S_GRASS_1958, S_GRASS_1956}
states[S_GRASS_1957] = {SPR_EMW5_GRASS, C, -1, nil, 0, 0, S_NULL}
states[S_GRASS_1958] = {SPR_EMW5_GRASS, D, -1, nil, 0, 0, S_NULL}
states[S_GRASS_1959] = {SPR_EMW5_GRASS, A, 1, A_RandomState, S_GRASS_1960, S_GRASS_1963, S_GRASS_1959}
states[S_GRASS_1960] = {SPR_EMW5_GRASS, A, 1, A_RandomState, S_GRASS_1961, S_GRASS_1962, S_GRASS_1960}
states[S_GRASS_1961] = {SPR_EMW5_GRASS, E, -1, nil, 0, 0, S_NULL}
states[S_GRASS_1962] = {SPR_EMW5_GRASS, F, -1, nil, 0, 0, S_NULL}
states[S_GRASS_1963] = {SPR_EMW5_GRASS, A, 1, A_RandomState, S_GRASS_1964, S_GRASS_1965, S_GRASS_1963}
states[S_GRASS_1964] = {SPR_EMW5_GRASS, G, -1, nil, 0, 0, S_NULL}
states[S_GRASS_1965] = {SPR_EMW5_GRASS, H, -1, nil, 0, 0, S_NULL}

--Barrel
mobjinfo[MT_BARREL] = {
    --$Category Decoration
    --$Name Doom Barrel
    --$Sprite F073A0
    doomednum = 1466,
    spawnstate = S_BARREL1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1310720,
    height = 2097152,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_BARREL1] = {SPR_EMW5_ACIDTANK, A, 4, nil, 0, 0, S_BARREL2}
states[S_BARREL2] = {SPR_EMW5_ACIDTANK, B, 4, nil, 0, 0, S_BARREL1}

--PoleThing
mobjinfo[MT_BSZVINE_ORANGE] = {
    --$Category Decoration
    --$Name Doom Pole
    --$Sprite F074A0
    doomednum = 1465,
    spawnstate = S_POLE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1310720,
    height = 2097152,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_POLE] = {SPR_EMW5_POST, A, -1, nil, 0, 0, S_NULL}

--ElectricStand
mobjinfo[MT_BSZVINE_YELLOW] = {
    --$Category Decoration
    --$Name Doom Eletric Stand
    --$Sprite F074B0
    doomednum = 1464,
    spawnstate = S_ELECSTAND1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1376256,
    height = 7864320,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_ELECSTAND1] = {SPR_EMW5_POST, B, -1, nil, 0, 0, S_NULL}

--UnderwaterBush
mobjinfo[MT_UNDERWATERBUSH] = {
    --$Category Decoration
    --$Name Underwater Bush
    --$Sprite F067A0
    doomednum = 865,
    spawnstate = S_UNDERWATERBUSH,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_NOCLIP|MF_SCENERY
}

states[S_UNDERWATERBUSH] = {SPR_EMW5_SEAWEED, A, -1, nil, 0, 0, S_NULL}

--ShortTree
mobjinfo[MT_SHORTTREE] = {
    --$Category Decoration
    --$Name Short Tree
    --$Sprite F068A0
    doomednum = 866,
    spawnstate = S_SHORTTREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 1703936,
    mass = 100,
    flags = MF_NOCLIP|MF_SCENERY
}

states[S_SHORTTREE] = {SPR_EMW5_SMALLBUSH, A, -1, nil, 0, 0, S_NULL}

--YoungTree
mobjinfo[MT_YOUNGTREE] = {
    --$Category Decoration
    --$Name Young Tree
    --$Sprite F069A0
    doomednum = 867,
    spawnstate = S_YOUNGTREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 3276800,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_YOUNGTREE] = {SPR_EMW5_TREE2, A, -1, nil, 0, 0, S_NULL}

--LargeTree
mobjinfo[MT_LARGETREE] = {
    --$Category Decoration
    --$Name Large Tree
    --$Sprite F017B0
    doomednum = 868,
    spawnstate = S_LARGETREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2293760,
    height = 8519680,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_LARGETREE] = {SPR_EMW5_BIGTREE, B, -1, nil, 0, 0, S_LARGETREE}

--Flowers
mobjinfo[MT_FLOWERS] = {
    --$Category Decoration
    --$Name Flowers (random)
    --$Sprite F070A0
    doomednum = 872,
    spawnstate = S_FLOWER1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2293760,
    height = 8519680,
    mass = 100,
    flags = MF_NOCLIP|MF_SCENERY
}

states[S_FLOWER1] = {SPR_EMW5_FLOWERS, A, 1, nil, 0, 0, S_FLOWER2}
states[S_FLOWER2] = {SPR_EMW5_FLOWERS, A, 1, A_RandomState, S_FLOWER3, S_FLOWER4, S_FLOWER2}
states[S_FLOWER3] = {SPR_EMW5_FLOWERS, A, 1, A_RandomState, S_FLOWER5, S_FLOWER6, S_FLOWER3}
states[S_FLOWER4] = {SPR_EMW5_FLOWERS, A, 1, A_RandomState, S_FLOWER7, S_FLOWER8, S_FLOWER4}
states[S_FLOWER5] = {SPR_EMW5_FLOWERS, A, -1, nil, 0, 0, S_NULL}
states[S_FLOWER6] = {SPR_EMW5_FLOWERS, B, -1, nil, 0, 0, S_NULL}
states[S_FLOWER7] = {SPR_EMW5_FLOWERS, C, -1, nil, 0, 0, S_NULL}
states[S_FLOWER8] = {SPR_EMW5_FLOWERS, D, -1, nil, 0, 0, S_NULL}

--HugeTree
mobjinfo[MT_HUGETREE] = {
    --$Category Decoration
    --$Name Huge Tree
    --$Sprite F071A0
    doomednum = 873,
    spawnstate = S_HUGETREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2621440,
    height = 9175040,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_HUGETREE] = {SPR_EMW5_BIGBUSH, A, -1, nil, 0, 0, S_NULL}

--Container
mobjinfo[MT_CONTAINER] = {
    --$Category Decoration
    --$Name Container
    --$Sprite F008A0
    doomednum = 2110,
    spawnstate = S_CONTAINER,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_NOCLIP|MF_SCENERY
}

states[S_CONTAINER] = {SPR_EMW5_FRIDGE, A, 1, nil, 0, 0, S_CONTAINER}

--Stalagmite
mobjinfo[MT_STALAGMITE] = {
    --$Category Decoration
    --$Name Stalagmite
    --$Sprite F014A0
    doomednum = 859,
    spawnstate = S_STALAGMITE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_STALAGMITE] = {SPR_EMW5_STALAGMITEUP, A, -1, nil, 0, 0, S_STALAGMITE}

--CheapTinyTree
mobjinfo[MT_CHEAPTTREE] = {
    --$Category Decoration
    --$Name Cheap Tiny Tree
    --$Sprite F016A0
    doomednum = 861,
    spawnstate = S_CHEAPTTREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_CHEAPTTREE] = {SPR_EMW5_SMALLTREE, A, -1, nil, 0, 0, S_CHEAPTTREE}

--CheapLargeTree
mobjinfo[MT_CHEAPLTREE] = {
    --$Category Decoration
    --$Name Cheap Large Tree
    --$Sprite F017A0
    doomednum = 862,
    spawnstate = S_CHEAPLTREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_CHEAPLTREE] = {SPR_EMW5_BIGTREE, A, -1, nil, 0, 0, S_CHEAPLTREE}

--CheapBush
mobjinfo[MT_CHEAPBUSH] = {
    --$Category Decoration
    --$Name Cheap Bush
    --$Sprite F018A0
    doomednum = 863,
    spawnstate = S_CHEAPBUSH,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_NOCLIP|MF_SCENERY
}

states[S_CHEAPBUSH] = {SPR_EMW5_BUSH, A, -1, nil, 0, 0, S_CHEAPBUSH}

--Brad
mobjinfo[MT_BRAD] = {
    --$Category Decoration
    --$Name Brad
    --$Sprite F029A0
    doomednum = 1476,
    spawnstate = S_BRAD,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 6291456,
    mass = 100,
    flags = MF_SOLID|MF_SCENERY
}

states[S_BRAD] = {SPR_EMW5_NORMALBRAD, A, -1, nil, 0, 0, S_NULL}

--SCeneryMetalFlyby
mobjinfo[MT_SMETALFLYBY] = {
    --$Category Decoration
    --$Name Metal Fly By
    --$Sprite EGGMB3B7
    doomednum = 876,
    spawnstate = S_SMETALFLYBY1,
    spawnhealth = 1000,
    seestate = S_SMETALFLYBY2,
    reactiontime = 8,
    radius = 2621440,
    height = 9175040,
    mass = 100,
    flags = MF_SPAWNCEILING|MF_NOGRAVITY|MF_NOCLIP|MF_FLOAT|MF_SCENERY
}

states[S_SMETALFLYBY1] = {SPR_EGGM, B, 1, A_Look, 1, 0, S_SMETALFLYBY1}
states[S_SMETALFLYBY2] = {SPR_EGGM, B, 1, A_MoveRelative, 0, 75, S_SMETALFLYBY3}
states[S_SMETALFLYBY3] = {SPR_EGGM, C, 1, A_SmokeTrailer, MT_SMETALFLYBY1, 0, S_SMETALFLYBY3}

mobjinfo[MT_SMETALFLYBY1] = {
    spawnstate = S_SMETALFLYBY4,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2621440,
    height = 9175040,
    mass = 100,
    flags = MF_SPAWNCEILING|MF_NOGRAVITY|MF_NOCLIP|MF_FLOAT|MF_SCENERY
}

states[S_SMETALFLYBY4] = {SPR_EGGM, B, 1, nil, 0, 0, S_NULL}

--EggmanDead
mobjinfo[MT_DEADEGG] = {
    --$Category Decoration
    --$Name Eggman Dead
    --$Sprite F019A0
    doomednum = 864,
    spawnstate = S_DEADEGG,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_NOCLIP|MF_SCENERY
}

states[S_DEADEGG] = {SPR_EMW5_EGGMANDEAD, A, 1, nil, 0, 0, S_DEADEGG}

--DeadTails
mobjinfo[MT_DEADTAILS] = {
    --$Category Decoration
    --$Name Dead Tails
    --$Sprite F006A0
    doomednum = 613,
    spawnstate = S_DEADTAILS,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_DEADTAILS] = {SPR_EMW5_DEADBODY, A, -1, nil, 0, 0, S_DEADTAILS}

--ReallyDeadTails
mobjinfo[MT_REALLYDTAILS] = {
    --$Category Decoration
    --$Name Really... Dead Tails
    --$Sprite F006B0
    doomednum = 614,
    spawnstate = S_RDTAILS,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_RDTAILS] = {SPR_EMW5_DEADBODY, B, -1, nil, 0, 0, S_RDTAILS}

--DeadHog
mobjinfo[MT_DEADHOG] = {
    --$Category Decoration
    --$Name Dead Hedgehog
    --$Sprite F006C0
    doomednum = 612,
    spawnstate = S_DEADHOG,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 1048576,
    height = 2621440,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_DEADHOG] = {SPR_EMW5_DEADBODY, C, -1, nil, 0, 0, S_DEADHOG}

--Dead GHZ Tree
mobjinfo[MT_DEADGHZTREE] = {
    --$Category Decoration
    --$Name Dead GHZ Tree
    --$Sprite F064A0
    doomednum = 1795,
    spawnstate = S_DEADGHZTREE,
    spawnhealth = 1,
    reactiontime = 32,
    painchance = 300,
    radius = 1572864,
    height = 2097152,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_DEADGHZTREE] = {SPR_EMW5_NGHZ_3, A, 1, nil, 0, 0, S_DEADGHZTREE}

--Dead GHZ Flower
mobjinfo[MT_DEADGHZFLOWER] = {
    --$Category Decoration
    --$Name Dead GHZ Flower
    --$Sprite F063A0
    doomednum = 1796,
    spawnstate = S_DEADGHZFLOWER,
    spawnhealth = 1,
    reactiontime = 32,
    painchance = 300,
    radius = 1572864,
    height = 2097152,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_DEADGHZFLOWER] = {SPR_EMW5_NGHZ_2, A, 1, nil, 0, 0, S_DEADGHZFLOWER}

--Dead GHZ Plant
mobjinfo[MT_DEADGHZPLANT] = {
    --$Category Decoration
    --$Name Dead GHZ Plant
    --$Sprite F062A0
    doomednum = 1797,
    spawnstate = S_DEADGHZPLANT,
    spawnhealth = 1,
    reactiontime = 32,
    painchance = 300,
    radius = 1572864,
    height = 2097152,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_DEADGHZPLANT] = {SPR_EMW5_NGHZ_1, A, 1, nil, 0, 0, S_DEADGHZPLANT}

--FlyBySounds
mobjinfo[MT_FLYBYSOUNDS] = {
    --$Category Misc. Invisible
    --$Name Fly By Sounds
    --$Sprite EGGMB1
    doomednum = 874,
    spawnstate = S_FLYBYSOUNDS1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2621440,
    height = 9175040,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_FLYBYSOUNDS1] = {SPR_NULL, A, 105, nil, 0, 0, S_FLYBYSOUNDS2}
states[S_FLYBYSOUNDS2] = {SPR_NULL, A, 1, A_RandomState, S_FLYBYSOUNDS3, S_FLYBYSOUNDS4, S_FLYBYSOUNDS2}
states[S_FLYBYSOUNDS3] = {SPR_NULL, A, 1, nil, 0, 0, S_FLYBYSOUNDS1}
states[S_FLYBYSOUNDS4] = {SPR_NULL, A, 1, A_RandomState, S_FLYBYSOUNDS5, S_FLYBYSOUNDS6, S_FLYBYSOUNDS4}
states[S_FLYBYSOUNDS5] = {SPR_NULL, A, 1, A_PlaySound, sfx_mtl04, 0, S_FLYBYSOUNDS1}
states[S_FLYBYSOUNDS6] = {SPR_NULL, A, 1, A_PlaySound, sfx_mtl05, 0, S_FLYBYSOUNDS1}

--ExplosionLight
mobjinfo[MT_EXPLOSIONLIGHT] = {
    --$Category Misc. Invisible
    --$Name Explosion Light
    --$Sprite NULLA0
    doomednum = 875,
    spawnstate = S_EXPLOSIONLIGHT1,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2621440,
    height = 9175040,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_EXPLOSIONLIGHT1] = {SPR_NULL, A, 140, nil, 0, 0, S_EXPLOSIONLIGHT2}
states[S_EXPLOSIONLIGHT2] = {SPR_NULL, A, 1, A_RandomState, S_EXPLOSIONLIGHT3, S_EXPLOSIONLIGHT1, S_EXPLOSIONLIGHT2}
states[S_EXPLOSIONLIGHT3] = {SPR_NULL, A, 10, A_PlaySound, sfx_emxpld, 0, S_EXPLOSIONLIGHT1}

--SceneryExplosion
mobjinfo[MT_SCENERYEXPLOSION] = {
    --$Category Decoration
    --$Name Scenery Explosion
    --$Sprite F010P0
    doomednum = 883,
    spawnstate = S_SCENERYEXPLOSION,
    spawnhealth = 1000,
    seestate = S_EMWROCKET_1670,
    seesound = sfx_emxpld,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_SCENERYEXPLOSION] = {SPR_NULL, A, 3, A_Look, 0, 0, S_SCENERYEXPLOSION}

mobjinfo[MT_SCENERYEXPLOSION2] = {
    --$Category Decoration
    --$Name Scenery Explosion 2
    --$Sprite F010P0
    doomednum = 2108,
    spawnstate = S_SCENERYEXPLOSION2,
    spawnhealth = 1000,
    seesound = sfx_emxpld,
    reactiontime = 8,
    radius = 1048576,
    height = 4621440,
    mass = 100,
    flags = MF_SCENERY|MF_NOCLIP
}

states[S_SCENERYEXPLOSION2] = {SPR_NULL, A, 1, A_PlaySeeSound, 0, 0, S_EMWROCKET_1670}

--DeadTree
mobjinfo[MT_DEADTREE] = {
    --$Category Decoration
    --$Name Dead Tree
    --$Sprite F017C0
    doomednum = 869,
    spawnstate = S_DEADTREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2293760,
    height = 6553600,
    mass = 100,
    flags = MF_SCENERY|MF_SOLID
}

states[S_DEADTREE] = {SPR_EMW5_BIGTREE, C, -1, nil, 0, 0, S_DEADTREE}

--DieingTree
mobjinfo[MT_DIEINGTREE] = {
    --$Category Decoration
    --$Name Dieing Tree
    --$Sprite F017D0
    doomednum = 870,
    spawnstate = S_DIEINGTREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2293760,
    height = 8519680,
    mass = 100,
    flags = MF_SCENERY|MF_SOLID
}

states[S_DIEINGTREE] = {SPR_EMW5_BIGTREE, D, -1, nil, 0, 0, S_DIEINGTREE}

--WarpedTree
mobjinfo[MT_WARPEDTREE] = {
    --$Category Decoration
    --$Name Warped Tree
    --$Sprite F017E0
    doomednum = 871,
    spawnstate = S_WARPEDTREE,
    spawnhealth = 1000,
    reactiontime = 8,
    radius = 2621440,
    height = 5898240,
    mass = 100,
    flags = MF_SCENERY|MF_SOLID
}

states[S_WARPEDTREE] = {SPR_EMW5_BIGTREE, E, -1, nil, 0, 0, S_WARPEDTREE}

--MetalTaunt
mobjinfo[MT_METALTAUNT] = {
    doomednum = 858,
    spawnstate = S_METALLOOK,
    spawnhealth = 1,
    seestate = S_METALSAYS,
    reactiontime = 32,
    painchance = 300,
    deathstate = S_METALSAYS,
    radius = 1572864,
    height = 2097152,
    mass = 100,
    flags = MF_NOCLIP|MF_SCENERY
}