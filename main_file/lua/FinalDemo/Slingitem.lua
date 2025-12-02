--Don't use rs weapons, we already have a propper one
addHook("MobjThinker", function(mo)
	if mo.target
	and (finaldemo_character[mo.target.skin] and finaldemo_character[mo.target.skin].slingitem) then
		S_StopSound(mo)
		P_RemoveMobj(mo)
	end
end, MT_REDRING)

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