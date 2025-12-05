//Script to restore 1.09.4 glide behavior.
//Translated from C to Lua by Ikkarou Tatsuru
//Tweaked and 2.2-ified by TrickyTex
local function GlideJumpThinker(p)
	if not (finaldemo_character[p.mo.skin] and finaldemo_character[p.mo.skin].oldglide) return end
	
	if (p.pflags & PF_GLIDING)
		local leeway

		if (p.mo.momz == (-2*FRACUNIT)/TICRATE)
			p.mo.momz = (-2*FRACUNIT)/TICRATE
		elseif (p.mo.momz < (-2*FRACUNIT)/TICRATE)
			p.mo.momz = $ + (3*(FRACUNIT/4))/TICRATE
		end

		-- Strafing while gliding.
		leeway = FixedAngle(p.cmd.sidemove * (FRACUNIT/2))

		if (p.mo.eflags & MFE_UNDERWATER)
			P_InstaThrust(p.mo, p.mo.angle - leeway, ((p.actionspd*(p.powers[pw_super] and 40 or 20)) + p.glidetime * 750)/TICRATE)
		else
			P_InstaThrust(p.mo, p.mo.angle - leeway, ((p.actionspd*(p.powers[pw_super] and 80 or 40)) + p.glidetime * 1500)/TICRATE)
		end
			
		p.glidetime = $ + 1

		if not (p.pflags & PF_JUMPDOWN) -- If not holding the jump button
			P_ResetPlayer(p) -- down, stop gliding.
			
			if (p.charability2 == CA2_MULTIABILITY)
			or (p.powers[pw_super]
			and All7Emeralds(p.powers[pw_emeralds])
			and p.charability == CA_GLIDEANDCLIMB)
				p.pflags = $ | PF_JUMPED
				p.mo.state = S_PLAY_ATK1
			else
				p.mo.momx = $ >> 1
				p.mo.momy = $ >> 1
				p.mo.state = S_PLAY_FALL1
			end
		end
	elseif p.climbing -- 'Deceleration' for climbing on walls.
		if (p.mo.momz > 0)
			p.mo.momz = $ - FRACUNIT/(TICRATE*2)
		elseif (p.mo.momz < 0)
			p.mo.momz = $ + FRACUNIT/(TICRATE*2)
		end
	end
end

addHook("JumpSpecial", GlideJumpThinker)

addHook("PreThinkFrame", function()
for p in players.iterate
    if not (finaldemo_character[p.mo.skin] and finaldemo_character[p.mo.skin].oldglide) then continue end

    if (p.climbing > 1) then
        p.pflags = (p.pflags | PF_FORCESTRAFE)
    elseif (p.climbing) then
        p.mo.angle = p.mo.angle
    elseif (p.climbing == 0)
    and (p.pflags & PF_FORCESTRAFE) then
        p.pflags = (p.pflags & ~PF_FORCESTRAFE)
    end
	
	local mo = p.mo
	if P_IsObjectOnGround(mo) and p.pflags & PF_GLIDING
		p.pflags = $ & ~(PF_GLIDING|PF_JUMPED|PF_NOJUMPDAMAGE)
		p.mo.state = S_PLAY_WALK
	end
	if p.mo.state == S_PLAY_GLIDE_LANDING
		p.mo.state = S_PLAY_STND
	end
	if p.mo.state != S_PLAY_GLIDE
		p.pflags = $ & ~PF_THOKKED
	end
end
end)