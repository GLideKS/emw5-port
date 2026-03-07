freeslot(
"MT_CLASSICMETAL",
"MT_METALIX",
"S_METALIX_STND1",
"S_METALIX_STND2",
"S_METALIX_PAIN",
"S_METALIX_ATK1",
"S_METALIX_ATK2",
"S_METALIX_ATK3",
"S_METALIX_ATK4",
"S_METALIX_PANIC1",
"S_METALIX_PANIC2",
"S_METALIX_DIE1",
"S_METALIX_DIE2",
"S_METALIX_DIE3",
"S_METALIX_DIE4",
"S_METALIX_DIE5",
"S_METALIX_DIE6",
"S_METALIX_DIE7",
"S_METALIX_DIE8",
"S_METALIX_DIE9",
"S_METALIX_DIE10",
"S_METALIX_DIE11",
"S_METALIX_DIE12",
"S_METALIX_DIE13",
"S_METALIX_DIE14",
"S_METALIX_FLEE1",
"S_METALIX_FLEE2",
"S_METALIX_FLEE3",
"S_METALIX_FLEE4",
"S_METALIX_1420",
"S_METALIX_1421",
"S_METALIX_1422",
"S_METALIX_1423",
"S_METALIX_1424",
"S_METALIX_1425",
"S_METALIX_1427",
"S_METALIX_1428",
"S_METALIX_1429",
"S_METALIX_1430",
"S_CLASSICMTLX_STND",
"S_CLASSICMTLX_MELEEATK1",
"S_CLASSICMTLX_MELEEATK2",
"S_CLASSICMTLX_MISSILEATK1",
"S_CLASSICMTLX_MISSILEATK2",
"S_CLASSICMTLX_RAISE1783",
"S_CLASSICMTLX_RAISE1784",
"S_CLASSICMTLX_PAIN1785"
)

--Metal Sonic (Hell)
/*
Note: Metal in final demo doesn't have MF_NOGRAVITY
and floats around the map. 

But in srb2 v2.2.15 for some reason doesn't happen
the same way despite having MF_FLOAT. 

Using MF_NOGRAVITY makes metal to float around the map.
*/

mobjinfo[MT_METALIX] = {
    --$Category Bosses
    --$Name Metallix
    --$Sprite EGGMB1
    doomednum = 210,
    spawnstate = S_METALIX_STND1,
    spawnhealth = 15,
    seestate = S_METALIX_STND1,
    reactiontime = 8,
    attacksound = sfx_zoom,
    painstate = S_METALIX_PAIN,
    painchance = MT_OLDTHOK,
    painsound = sfx_dmpain,
    meleestate = S_METALIX_ATK3,
    missilestate = S_METALIX_ATK1,
    deathstate = S_METALIX_DIE1,
    deathsound = sfx_cybdth,
    xdeathstate = S_METALIX_FLEE1,
    speed = 38,
    radius = 24*FU,
    height = 76*FU,
    mass = 0,
    damage = 4,
    activesound = sfx_mtl01,
    raisestate = S_METALIX_PANIC1,
    flags = MF_SPECIAL|MF_SHOOTABLE|MF_BOSS|MF_SLIDEME|MF_NOGRAVITY|MF_FLOAT|MF_BOUNCE
}

states[S_METALIX_STND1]  = {SPR_EGGM, B|FF_FULLBRIGHT, 1, nil, 0, 0, S_METALIX_STND1}
states[S_METALIX_ATK1]   = {SPR_EGGM, B|FF_FULLBRIGHT, 1, A_PlaySound, sfx_mtl01, 0, S_METALIX_ATK2}
states[S_METALIX_ATK2]   = {SPR_EGGM, D|FF_FULLBRIGHT, 1, A_FireShot, MT_JETTBULLET, 4, S_METALIX_STND1}
states[S_METALIX_ATK3]   = {SPR_EGGM, D|FF_FULLBRIGHT, 1, A_FireShot, MT_JETTBULLET, 4, S_METALIX_ATK4}
states[S_METALIX_ATK4]   = {SPR_EGGM, B|FF_FULLBRIGHT, 1, A_PlaySound, sfx_mtl01, 0, S_METALIX_STND1}
states[S_METALIX_PANIC1] = {SPR_EGGM, D|FF_FULLBRIGHT, 5, A_SkullAttack, 2, 0, S_METALIX_PANIC2}
states[S_METALIX_PANIC2] = {SPR_EGGM, D|FF_FULLBRIGHT, 6, A_SkullAttack, 2, 0, S_METALIX_1420}
states[S_METALIX_PAIN]   = {SPR_EGGM, E|FF_FULLBRIGHT, 20, A_Pain, 0, 0, S_METALIX_1427}

