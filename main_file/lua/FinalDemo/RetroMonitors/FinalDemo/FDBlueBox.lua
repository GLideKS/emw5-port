-- Final Demo Blue Shield Monitor - Ported by MIDIMan
-- Use with FDBoxCommon.lua

--[[
The blue shield originally acted as a pity shield until 1.09, where it behaved
more like a water-protecting shield. Then, 2.0 replaced its behavior with that
of the force shield (without the passive ability).
]]

SafeFreeslot(
	"SPR_FBXB",
	"MT_FDBOX_BLUE",
	"MT_FDBOX_BLUE_ICON",
	"S_FDBOX_BLUE_IDLE",
	"S_FDBOX_BLUE_ICON1",
	"S_FDBOX_BLUE_ICON2"
)

local RM_FD_BLUESHIELD_VARIANTS = {
	[0] = SH_FORCE|1, -- 2.0
	[1] = SH_BUBBLEWRAP, -- 1.09-1.09.4
	[2] = SH_PITY, -- 1.08
	[3] = SH_PITY, -- 2K3-1.04
	[4] = SH_FORCE|1 -- 1.1
}

function A_FDBlueShield(actor, var1, var2)
	if not (actor and actor.valid) then return end
	A_GiveShield(actor, RM_FD_BLUESHIELD_VARIANTS[actor.rmFDAltOption or 0], var2)
end

addHook("MobjFuse", RM_FDMonitorFuseThink, MT_FDBOX_BLUE)
addHook("MapThingSpawn", function(mo, mthing)
	if not (mo and mo.valid and mthing and mthing.valid) then return end

	RM_FDMonitorTypeSpawn(mo, mthing)

	if mo and mo.valid then
		if ultimatemode and not G_IsSpecialStage(gamemap) then
			P_RemoveMobj(mo)
		end
	end
end, MT_FDBOX_BLUE)

mobjinfo[MT_FDBOX_BLUE] = {
	--$Name Final Demo Blue Shield
	--$Sprite FBXBA1
	--$Category Monitors
	--$Flags1Text Don't "Era-Swap" Shield
	--$Flags4Text Random (Strong)
	--$Flags8Text Random (Weak) / Random (Pre-2.0)
	--$ParameterText Behavior
	--$Arg1 Respawn behavior
	--$Arg1Type 11
	--$Arg1Enum monitorrespawn
	--$Arg2 Era-Swap Shield
	--$Arg2Type 11
	--$Arg2Enum yesno
	--$Arg3 Era
	--$Arg3Type 11
	--$Arg3Enum {0 = "2.0"; 1 = "1.09-1.09.4"; 2 = "1.08"; 3 = "2K3-1.04"; 4 = "1.1";}
	doomednum = 469,
	spawnstate = S_FDBOX_BLUE_IDLE,
	spawnhealth = 1,
	painstate = S_FDBOX_BLUE_IDLE,
	deathstate = S_FDBOX_EXPLOSION1,
	deathsound = sfx_pop,
	speed = 1,
	radius = 16*FRACUNIT,
	height = 32*FRACUNIT,
	damage = MT_FDBOX_BLUE_ICON,
	flags = MF_SOLID|MF_SHOOTABLE|MF_MONITOR|MF_GRENADEBOUNCE
}

states[S_FDBOX_BLUE_IDLE] =	{SPR_FBXB,	A,	2,	nil,	0,	0,	S_FDBOX_FLICKER}

mobjinfo[MT_FDBOX_BLUE_ICON] = {
	doomednum = -1,
	spawnstate = S_FDBOX_BLUE_ICON1,
	spawnhealth = 1,
	seesound = sfx_shield,
	speed = 4*FRACUNIT,	-- Originally 2*FRACUNIT; Changed to match pre-2.1's speed
	radius = 8*FRACUNIT,
	height = 14*FRACUNIT,
	damage = 62*FRACUNIT,
	flags = MF_NOBLOCKMAP|MF_NOCLIP|MF_SCENERY|MF_NOGRAVITY|MF_BOXICON
}

states[S_FDBOX_BLUE_ICON1] =	{SPR_FBXB,	B,	18,	nil,			0,	0,	S_FDBOX_BLUE_ICON2}
states[S_FDBOX_BLUE_ICON2] =	{SPR_FBXB,	B,	18,	A_FDBlueShield,	0,	0,	S_NULL}
