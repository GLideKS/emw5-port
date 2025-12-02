-- Retro Monitors - init.lua
-- Created by MIDIMan

local folder = ""

local dofolder = function(file)
    dofile(folder.."/"..file)
end

folder = "FinalDemo/RetroMonitors/FinalDemo"

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

folder = "FinalDemo/RetroMonitors"

dofolder("FDShieldOrb.lua")
dofolder("ShieldEra.lua")
dofolder("FDInfernoShield.lua")

folder = "FinalDemo/Common"

dofolder("LUA_CCOM.txt")

folder = "FinalDemo/Crawla Commander FD"

dofolder("LUA_OCOM.txt")

folder = "FinalDemo"

dofolder("FDHud.lua")
dofolder("Old Level Title.lua")
dofolder("Legacy Replacements.lua")
dofolder("Slingitem.lua")

dofile("LUA_FLY1")
dofile("LUA_LNDF")
dofile("LUA_XPDL")
dofile("Some Brad Lua")