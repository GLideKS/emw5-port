SafeFreeslot(
	"SPR_EMW5_SKIM"
)

--Turret Fire defaults override
function A_TurretFire(actor, var1, var2)
	if actor.type == MT_TURRET --Only replace it's ammo with flame thrower in EMW5 maps.
	and mapheaderinfo[gamemap].emw5 then
		super(actor, MT_EMW5_FLAMETHROWER, nil)
		return
	end

	super(actor, var1, var2)
end

--Goombas.
--Sorry, there's no way to set these only for emw5 maps and revert for vanilla in a net safe way.
mobjinfo[MT_GOOMBA].speed = 16
mobjinfo[MT_GOOMBA].speed = 24

local skim_sprite = SPR_EMW5_SKIM
local emerald_sprite = SPR_EMW5_EMMY
local deton_sprite = SPR_EMW5_DETON
local mine_sprite = SPR_EMW5_BOMB

--sync for all players
addHook("NetVars", function(net)
	skim_sprite = net($)
	emerald_sprite = net($)
	deton_sprite = net($)
	mine_sprite = net($)
end)

--Objects to have a replaced sprite
local object_sprite_replace = {
	[MT_DETON] = deton_sprite,
	[MT_SKIM] = skim_sprite,
	[MT_EMERALD1] = emerald_sprite,
	[MT_EMERALD2] = emerald_sprite,
	[MT_EMERALD3] = emerald_sprite,
	[MT_EMERALD4] = emerald_sprite,
	[MT_EMERALD5] = emerald_sprite,
	[MT_EMERALD6] = emerald_sprite,
	[MT_EMERALD7] = emerald_sprite,
	[MT_MINE] = mine_sprite
}

--Since it's only the sprites and doesn't involve anything on movement
--should not be harmful to have a resync.
local function EMW_UpdateSprites()
	for i = 1, 4 do --EMW5 SKIM
		states[_G["S_SKIM"..i]].sprite = skim_sprite
	end

	for i = 1, 7 do --EMW5 Emerald
		states[_G["S_CEMG"..i]].sprite = emerald_sprite
	end

	states[S_MINE1].sprite = mine_sprite --Jetty-syn's mine

	--EMW5 Deton
	for i = 1, 15 do
		states[_G["S_DETON"..i]].sprite = deton_sprite
	end

	-- Update for all the mobjs in the map since changing the sprite on the state isn't enough
	-- Using mobjs.iterate in a function that only gets called once it's fine.
	for mo in mobjs.iterate() do
		if not mo.health then continue end
		if not object_sprite_replace[mo.type] then continue end

		mo.sprite = object_sprite_replace[mo.type]
	end

	--Update Properties
	if mapheaderinfo[gamemap].emw5 then --EMW5 properties
		mobjinfo[MT_DETON].seesound = sfx_mario6
	else --Vanilla
		mobjinfo[MT_DETON].seesound = sfx_s3k86
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
			deton_sprite = SPR_EMW5_DETON
			mine_sprite = SPR_EMW5_BOMB
		else
			skim_sprite = SPR_SKIM
			emerald_sprite = SPR_CEMG
			deton_sprite = SPR_DETN
			mine_sprite = SPR_MINE
		end
		EMW_UpdateSprites()
	end

	--For Joining Players
	if not consoleplayer then return end

	if consoleplayer.jointime == 1 then
		EMW_UpdateSprites()
	end
end)