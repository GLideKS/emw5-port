-- Reintroduce slingitem behavior (aka. ringslinger usable in all modes)
addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and pmo.skin == "emwbrad"
		--Don't play the transform animation, directly go super
		if pmo.state >= S_PLAY_SUPER_TRANS1 and pmo.state <= S_PLAY_SUPER_TRANS6
			pmo.state = S_PLAY_STND
		end
	end
end)

--add brad to the final demo hud list from emw5
if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end
finaldemo_character["emwbrad"] = {
	name_graphic = "STBRADN",
	slingitem = MT_ROCKET
}