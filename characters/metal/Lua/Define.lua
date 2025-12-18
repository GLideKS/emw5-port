freeslot("sfx_metl01")

if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwmetal"] = {
	name_graphic = "MESONIC",
	slingitem = MT_EMWMETAL_BOOST,
	skiptransform = true,
	taunts = {sfx_metl01, sfx_metl01, sfx_MTL01, sfx_MTL01}
}