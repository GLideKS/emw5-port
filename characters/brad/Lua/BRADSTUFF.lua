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

-- Brad ringslinger item

freeslot("MT_BRADROCKET", "S_BRADROCKET", "sfx_brdlnc", "sfx_brdxpl", 
		 "S_EMWROCKET_1670", "S_EMWROCKET_1671", "S_EMWROCKET_1672",
		 "S_EMWROCKET_1673", "S_EMWROCKET_1674", "S_EMWROCKET_1675",
		 "S_EMWROCKET_1676", "S_EMWROCKET_1677", "S_EMWROCKET_1678",
		 "S_EMWROCKET_1679", "S_EMWROCKET_1680", "S_EMWROCKET_1681",
		 "S_EMWROCKET_1682", "S_EMWROCKET_1683", "S_EMWROCKET_1684",
		 "S_EMWROCKET_1685", "S_EMWROCKET_1686", "S_EMWROCKET_1687",
		 "S_EMWROCKET_1688", "SPR_F010", "SPR_BRDM")
		
sfxinfo[sfx_brdxpl] = {false, 34, SF_X4AWAYSOUND|SF_X8AWAYSOUND}

mobjinfo[MT_BRADROCKET] = {
        doomednum = -1,
        spawnstate = S_BRADROCKET,
        spawnhealth = 1000,
        seesound = sfx_brdlnc,
        reactiontime = 8,
        deathstate = S_EMWROCKET_1670,
        deathsound = sfx_brdxpl,
        speed = 39*FU,
        radius = 11*FU,
        height = 8*FU,
        mass = 100,
        damage = 20,
        flags = MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE
}

states[S_BRADROCKET] = {SPR_BRDM, A, 1, A_DualAction, S_ROCKET, S_CYBRAKDEMONMISSILE, S_BRADROCKET}
states[S_EMWROCKET_1670] = {SPR_F010, FF_FULLBRIGHT|A, 2, nil, nil, nil, S_EMWROCKET_1671}
states[S_EMWROCKET_1671] = {SPR_F010, FF_FULLBRIGHT|B, 2, nil, nil, nil, S_EMWROCKET_1672}
states[S_EMWROCKET_1672] = {SPR_F010, FF_FULLBRIGHT|C, 2, nil, nil, nil, S_EMWROCKET_1673}
states[S_EMWROCKET_1673] = {SPR_F010, FF_FULLBRIGHT|D, 2, nil, nil, nil, S_EMWROCKET_1674}
states[S_EMWROCKET_1674] = {SPR_F010, FF_FULLBRIGHT|E, 2, nil, nil, nil, S_EMWROCKET_1675}
states[S_EMWROCKET_1675] = {SPR_F010, FF_FULLBRIGHT|F, 2, nil, nil, nil, S_EMWROCKET_1676}
states[S_EMWROCKET_1676] = {SPR_F010, FF_FULLBRIGHT|G, 2, nil, nil, nil, S_EMWROCKET_1677}
states[S_EMWROCKET_1677] = {SPR_F010, FF_FULLBRIGHT|H, 2, nil, nil, nil, S_EMWROCKET_1678}
states[S_EMWROCKET_1678] = {SPR_F010, FF_FULLBRIGHT|I, 2, nil, nil, nil, S_EMWROCKET_1679}
states[S_EMWROCKET_1679] = {SPR_F010, FF_FULLBRIGHT|J, 2, nil, nil, nil, S_EMWROCKET_1680}
states[S_EMWROCKET_1680] = {SPR_F010, FF_FULLBRIGHT|K, 2, nil, nil, nil, S_EMWROCKET_1681}
states[S_EMWROCKET_1681] = {SPR_F010, FF_FULLBRIGHT|L, 2, nil, nil, nil, S_EMWROCKET_1682}
states[S_EMWROCKET_1682] = {SPR_F010, FF_FULLBRIGHT|M, 2, nil, nil, nil, S_EMWROCKET_1683}
states[S_EMWROCKET_1683] = {SPR_F010, FF_FULLBRIGHT|N, 2, nil, nil, nil, S_EMWROCKET_1684}
states[S_EMWROCKET_1684] = {SPR_F010, FF_FULLBRIGHT|O, 2, nil, nil, nil, S_EMWROCKET_1685}
states[S_EMWROCKET_1685] = {SPR_F010, FF_FULLBRIGHT|P, 2, nil, nil, nil, S_EMWROCKET_1686}
states[S_EMWROCKET_1686] = {SPR_F010, FF_FULLBRIGHT|Q, 2, nil, nil, nil, S_EMWROCKET_1687}
states[S_EMWROCKET_1687] = {SPR_F010, FF_FULLBRIGHT|R, 2, nil, nil, nil, S_EMWROCKET_1688}
states[S_EMWROCKET_1688] = {SPR_F010, FF_FULLBRIGHT|S, 2, nil, nil, nil, S_NULL}

--Don't use redring weapon, we already have a propper one
addHook("MobjThinker", function(mo)
		if G_RingSlingerGametype()
			if (mo and mo.valid and mo.target and mo.target.skin == "emwbrad") 
				mobjinfo[MT_REDRING].seesound = sfx_none
				mobjinfo[MT_REDRING].deathsound = sfx_none
				P_RemoveMobj(mo)
				S_StopSound(mo)
			else
				mobjinfo[MT_REDRING].seesound = sfx_thok
				mobjinfo[MT_REDRING].deathsound = sfx_itemup
			end
		end
end, MT_REDRING)

-- Reintroduce slingitem behavior (aka. ringslinger usable in all modes)
addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and pmo.skin == "emwbrad"
		p.slingitem = MT_BRADROCKET --define the missile mobj here
		if not p.fireholding -- init fire holding checks to avoid obj spawn spam
			p.fireholding = false
		end
		
		--Cooldown for the sling item as intended
		if not p.slingcooldown
			p.slingcooldown = 0
		end
		if p.slingcooldown > 0
			p.slingcooldown = $-1
		end
		
		if p.rings != 0
			if p.cmd.buttons & BT_ATTACK
				if not p.fireholding
					if p.slingcooldown == 0
    					P_SpawnPlayerMissile(pmo, p.slingitem)
						if not G_RingSlingerGametype()
							p.rings = $-1
						end
						p.slingcooldown = TICRATE/4
					end
					p.fireholding = true
				else
					return
				end
			else
				p.fireholding = false
			end
		end
		
		--Don't play the transform animation, directly go super
		if pmo.state >= S_PLAY_SUPER_TRANS1 and pmo.state <= S_PLAY_SUPER_TRANS6
			pmo.state = S_PLAY_STND
		end
	end
end)