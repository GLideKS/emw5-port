--Coded by GLide KS

--add brad to the final demo hud list from emw5
if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwbrad"] = "STBRADN"

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
		p.slingitem = MT_ROCKET --define the missile mobj here
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