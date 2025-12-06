freeslot("sfx_knux05", "sfx_knux06")

if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwknux"] = {
	name_graphic = "STKNUXNM",
	slingitem = MT_KNUXPUNCH,
	skiptransform = true,
	oldglide = true,
	taunts = {sfx_knux05, sfx_knux06}
}