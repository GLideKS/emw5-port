addHook("PostThinkFrame", function()
if gamestate != GS_LEVEL then return end
for p in players.iterate() do
	local pmo = p.mo
    if p.exiting then return end
		
	--Don't play the transform animation, directly go super
    if not (p and pmo and finaldemo_character[p.mo.skin]) then continue end
    if finaldemo_character[p.mo.skin].skiptransform then
        if pmo.state >= S_PLAY_SUPER_TRANS1 and pmo.state <= S_PLAY_SUPER_TRANS6 then
            pmo.state = S_PLAY_STND
        end
    end

    --Go to walk animation when using springs as superform
    if finaldemo_character[p.mo.skin].nosuperspring then
        if p.powers[pw_super]
        and (p.panims == PA_SPRING or pmo.state == S_PLAY_SPRING) then
            pmo.state = S_PLAY_WALK
            p.panims = PA_WALK
        end
    end
end
end)