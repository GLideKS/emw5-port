freeslot("sfx_vect01", "sfx_vect02")

if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwvector"] = {
	name_graphic = "STVECTOR",
	slingitem = MT_EMWVECTOR_ROCKTHROW,
	skiptransform = true,
	oldglide = true,
	taunts = {sfx_vect01, sfx_vect02}
}