-- Death
states[S_METALIX_DIE1]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_Fall, 0, 0, S_METALIX_DIE2}
states[S_METALIX_DIE2]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE3}
states[S_METALIX_DIE3]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE4}
states[S_METALIX_DIE4]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE5}
states[S_METALIX_DIE5]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE6}
states[S_METALIX_DIE6]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE7}
states[S_METALIX_DIE7]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE8}
states[S_METALIX_DIE8]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE9}
states[S_METALIX_DIE9]   = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE10}
states[S_METALIX_DIE10]  = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE11}
states[S_METALIX_DIE11]  = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE12}
states[S_METALIX_DIE12]  = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE13}
states[S_METALIX_DIE13]  = {SPR_EGGM, E|FF_FULLBRIGHT, 4, A_BossScream, 0, 0, S_METALIX_DIE14}
states[S_METALIX_DIE14]  = {SPR_EGGM, E|FF_FULLBRIGHT, -1, A_BossDeath, 0, 0, S_NULL}

--Flee and shot states
states[S_METALIX_FLEE1]  = {SPR_EGGM, F|FF_FULLBRIGHT, 5, nil, 0, 0, S_METALIX_FLEE2}
states[S_METALIX_FLEE2]  = {SPR_EGGM, F|FF_FULLBRIGHT, 5, nil, 0, 0, S_METALIX_FLEE1}
states[S_METALIX_1420]   = {SPR_EGGM, D|FF_FULLBRIGHT, 6, A_SkullAttack, 2, 0, S_METALIX_1423}
states[S_METALIX_1421]   = {SPR_EGGM, G|FF_FULLBRIGHT, 5, A_FireShot, MT_JETTBULLET, 4, S_METALIX_PANIC1}
states[S_METALIX_1422]   = {SPR_EGGM, C|FF_FULLBRIGHT, 1, A_PlaySound, sfx_mtl03, 0, S_METALIX_1425}
states[S_METALIX_1423]   = {SPR_EGGM, D|FF_FULLBRIGHT, 1, A_RandomState, S_METALIX_1421, S_METALIX_1422, S_METALIX_STND1}
states[S_METALIX_1424]   = {SPR_EGGM, B|FF_FULLBRIGHT, 20, A_MoveRelative, 0, 100, S_METALIX_PANIC1}
states[S_METALIX_1425]   = {SPR_EGGM, B|FF_FULLBRIGHT, 1, A_FaceTarget, 0, 0, S_METALIX_1424}
states[S_METALIX_1427]   = {SPR_EGGM, B|FF_FULLBRIGHT, 1, A_SetObjectFlags, MF_SPECIAL|MF_SHOOTABLE, 1, S_METALIX_1428}
states[S_METALIX_1428]   = {SPR_EGGM, D|FF_FULLBRIGHT, 10, A_FaceTarget, 0, 0, S_METALIX_1429}
states[S_METALIX_1429]   = {SPR_EGGM, D|FF_FULLBRIGHT, 1, A_FireShot, MT_JETTBULLET, 0, S_METALIX_1430}
states[S_METALIX_1430]   = {SPR_EGGM, C|FF_FULLBRIGHT, 1, A_SetObjectFlags, MF_SPECIAL|MF_SHOOTABLE, 2, S_METALIX_STND1}

--Classic Metal

mobjinfo[MT_CLASSICMETAL] = {
    --$Category Bosses
    --$Name Classic Metallix
    --$Sprite EGGMC1
    doomednum = 696,
    spawnstate = S_CLASSICMTLX_STND,
    spawnhealth = 25,
    seesound = 0,
    reactiontime = 8,
    attacksound = 0,
    painstate = S_CLASSICMTLX_PAIN1785,
    painchance = MT_OLDTHOK,
    painsound = sfx_dmpain,
    meleestate = S_CLASSICMTLX_MELEEATK1,
    missilestate = S_CLASSICMTLX_MISSILEATK1,
    deathstate = S_METALIX_DIE1,
    deathsound = sfx_cybdth,
    xdeathstate = S_METALIX_FLEE1,
    speed = 32,
    radius = 46*FRACUNIT,
    height = 100*FRACUNIT,
    mass = 0,
    damage = 2,
    activesound = sfx_fre001,
    raisestate = S_CLASSICMTLX_RAISE1783,
    flags = MF_SPECIAL|MF_SHOOTABLE|MF_BOSS|MF_SPAWNCEILING|MF_SLIDEME|MF_BOUNCE|MF_NOCLIPTHING|MF_NOGRAVITY
}

