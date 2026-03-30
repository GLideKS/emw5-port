addHook("PlayerThink", function(p)
	local pmo = p.mo
	if pmo and pmo.valid and pmo.health and pmo.skin == "emwshade" then
		
		--In the original version of this character, spin trails dissapears when on super
		if p.powers[pw_super] then
			p.revitem = 0
			p.spinitem = 0
		else
			p.revitem = MT_SHADESPIN
			p.spinitem = MT_SHADESPIN
		end
		
		if p.playerstate == PST_DEAD then return end
		
		--Do rolling after a glide
		if (p.pflags & PF_GLIDING) and not (p.cmd.buttons & BT_JUMP)
		and not P_IsObjectOnGround(p.mo) then
			P_ResetPlayer(p)
			p.mo.state = S_PLAY_ROLL
			p.pflags = ($ | PF_JUMPED)
		end
	end
end)

--Wall checks from Nick WolfFang, prevents Shade to climb
--Can't find a way to slide on walls still
local function WallBumping(mo,mobj,line)
	if mo and mo.valid
	and mo.skin == "emwshade"
	and (mo.player.pflags & PF_GLIDING)
	and not (mobj and mobj.valid and mobj.flags & (MF_MONITOR|MF_ENEMY|MF_BOSS))
	and line and line.valid then

		if NK_GlideClimbTraverse(mo,line) 
		and not (line and line.backsector
		and line.backsector.ceilingpic == "F_SKY1"
		and line.frontsector
		and line.frontsector.ceilingpic == "F_SKY1"
		and (mo.z >= line.frontsector.ceilingheight
		or mo.z >= line.backsector.ceilingheight)) then
			return true
		end
	end
end
addHook("MobjMoveBlocked", WallBumping, MT_PLAYER)