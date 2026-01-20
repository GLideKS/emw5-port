freeslot("sfx_vect01", "sfx_vect02")

if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwvector"] = {
	name_graphic = "STVECTOR",
	slingitem = MT_EMWVECTOR_ROCKTHROW,
	ringslinger = true,
	skiptransform = true,
	old_ability = true,
	taunts = {sfx_vect01, sfx_vect02}
}