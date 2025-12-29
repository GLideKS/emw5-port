addHook("PostThinkFrame", function()
if gamestate != GS_LEVEL then return end
for p in players.iterate() do
	local pmo = p.mo
    if p.exiting then return end
	if not (p and pmo and pmo.valid and p.playerstate == PST_LIVE) then continue end
		
	--Don't play the transform animation, directly go super
    if not (p and pmo and FDChar[p.mo.skin]) then continue end
    if FDChar[p.mo.skin].skiptransform then
        if pmo.state >= S_PLAY_SUPER_TRANS1 and pmo.state <= S_PLAY_SUPER_TRANS6 then
            pmo.state = S_PLAY_STND
        end
    end

    --Go to walk animation when using springs as superform
    if FDChar[p.mo.skin].nosuperspring then
        if p.powers[pw_super]
        and (p.panims == PA_SPRING or pmo.state == S_PLAY_SPRING) then
            pmo.state = S_PLAY_WALK
            p.panims = PA_WALK
        end
    end
end
end)

addHook("PlayerThink", function(p)
	--Do rolling after a glide (for non-spin jump and multiability)
	if not (p and p.mo and p.mo.valid and p.playerstate == PST_LIVE) then return end
	if not (FDChar[p.mo.skin] and FDChar[p.mo.skin].oldglide_rolloff) then return end
	
	if (p.pflags & PF_GLIDING) and not (p.cmd.buttons & BT_JUMP)
	and not P_IsObjectOnGround(p.mo) then
		P_ResetPlayer(p)
		p.mo.state = S_PLAY_ROLL
		p.pflags = ($ | PF_JUMPED)
	end
end)