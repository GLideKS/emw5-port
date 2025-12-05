--Old CA_FLOAT pre 2.2 recreation by GLide KS
local CA_OLD_FLOAT = 180

addHook("PlayerSpawn", function(player)
player.floatUsed = false
player.floatUsedOnce = false
end)

addHook("AbilitySpecial", function(player)
    if player.charability == CA_OLD_FLOAT and player.pflags & PF_JUMPED and not (player.pflags & PF_THOKKED) then
        player.pflags = $1 | PF_THOKKED
    end
end)

addHook("PlayerThink", function(player)
	if not (player and player.mo) then return end
	if player.charability == CA_OLD_FLOAT then
		if player.pflags & PF_THOKKED and not player.floatUsedOnce then
			player.mo.momz = 0
			player.floatUsed = true
			if not (player.cmd.buttons & BT_JUMP) then
				player.floatUsedOnce = true
			end
		end
			
		if P_IsObjectOnGround(player.mo) then
			player.floatUsedOnce = false
		end
	end
end)