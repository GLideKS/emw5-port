/*
Replica of Final Demo's S_SKIN slingitem functionality for EMW5.
Coded by: GLide KS
*/

--we gotta set this up manually in the PreThinkFrame where the inputs goes
mobjinfo[MT_REDRING].seesound = sfx_none 

--Don't use red ring weapon for slingitem characters, already has it's own
addHook("PostThinkFrame", function()
if gamestate != GS_LEVEL then return end
for mo in mobjs.iterate() do
	if mo.valid and mo.type == MT_REDRING and mo.target
	and (finaldemo_character[mo.target.skin] and finaldemo_character[mo.target.skin].slingitem) then
		P_RemoveMobj(mo)
	end
end
end)

--Shooting function for slingitems
local function Shoot(p, slingitem)
	local pmo = p.mo
	if not (pmo and pmo.valid) then return end

	p.lookfortargets = P_LookForEnemies(p, false, true)
	
	if not finaldemo_character[pmo.skin].slingitem_notarget
		if p.lookfortargets then
			P_SpawnMissile(pmo, p.lookfortargets, slingitem)
		else
			P_SpawnPlayerMissile(pmo, slingitem)
		end
	else
		P_SpawnPlayerMissile(pmo, slingitem)
	end
end

--Main hook to handle slingitem shooting
addHook("PreThinkFrame", function()
if gamestate != GS_LEVEL then return end
for p in players.iterate() do
	if p.exiting then continue end
	local pmo = p.mo
	local cmd = p.cmd
	local has_slingitem = finaldemo_character[pmo.skin] and finaldemo_character[pmo.skin].slingitem
	if not (pmo and pmo.valid and p.playerstate == PST_LIVE) then continue end

	if p.rings != 0
	and not p.weapondelay then
		if (cmd.buttons & BT_ATTACK) and not (p.lastbuttons & BT_ATTACK) then
			if has_slingitem then
				local slingitem = finaldemo_character[pmo.skin].slingitem
				Shoot(p, slingitem)
				if not G_RingSlingerGametype() then
					p.rings = $-1
					p.weapondelay = TICRATE/4
				end
			elseif G_RingSlingerGametype() then
				S_StartSound(pmo, sfx_thok) -- play the shooting sound as usual
			end
		elseif (cmd.buttons & BT_FIRENORMAL) and not (p.lastbuttons & BT_FIRENORMAL)
		and G_RingSlingerGametype()
		and not has_slingitem then
			S_StartSound(pmo, sfx_thok) -- play the shooting sound as usual
		end
	end
end
end)