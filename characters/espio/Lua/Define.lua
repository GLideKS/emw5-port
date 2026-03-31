SafeFreeslot("sfx_espio1", "sfx_espio3")

if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwespio"] = {
	name_graphic = "SRESPION",
	ringslinger = true,
	slingitem = MT_EMWESPIO_NINJASTAR,
	skiptransform = true,
	taunts = {sfx_espio1, sfx_espio3}
}