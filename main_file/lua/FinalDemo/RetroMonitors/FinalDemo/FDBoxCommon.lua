-- Final Demo Monitor Commonalities - Ported by MIDIMan
-- Use with the other Final Demo Monitor scripts
-- It is important to note that, even though these are labelled as "Final Demo" boxes, 
-- some of them come from the 2.0 era

--[[
A few notes regarding multiplayer monitors between versions:
1.01-1.04 - Monitors could be switched on or off (Eggman was an option)
1.08-2.0 - Monitors could be set between off, low, medium, and high (Eggman was not an option)
2.1-present - Monitors could be set as percentages

In versions 1.08-1.09.4, players can cause a "segment violation" by setting all 
the monitor toggles to "High", starting a race with "Random" monitors only, and 
breaking a monitor. This is caused by the array that stores the random chances 
being too small. This bug has not been replicated for obvious reasons.
]]

freeslot(
	"SPR_FBOX",
	"S_FDBOX_FLICKER",
	"S_FDBOX_EXPLOSION1",
	"S_FDBOX_EXPLOSION2"
)

-- Change the current mo type to something else
local function RM_ChangeMobj(mo, newtype)
	if not (mo and mo.valid) then return end
	if not newtype then return end

	-- local fdAltOption = mo.rmFDAltOption

	mo.type = newtype

	mo.radius = FixedMul(mo.scale, mo.info.radius)
	mo.height = FixedMul(mo.scale, mo.info.height)
	mo.flags = mo.info.flags

	mo.health = mo.info.spawnhealth

	mo.reactiontime = mo.info.reactiontime

	mo.state = mo.info.spawnstate
end

---@param mo mobj_t
local function RM_DetermineShieldVariants(mo)
	-- Use the 2.0 variants by default
	local shields = {
		monitors = {
			MT_FDBOX_WHITE,
			MT_FDBOX_GREEN,
			MT_FDBOX_BLUE,
			MT_FDBOX_RED
		},
		icons = {
			MT_FDBOX_WHITE_ICON,
			MT_FDBOX_GREEN_ICON,
			MT_FDBOX_BLUE_ICON,
			MT_FDBOX_RED_ICON
		}
	}
	if not (mo and mo.valid) then return shields end -- Just use the 2.0 variants 

	-- [1] = jumpshield
	-- [2] = watershield
	-- [3] = fireforceshield
	-- [4] = bombshield

	local altoption = mo.rmFDAltOption or 0

	if altoption > 0 and altoption < 4 then
		if altoption >= 2 then -- 2K3-1.08 shields
			shields.monitors[1] = MT_FDBOX_BLUE
			shields.icons[1] = MT_FDBOX_BLUE_ICON
			shields.monitors[2] = MT_FDBOX_GREEN
			shields.icons[2] = MT_FDBOX_GREEN_ICON
		else -- 1.09-1.09.4 shields
			shields.monitors[1] = MT_FDBOX_WHITE
			shields.icons[1] = MT_FDBOX_WHITE_ICON
			shields.monitors[2] = MT_FDBOX_BLUE
			shields.icons[2] = MT_FDBOX_BLUE_ICON
		end
		shields.monitors[3] = MT_FDBOX_RED
		shields.icons[3] = MT_FDBOX_RED_ICON
		shields.monitors[4] = MT_FDBOX_BLACK
		shields.icons[4] = MT_FDBOX_BLACK_ICON
	else -- 2.0 shields
		if altoption == 4 then
			shields.monitors[4] = MT_FDBOX_BLACK
			shields.icons[4] = MT_FDBOX_BLACK_ICON
		end
	end

	return shields
end

