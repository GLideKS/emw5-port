--TODO: Replace hud.add with the proper "HUD" hook

if not FDChar then rawset(_G, "FDChar", {}) end

local function FDLives(v, p)
	if not (p.mo and FDChar[p.mo.skin]) then return false end
	if (FDChar[p.mo.skin] and FDChar[p.mo.skin].fdhud == false) then return false end
	if (p.powers[pw_carry] == CR_NIGHTSMODE) then return false end
	if (maptol & TOL_NIGHTS) then return false end
	if G_RingSlingerGametype() then return false end
	
	--Face graphic
	local face = v.getSprite2Patch(p.mo.skin, SPR2_XTRA, (p.powers[pw_super] != 0), 0, 0)
	v.drawScaled(16*FRACUNIT, 161*FRACUNIT, 1*FRACUNIT, face, V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS, v.getColormap(p.mo.skin, p.mo.color))
	
	--Graphic Name
	v.draw(53, 161, v.cachePatch(FDChar[p.mo.skin].name_graphic),V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
	
	--Lives X
	local livex = v.cachePatch("STFINLX")
	v.draw(57, 185, livex, V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
	
	--Lives count
	local x,y = 81,182
	local spacing = x - 8
	local flags = V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS
	local number = p.lives
	if p.lives <= 99 then
		while (number) do
			v.draw(x, 182, v.cachePatch("STTNUM"..(number % 10)), flags)
			x = spacing
			number = $ / 10
		end
	elseif (p.lives == INFLIVES) then
		v.draw(x, 182, v.cachePatch("STTNUM9"), flags)
		v.draw(spacing, 182, v.cachePatch("STTNUM9"), flags)
	end
end
customhud.SetupItem("lives", "FDFeatures", FDLives)

addHook("HUD", function(v, p)
	if not p.mo then
		if customhud.CheckType("lives") == "FDFeatures" then
			customhud.SetupItem("lives", "vanilla")
		end
		return 
	end
	
	if FDChar[p.mo.skin] and FDChar[p.mo.skin].fdhud != false then
		if customhud.CheckType("lives") == "vanilla" then
			customhud.SetupItem("lives", "FDFeatures")
		end
	else
		customhud.SetupItem("lives", "vanilla")
	end
end)