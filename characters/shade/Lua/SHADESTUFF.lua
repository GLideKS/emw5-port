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
		"S_SHADESLINGDEATH2",
		"SPR_SLSH",
		"sfx_fre014",
		"sfx_fre015")
		
sfxinfo[sfx_fre014] = {false, 50, SF_X4AWAYSOUND}
sfxinfo[sfx_fre015] = {false, 50, SF_X4AWAYSOUND}

mobjinfo[MT_SHADESLING] = {
        doomednum = -1,
        spawnstate = S_SHADESLING,
        spawnhealth = 1000,
        seesound = sfx_fre014,
        reactiontime = 0,
        deathstate = S_SHADESLINGDEATH1,
        deathsound = sfx_fre015,
        speed = 39*FU,
        radius = 60*FU,
        height = 15*FU,
        mass = 100,
        damage = 20,
        flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_SHADESLING] = {SPR_SLSH, A, 3, nil, 0, 0, S_NULL}
states[S_SHADESLINGDEATH1] = {SPR_SLSH, A, 3, nil, 0, 0, S_SHADESLINGDEATH2}
states[S_SHADESLINGDEATH2] = {SPR_NULL, A, 30, nil, 0, 0, S_NULL}

addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and pmo.skin == "emwshade"
		--Shade doesn't climb in the original version. Still, I don't know how to avoid the cling
		p.climbing = 0
		
		--In the original version of this character, spin trails dissapears when on super
		if p.powers[pw_super]
			p.revitem = 0
			p.spinitem = 0
		else
			p.revitem = MT_SHADESPIN
			p.spinitem = MT_SHADESPIN
		end
	end
end)

--add shade to the final demo hud list from emw5
if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwshade"] = {
	name_graphic = "STSHADE",
	slingitem = MT_SHADESLING,
	skiptransform = true
}