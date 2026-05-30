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

local skim_sprite = SPR_SKIM
local emerald_sprite = SPR_CEMG

--sync for all players
addHook("NetVars", function(net)
	skim_sprite = net($)
	emerald_sprite = net($)
end)

--Since it's only the sprites and doesn't involve anything on movement
--should not be harmful to have a resync.
local function EMW_UpdateSprites()
	for i = 1, 4 do
		states[_G["S_SKIM"..i]].sprite = skim_sprite
	end

	for i = 1, 7 do
		states[_G["S_CEMG"..i]].sprite = emerald_sprite
	end

	-- Update for all the emeralds in the map since changing the sprite on the state isn't enough
	-- Using mobjs.iterate in a function that only gets called once it's fine.
	for mo in mobjs.iterate() do
		if (mo.type == MT_EMERALD1
		or mo.type == MT_EMERALD2
		or mo.type == MT_EMERALD3
		or mo.type == MT_EMERALD4
		or mo.type == MT_EMERALD5
		or mo.type == MT_EMERALD6
		or mo.type == MT_EMERALD7) then
			mo.sprite = emerald_sprite
		end
	end
end

--The reason of why I'm doing this into a thinkframe and not in a mapload hook
--is because joining players will not see the changes
addHook("ThinkFrame", function()
	if gamestate != GS_LEVEL then return end

	--Change if the map is an EMW5 map.
	if leveltime == 1 then
		if mapheaderinfo[gamemap].emw5 then
			skim_sprite = SPR_EMW5_SKIM
			emerald_sprite = SPR_EMW5_EMMY
		else
			skim_sprite = SPR_SKIM
			emerald_sprite = SPR_CEMG
		end
		EMW_UpdateSprites()
	end

	--For Joining Players
	if not consoleplayer then return end

	if consoleplayer.jointime == 1 then
		EMW_UpdateSprites()
	end
end)