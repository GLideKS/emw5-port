--Coded by GLide KS

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

-- Shade ringslinger item

freeslot("MT_SHADESLING",
		"S_SHADESLING",
		"S_SHADESLINGDEATH1",
		"S_SHADESLINGDEATH2"
)

mobjinfo[MT_SHADESLING] = {
        doomednum = -1,
        spawnstate = S_SHADESLING,
        spawnhealth = 1000,
        seesound = sfx_shslsh,
        reactiontime = 0,
        deathstate = S_SHADESLINGDEATH1,
        deathsound = sfx_slshit,
        speed = 39*FU,
        radius = 60*FU,
        height = 15*FU,
        mass = 100,
        damage = 20,
        flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_SHADESLING] = {SPR_EMW5_SHADESLASH, A, 3, nil, 0, 0, S_NULL}
states[S_SHADESLINGDEATH1] = {SPR_EMW5_SHADESLASH, A, 3, nil, 0, 0, S_SHADESLINGDEATH2}
states[S_SHADESLINGDEATH2] = {SPR_NULL, A, 30, nil, 0, 0, S_NULL}

addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and pmo.skin == "emwshade" then
		
		--In the original version of this character, spin trails dissapears when on super
		if p.powers[pw_super] then
			p.revitem = 0
			p.spinitem = 0
		else
			p.revitem = MT_SHADESPIN
			p.spinitem = MT_SHADESPIN
		end
		
		if p.playerstate == PST_DEAD then return end
		
		--Do rolling after a glide
		if (p.pflags & PF_GLIDING) and not (p.cmd.buttons & BT_JUMP)
		and not P_IsObjectOnGround(p.mo) then
			P_ResetPlayer(p)
			p.mo.state = S_PLAY_ROLL
			p.pflags = ($ | PF_JUMPED)
		end
	end
end)

--add shade to the final demo hud list from emw5
if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwshade"] = {
	name_graphic = "STSHADE",
	slingitem = MT_SHADESLING,
	ringslinger = true,
	skiptransform = true,
	oldglide = true
}

--Wall checks from Nick WolfFang, prevents Shade to climb
--Can't find a way to slide on walls still
local function WallBumping(mo,mobj,line)
	if mo and mo.valid
	and mo.skin == "emwshade"
	and (mo.player.pflags & PF_GLIDING)
	and not (mobj and mobj.valid and mobj.flags & (MF_MONITOR|MF_ENEMY|MF_BOSS))
	and line and line.valid then

		if NK_GlideClimbTraverse(mo,line) 
		and not (line and line.backsector
		and line.backsector.ceilingpic == "F_SKY1"
		and line.frontsector
		and line.frontsector.ceilingpic == "F_SKY1"
		and (mo.z >= line.frontsector.ceilingheight
		or mo.z >= line.backsector.ceilingheight)) then
			return true
		end
	end
end
addHook("MobjMoveBlocked", WallBumping, MT_PLAYER)