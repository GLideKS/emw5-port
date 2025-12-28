freeslot("sfx_metl01")

if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwmetal"] = {
	name_graphic = "MESONIC",
	slingitem = MT_EMWMETAL_BOOST,
	ringslinger = true,
	skiptransform = true,
	taunts = {sfx_metl01, sfx_metl01, sfx_MTL01, sfx_MTL01}
}