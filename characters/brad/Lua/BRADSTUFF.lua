--Coded by GLide KS

-- Old spin trail

freeslot("MT_OLDTHOK", "S_OLDTHOK")

mobjinfo[MT_OLDTHOK] = {
        doomednum = -1,
        spawnstate = S_OLDTHOK,
        spawnhealth = 1,
        radius = 32*FU,
        height = 64*FU,
        flags = MF_NOBLOCKMAP|MF_NOCLIP|MF_NOCLIPHEIGHT|MF_NOGRAVITY|MF_SCENERY
}

states[S_OLDTHOK] = {SPR_THOK, TR_TRANS60|B, 8, nil, nil, nil, nil}

-- Reintroduce slingitem behavior (aka. ringslinger usable in all modes)
addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and pmo.skin == "emwbrad"
		--Don't play the transform animation, directly go super
		if pmo.state >= S_PLAY_SUPER_TRANS1 and pmo.state <= S_PLAY_SUPER_TRANS6
			pmo.state = S_PLAY_STND
		end
	end
end)

--add brad to the final demo hud list from emw5
if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwbrad"] = {
	name_graphic = "STBRADN",
	slingitem = MT_ROCKET
}