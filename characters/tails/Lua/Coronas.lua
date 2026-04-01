local coronasloaded = false

local function LoadCoronas() --Only load coronas if the system is loaded. This is not TsoURDt3rd coronas.
if coronasloaded then return end
if not LightingSystem_loaded then return end

local explodestuff = {
    color = SKINCOLOR_ORANGE,
    scale = FU*2,
    floorlight = true,
    alpha = FU/2,
    stayondeath = true,
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

LightObjects[MT_TAILSBOMB] = explodestuff
coronasloaded = true
end

LoadCoronas()
addHook("AddonLoaded", LoadCoronas)