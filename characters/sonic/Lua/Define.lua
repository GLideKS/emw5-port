freeslot("sfx_onic1", "sfx_onic6")

if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwsonic"] = {
	name_graphic = "STSONIC",
	slingitem = MT_EMWSONICBOOST,
	skiptransform = true,
	nosuperspring = true,
	taunts = {sfx_onic1, sfx_onic6}
}