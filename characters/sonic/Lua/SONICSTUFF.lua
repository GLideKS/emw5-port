freeslot(
	"SKINCOLOR_SUPERLEGACYYELLOW1",
	"SKINCOLOR_SUPERLEGACYYELLOW2",
	"SKINCOLOR_SUPERLEGACYYELLOW3",
	"SKINCOLOR_SUPERLEGACYYELLOW4",
	"SKINCOLOR_SUPERLEGACYYELLOW5"
)

local yellow_ramp = {73,73,73,73,73,73,73,73,64,64,65,66,66,67,67,68}
skincolors[SKINCOLOR_SUPERLEGACYYELLOW1] = {
    name = "Super legacyyellow 1",
    ramp = yellow_ramp,
    invcolor = SKINCOLOR_CORNFLOWER,
    invshade = 9,
    chatcolor = V_YELLOWMAP,
    accessible = false
}
skincolors[SKINCOLOR_SUPERLEGACYYELLOW2] = {
    name = "Super legacyyellow 2",
    ramp = yellow_ramp,
    invcolor = SKINCOLOR_CORNFLOWER,
    invshade = 9,
    chatcolor = V_YELLOWMAP,
    accessible = false
}
skincolors[SKINCOLOR_SUPERLEGACYYELLOW3] = {
    name = "Super legacyyellow 3",
    ramp = yellow_ramp,
    invcolor = SKINCOLOR_CORNFLOWER,
    invshade = 9,
    chatcolor = V_YELLOWMAP,
    accessible = false
}
skincolors[SKINCOLOR_SUPERLEGACYYELLOW4] = {
    name = "Super legacyyellow 4",
    ramp = yellow_ramp,
    invcolor = SKINCOLOR_CORNFLOWER,
    invshade = 9,
    chatcolor = V_YELLOWMAP,
    accessible = false
}
skincolors[SKINCOLOR_SUPERLEGACYYELLOW5] = {
    name = "Super legacyyellow 5",
    ramp = yellow_ramp,
    invcolor = SKINCOLOR_CORNFLOWER,
    invshade = 9,
    chatcolor = V_YELLOWMAP,
    accessible = false
}

addHook("PostThinkFrame", function()
if gamestate != GS_LEVEL then return end
for p in players.iterate() do
	local pmo = p.mo
	if not (pmo and pmo.valid and pmo.health and pmo.skin == "emwsonic") then continue end
		
	--Don't play the transform animation, directly go super
	if pmo.state >= S_PLAY_SUPER_TRANS1 and pmo.state <= S_PLAY_SUPER_TRANS6 then
		pmo.state = S_PLAY_STND
	end

    --Go to walk animation when using springs as superform
    if p.powers[pw_super]
    and (p.panims == PA_SPRING or pmo.state == S_PLAY_SPRING) then
        pmo.state = S_PLAY_WALK
        p.panims = PA_WALK
    end
end
end)