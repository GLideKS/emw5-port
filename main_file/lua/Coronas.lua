//Lighting System support.

local coronasloaded = false

local function LoadCoronas()
if coronasloaded then return end
if not LightingSystem_loaded then return end

local explodestuff = {
    color = SKINCOLOR_ORANGE,
    scale = FU*2,
    floorlight = true,
    alpha = FU/2,
    stayondeath = true,
    centered_offset = true,
    zoffset = 4,
    states = {
        [S_EMWROCKET_1670] = true,
        [S_EMWROCKET_1671] = true,
        [S_EMWROCKET_1672] = true,
        [S_EMWROCKET_1673] = true,
        [S_EMWROCKET_1674] = true,
        [S_EMWROCKET_1675] = true,
        [S_EMWROCKET_1676] = true,
        [S_EMWROCKET_1677] = true,
        [S_EMWROCKET_1678] = true,
        [S_EMWROCKET_1679] = true,
        [S_EMWROCKET_1680] = true,
        [S_EMWROCKET_1681] = true,
        [S_EMWROCKET_1682] = true,
        [S_EMWROCKET_1683] = true,
        [S_EMWROCKET_1684] = true,
        [S_EMWROCKET_1685] = true,
        [S_EMWROCKET_1686] = true,
        [S_EMWROCKET_1687] = true,
        [S_EMWROCKET_1688] = true,
    }
}

local bossexplode = {
    stayondeath = true,
    floorlight = true
}

--EMW5
LightObjects[MT_DARKBRAD] = {
    color = SKINCOLOR_SALMON,
    states = {
        [S_DARKB_1844] = true,
        [S_DARKB_1845] = true,
        [S_DARKB_1832] = true,
        [S_DARKB_1833] = true,
        [S_DARKB_1834] = true,
        --Death
        [S_DARKB_1862] = true,
        [S_DARKB_1863] = true,
        [S_DARKB_1864] = true,
        [S_DARKB_1865] = true,
        [S_DARKB_1866] = true,
        [S_DARKB_1867] = true,
        [S_DARKB_1868] = true,
        [S_DARKB_1869] = true,
        [S_DARKB_1870] = true,
        [S_DARKB_1871] = true,
        [S_DARKB_1872] = true,
    },
    scale = FU*5,
    alpha = FU/2, --The translucency of the corona. in this case, is 50% translucent
    floorlight = true, --will the floorlight spawn?
    centered_offset = true,
    stayondeath = true
}
LightObjects[MT_ENERGYBALL] = {
    color = SKINCOLOR_GALAXY,
    scale = FU*2,
    alpha = FU/4,
    floorlight = true
}
LightObjects[MT_DOOMDBALL] = {
    color = SKINCOLOR_RED,
    states = {
        [S_DEATHBALL_1631] = {color = SKINCOLOR_SALMON},
        [S_DEATHBALL_1632] = true,
        [S_DEATHBALL_1633] = {color = SKINCOLOR_SUPERRED1},
        [S_DEATHBALL_1634] = {color = SKINCOLOR_SUPERRED3},
        [S_DOOMDBALL_1580] = {color = SKINCOLOR_SUPERRED5},
        [S_DOOMDBALL_1581] = {color = SKINCOLOR_PINK},
        [S_DOOMDBALL_1582] = {color = SKINCOLOR_PINK}
    },
    scale = FU*10,
    alpha = FU/3*2,
    centered_offset = true,
    zoffset = 40,
    floorlight = true,
    stayondeath = true
}

LightObjects[MT_DEATHBALL] = {
    color = SKINCOLOR_RED,
    states = {
        [S_DEATHBALL_1631] = {color = SKINCOLOR_SALMON},
        [S_DEATHBALL_1632] = true,
        [S_DEATHBALL_1633] = {color = SKINCOLOR_SALMON},
        [S_DEATHBALL_1634] = {color = SKINCOLOR_PINK},
        [S_DEATHBALL_1635] = {color = SKINCOLOR_PINK},
        [S_DEATHBALL_1636] = {color = SKINCOLOR_PINK},
        [S_DEATHBALL_1637] = {color = SKINCOLOR_PINK}
    },
    scale = LightObjects[MT_DOOMDBALL].scale,
    alpha = LightObjects[MT_DOOMDBALL].alpha,
    floorlight = LightObjects[MT_DOOMDBALL].floorlight,
    centered_offset = LightObjects[MT_DOOMDBALL].centered_offset,
    zoffset = -40,
    stayondeath = LightObjects[MT_DOOMDBALL].stayondeath
}

LightObjects[MT_SHOOPDAWHOOP] = {
    color = SKINCOLOR_BLUEBELL,
    scale = FU/3,
    alpha = FU/2,
    stayondeath = false,
    zoffset = 0
}

LightObjects[MT_EMW5_ROCKET] = explodestuff
LightObjects[MT_BRADROCKET] = explodestuff
LightObjects[MT_SCENERYEXPLOSION] = explodestuff

LightObjects[MT_SONIC3KBOSSEXPLODE] = bossexplode
LightObjects[MT_BOSSEXPLODE] = bossexplode

LightObjects[MT_METALIX] = {
    color = SKINCOLOR_YELLOW,
    scale = FU*2,
    alpha = FU/2,
    states = {
        [S_METALIX_STND1] = true
    },
    zoffset = -40,
    floorlight = true,
    flicker = true,
    stayondeath = false
}

--Vanilla objects override

local emeralds_scale = FU*2

LightObjects[MT_EMERALD1].color = SKINCOLOR_GREEN
LightObjects[MT_EMERALD1].scale = emeralds_scale

LightObjects[MT_EMERALD2].color = SKINCOLOR_GOLDENROD
LightObjects[MT_EMERALD2].scale = emeralds_scale

LightObjects[MT_EMERALD3].color = SKINCOLOR_BLUE
LightObjects[MT_EMERALD3].scale = emeralds_scale

LightObjects[MT_EMERALD4].color = SKINCOLOR_BLUEBELL
LightObjects[MT_EMERALD4].scale = emeralds_scale

LightObjects[MT_EMERALD5].color = SKINCOLOR_ORANGE
LightObjects[MT_EMERALD5].scale = emeralds_scale

LightObjects[MT_EMERALD6].color = SKINCOLOR_SALMON
LightObjects[MT_EMERALD6].scale = emeralds_scale

LightObjects[MT_EMERALD7].color = SKINCOLOR_SILVER
LightObjects[MT_EMERALD7].scale = emeralds_scale

LightObjects[MT_EMW5_FLAMETHROWER] = {
    color = SKINCOLOR_ORANGE,
    scale = FU,
    alpha = FU/2,
    floorlight = true,
    stayondeath = true
}

LightObjects[MT_RING].scale = FU/3

coronasloaded = true
print("\131Eggmanway5 coronas definitions loaded.")
end

LoadCoronas()
addHook("AddonLoaded", LoadCoronas)