states[S_CLASSICMTLX_STND]       = {SPR_EGGM, FF_FULLBRIGHT|B, 20, nil, 0, 0, S_CLASSICMTLX_STND}
states[S_CLASSICMTLX_MELEEATK1]  = {SPR_EGGM, FF_FULLBRIGHT|B, 2, A_SkullAttack, 0, 0, S_CLASSICMTLX_MELEEATK2}
states[S_CLASSICMTLX_MELEEATK2]  = {SPR_EGGM, FF_FULLBRIGHT|B, 1, A_FireShot, MT_JETTBULLET, 4, S_CLASSICMTLX_STND}
states[S_CLASSICMTLX_MISSILEATK1] = {SPR_EGGM, FF_FULLBRIGHT|B, 1, A_SkullAttack, 0, 0, S_CLASSICMTLX_MISSILEATK2}
states[S_CLASSICMTLX_MISSILEATK2] = {SPR_EGGM, FF_FULLBRIGHT|B, 1, A_FireShot, MT_JETTBULLET, 4, S_CLASSICMTLX_STND}
states[S_CLASSICMTLX_RAISE1783]  = {SPR_EGGM, FF_FULLBRIGHT|B, 1, A_SkullAttack, 0, 0, S_CLASSICMTLX_RAISE1784}
states[S_CLASSICMTLX_RAISE1784]  = {SPR_EGGM, FF_FULLBRIGHT|B, 1, A_FireShot, MT_JETTBULLET, 4, S_CLASSICMTLX_RAISE1783}
states[S_CLASSICMTLX_PAIN1785]   = {SPR_EGGM, FF_FULLBRIGHT|B, 26, A_Pain, 0, 0, S_CLASSICMTLX_STND}

--Workaround to collide with metals despite having MF_NOCLIPTHING like in final demo

freeslot("MT_DUMMYCOLLIDE")
mobjinfo[MT_DUMMYCOLLIDE] = {
    spawnstate = S_INVISIBLE,
    deathstate = S_NULL,
    radius = 1*FU,
    height = 1*FU,
    flags = MF_NOGRAVITY|MF_FLOAT
}

addHook("MobjSpawn", function(mo)
    local dummycollide = P_SpawnMobjFromMobj(mo, 0,0,0, MT_DUMMYCOLLIDE)
    dummycollide.target = mo
end, MT_CLASSICMETAL)

addHook("MobjThinker", function(mo)
    if not (mo and mo.valid) then return end
    local t = mo.target
    if t then 
        P_MoveOrigin(mo, t.x, t.y, t.z)
        if mo.scale != t.scale then mo.scale = t.scale end
        if mo.radius != t.radius then mo.radius = t.radius end
    else 
        P_RemoveMobj(mo)
    end
end, MT_DUMMYCOLLIDE)

local function ZCollide(mo1,mo2)
	if (mo1.z > mo2.z + mo2.height) then return false; end
	if (mo2.z > mo1.z + mo1.height) then return false; end
	return true
end

local function dummycollide(mo, pmo)
    if not ((mo and mo.valid) and (pmo and pmo.valid)) then return end
    if not mo.target then return end
    if not ZCollide(mo, pmo) then return end
    if not (
        (pmo.player and P_PlayerCanDamage(pmo.player, mo))
        or (pmo.flags & MF_MISSILE)
    ) then return end
    if (mo.target.flags2 & MF2_FRET) then return end

    local angle = R_PointToAngle2(mo.x, mo.y, pmo.x, pmo.y)
    if pmo.player then
        P_InstaThrust(pmo, pmo.angle+angle, pmo.player.speed)
        P_SetObjectMomZ(pmo, -pmo.momz)
    end
    P_DamageMobj(mo.target, pmo, pmo.target or pmo)
    return true
end
addHook("MobjCollide", dummycollide, MT_DUMMYCOLLIDE)
addHook("MobjMoveCollide", dummycollide, MT_DUMMYCOLLIDE)