-- Change the monitor's type based on the flags given, the current gametype and its settings
rawset(_G, "RM_FDMonitorTypeSpawn", function(mo, mthing)
	if not (mo and mo.valid and mthing and mthing.valid) then return end

	if udmf then
		-- 1 = 1.09-1.09.4 behavior
		-- 2 = 1.08 behavior
		-- 3 = 2K3-1.04 behavior
		-- 4 = 1.1 (IRC Match beta) behavior
		mo.rmFDAltOption = max(min(mthing.args[3], 4), 0)

		if not mthing.args[2] then
			if mo.rmFDAltOption > 1 then
				if mo.rmFDAltOption < 4 then
					mo.rmShieldEra = "FINALDEMO"
				else
					mo.rmShieldEra = "1.1"
				end
			elseif mo.rmFDAltOption == 1 then
				mo.rmShieldEra = "LATEFINALDEMO"
			else
				mo.rmShieldEra = "2.0"
			end
		end

		if mthing.args[1] and mo.info.speed ~= 0 then
			if mthing.args[1] == 1 then
				mo.flags2 = $|MF2_AMBUSH
			elseif mthing.args[1] == 2 then
				mo.flags2 = $|MF2_STRONGBOX
			end
		end
	else
		-- 1 = 1.09-1.09.4 behavior
		-- 2 = 1.08 behavior
		-- 3 = 2K3-1.04 behavior
		-- 4 = 1.1 (IRC Match beta) behavior
		mo.rmFDAltOption = max(min(mthing.extrainfo, 4), 0)

		if not (mthing.options & MTF_EXTRA) then
			if mo.rmFDAltOption > 1 then
				if mo.rmFDAltOption < 4 then
					mo.rmShieldEra = "FINALDEMO"
				else
					mo.rmShieldEra = "1.1"
				end
			elseif mo.rmFDAltOption == 1 then
				mo.rmShieldEra = "LATEFINALDEMO"
			else
				mo.rmShieldEra = "2.0"
			end
		end
	end

	local altoption = mo.rmFDAltOption

-- 	if (mthing.options & MTF_OBJECTSPECIAL) -- 2.0 behavior
-- 		mo.flags2 = $|MF2_STRONGBOX
-- 	end

-- 	if (mthing.options & MTF_AMBUSH)
-- 		mo.flags2 = $|MF2_AMBUSH
-- 	end

	-- Set powerup boxes to user settings for race and competition.
	-- Note: Competition mode is based off of the "Classic Race" mode from the 
	-- pre-2.1 eras of SRB2
	-- TODO: Consider using G_CoopGametype and GTR_RACE
	if gametype == GT_RACE or gametype == GT_COMPETITION then
		local compboxes = CV_FindVar("competitionboxes").value
		if compboxes then -- not Normal
			if compboxes == 1 then -- Random
				RM_ChangeMobj(mo, MT_FDBOX_QUESTION)
			elseif compboxes == 2 then -- Teleports (Doesn't work in 2.2)
				RM_ChangeMobj(mo, MT_FDBOX_MIXUP)
			elseif compboxes == 3 then -- None
				P_RemoveMobj(mo) -- Don't spawn!
				return
			end
		elseif altoption > 0 then -- Normal, 2K3-1.1 removed monitors if they were turned off in the settings
			local shieldMonitors = RM_DetermineShieldVariants(mo)
			if mo.type == shieldMonitors[3] and not CV_FindVar("tv_forceshield").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_YELLOW and not CV_FindVar("tv_ringshield").value then P_RemoveMobj(mo); return end
			if mo.type == shieldMonitors[2] and not CV_FindVar("tv_watershield").value then P_RemoveMobj(mo); return end
			if mo.type == shieldMonitors[4] and not CV_FindVar("tv_bombshield").value then P_RemoveMobj(mo); return end
			if mo.type == shieldMonitors[1] and not CV_FindVar("tv_jumpshield").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_SHOES and not CV_FindVar("tv_supersneaker").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_1UP then P_RemoveMobj(mo); return end -- no meaning in CTF/tag/chaos/match -1.09.4 code
			if mo.type == MT_FDBOX_RING and not CV_FindVar("tv_superring").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_SRING and not CV_FindVar("tv_recycler").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_INVIN and not CV_FindVar("tv_invincibility").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_EGGMAN and not CV_FindVar("tv_eggman").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_MIXUP and not CV_FindVar("tv_teleporter").value then P_RemoveMobj(mo); return end
			-- The mystery monitor doesn't have its own dedicated console variable, so reuse the 1-up's
			if mo.type == MT_FDBOX_QUESTION and not CV_FindVar("tv_1up").value then P_RemoveMobj(mo); return end
		end
	-- Set powerup boxes to user settings for other netplay modes
	elseif gametype ~= GT_COOP then
		local matchboxes = CV_FindVar("matchboxes").value
		if matchboxes then -- not Normal
			if matchboxes == 1 then -- Random
				RM_ChangeMobj(mo, MT_FDBOX_QUESTION)
			elseif matchboxes == 2 then -- Non-Random
				if mo.type == MT_FDBOX_QUESTION then
					P_RemoveMobj(mo) -- don't spawn in Non-Random
					return
				end

				if altoption > 0 then
					local shieldMonitors = RM_DetermineShieldVariants(mo)
					if mo.type == shieldMonitors[3] and not CV_FindVar("tv_forceshield").value then P_RemoveMobj(mo); return end
					if mo.type == MT_FDBOX_YELLOW and not CV_FindVar("tv_ringshield").value then P_RemoveMobj(mo); return end
					if mo.type == shieldMonitors[2] and not CV_FindVar("tv_watershield").value then P_RemoveMobj(mo); return end
					if mo.type == shieldMonitors[4] and not CV_FindVar("tv_bombshield").value then P_RemoveMobj(mo); return end
					if mo.type == shieldMonitors[1] and not CV_FindVar("tv_jumpshield").value then P_RemoveMobj(mo); return end
					if mo.type == MT_FDBOX_SHOES and not CV_FindVar("tv_supersneaker").value then P_RemoveMobj(mo); return end
					if mo.type == MT_FDBOX_1UP then P_RemoveMobj(mo); return end -- no meaning in CTF/tag/chaos/match -1.09.4 code
					if mo.type == MT_FDBOX_RING and not CV_FindVar("tv_superring").value then P_RemoveMobj(mo); return end
					if mo.type == MT_FDBOX_SRING and not CV_FindVar("tv_recycler").value then P_RemoveMobj(mo); return end
					if mo.type == MT_FDBOX_INVIN and not CV_FindVar("tv_invincibility").value then P_RemoveMobj(mo); return end
					if mo.type == MT_FDBOX_EGGMAN and not CV_FindVar("tv_eggman").value then P_RemoveMobj(mo); return end
					if mo.type == MT_FDBOX_MIXUP and not CV_FindVar("tv_teleporter").value then P_RemoveMobj(mo); return end
				end

				mthing.options = $ & ~(MTF_AMBUSH|MTF_OBJECTSPECIAL) -- No random respawning!
-- 				mthing.args[1] = 0 -- Doesn't work
				mo.flags2 = $ & ~(MF2_AMBUSH|MF2_STRONGBOX)
			elseif matchboxes == 3 then -- Don't spawn
				P_RemoveMobj(mo)
				return
			end
		elseif altoption > 0 then -- Normal, 2K3-1.1 removed monitors if they were turned off in the settings
			local shieldMonitors = RM_DetermineShieldVariants(mo)
			if mo.type == shieldMonitors[3] and not CV_FindVar("tv_forceshield").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_YELLOW and not CV_FindVar("tv_ringshield").value then P_RemoveMobj(mo); return end
			if mo.type == shieldMonitors[2] and not CV_FindVar("tv_watershield").value then P_RemoveMobj(mo); return end
			if mo.type == shieldMonitors[4] and not CV_FindVar("tv_bombshield").value then P_RemoveMobj(mo); return end
			if mo.type == shieldMonitors[1] and not CV_FindVar("tv_jumpshield").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_SHOES and not CV_FindVar("tv_supersneaker").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_1UP then P_RemoveMobj(mo); return end -- no meaning in CTF/tag/chaos/match -1.09.4 code
			if mo.type == MT_FDBOX_RING and not CV_FindVar("tv_superring").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_SRING and not CV_FindVar("tv_recycler").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_INVIN and not CV_FindVar("tv_invincibility").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_EGGMAN and not CV_FindVar("tv_eggman").value then P_RemoveMobj(mo); return end
			if mo.type == MT_FDBOX_MIXUP and not CV_FindVar("tv_teleporter").value then P_RemoveMobj(mo); return end
		end
	end
end)

-- Handle how Final Demo monitors respawn in Multiplayer gametypes (CHANGE THIS)
rawset(_G, "RM_FDMonitorFuseThink", function(mo)
	if not (mo and mo.valid) then return end

	local newmobj, boxtype

	if ((mo.flags2 & (MF2_AMBUSH|MF2_STRONGBOX)) and mo.info.damage ~= MT_UNKNOWN) then
		local spawnchance = {}
		local numchoices, i = 0, 0
		local altoption = mo.rmFDAltOption

		if altoption == nil then
			altoption = -1
		end

		local function SETMONITORCHANCES(boxtype2, strongboxamt, weakboxamt)
			local boxamt = 0 -- Off

			if (mo.flags2 & MF2_STRONGBOX) and altoption < 1 then
				boxamt = strongboxamt
			else
				if altoption == 3 then -- Pre-1.08 behavior
					if weakboxamt then
						boxamt = 1
					end
				elseif altoption > 0 then
					if weakboxamt > 6 then -- High
						boxamt = 3
					elseif weakboxamt > 3 then -- Medium
						boxamt = 2
					elseif weakboxamt > 0 then -- Low
						boxamt = 1
					end
				else
					boxamt = weakboxamt
				end
			end

			if not boxamt then
				boxamt = -1
			end

			if boxamt > 0 then -- Prevent a possible endless loop
				for i = boxamt, 1, -1 do
					spawnchance[numchoices+1] = boxtype2
					numchoices = $+1
				end
			end
		end

		local shields = RM_DetermineShieldVariants(mo).monitors

		if altoption > 0 then
			SETMONITORCHANCES(MT_FDBOX_RING,		0,	CV_FindVar("tv_superring").value)
			if altoption > 0 and altoption < 4 then
				SETMONITORCHANCES(MT_FDBOX_SRING,	0,	CV_FindVar("tv_recycler").value)
			end
			SETMONITORCHANCES(MT_FDBOX_SHOES,		0,	CV_FindVar("tv_supersneaker").value)
			SETMONITORCHANCES(MT_FDBOX_INVIN,		0,	CV_FindVar("tv_invincibility").value)
			SETMONITORCHANCES(shields[1],			0,	CV_FindVar("tv_jumpshield").value)
			SETMONITORCHANCES(shields[2],			0,	CV_FindVar("tv_watershield").value)
			SETMONITORCHANCES(MT_FDBOX_YELLOW,		0,	CV_FindVar("tv_ringshield").value)
			SETMONITORCHANCES(shields[3],			0,	CV_FindVar("tv_forceshield").value)
			SETMONITORCHANCES(shields[4],			0,	CV_FindVar("tv_bombshield").value)
			if gametype == GT_RACE then -- no meaning in CTF/tag/chaos/match -1.09.4 code
				SETMONITORCHANCES(MT_FDBOX_1UP,		0,	CV_FindVar("tv_1up").value)
			end
			if altoption == 3 then -- Pre-1.08 behavior
				SETMONITORCHANCES(MT_FDBOX_EGGMAN,	0,	CV_FindVar("tv_eggman").value)
			end
			SETMONITORCHANCES(MT_FDBOX_MIXUP,		0,	CV_FindVar("tv_teleporter").value)
		else
			--			Type				  SRM  WRM
			SETMONITORCHANCES(MT_FDBOX_RING,	0,	16)
			SETMONITORCHANCES(MT_FDBOX_SHOES,	0,	14)
			SETMONITORCHANCES(MT_FDBOX_INVIN,	6,	 0)
			SETMONITORCHANCES(shields[1],		12,	12)
			SETMONITORCHANCES(shields[2],		12,	12)
			SETMONITORCHANCES(MT_FDBOX_YELLOW,	8,	 2)
			SETMONITORCHANCES(shields[3],		12,	 4)
			SETMONITORCHANCES(shields[4],		8,	 0)
			SETMONITORCHANCES(MT_FDBOX_MIXUP,	0,	 2)
			SETMONITORCHANCES(MT_FDBOX_RECYCLE,	0,	 2)
			SETMONITORCHANCES(MT_FDBOX_1UP,		6,	 0)
			-- =======================================
			--			Total				   64 	64
		end

		if numchoices == 0 then
			print("Note: All monitors turned off.")
		else
			boxtype = spawnchance[(P_RandomByte()%numchoices)+1]
		end
	end

	if boxtype == nil then
		boxtype = mo.type
	end

	newmobj = P_SpawnMobjFromMobj(mo, 0, 0, 0, boxtype)

	-- Transfer flags2 (strongbox, objectflip)
	newmobj.flags2 = mo.flags2

	-- Transfer rmFDAltOption (if the monitor is not a 2.0 variant)
	if mo.rmFDAltOption then newmobj.rmFDAltOption = mo.rmFDAltOption end
	-- Transfer shield era as well
	newmobj.rmShieldEra = mo.rmShieldEra

	P_RemoveMobj(mo) -- make sure they disappear

	return true
end)

-- Randomly choose a monitor based on the user's settings and the monitor
local function RM_FDRandomBoxChance(mo)
	if not (mo and mo.valid) then return end

	local spawnchance = {}
	local numchoices = 0
	-- local jumpshield, watershield, fireforceshield, bombshield

	local function QUESTIONBOXCHANCES(boxtype, cvar)
		local boxset = cvar.value
		local maxvalue = -1 -- Off/No
		local altoption = mo.rmFDAltOption

		if altoption == nil then altoption = -1 end

		if altoption == 3 then -- Pre-1.08 behavior
			if boxset > 0 then
				maxvalue = 1 -- Yes
			end
		else
			if boxset > 6 then -- High
				maxvalue = 3
			elseif boxset > 3 then -- Medium
				maxvalue = 2
			elseif boxset > 0 then -- Low
				maxvalue = 1
			end
		end

		if maxvalue > 0 then -- Prevent a possible endless loop
			for i = maxvalue, 1, -1 do
				spawnchance[numchoices+1] = boxtype
				numchoices = $+1
			end
		end
	end

	local altoption = mo.rmFDAltOption or 0
	local shields = RM_DetermineShieldVariants(mo).icons

	QUESTIONBOXCHANCES(MT_FDBOX_RING_ICON,			CV_FindVar("tv_superring"))
	if altoption > 0 and altoption < 4 then -- Pre-2.0 Behavior (for Silver Ring)
		QUESTIONBOXCHANCES(MT_FDBOX_SRING_ICON,		CV_FindVar("tv_recycler"))
	end
	QUESTIONBOXCHANCES(MT_FDBOX_SHOES_ICON,			CV_FindVar("tv_supersneaker"))
	QUESTIONBOXCHANCES(MT_FDBOX_INVIN_ICON,			CV_FindVar("tv_invincibility"))
	QUESTIONBOXCHANCES(shields[1],					CV_FindVar("tv_jumpshield"))
	QUESTIONBOXCHANCES(shields[2],					CV_FindVar("tv_watershield"))
	QUESTIONBOXCHANCES(MT_FDBOX_YELLOW_ICON,		CV_FindVar("tv_ringshield"))
	QUESTIONBOXCHANCES(shields[3],					CV_FindVar("tv_forceshield"))
	QUESTIONBOXCHANCES(shields[4],					CV_FindVar("tv_bombshield"))
	QUESTIONBOXCHANCES(MT_FDBOX_1UP_ICON,			CV_FindVar("tv_1up"))
	QUESTIONBOXCHANCES(MT_FDBOX_EGGMAN_ICON,		CV_FindVar("tv_eggman"))
	QUESTIONBOXCHANCES(MT_FDBOX_MIXUP_ICON,			CV_FindVar("tv_teleporter"))
	if not altoption then -- 2.0 behavior
		QUESTIONBOXCHANCES(MT_FDBOX_RECYCLE_ICON,	CV_FindVar("tv_recycler"))
	end

	if numchoices == 0 then
		print("Note: All monitors turned off.")
		return MT_NULL
	end

	return spawnchance[(P_RandomByte()%numchoices)+1]
end

-- Variant of A_MonitorPop that doesn't spawn an explosion
function A_FDMonitorPop(actor, var1, var2)
	if not (actor and actor.valid) then return end

-- 	local remains
	local item
-- 	local random
-- 	local newbox

	-- de-solidify
	actor.flags = $|MF_NOCLIP & ~MF_SOLID

-- 	remains = P_SpawnMobj(actor.x, actor.y, actor.z, actor.info.speed)

	if actor.info.deathsound then
		S_StartSound(actor, actor.info.deathsound)
	end

	if actor.info.damage == MT_UNKNOWN then
		item = RM_FDRandomBoxChance(actor)
	else
		item = actor.info.damage
	end

	if item ~= nil then
		local newmobj
		newmobj = P_SpawnMobjFromMobj(actor, 0, 0, 13*FRACUNIT, item)
		newmobj.target = actor.target -- Transfer target

		-- Might not be needed if using P_SpawnMobjFromMobj
-- 		if (actor.eflags & MFE_VERTICALFLIP)
-- 			newmobj.eflags = $|MFE_VERTICALFLIP
-- 		end

		-- Let the icon give the player the correct shield based on the monitor's options
		newmobj.rmFDAltOption = actor.rmFDAltOption
		newmobj.rmShieldEra = actor.rmShieldEra

		-- Only display the player's 1up icon instead of the monitor's if the monitor is set to do so
		if item == MT_FDBOX_1UP_ICON then
			if (newmobj.rmFDAltOption or 0) == 2 or (newmobj.rmFDAltOption or 0) == 3 then return end

			if actor.tracer then -- Remove the old lives icon.
				P_RemoveMobj(actor.tracer)
			end

			if not newmobj.target
			or not newmobj.target.player
			or not newmobj.target.skin
			or skins[newmobj.target.skin].sprites[SPR2_LIFE].numframes == 0 then
				-- No lives icon for this player, use the default
			else -- Spawn the lives icon
				local livesico = P_SpawnMobjFromMobj(newmobj, 0, 0, 0, MT_OVERLAY)
				livesico.target = newmobj
				newmobj.tracer = livesico

				livesico.color = newmobj.target.player.mo.color
				livesico.skin = newmobj.target.skin
				livesico.state = newmobj.info.seestate

				-- Use the new 2.2.9 sprite scaling variables to make the life icon fit inside the Final Demo monitor
				livesico.spritexscale = 3*FRACUNIT/4
				livesico.spriteyscale = 3*FRACUNIT/4

				-- We're using the overlay, so use the overlay 1up frame (no text)
				newmobj.frame = D
			end
		end
	else
-- 		print("Powerup item not defined in 'damage' field for A_FDMonitorPop")
	end
end

states[S_FDBOX_FLICKER] =	{SPR_FBOX,	A,	1,	nil,	0,	0,	S_SPAWNSTATE}

states[S_FDBOX_EXPLOSION1] =	{SPR_FBOX,	B|FF_ANIMATE,	8,	A_FDMonitorPop,	4,	2,	S_FDBOX_EXPLOSION2}
states[S_FDBOX_EXPLOSION2] =	{SPR_FBOX,	F,				-1,	nil,			0,	0,	S_NULL}
