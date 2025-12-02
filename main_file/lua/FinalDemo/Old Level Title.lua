local LevelTitleY = {
	[0] = -48,
	[1] = -24,
	[2] = 1,
	[3] = 12,
	[4] = 24,
	[5] = 36,
	[6] = 48,
	[7] = 60,
	[8] = 72,
	[106] =	104,
	[107] =	128,
	[108] =	152,
	[109] =	176,
	[110] =	200,
	[111] = 224,
	[112] = 248,
	[113] = 272,
	[114] = 296,
	[115] = 320
}

local LevelActY = {
	[0] = 248,
	[1] = 224,
	[2] = 200,
	[3] = 188,
	[4] = 176,
	[5] = 164,
	[6] = 152,
	[7] = 140,
	[8] = 128,
	[106] =	80,
	[107] =	56,
	[108] =	32,
	[109] =	8,
	[110] =	1,
	[111] = -8,
	[112] = -32,
	[113] = -56,
	[114] = -80,
	[115] = -128
}

hud.add(function(v, p, ticker, endtick)
	if mapheaderinfo[gamemap].emw5 then
    	hud.disable("stagetitle")
	else
		hud.enable("stagetitle")
	end
	
	if not mapheaderinfo[gamemap].emw5 then return end

    if (ticker < 0) or (ticker > endtick) then return end

    if (mapheaderinfo[gamemap].levelflags & LF_NOTITLECARD) then
        return
    end

    local titleString = mapheaderinfo[gamemap].lvlttl
	local actNum = mapheaderinfo[gamemap].actnum
	local subtitleString = mapheaderinfo[gamemap].subttl
	local titleNum
	local titleNumPosX = 0
	local titleNumPosY = 0
    local levelTitleX = 160 - (v.levelTitleWidth(titleString) / 2)

    if actNum then
		titleNum = v.cachePatch("TTL" .. tostring(actNum))
		levelTitleX = $ - titleNum.width
	end

    local levelTitleY = 0
	levelTitleY = LevelTitleY[ticker] or 80
	titleNumPosY = LevelActY[ticker] or 104

    titleNumPosX = levelTitleX + v.levelTitleWidth(titleString)
    if actNum and titleNum then
		v.draw(titleNumPosX, titleNumPosY, titleNum)
	end

    v.drawLevelTitle(levelTitleX, levelTitleY, titleString)
	if not (mapheaderinfo[gamemap].levelflags & LF_NOZONE) then
		v.drawLevelTitle(titleNumPosX - v.levelTitleWidth("Zone"), titleNumPosY, "Zone")
	end
end, "titlecard")