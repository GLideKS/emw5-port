--Don't use red ring weapon.
addHook("PostThinkFrame", function()
for mo in mobjs.iterate() do
	if mo.valid and mo.type == MT_REDRING and mo.target
	and (finaldemo_character[mo.target.skin] and finaldemo_character[mo.target.skin].slingitem) then
		S_StopSoundByID(mo, sfx_thok)
		S_StopSoundByID(mo.target, sfx_thok)
		P_RemoveMobj(mo)
	end
end
end)

local function Shoot(p, slingitem)
	local pmo = p.mo
	if not (pmo and pmo.valid) then return end

	p.lookfortargets = P_LookForEnemies(p, false, true)
	
	if p.lookfortargets then
		P_SpawnMissile(pmo, p.lookfortargets, slingitem)
	else
		P_SpawnPlayerMissile(pmo, slingitem)
	end
end

addHook("PreThinkFrame", function()
for p in players.iterate() do
	local pmo = p.mo
	local cmd = p.cmd
	if not (pmo and pmo.valid and p.playerstate == PST_LIVE and (finaldemo_character[pmo.skin] and finaldemo_character[pmo.skin].slingitem)) then continue end
	local slingitem = finaldemo_character[pmo.skin].slingitem

	if p.rings != 0
	and not p.weapondelay
	and (cmd.buttons & BT_ATTACK) and not (p.lastbuttons & BT_ATTACK) then
		Shoot(p, slingitem)
		if not G_RingSlingerGametype() then
			p.rings = $-1
			p.weapondelay = TICRATE/4
		end
	end
end
end)