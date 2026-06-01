--load all files
local directory = { "/",
// Load Libraries and Freeslots //
    "Functions",
    "Freeslot_main",

// Retro Monitors //
	{ "FinalDemo/RetroMonitors/FinalDemo",

		"FDBoxCommon.lua", -- Final Demo Monitor Commonalities
        "FDRingBox.lua", -- Final Demo Ring Monitors
        "FDShoesBox.lua", -- Final Demo Super Sneakers Monitor
        "FDInvinBox.lua", -- Final Demo Invincibility Monitor
        "FD1upBox.lua", -- Final Demo 1up Monitor
        "FDBlueBox.lua", -- Final Demo Blue Shield Monitor
        "FDGreenBox.lua", -- Final Demo Green Shield Monitor
        "FDBlackBox.lua", -- Final Demo Black Shield Monitor
        "FDRedBox.lua", -- Final Demo Red Shield Monitor
        "FDYellowBox.lua", -- Final Demo Yellow (Attraction) Shield Monitor
        "FDWhiteBox.lua", -- Final Demo White (Whirlwind) Shield Monitor
        "FDMiscBoxCommon.lua", -- Final Demo Miscellaneous Monitor Commonalities
        "FDEggmanBox.lua", -- Final Demo Eggman Monitor
        "20GravityBox.lua", -- 2.0 Gravity Boots Monitor
        "FDMysteryBox.lua", -- Final Demo Mystery Monitor
        "FDTeleporterBox.lua", -- Final Demo Teleporter Monitor
        "20RecyclerBox.lua" -- 2.0 Recycler Monitor
	},

    { "FinalDemo/RetroMonitors",

        "FDShieldOrb.lua",
        "ShieldEra.lua",
        "FDInfernoShield.lua"
    },

// SRB2 The Past //
	{ "FinalDemo/SRB2 The Past",
		"Common/LUA_CCOM.txt",
        "Crawla Commander FD/LUA_OCOM.txt"
	},

// Final Demo System replica //
    { "FinalDemo",
        "Old Level Title.lua",
        "FD Weapon System.lua",
        "Old Thok.lua"
    },

// Eggman Way 5 Scripts //
	"LUA_XPDL",
    "Ammo",
    "Sound Definitions",
    "Enemies",
    "Egg Mobile",
    "Metal_Guardian",
    "Metal",
    "Brad",
    "Ambience_1",
    "Cutscenes",
    "Coronas",
    "Overrides",

// Retro Bosses //
	{ "FinalDemo/RetroBosses",
		"RetroBossesCommon", -- Retro Boss Commonalities
        "OldJetfumes", -- Old Jetfumes
        "Pre21EggMobileCommon", -- Pre-2.1 Egg Mobile Commonalities
        "OldSlimerGoop", -- Old Egg Slimer Goop
        "EggSlimerCommon", -- Egg Slimer Commonalities
        "Pre21EggSlimerCommon", -- Pre-2.1 Egg Slimer Commonalities
        "Behavior"
	},

    { "FinalDemo/RetroBosses/FinalDemo",
        "FDEggSlimer"
    }
}

local function load(dir, path)
	for i, v in ipairs(dir) do
		if i == 1 then continue end

		if type(v) == "string" then
			dofile(path..v)
		elseif type(v) == "table" then
			load(v, path..v[1].."/")
		end
	end
end

load(directory, "")