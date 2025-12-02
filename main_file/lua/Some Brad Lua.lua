freeslot("MT_DARKBRAD")

// Override the vanilla boss death function
addHook("BossDeath", function(mobj)
	if not mobj and mobj.valid then return end
	
	// Stop exploding and prepare to run.
	mobj.state = mobj.info.xdeathstate
	if not mobj.valid then
		return
	end
	
	mobj.target = nil
	
	// Flee! Flee! Find a point to escape to! If none, just shoot upward!
	// scan the thinkers to find the runaway point
	for th in mobjs.iterate() do
		if th.type == MT_BOSSFLYPOINT then
			// If this one's closer then the last one, go for it
			if not (mobj.target and mobj.target.valid) or
			FixedHypot(FixedHypot(mobj.x - th.x, mobj.y - th.y), mobj.z - th.z) <
			FixedHypot(FixedHypot(mobj.x - mobj.target.x, mobj.y - mobj.target.y), mobj.z - mobj.target.z) then
				mobj.target = th
			end
			// Otherwise... Don't!
		end
	end
	
	mobj.flags = $|MF_NOGRAVITY|MF_NOCLIP
	mobj.flags = $|MF_NOCLIPHEIGHT
	
	if mobj.target and mobj.target.valid then
		mobj.angle = R_PointToAngle2(mobj.x, mobj.y, mobj.target.x, mobj.target.y)
		mobj.flags2 = $|MF2_BOSSFLEE
		mobj.momz = FixedMul(FixedDiv(mobj.target.z - mobj.z, FixedHypot(mobj.x-mobj.target.x,mobj.y-mobj.target.y)), FixedMul(2*FRACUNIT, mobj.scale))
	else
		mobj.momz = FixedMul(2*FRACUNIT, mobj.scale)
	end
	
	return true
end, MT_DARKBRAD)