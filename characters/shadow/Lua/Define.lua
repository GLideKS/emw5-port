freeslot("sfx_shdwt1", "sfx_shdwt2", "sfx_shdwt3", "sfx_shdwt4")

if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwshadow"] = {
	name_graphic = "STSHDOW",
	slingitem = MT_EMWSHADOW_CHAOSBLAST,
	skiptransform = true,
	nosuperspring = true,
	taunts = {sfx_shdwt1, sfx_shdwt2, sfx_shdwt3, sfx_shdwt4}
}