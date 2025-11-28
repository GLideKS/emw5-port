-- Retro Monitors - init.lua
-- Created by MIDIMan

local folder = ""

local dofolder = function(file)
    dofile(folder.."/"..file)
end

folder = "RetroMonitors/FinalDemo"

dofolder("FDBoxCommon.lua") -- Final Demo Monitor Commonalities
dofolder("FDRingBox.lua") -- Final Demo Ring Monitors
dofolder("FDShoesBox.lua") -- Final Demo Super Sneakers Monitor
dofolder("FDInvinBox.lua") -- Final Demo Invincibility Monitor
dofolder("FD1upBox.lua") -- Final Demo 1up Monitor
dofolder("FDBlueBox.lua") -- Final Demo Blue Shield Monitor
dofolder("FDGreenBox.lua") -- Final Demo Green Shield Monitor
dofolder("FDBlackBox.lua") -- Final Demo Black Shield Monitor
dofolder("FDRedBox.lua") -- Final Demo Red Shield Monitor
dofolder("FDYellowBox.lua") -- Final Demo Yellow (Attraction) Shield Monitor
dofolder("FDWhiteBox.lua") -- Final Demo White (Whirlwind) Shield Monitor
dofolder("FDMiscBoxCommon.lua") -- Final Demo Miscellaneous Monitor Commonalities
dofolder("FDEggmanBox.lua") -- Final Demo Eggman Monitor
dofolder("20GravityBox.lua") -- 2.0 Gravity Boots Monitor
dofolder("FDMysteryBox.lua") -- Final Demo Mystery Monitor
dofolder("FDTeleporterBox.lua") -- Final Demo Teleporter Monitor
dofolder("20RecyclerBox.lua") -- 2.0 Recycler Monitor

folder = "RetroMonitors"

dofolder("FDShieldOrb.lua")
dofolder("ShieldEra.lua")
dofolder("FDInfernoShield.lua")

folder = "Common"

dofolder("LUA_CCOM.txt")

folder = "Crawla Commander FD"

dofolder("LUA_OCOM.txt")

dofile("Legacy Replacements")
dofile("Old Level Title")
dofile("LUA_FLY1")
dofile("LUA_LNDF")
dofile("LUA_XPDL")
dofile("Some Brad Lua")