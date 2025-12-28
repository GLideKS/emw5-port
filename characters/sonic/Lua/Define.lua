freeslot("sfx_onic1", "sfx_onic6")

if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwsonic"] = {
	name_graphic = "STSONIC",
	slingitem = MT_EMWSONICBOOST,
	ringslinger = true,
	skiptransform = true,
	nosuperspring = true,
	taunts = {sfx_onic1, sfx_onic6}
}