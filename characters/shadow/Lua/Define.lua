SafeFreeslot("sfx_shdwt1", "sfx_shdwt2", "sfx_shdwt3", "sfx_shdwt4")

if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwshadow"] = {
	name_graphic = "STSHDOW",
	ringslinger = true,
	slingitem = MT_EMWSHADOW_CHAOSBLAST,
	skiptransform = true,
	nosuperspring = true,
	taunts = {sfx_shdwt1, sfx_shdwt2, sfx_shdwt3, sfx_shdwt4}
}