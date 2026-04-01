local coronasloaded = false

local function LoadCoronas() --Only load coronas if the system is loaded. This is not TsoURDt3rd coronas.
if coronasloaded then return end
if not LightingSystem_loaded then return end

LightObjects[MT_EMWESPIO_NINJASTAR] = { --Espio's Shouriken
    scale = FU/4,
	alpha = FU/3*2,
	zoffset = -5
}
coronasloaded = true
end

LoadCoronas()
addHook("AddonLoaded", LoadCoronas)