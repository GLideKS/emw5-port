if not finaldemo_character then rawset(_G, "finaldemo_character", {}) end

local function EMWFDLifeIcon(v, p)
	if not (p.mo and finaldemo_character[p.mo.skin]) return end
	
	if not (p.powers[pw_carry] == CR_NIGHTSMODE)
	and not (maptol & TOL_NIGHTS)
		local face = v.getSprite2Patch(p.mo.skin, SPR2_XTRA, (p.powers[pw_super] != 0), 0, 0)
		v.drawScaled(16*FRACUNIT, 161*FRACUNIT, 1*FRACUNIT, face, V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS, v.getColormap(p.mo.skin, p.mo.color))
	end
end

local function EMWFDLifeX(v, p)
	if not (p.mo and finaldemo_character[p.mo.skin]) return end
	
	if not (p.powers[pw_carry] == CR_NIGHTSMODE)
	and not (maptol & TOL_NIGHTS)
		local livex = v.cachePatch("STFINLX")
		v.draw(57, 185, livex, V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
	end
end

// Skin names.
// Please note that not all of them are available, since those
// names are shown as patches and not in-font texts.
local function EMWIdentifier(v, p)
	if not (p.mo and finaldemo_character[p.mo.skin]) return end
	
	if not (p.powers[pw_carry] == CR_NIGHTSMODE)
	and not (maptol & TOL_NIGHTS)
		v.draw(53, 161, v.cachePatch(finaldemo_character[p.mo.skin].name_graphic),V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
	end
end

// Below is a script written to fix an issue that causes Adventure Sonic to re-enable the
// original "X", character hudname and number from the original SRB2's life counter.
// However, there's a twist: The WHOLE life number code has to be rewritten.
local function EMWFDLifeCounter(v, p)
	if not (p.mo and finaldemo_character[p.mo.skin]) return end
	
	if not (p.powers[pw_carry] == CR_NIGHTSMODE)
	and not (maptol & TOL_NIGHTS)
		if (p.lives == 0) then
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 1) then
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 2) then
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 3) then
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 4) then
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 5) then
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 6) then
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 7) then
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 8) then
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 9) then
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 10) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 11) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 12) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 13) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 14) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 15) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 16) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 17) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 18) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 19) then
			v.draw(73, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 20) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 21) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 22) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 23) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 24) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 25) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 26) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 27) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 28) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 29) then
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 30) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 31) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 32) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 33) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 34) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 35) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 36) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 37) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 38) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 39) then
			v.draw(73, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 40) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 41) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 42) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 43) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 44) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 45) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 46) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 47) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 48) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 49) then
			v.draw(73, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 50) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 51) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 52) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 53) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 54) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 55) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 56) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 57) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 58) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 59) then
			v.draw(73, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 60) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 61) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 62) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 63) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 64) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 65) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 66) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 67) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 68) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 69) then
			v.draw(73, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 70) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 71) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 72) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 73) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 74) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 75) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 76) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 77) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 78) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 79) then
			v.draw(73, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 80) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 81) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 82) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 83) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 84) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 85) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 86) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 87) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 88) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 89) then
			v.draw(73, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 90) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM0"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 91) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 92) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 93) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM3"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 94) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM4"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 95) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM5"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 96) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM6"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 97) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 98) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM8"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == 99) then
			v.draw(73, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM9"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		elseif (p.lives == INFLIVES) then
			v.draw(65, 182, v.cachePatch("STTNUM1"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(73, 182, v.cachePatch("STTNUM2"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
			v.draw(81, 182, v.cachePatch("STTNUM7"), V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_PERPLAYER|V_HUDTRANS)
		end
	end
end

hud.add(EMWFDLifeX)
hud.add(EMWIdentifier)
hud.add(EMWFDLifeCounter)
hud.add(EMWFDLifeIcon)

addHook("PlayerThink", function(p)
	if not p.hudchanged
		p.hudchanged = false
	end
	
	if finaldemo_character[p.mo.skin]
		if not p.hudchanged
			if hud.enabled("lives")
				hud.disable("lives")
				p.hudchanged = true
			end
		elseif hud.enabled("lives")
			hud.disable("lives")
		end
	elseif p.hudchanged
		hud.enable("lives")
		p.hudchanged = false
	end
end)