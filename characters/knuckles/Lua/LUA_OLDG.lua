//Script to restore 1.09.4 glide behavior.
//Translated from C to Lua by Ikkarou Tatsuru
//Tweaked and 2.2-ified by TrickyTex
local function KnuxJumpThinker(p)
	if p.mo.skin != "emwknux" return end
	
	if (p.pflags & PF_GLIDING)
		local leeway

		if (p.mo.momz == (-2*FRACUNIT)/TICRATE)
			p.mo.momz = (-2*FRACUNIT)/TICRATE
		elseif (p.mo.momz < (-2*FRACUNIT)/TICRATE)
			p.mo.momz = $ + (3*(FRACUNIT/4))/TICRATE
		end
		
		p.isgliding = 1

		-- Strafing while gliding.
		leeway = FixedAngle(p.cmd.sidemove * (FRACUNIT/2))

		if p.mo.skin == "emwknux" and ((p.mo.eflags & MFE_UNDERWATER))
			P_InstaThrust(p.mo, p.mo.angle - leeway, ((p.actionspd*(p.powers[pw_super] and 40 or 20)) + p.glidetime * 750)/TICRATE)
		elseif p.mo.skin == "emwknux"
			P_InstaThrust(p.mo, p.mo.angle - leeway, ((p.actionspd*(p.powers[pw_super] and 80 or 40)) + p.glidetime * 1500)/TICRATE)
		end
			
		p.glidetime = $ + 1
	else
		p.isgliding = 0
		if p.climbing -- 'Deceleration' for climbing on walls.
		if (p.mo.momz > 0)
			p.mo.momz = $ - FRACUNIT/(TICRATE*2)
		elseif (p.mo.momz < 0)
			p.mo.momz = $ + FRACUNIT/(TICRATE*2)
		end
		end
	end
end

addHook("JumpSpecial", KnuxJumpThinker)

addHook("PlayerThink", function(player)
    if (player.mo and player.mo.valid and player.mo.skin ~= "emwknux") then
        return
    end

    if (player.climbing > 1) then
        player.pflags = (player.pflags | PF_FORCESTRAFE)
    elseif (player.climbing) then
        player.mo.angle = player.mo.angle
    elseif (player.climbing == 0)
    and (player.pflags & PF_FORCESTRAFE) then
        player.pflags = (player.pflags & ~PF_FORCESTRAFE)
    end
end)

addHook("PlayerThink",function(p)
	if not (p.mo and p.mo.valid and p.mo.skin=="emwknux") return end
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
end) 