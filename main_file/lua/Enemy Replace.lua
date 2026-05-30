SafeFreeslot(
	"SPR_EMW5_SKIM"
)

function A_TurretFire(actor, var1, var2)
	if actor.type == MT_TURRET --Only replace it's ammo with flame thrower in EMW5 maps.
	and mapheaderinfo[gamemap].emw5 then
		super(actor, MT_EMW5_FLAMETHROWER, nil)
		return
	end

	super(actor, var1, var2)
end

// Change Skim sprites on EMW5 maps.
// Quite a hack, but blame SRB2 making MT_SKIM movement hardcoded. amazing game!

local skim_sprite = SPR_SKIM

--Since it's only the sprites and doesn't involve anything on movement
--should not be harmful to have a resync.
local function EMW_UpdateSprites()
	states[S_SKIM1].sprite = skim_sprite
	states[S_SKIM2].sprite = skim_sprite
	states[S_SKIM3].sprite = skim_sprite
	states[S_SKIM4].sprite = skim_sprite
end

addHook("NetVars", function(net)
	skim_sprite = net($) --sync for all players
end)

--Change it on map load
addHook("MapLoad", function()
	if mapheaderinfo[gamemap].emw5 then
		skim_sprite = SPR_EMW5_SKIM
	else
		skim_sprite = SPR_SKIM
	end

	EMW_UpdateSprites()
end)

--For joining players
addHook("ThinkFrame", function()
	if not consoleplayer then return end
	if consoleplayer.jointime != 1 then return end

	EMW_UpdateSprites()
end)