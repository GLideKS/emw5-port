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

--Don't use redring weapon, we already have a propper one
addHook("MobjThinker", function(mo)
		if G_RingSlingerGametype()
			if (mo and mo.valid and mo.target and mo.target.skin == "emwshade") 
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
	if pmo and pmo.valid and pmo.health and pmo.skin == "emwshade"
		p.slingitem = MT_SHADESLING --define the missile mobj here
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
			p.slashtarget = P_LookForEnemies(p, false, true)
			if (p.slashtarget 
			and p.slashtarget.valid 
			and p.slashtarget.health)
				p.slashangle = R_PointToAngle2(pmo.x, pmo.y, p.slashtarget.x, p.slashtarget.y)
			end
			
			if p.cmd.buttons & BT_ATTACK
				if not p.fireholding
					if p.slingcooldown == 0
						if p.slashtarget and p.slashtarget.valid
							P_SpawnMissile(pmo, p.slashtarget, p.slingitem)
							if not G_RingSlingerGametype()
								p.slingcooldown = TICRATE/4
							end
						else
							P_SpawnPlayerMissile(pmo, p.slingitem)
							if not G_RingSlingerGametype()
								p.slingcooldown = TICRATE/4
							end
						end
						if not G_RingSlingerGametype()
							p.rings = $-1
						end
					end
					p.fireholding = true
				else
					return
				end
			else
				p.fireholding = false
			end
		end
		
		--Shade doesn't climb in the original version. Still, I don't know how to avoid the cling
		p.climbing = 0
		
		--Don't play the transform animation, directly go super
		if pmo.state >= S_PLAY_SUPER_TRANS1 and pmo.state <= S_PLAY_SUPER_TRANS6
			pmo.state = S_PLAY_STND
		end
		
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