freeslot("sfx_knux05", "sfx_knux06")

if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwknux"] = {
	name_graphic = "STKNUXNM",
	slingitem = MT_KNUXPUNCH,
	ringslinger = true,
	skiptransform = true,
	oldglide = true,
	taunts = {sfx_knux05, sfx_knux06}
}