/*
Replica of Final Demo's S_SKIN slingitem functionality for EMW5.
Coded by: GLide KS
*/

--we gotta play this sound manually if we want to use custom slingitem's seesound
mobjinfo[MT_REDRING].seesound = sfx_none

--Shoot the character's slingitem if defined instead
addHook("PostThinkFrame", function()
if gamestate != GS_LEVEL then return end
for mo in mobjs.iterate() do
	if mo.type != MT_REDRING then continue end
	if mo.valid and mo.target then
		local has_slingitem = (finaldemo_character[mo.target.skin] and finaldemo_character[mo.target.skin].slingitem)
		if has_slingitem then
			P_SpawnPlayerMissile(mo.target, finaldemo_character[mo.target.skin].slingitem)
			P_RemoveMobj(mo)
		end
	end
end
end)

--Play the usual MT_REDRING shoot sound for non-slingitem characters
addHook("MobjSpawn", function(mo)
	if (mo.target and (finaldemo_character[mo.target.skin] and finaldemo_character[mo.target.skin].slingitem)) then return end
	S_StartSound(mo, sfx_thok)
end, MT_REDRING)

--Do ringslinger in non-ringslinger gamemodes for slingitem characters
addHook("PlayerThink", function(p)
	if not (p and p.mo and p.mo.valid and p.playerstate == PST_LIVE and p.rings) then return end
	if G_RingSlingerGametype() then return end
	local pmo = p.mo
	local cmd = p.cmd
	local has_slingitem = finaldemo_character[pmo.skin] and finaldemo_character[pmo.skin].slingitem
	if not has_slingitem then return end
	
	if not p.weapondelay
	and ((cmd.buttons & BT_ATTACK) and not (p.lastbuttons & BT_ATTACK))
	and has_slingitem then
		local slingitem = finaldemo_character[pmo.skin].slingitem
		P_SpawnPlayerMissile(pmo, slingitem)
		p.rings = $-1
		p.weapondelay = TICRATE/4
	end
end)