--add shade to the final demo hud list from emw5
if not FDChar then rawset(_G, "FDChar", {}) end
FDChar["emwshade"] = {
	name_graphic = "STSHADE",
	slingitem = MT_SHADESLING,
	ringslinger = true,
	skiptransform = true,
	old_ability = true
}