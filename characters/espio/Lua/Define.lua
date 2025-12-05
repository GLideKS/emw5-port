freeslot("sfx_espio1", "sfx_espio3")

if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwespio"] = {
	name_graphic = "SRESPION",
	slingitem = MT_EMWESPIO_NINJASTAR,
	skiptransform = true,
	taunts = {sfx_espio1, sfx_espio3}
}