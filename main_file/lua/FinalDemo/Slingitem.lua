--Don't use rs weapons, we already have a propper one
addHook("MobjThinker", function(mo)
		if G_RingSlingerGametype() then
			if (mo and mo.valid and mo.target and finaldemo_character[mo.target.skin].slingitem) then
				P_RemoveMobj(mo)
				S_StopSound(mo)
			end
		end
end, MT_REDRING)

addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and finaldemo_character[pmo.skin].slingitem then
		p.slingitem = finaldemo_character[p.mo.skin].slingitem --define the missile mobj here
		if not p.fireholding then -- init fire holding checks to avoid obj spawn spam
			p.fireholding = false
		end
		
		--Cooldown for the sling item as intended
		if not p.slingcooldown then
			p.slingcooldown = 0
		end
		if p.slingcooldown > 0 then
			p.slingcooldown = $-1
		end
		
		if p.rings != 0 then
			p.slashtarget = P_LookForEnemies(p, false, true)
			if (p.slashtarget 
			and p.slashtarget.valid 
			and p.slashtarget.health) then
				p.slashangle = R_PointToAngle2(pmo.x, pmo.y, p.slashtarget.x, p.slashtarget.y)
			end
			
			if p.cmd.buttons & BT_ATTACK then
				if not p.fireholding then
					if p.slingcooldown == 0 then
						if p.slashtarget and p.slashtarget.valid then
							P_SpawnMissile(pmo, p.slashtarget, p.slingitem)
							if not G_RingSlingerGametype() then
								p.slingcooldown = TICRATE/4
							end
						else
							P_SpawnPlayerMissile(pmo, p.slingitem)
							if not G_RingSlingerGametype() then
								p.slingcooldown = TICRATE/4
							end
						end
						if not G_RingSlingerGametype() then
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