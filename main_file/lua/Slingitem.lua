--Don't use rs weapons, we already have a propper one
addHook("MobjThinker", function(mo)
		if G_RingSlingerGametype()
			if (mo and mo.valid and mo.target and finaldemo_character[mo.target.skin].slingitem)
				P_RemoveMobj(mo)
				S_StopSound(mo)
			end
		end
end, MT_REDRING)

addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and finaldemo_character[pmo.skin].slingitem
		p.slingitem = finaldemo_character[p.mo.skin].slingitem --define the missile mobj here
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
	end
end)