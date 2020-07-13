// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// █████ FOR USE WITH APEX SNEAK PREVIEW BRANCH ONLY! █████

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost

// empty name = name is extracted from class config

pistolArray = compileFinal str
[
	// Handguns
	["PM Pistol", "hgun_Pistol_01_F", 250],
	["P07 Pistol", "hgun_P07_F", 500],
	["P07 Pistol (Khaki)", "hgun_P07_khk_F", 500],
	["Rook-40 Pistol", "hgun_Rook40_F", 500],
	["ACP-C2 Pistol", "hgun_ACPC2_F", 750],
	["Zubr Revolver", "hgun_Pistol_heavy_02_F", 750],
	["4-five Pistol", "hgun_Pistol_heavy_01_F", 1000],
	["4-five Pistol (Green)", "hgun_Pistol_heavy_01_green_F", 1000, "noDLC"],
	["CZ 75 COMPACT", "CUP_hgun_Compact", 500],
	["CZ 75 PHANTOM", "CUP_hgun_Phantom", 500],
	["Desert Eagle", "CUP_hgun_Deagle", 500],
	["Glock 17", "CUP_hgun_Glock17", 500],
	// ["M1911", "CUP_7Rnd_45ACP_1911", 500], //Mags gehn nicht
	// ["M9", "CUP_15Rnd_9x19_M9", 500], //Mags gehn nicht
	["MAC-10", "CUP_hgun_Mac10", 500],
	["Makarow PM", "CUP_hgun_Makarov", 500],
	["Micro UZI PDW", "CUP_hgun_MicroUzi", 500],
	["Mk23 SOCCOM", "CUP_hgun_Mk23", 500],
	// ["MP7", "BWA3_MP7", 500],
	["MP7A1", "CUP_hgun_MP7", 500],
	// ["P2A1", "BWA3_P2A1", 500],
	// ["P8", "BWA3_P8", 500],
	["PB 6P9", "CUP_hgun_PB6P9", 500],
	["PMM-12", "CUP_hgun_PMM", 500],
	["Sa-61", "CUP_hgun_SA61", 500],
	["Taurus Tracker Model 455", "CUP_hgun_TaurusTracker455", 750],
	["Taurus Tracker Model 455 (Gold)", "CUP_hgun_TaurusTracker455_gold", 750],
	["TEC9", "CUP_hgun_TEC9", 900]
];

smgArray = compileFinal str
[
	["Ballistic Shield (M9)", "CUP_hgun_BallisticShield_Armed", 1000],
	["PDW2000 SMG", "hgun_PDW2000_F", 1000],
	["Protector SMG", "SMG_05_F", 1000],
	["Sting SMG", "SMG_02_F", 1250],
	["Vermin SMG", "SMG_01_F", 1250],
	
	["CZ SCORPION EVO 3", "CUP_smg_EVO", 1000],
	["MAC-10", "CUP_smg_Mac10", 1000],
	["MP5A5", "CUP_smg_MP5A5", 1000],
	["MP5SD6", "CUP_smg_MP5SD6", 1000],
	["MP7A1", "CUP_smg_MP7", 1000],
	["PP-19-01 Vityaz", "CUP_smg_vityaz", 1250],
	["PP-19-01 Vityaz VFG", "CUP_smg_vityaz_vfg", 1250],
	["PP-19 Bizon", "CUP_smg_bizon", 1250],
	["SA-61", "CUP_smg_SA61", 1250],
	["Saiga-9", "CUP_smg_saiga9", 1250],
	
	["ADR-97C (Black)", "SMG_03C_black", 1000],
	["ADR-97C (Camo)", "SMG_03C_camo", 1000],
	["ADR-97C (Hex)", "SMG_03C_hex", 1000],
	["ADR-97C (Khaki)", "SMG_03C_khaki", 1000],
	["ADR-97C TR (Black)", "SMG_03C_TR_black", 1250],
	["ADR-97C TR (Camo)", "SMG_03C_TR_camo", 1250],
	["ADR-97C TR (Hex)", "SMG_03C_TR_hex", 1250],
	["ADR-97C TR (Khaki)", "SMG_03C_TR_khaki", 1250],
	["ADR-97 (Black)", "SMG_03_black", 1250],
	["ADR-97 (Camo)", "SMG_03_camo", 1250],
	["ADR-97 (Hex)", "SMG_03_hex", 1250],
	["ADR-97 (Khaki)", "SMG_03_khaki", 1250],
	["ADR-97 TR (Black)", "SMG_03_TR_black", 1500],
	["ADR-97 TR (Camo)", "SMG_03_TR_camo", 1500],
	["ADR-97 TR (Hex)", "SMG_03_TR_hex", 1500],
	["ADR-97 TR (Khaki)", "SMG_03_TR_khaki", 1500]
];

gLauncherArray = compileFinal str //Need Check
[
	["6G30 Launcher", "CUP_glaunch_6G30", 10000],
	["M32", "CUP_glaunch_M32", 10000],
	["M79", "CUP_glaunch_M79", 10000],
	["Mk13", "CUP_glaunch_Mk13", 10000]
];

rifleArray = compileFinal str
[
	["Kozlice 12G (Sawedoff)", "sgun_HunterShotgun_01_sawedoff_F", 1000],
	["Kozlice 12G", "sgun_HunterShotgun_01_F", 1500],
	["Promet SG (Khaki)", "arifle_MSBS65_UBS_F", 3000],
	["Promet SG (Desert)", "arifle_MSBS65_UBS_sand_F", 3000],
	["Promet SG (Black)", "arifle_MSBS65_UBS_black_F", 3000],
	["Promet SG (Camo)", "arifle_MSBS65_UBS_camo_F", 3000],
	["AA-12", "CUP_sgun_AA12", 2000],
// 	["M1014", CUP_sgun_M1014", 1000],
// 	["M1014 (VFG)", CUP_sgun_M1014_vfg", 1000],
// 	["M1014 Entry Kugel munition zu OP", CUP_sgun_M1014_Entry", 1000]

	// Underwater Gun
	["SDAR Underwater Rifle", "arifle_SDAR_F", 1000],

	// Assault Rifles
	["Mk20 Carbine", "arifle_Mk20C_plain_F", 1500],
	["Mk20 Carbine (Camo)", "arifle_Mk20C_F", 1500],
	["Mk20 Rifle", "arifle_Mk20_plain_F", 2000],
	["Mk20 Rifle (Camo)", "arifle_Mk20_F", 2000],
	["Mk20 EGLM Rifle", "arifle_Mk20_GL_plain_F", 2500],
	["Mk20 EGLM Rifle (Camo)", "arifle_Mk20_GL_F", 2500],

	["TRG-20 Carbine", "arifle_TRG20_F", 1500],
	["TRG-21 Rifle ", "arifle_TRG21_F", 2000],
	["TRG-21 EGLM Rifle", "arifle_TRG21_GL_F", 2500],

// AK-101
	["AK-101", "CUP_arifle_AK101", 1500],
	["AK-101 (RIS mount)", "CUP_arifle_AK101_top_rail", 1500],
	["AK-101 (Zenitco/RIS)", "CUP_arifle_AK101_railed", 1500],
	["AK-101 GP-25", "CUP_arifle_AK101_GL", 2000],
	["AK-101 GP-25 (RIS mount)", "CUP_arifle_AK101_GL_top_rail", 2000],
	["AK-101 GP-25 (Zenitco/RIS)", "CUP_arifle_AK101_GL_railed", 2000],

	["AK-102", "CUP_arifle_AK102", 1650],
	["AK-102 (RIS mount)", "CUP_arifle_AK102_top_rail", 1650],
	["AK-102 (Zenitco/RIS)", "CUP_arifle_AK102_railed", 1650],

	["AK-103", "CUP_arifle_AK103", 1750],
	["AK-103 (RIS mount)", "CUP_arifle_AK103_top_rail", 1750],
	["AK-103 (Zenitco/RIS)", "CUP_arifle_AK103_railed", 1750],

	["AK-103 GP-25", "CUP_arifle_AK103_GL", 2100],
	["AK-103 GP-25 (RIS mount)", "CUP_arifle_AK103_GL_top_rail", 2100],
	["AK-103 GP-25 (Zenitco/RIS)", "CUP_arifle_AK103_GL_railed", 2100],

	["AK-104", "CUP_arifle_AK104", 1800],
	["AK-104 (RIS mount)", "CUP_arifle_AK104_top_rail", 1800],
	["AK-104 (Zenitco/RIS)", "CUP_arifle_AK104_railed", 1800],

	["AK-105", "CUP_arifle_AK105", 1850],
	["AK-105 (RIS mount)", "CUP_arifle_AK105_top_rail", 1850],
	["AK-105 (Zenitco/RIS)", "CUP_arifle_AK105_railed", 1850],

	["AK-107", "CUP_arifle_AK107", 1900],
	["AK-107 (RIS mount)", "CUP_arifle_AK107_top_rail", 1900],
	["AK-107 (Zenitco/RIS)", "CUP_arifle_AK107_railed", 1900],

	["AK-107 GP-25", "CUP_arifle_AK107_GL", 2200],
	["AK-107 GP-25 (RIS mount)", "CUP_arifle_AK107_GL_top_rail", 2200],
	["AK-107 GP-25 (Zenitco/RIS)", "CUP_arifle_AK107_GL_railed", 2200],

	["AK-108", "CUP_arifle_AK108", 1950],
	["AK-108 (RIS mount)", "CUP_CUP_arifle_AK108_railed", 1950],
	["AK-108 (Zenitco/RIS)", "arifle_AK108_top_rail", 1950],

	["AK-108 GP-25", "CUP_arifle_AK108_GL", 2300],
	["AK-108 GP-25 (RIS mount)", "CUP_arifle_AK108_GL_top_rail", 2300],
	["AK-108 GP-25 (Zenitco/RIS)", "CUP_arifle_AK108_GL_railed", 2300],

	["AK-109", "CUP_arifle_AK109", 2000],
	["AK-109 (RIS mount)", "CUP_arifle_AK109_top_rail", 2000],
	["AK-109 (Zenitco/RIS)", "CUP_arifle_AK109_railed", 2000],

	["AK-109 GP-25", "CUP_arifle_AK109_GL", 2400],
	["AK-109 GP-25 (RIS mount)", "CUP_arifle_AK109_GL_top_rail", 2400],
	["AK-109 GP-25 (Zenitco/RIS)", "CUP_arifle_AK109_GL_railed", 2400],

	["AUG A1", "CUP_arifle_AUG_A1", 2600],
	// ["AUG CQC (Black)", "SMA_AUG_A3_F", 1000],
	// ["AUG CQC blk (GL)", "SMA_AUG_EGLM", 1000],

	["CZ 805 BREN A1", "CUP_arifle_CZ805_A1", 2500],
	["CZ 805 BREN A1 (Black)", "CUP_arifle_CZ805_A1_blk", 2500],
	["CZ 805 BREN A1 G1 (Black)", "CUP_arifle_CZ805_GL_blk", 2900],
	["CZ 805 BREN A2 (Black)", "CUP_arifle_CZ805_A2_blk", 2500],

	["CZ 807 (14)", "CUP_CZ_BREN2_762_14", 2500],
	["CZ 807 (14) GL", "CUP_CZ_BREN2_762_14_GL", 2900],
	["CZ 807 (8)", "CUP_CZ_BREN2_762_8", 2500],
	["CZ BREN 2 (11)", "CUP_CZ_BREN2_556_11", 2500],
	["CZ BREN 2 (11) GL", "CUP_CZ_BREN2_556_11_GL", 2900],
	["CZ BREN 2 (14)", "CUP_CZ_BREN2_556_14", 2500],
	["CZ BREN 2 (14) GL", "CUP_CZ_BREN2_556_14_GL", 2900],
	["CZ BREN 2 (8)", "CUP_CZ_BREN2_556_8", 2500],

	["FAL 50.61", "CUP_arifle_FNFAL5061", 3300],
	["FAL 50.62", "CUP_arifle_FNFAL5062", 3400],
	["FAL 50.63", "CUP_arifle_FNFAL", 3500],
	["FAL 50.61 (RIS)", "CUP_arifle_FNFAL_railed", 3300],
	["FAL OSW", "CUP_arifle_FNFAL_OSW", 3600],

	["Fort-221", "CUP_arifle_Fort221", 3200],
	["Fort-222", "CUP_arifle_Fort222", 3300],
	["Fort-224", "CUP_arifle_Fort224", 3400],
	["Fort-224 (Grip)", "CUP_arifle_Fort224_Grippod", 3450],

	["G27", "BWA3_G27", 2000],
	["G27 AG40-2", "BWA3_G27_AG40v", 2000], 

	["G28 E2", "BWA3_G28", 2500],
	["G28 E2 (Patrol)", "BWA3_G28_Patrol", 2500],

	["G36", "CUP_arifle_G36A", 2500],
	["G36 (RIS/Grip)", "CUP_arifle_G36A_RIS", 2500],
	["G36A1", "BWA3_G36A1", 2600],
	["G36A1 AG40-2", "BWA3_G36A1_AG40", 3200],
	["G36A2", "BWA3_G36A2", 2700],
	["G36A2 AG40-2", "BWA3_G36A2_AG40", 3300],
	["G36A3", "BWA3_G36A3", 2800],
	["G36A3 AG40-2", "BWA3_G36A3_AG40", 3400],
	["G36KA4", "BWA3_G36KA4", 2900],
	["G38", "BWA3_G38", 3000],
	["G38 AG40-2", "BWA3_G38_AG40", 3500],
	["G38C", "BWA3_G38C", 3100],
	["G3A3", "CUP_arifle_G3A3_ris", 3200],
	["HK416 (Woodland)", "CUP_arifle_HK416_Wood", 2000],
	["HK416 CQC", "CUP_arifle_HK416_CQB_Black", 2000],
	["HK416 CQC M203", "CUP_arifle_HK416_CQB_M203_Black", 3500],
	["HK416 CQC M320", "CUP_arifle_HK416_CQB_AG36", 3000],
	["HK416 M203", "CUP_arifle_HK416_M203_Black", 2300],
	["HK416 M320", "CUP_arifle_HK416_AGL_Black", 3300],
	["HK417 CQC", "CUP_arifle_HK417_12", 2500],
	["HK417 CQC M203", "CUP_arifle_HK417_12_M203", 3500],
	["HK417 CQC M320", "CUP_arifle_HK417_12_AG36", 3300],
	["L129a1", "CUP_srifle_L129A1", 2500],
	["L129a1 w/HG", "CUP_srifle_L129A1_HG", 3200],
	["L85A2 (RIS)", "CUP_arifle_L85A2_NG", 2500],
	["L85A2 (RIS/GRIP)", "CUP_arifle_L85A2_G", 2500],
	["L85A2 L123A2 GL", "CUP_arifle_L85A2_GL", 3500],
	["M16A1", "CUP_arifle_M16A", 2500],
	["M16A1 M203 (Flaming shark)", "CUP_arifle_M16A1GL_FS", 3500],
	["M16A2", "CUP_arifle_M16A2", 2600],
	["M16A2 M203", "CUP_arifle_M16A2_GL", 3600],
	["M16A4", "CUP_arifle_M16A4_Base", 2800],
	["M16A4 M203", "CUP_arifle_M16A4_GL", 3800],
	["M4 SBR (OD)", "CUP_arifle_SBR_od", 2900],
	["M4A1", "CUP_arifle_M4A1_black", 2600],
	["M4A1 (Grip)", "CUP_arifle_M4A3_black", 2800],
	["M4A1 M203", "CUP_arifle_M4A1_BUIS_GL", 3300],
	["M4A1 M203 (Carry handle)", "CUP_arifle_M4A1_GL_carryhandle", 3500],
	["Mk 16 CQC (Grip)", "CUP_arifle_Mk16_CQC_FG", 2200],
	["Mk 16 CQC (Surefire)", "CUP_arifle_Mk16_CQC_SFG", 2300],
	["Mk 16 CQC EGLM", "CUP_arifle_Mk16_CQC_EGLM", 3000],
	["Mk 16 SV", "CUP_arifle_Mk16_SV", 2800],
	["MK 17 CQC", "CUP_arifle_Mk17_CQC", 2500],
	["MK 17 CQC (Grip)", "CUP_arifle_Mk17_CQC_FG", 2700],
	["MK 17 CQC (Surefire)", "CUP_arifle_Mk17_CQC_SFG", 2800],
	["Mk 17 CQC EGLM", "CUP_arifle_Mk17_CQC_EGLM", 3300],
	["MK 17 SV", "CUP_arifle_Mk20", 2900],
	["Mk 18 Mod 1", "CUP_arifle_mk18_black", 3200],
	["Mk 1 Mod 1 M203", "CUP_arifle_mk18_m203_black", 3900],
	["OTs-14-1A-01 Groza", "CUP_arifle_OTS14_GROZA_762_Grip", 2900],
	["OTs-14-1A Groza GL", "CUP_arifle_OTS14_GROZA_762_GL", 3600],
	["RPK-74", "CUP_arifle_RPK74_45", 3600],
	["RPK-74 (RIS)", "CUP_arifle_RPK74_45_top_rail", 3600],
	["Sa-58P", "CUP_arifle_Sa58P", 2000],
	["Sa-58P (RIS)", "CUP_arifle_Sa58RIS2", 2000],
	["Sa-58P G1 GL (RIS)", "CUP_arifle_Sa58RIS2_gl", 3100],
	["Saiga 12K (RIS)", "CUP_sgun_Saiga12K_top_rail", 2000],
	["Saiga MK03", "CUP_arifle_SAIGA_MK03", 2400],
	// ["SAR-21", "SMA_SAR21_F", 1000],
	// ["SKS SG Works (Tan)", "SMA_SKS_TAN_F", 1000],
	["SR-3M Vikhr (RIS/Grip)", "CUP_arifle_SR3M_Vikhr_VFG_top_rail", 2800],
	// ["Tavor 21", "SMA_Tavor_F", 1000],
	// ["Tavor CTAR blk", "SMA_CTARBLK_F", 1000],
	["Type 56-2 (RIS)", "CUP_arifle_TYPE_56_2_top_rail", 1000],
	["X95", "CUP_arifle_X95", 1000],
	["XM16E1", "CUP_arifle_XM16E1", 1000],
	["XM8 Carbine", "CUP_arifle_XM8_Carbine", 1000],
	["XM8 Carbine (RIS)", "CUP_arifle_XM8_Railed", 1000],
	["XM8 Carbine XM320 GL", "CUP_arifle_XM8_Carbine_GL", 1000],
	["XM8 SAW", "CUP_arifle_xm8_SAW", 1000],
	["XM8 Sharpshooter", "CUP_arifle_xm8_sharpshooter", 1000],

	["Katiba Carbine", "arifle_Katiba_C_F", 1500],
	["Katiba Rifle", "arifle_Katiba_F", 2000],
	["Katiba GL Rifle", "arifle_Katiba_GL_F", 2500],

	["MX Carbine", "arifle_MXC_F", 1500],
	["MX Carbine (Black)", "arifle_MXC_Black_F", 1500],
	["MX Carbine (Khaki)", "arifle_MXC_khk_F", 1500, "noDLC"],
	["MX Rifle", "arifle_MX_F", 2000],
	["MX Rifle (Black)", "arifle_MX_Black_F", 2000],
	["MX Rifle (Khaki)", "arifle_MX_khk_F", 2000, "noDLC"],
	["MX 3GL Rifle", "arifle_MX_GL_F", 2500],
	["MX 3GL Rifle (Black)", "arifle_MX_GL_Black_F", 2500],
	["MX 3GL Rifle (Khaki)", "arifle_MX_GL_khk_F", 2500, "noDLC"],

	["SPAR-16 Rifle", "arifle_SPAR_01_blk_F", 2000],
	["SPAR-16 Rifle (Khaki)", "arifle_SPAR_01_khk_F", 2000],
	["SPAR-16 Rifle (Sand)", "arifle_SPAR_01_snd_F", 2000],
	["SPAR-16 GL Rifle", "arifle_SPAR_01_GL_blk_F", 2500],
	["SPAR-16 GL Rifle (Khaki)", "arifle_SPAR_01_GL_khk_F", 2500],
	["SPAR-16 GL Rifle (Sand)", "arifle_SPAR_01_GL_snd_F", 2500],

	["CAR-95 Rifle", "arifle_CTAR_blk_F", 2000],
	["CAR-95 Rifle (Hex)", "arifle_CTAR_hex_F", 2000],
	["CAR-95 Rifle (G Hex)", "arifle_CTAR_ghex_F", 2000],
	["CAR-95 GL Rifle", "arifle_CTAR_GL_blk_F", 2500],
	["CAR-95 GL Rifle (Hex)", "arifle_CTAR_GL_hex_F", 2500],
	["CAR-95 GL Rifle (G Hex)", "arifle_CTAR_GL_ghex_F", 2500],
	["Type 115 Stealth Rifle", "arifle_ARX_blk_F", 3000],
	["Type 115 Stealth Rifle (Hex)", "arifle_ARX_hex_F", 3000],
	["Type 115 Stealth Rifle (G Hex)", "arifle_ARX_ghex_F", 3000],
	
	["Promet (Khaki)", "arifle_MSBS65_F", 2100],
	["Promet (Desert)", "arifle_MSBS65_sand_F", 2100],
	["Promet (Black)", "arifle_MSBS65_black_F", 2100],
	["Promet (Camo)", "arifle_MSBS65_camo_F", 2100],
	["Promet GL (Khaki)", "arifle_MSBS65_GL_F", 2500],
	["Promet GL (Desert)", "arifle_MSBS65_GL_sand_F", 2500],
	["Promet GL (Black)", "arifle_MSBS65_GL_black_F", 2500],
	["Promet GL (Camo)", "arifle_MSBS65_GL_camo_F", 2500],
	["Promet MR (Khaki)", "arifle_MSBS65_Mark_F", 2200],
	["Promet MR (Desert)", "arifle_MSBS65_Mark_sand_F", 2200],
	["Promet MR (Black)", "arifle_MSBS65_Mark_black_F", 2200],
	["Promet MR (Camo)", "arifle_MSBS65_Mark_camo_F", 2200],
	["Promet SG (Khaki)", "arifle_MSBS65_UBS_F", 3000],
	["Promet SG (Desert)", "arifle_MSBS65_UBS_sand_F", 3000],
	["Promet SG (Black)", "arifle_MSBS65_UBS_black_F", 3000],
	["Promet SG (Camo)", "arifle_MSBS65_UBS_camo_F", 3000],

	["AKS-74U Carbine", "arifle_AKS_F", 1500],
	["AKM Rifle", "arifle_AKM_F", 2000],
	
	["AKU-12 Rifle", "arifle_AK12U_F", 2000],
	["AKU-12 Rifle (Arid)", "arifle_AK12U_arid_F", 2000],
	["AKU-12 Rifle (Lush)", "arifle_AK12U_lush_F", 2000],
	
	["AK-12 Rifle", "arifle_AK12_F", 2050],
	["AK-12 Rifle (Arid)", "arifle_AK12_arid_F", 2050, "noDLC"],
	["AK-12 Rifle (Lush)", "arifle_AK12_lush_F", 2050, "noDLC"],
	["AK-12 GL Rifle", "arifle_AK12_GL_F", 3000],
	["AK-12 GL Rifle (Arid)", "arifle_AK12_GL_arid_F", 3000, "noDLC"],
	["AK-12 GL Rifle (Lush)", "arifle_AK12_GL_lush_F", 3000, "noDLC"],

	// Marksman Rifles
	["MXM Rifle", "arifle_MXM_F", 3000],
	["MXM Rifle (Black)", "arifle_MXM_Black_F", 3000],
	["MXM Rifle (Khaki)", "arifle_MXM_khk_F", 3000, "noDLC"],
	["Rahim DMR Rifle", "srifle_DMR_01_F", 3750],
	["Mk18 ABR Rifle", "srifle_EBR_F", 4500],
	
	//MODS
	// ["", "arifle_AK12_GL_F", 3000],
	["Lee Enfield", "CUP_srifle_LeeEnfield_rail", 4000],
	["CZ 550 (picatinny rail)", "CUP_srifle_CZ550_rail", 4000],
	["CZ 584", "CUP_sgun_CZ584", 4200],
	["CZ 584 RIS", "CUP_sgun_CZ584_RIS", 4400],
	["CZ 750", "CUP_srifle_CZ750", 4600],
	["AS50", "CUP_srifle_AS50", 16000],
	["AS VAL", "CUP_arifle_AS_VAL", 10000],
	["AS VAL (Grip)", "CUP_arifle_AS_VAL_VFG", 12000],
	["AS VAL (RIS mount)", "CUP_arifle_AS_VAL_top_rail", 10000],
	["AS VAL (RIS mount/Grip)", "CUP_arifle_AS_VAL_VFG_top_rail", 12000],
	["G22 (Desert)", "CUP_srifle_G22_des", 6000],
	["HK417 DMR", "CUP_arifle_HK417_20", 6000],
	["KSVK", "CUP_srifle_ksvk", 18000],
	["L82A2 LSW", "CUP_arifle_L86A2", 12000],
	["M107", "CUP_srifle_M107_Base", 14000],
	["M110", "CUP_srifle_m110_kac_black", 4000],
	["M14", "CUP_srifle_M14", 4000],
	["M14 DMR", "CUP_srifle_M14_DMR", 4000],
	["M24", "CUP_srifle_M24_wdl", 10000],
	["M27 IAR", "CUP_arifle_HK_M27_VFG", 7000],
	["M27 M320", "CUP_arifle_HK_M27_AG36", 7500],
	["L115A3 LRR (AWM)", "CUP_srifle_AWM_wdl", 11000],
	["M40A3", "CUP_srifle_M40A3", 8000],
	["MG 36", "CUP_arifle_MG36", 6500],
	["Mk 12 SPR", "CUP_srifle_Mk12SPR", 4500],
	["SVD", "CUP_srifle_SVD", 9000],
	["SVD (RIS)", "CUP_srifle_SVD_wdl_top_rail", 9000],
	["VSS Vintorez (RIS/Grip)", "CUP_srifle_VSSVintorez_VFG_top_rail", 8000],

	// DLC
	["CMR-76 Stealth Rifle", "srifle_DMR_07_blk_F", 4000],
	["CMR-76 Stealth Rifle (Hex)", "srifle_DMR_07_hex_F", 4000],
	["CMR-76 Stealth Rifle (G Hex)", "srifle_DMR_07_ghex_F", 4000],
	["SPAR-17 Rifle", "arifle_SPAR_03_blk_F", 4500],
	["SPAR-17 Rifle (Khaki)", "arifle_SPAR_03_khk_F", 4500],
	["SPAR-17 Rifle (Sand)", "arifle_SPAR_03_snd_F", 4500],

	["Mk14 Rifle (Camo)", "srifle_DMR_06_camo_F", 5000],
	["Mk14 Rifle (Olive)", "srifle_DMR_06_olive_F", 5000],
	["Mk14 Rifle (Classic)", "srifle_DMR_06_hunter_F", 5000, "noDLC"],
	["Mk-I EMR Rifle", "srifle_DMR_03_F", 5000],
	["Mk-I EMR Rifle (Camo)", "srifle_DMR_03_multicam_F", 5000],
	["Mk-I EMR Rifle (Khaki)", "srifle_DMR_03_khaki_F", 5000],
	["Mk-I EMR Rifle (Sand)", "srifle_DMR_03_tan_F", 5000],
	["Mk-I EMR Rifle (Woodland)", "srifle_DMR_03_woodland_F", 5000],
	["MAR-10 Rifle", "srifle_DMR_02_F", 7500],
	["MAR-10 Rifle (Camo)", "srifle_DMR_02_camo_F", 7500],
	["MAR-10 Rifle (Sand)", "srifle_DMR_02_sniper_F", 7500],
	["Cyrus Rifle", "srifle_DMR_05_blk_F", 7500],
	["Cyrus Rifle (Hex)", "srifle_DMR_05_hex_F", 7500],
	["Cyrus Rifle (Tan)", "srifle_DMR_05_tan_f", 7500],

	// Sniper Rifles
	["M320 LRR Sniper", "srifle_LRR_LRPS_F", 10000],
	["M320 LRR Sniper (Camo)", "srifle_LRR_camo_LRPS_F", 12000],
	["M320 LRR Sniper (Tropic)", "srifle_LRR_tna_LRPS_F", 12000],
	["GM6 Lynx Sniper", "srifle_GM6_LRPS_F", 12500],
	["GM6 Lynx Sniper (Camo)", "srifle_GM6_camo_LRPS_F", 15000],
	["GM6 Lynx Sniper (G Hex)", "srifle_GM6_ghex_LRPS_F", 15000],

	["ASP-1 Kir Rifle", "srifle_DMR_04_F", 5000],
	["ASP-1 Kir Rifle (Tan)", "srifle_DMR_04_tan_F", 5000]
];

lmgArray = compileFinal str
[
	["MX SW LMG", "arifle_MX_SW_F", 3000],
	["MX SW LMG (Black)", "arifle_MX_SW_Black_F", 3250],
	["MX SW LMG (Khaki)", "arifle_MX_SW_khk_F", 3250, "noDLC"],
	["Mk200 LMG", "LMG_Mk200_F", 4000],
	["Mk200 LMG (Black)", "LMG_Mk200_black_F", 4000, "noDLC"],
	["Zafir LMG", "LMG_Zafir_F", 5000],

	["SPAR-16S LMG", "arifle_SPAR_02_blk_F", 3000],
	["SPAR-16S LMG (Khaki)", "arifle_SPAR_02_khk_F", 3000],
	["SPAR-16S LMG (Sand)", "arifle_SPAR_02_snd_F", 3000],
	["CAR-95-1 LMG", "arifle_CTARS_blk_F", 3000],
	["CAR-95-1 LMG (Hex)", "arifle_CTARS_hex_F", 3000],
	["CAR-95-1 LMG (G Hex)", "arifle_CTARS_ghex_F", 3000],
	["LIM-85 LMG", "LMG_03_F", 3500],
	
	["RPK-12 (Gray)", "arifle_RPK12_F", 6000],
	["RPK-12 (Arid)", "arifle_RPK12_arid_F", 6000],
	["RPK-12 (Lush)", "arifle_RPK12_lush_F", 6000],

	["SPMG MMG (Sand)", "MMG_02_sand_F", 7500],
	["SPMG MMG (MTP)", "MMG_02_camo_F", 7500],
	["SPMG MMG (Black)", "MMG_02_black_F", 7500],
	["Navid MMG (Tan)", "MMG_01_tan_F", 10000],
	["Navid MMG (Hex)", "MMG_01_hex_F", 10000],
	
	["L110A2", "CUP_lmg_L110A1", 7500],
	["L7A2 GPMG", "CUP_lmg_L7A2_Flat", 8500],
	["M240", "CUP_lmg_M240", 7500],
	["M249 (Squantoon Special)", "CUP_lmg_m249_SQuantoon", 7500],
	["M249E2", "CUP_lmg_M249_E2", 7500],
	["M60", "CUP_lmg_M60", 7500],
	["M60E4", "CUP_lmg_M60E4", 7500],
	["MAG 60.20 (RIS)", "CUP_lmg_FNMAG_RIS", 7500],
	["MG3 (RIS)", "CUP_lmg_MG3_rail", 7500],
	["MG4", "BWA3_MG4", 7500],
	["MG5", "BWA3_MG5", 7500],
	["Minimi (RIS/Grip)", "CUP_lmg_minimi_railed", 7500],
	["Mk48 Mod 0", "CUP_lmg_Mk48", 7500],
	["PKM", "CUP_lmg_PKM", 7500],
	["PKP (Woodland)", "CUP_lmg_Pecheneg_woodland", 8500],
	["RPK", "CUP_arifle_RPK74", 7500],
	["UK-59", "CUP_lmg_UK59", 7500]
];

launcherArray = compileFinal str
[
	["RPG-7", "launch_RPG7_F", 4500],
	["RPG-42 Alamut", "launch_RPG32_F", 5000],
	["RPG-42 Alamut (G Hex)", "launch_RPG32_ghex_F", 5000, "noDLC"],
	["RPG-42 Alamut (Green)", "launch_RPG32_green_F", 5000, "noDLC"],
	["PCML", "launch_NLAW_F", 7000],
	["MAAWS Mk4 Mod 0 (Green)", "launch_MRAWS_green_rail_F", 5250, "noDLC"], // RPG-42 and MAAWS are similar, but MAAWS has longer range
	["MAAWS Mk4 Mod 0 (Olive)", "launch_MRAWS_olive_rail_F", 5250, "noDLC"],
	["MAAWS Mk4 Mod 0 (Sand)", "launch_MRAWS_sand_rail_F", 5250, "noDLC"],
	["MAAWS Mk4 Mod 1 (Green)", "launch_MRAWS_green_F", 8500, "noDLC"], // MAAWS Mod 1 has nightvision and laser rangefinder, while Mod 0 doesn't
	["MAAWS Mk4 Mod 1 (Olive)", "launch_MRAWS_olive_F", 8000, "noDLC"],
	["MAAWS Mk4 Mod 1 (Sand)", "launch_MRAWS_sand_F", 8500, "noDLC"],
	["9M135 Vorona (Brown)", "launch_O_Vorona_brown_F", 15000, "noDLC"],
	["9M135 Vorona (Green)", "launch_O_Vorona_green_F", 15000, "noDLC"],
	["Titan MPRL Compact (Sand)", "launch_Titan_short_F", 15000],
	["Titan MPRL Compact (Coyote)", "launch_O_Titan_short_F", 15000],
	["Titan MPRL Compact (Olive)", "launch_I_Titan_short_F", 15000],
	["Titan MPRL Compact (Tropic)", "launch_B_Titan_short_tna_F", 15000, "noDLC"],
	["Titan MPRL Compact (G Hex)", "launch_O_Titan_short_ghex_F", 15000, "noDLC"],
	["Titan MPRL AA (Sand)", "launch_Titan_F", 8000],
	["Titan MPRL AA (Hex)", "launch_O_Titan_F", 8000],
	["Titan MPRL AA (Digi)", "launch_I_Titan_F", 8000],
	["Titan MPRL AA (Tropic)", "launch_B_Titan_tna_F", 8000, "noDLC"],
	["Titan MPRL AA (G Hex)", "launch_O_Titan_ghex_F", 8000, "noDLC"],
	["Titan MPRL AA (Olive)", "launch_B_Titan_olive_F", 8000, "noDLC"],
	["Titan MPRL AA (BW)", "launch_I_Titan_eaf_F", 8000, "noDLC"],
	
	["9K32 Strela-2", "CUP_launch_9K32Strela", 8000],
	["Bunkerfaust", "BWA3_Bunkerfaust_Loaded", 8000], //geht nicht
	["FGM-148 Javelin", "CUP_launch_Javelin", 8000],
	["FIM-92F Stinger", "CUP_launch_FIM92Stinger", 8000], //geht nicht
	["Igla 9K38", "CUP_launch_Igla", 8000], //geht nicht
	["M136 Granatenwerfer", "CUP_launch_M136", 8000], //geht nicht
	["M47 Dragon", "CUP_launch_M47", 8000],
	["M72A6", "CUP_launch_M72A6", 8000], //geht nicht
	["M72A6 (Special)", "CUP_launch_M72A6_Special", 8000], //geht nicht
	["Metis AT-13", "CUP_launch_Metis", 8000],
	["Mk153 Mod 0 SMAW", "CUP_launch_Mk153Mod0", 8000],
	["Mk153 Mod 0 SMAW (Black)", "CUP_launch_Mk153Mod0_blk", 8000],
	["Panzerfaust 3", "BWA3_PzF3_Tandem_Loaded", 8000], //geht nicht
	["RGW 90", "BWA3_RGW90_Loaded", 8000], //geht nicht
	["RPG-7V2 Raketenwerfer", "CUP_launch_RPG7V", 8000],
	["RPG18", "CUP_launch_RPG18", 8000] //geht nicht
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray + call gLauncherArray);

staticGunsArray = compileFinal str
[
	["L111A1 Minitripod", "CUP_B_L111A1_MiniTripod_BAF_MPT", 30000],
	["L111A1 Machine Gun", "CUP_B_L111A1_BAF_DDPM", 30000],
	["Podnos 2B14", "CUP_B_2b14_82mm_ACR", 150000],
	["RBS 70", "CUP_B_RBS70_ACR", 40000],
	["AGS-30", "CUP_B_AGS_ACR", 40000],
	["DShKM", "CUP_B_DSHKM_ACR", 30000],
	["DShKM Minitripod", "CUP_B_DSHkM_MiniTriPod_CDF", 30000],
	["L16A2 81mm Mortar", "CUP_B_L16A2_BAF_DDPM", 225000],
	["ZU-23", "CUP_B_ZU23_CDF", 50000],
	["D-30", "CUP_B_D30_CDF", 30000],
	["IGLA Aircraft Defense", "CUP_B_Igla_AA_pod_CDF", 40000],
	["SPG-9", "CUP_B_SPG9_CDF", 30000],
	["M2HD Minitripod", "CUP_B_M2StaticMG_MiniTripod_US", 35000],
	["M2 Machine Gun", "CUP_B_M2StaticMG_US", 30000],
	["M252 81mm Mortar", "CUP_B_M252_US", 225000],
	["M119", "CUP_B_M119_US", 40000],
	["D-30 AT", "CUP_O_D30_AT_TK_INS", 40000],
	["KORD", "CUP_O_KORD_high_RU", 40000],
	["KORD Minitripod", "CUP_O_KORD_RU", 40000],
	["Metris AT-13", "CUP_O_Metis_RU", 40000],
	["M2 HMG .50 High tripod", "I_G_HMG_02_F", 35000], //OLDMAN DLC
	["M2 HMG .50 High tripod", "I_G_HMG_02_high_F", 30000] //OLDMAN DLC
];

throwputArray = compileFinal str
[
	["RGN Mini Grenade", "MiniGrenade", 500],
	["RGO Frag Grenade", "HandGrenade", 1000],
	// ["Flashbang Grenade", "HandGrenade_Stone", 15000], still working on it
	["APERS Tripwire Mine", "APERSTripMine_Wire_Mag", 2000],
	["APERS Bounding Mine", "APERSBoundingMine_Range_Mag", 2500],
	["APERS Mine", "APERSMine_Range_Mag", 3000],
	["Claymore Charge", "ClaymoreDirectionalMine_Remote_Mag", 3500],
	["M6 SLAM Mine", "SLAMDirectionalMine_Wire_Mag", 3500],
	["AT Mine", "ATMine_Range_Mag", 4000],
	["Training Mine", "TrainingMine_Mag", 4000],
	["APERS MineDispenser", "APERSMineDispenser_Mag", 8000],
	["Explosive Charge", "DemoCharge_Remote_Mag", 4500],
	["Explosive Satchel", "SatchelCharge_Remote_Mag", 5000],
	["Smoke Grenade (White)", "SmokeShell", 500],
	["Smoke Grenade (Purple)", "SmokeShellPurple", 500],
	["Smoke Grenade (Blue)", "SmokeShellBlue", 500],
	["Toxic Grenade (Green)", "SmokeShellGreen", 2500],
	["Tear Gas Grenade (Yellow)", "SmokeShellYellow", 1500],
	["Incendiary Grenade (Red)", "SmokeShellRed", 5500],
	["Smoke Grenade (Orange)", "SmokeShellOrange", 500]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
	["9mm 10Rnd Mag", "10Rnd_9x21_Mag", 50],
	["9mm 16Rnd Mag", "16Rnd_9x21_Mag", 100],
	["9mm 30Rnd Mag", "30Rnd_9x21_Mag", 150],
	["9mm 30Rnd SMG Mag", "30Rnd_9x21_Mag_SMG_02", 150],
	[".45 ACP 6Rnd Cylinder", "6Rnd_45ACP_Cylinder", 50],
	[".45 ACP 9Rnd Mag", "9Rnd_45ACP_Mag", 100],
	[".45 ACP 11Rnd Mag", "11Rnd_45ACP_Mag", 150],
	[".45 ACP 30Rnd Vermin Mag", "30Rnd_45ACP_MAG_SMG_01", 200],
	[".45 ACP 30Rnd Vermin Mag T-G", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 150],
	["12 Gauge 2Rnd Pellets", "2Rnd_12Gauge_Pellets", 150],
	["12 Gauge 2Rnd Slug", "2Rnd_12Gauge_Slug", 150],
	["12 Gauge 6Rnd Pellets", "6Rnd_12Gauge_Pellets", 300],
	["12 Gauge 6Rnd Slug)", "6Rnd_12Gauge_Slug", 300],
	["5.45mm 30Rnd Mag", "30Rnd_545x39_Mag_F", 200],
	["5.45mm 30Rnd Mag T-Y", "30Rnd_545x39_Mag_Tracer_F", 150],
	["5.45mm 30Rnd Mag T-R", "30Rnd_545x39_Mag_Tracer_Green_F", 150],
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 110],
	["5.56mm 30Rnd Mag", "30Rnd_556x45_Stanag", 200],
	["5.56mm 30Rnd Mag T-G", "30Rnd_556x45_Stanag_Tracer_Green", 150],
	["5.56mm 30Rnd Mag T-Y", "30Rnd_556x45_Stanag_Tracer_Yellow", 150],
	["5.56mm 30Rnd Mag T-R", "30Rnd_556x45_Stanag_Tracer_Red", 150],
	["5.56mm 30Rnd Mag (Sand)", "30Rnd_556x45_Stanag_Sand", 250],
	["5.56mm 30Rnd Mag (Sand) T-G", "30Rnd_556x45_Stanag_Sand_Tracer_Green", 200],
	["5.56mm 30Rnd Mag (Sand) T-Y", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow", 200],
	["5.56mm 30Rnd Mag (Sand) T-R", "30Rnd_556x45_Stanag_Sand_Tracer_Red", 200],
	["5.56mm 150Rnd Mag", "150Rnd_556x45_Drum_Mag_F", 1000],
	["5.56mm 150Rnd Mag T-R", "150Rnd_556x45_Drum_Mag_Tracer_F", 750],
	["5.56mm 150Rnd Mag (Khaki)", "150Rnd_556x45_Drum_Green_Mag_F", 1100],
	["5.56mm 150Rnd Mag (Khaki) T-R", "150Rnd_556x45_Drum_Green_Mag_Tracer_F", 850],
	["5.56mm 150Rnd Mag (Sand)", "150Rnd_556x45_Drum_Sand_Mag_F", 1100],
	["5.56mm 150Rnd Mag (Sand) T-R", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F", 850],
	["5.56mm 200Rnd Box", "200Rnd_556x45_Box_F", 1250],
	["5.56mm 200Rnd Box T-Y", "200Rnd_556x45_Box_Tracer_F", 1000],
	["5.56mm 200Rnd Box T-R", "200Rnd_556x45_Box_Tracer_Red_F", 1000],
	["5.7mm 50Rnd SMG Mag", "50Rnd_570x28_SMG_03", 200],
	["5.8mm 30Rnd Mag", "30Rnd_580x42_Mag_F", 200],
	["5.8mm 30Rnd Mag T-G", "30Rnd_580x42_Mag_Tracer_F", 150],
	["5.8mm 100Rnd Mag", "100Rnd_580x42_Mag_F", 1000],
	["5.8mm 100Rnd Mag T-G", "100Rnd_580x42_Mag_Tracer_F", 750],
	["5.8mm 100Rnd Mag (Hex)", "100Rnd_580x42_hex_Mag_F", 1100],
	["5.8mm 100Rnd Mag (Hex) T-G", "100Rnd_580x42_hex_Mag_Tracer_F", 850],
	["5.8mm 100Rnd Mag (G Hex)", "100Rnd_580x42_ghex_Mag_F", 1100],
	["5.8mm 100Rnd Mag (G Hex) T-G", "100Rnd_580x42_ghex_Mag_Tracer_F", 850],
	["6.5mm 20Rnd CMR Mag", "20Rnd_650x39_Cased_Mag_F", 150],
	["6.5mm 30Rnd Promet Mag", "30Rnd_65x39_caseless_msbs_mag", 200],
	["6.5mm 30Rnd Promet Mag T-R", "30Rnd_65x39_caseless_msbs_mag_Tracer", 150],
	["6.5mm 30Rnd Katiba Mag", "30Rnd_65x39_caseless_green", 200],
	["6.5mm 30Rnd Katiba Mag T-G", "30Rnd_65x39_caseless_green_mag_Tracer", 150],
	["6.5mm 30Rnd MX Mag (Sand)", "30Rnd_65x39_caseless_mag", 200],
	["6.5mm 30Rnd MX Mag (Sand) T-R", "30Rnd_65x39_caseless_mag_Tracer", 150],
	["6.5mm 30Rnd MX Mag (Black)", "30Rnd_65x39_caseless_black_mag", 250],
	["6.5mm 30Rnd MX Mag (Black) T-R", "30Rnd_65x39_caseless_black_mag_Tracer", 250],
	["6.5mm 30Rnd MX Mag (Khaki)", "30Rnd_65x39_caseless_khaki_mag", 250],
	["6.5mm 30Rnd MX Mag (Khaki) T-R", "30Rnd_65x39_caseless_khaki_mag_Tracer", 250],
	["6.5mm 100Rnd MX Mag (Sand)", "100Rnd_65x39_caseless_mag", 750],
	["6.5mm 100Rnd MX Mag (Sand) T-R", "100Rnd_65x39_caseless_mag_Tracer", 500],
	["6.5mm 100Rnd MX Mag (Black)", "100Rnd_65x39_caseless_black_mag", 850],
	["6.5mm 100Rnd MX Mag (Black) T-R", "100Rnd_65x39_caseless_black_mag_tracer", 600],
	["6.5mm 100Rnd MX Mag (Khaki)", "100Rnd_65x39_caseless_khaki_mag", 850],
	["6.5mm 100Rnd MX Mag (Khaki) T-R", "100Rnd_65x39_caseless_khaki_mag_tracer", 600],
	["6.5mm 200Rnd Belt Case", "200Rnd_65x39_cased_Box", 1500],
	["6.5mm 200Rnd Belt Case T-Y", "200Rnd_65x39_cased_Box_Tracer", 1250],
	["6.5mm 200Rnd Belt Case T-R", "200Rnd_65x39_cased_Box_Tracer_Red", 1250],
	["7.62mm 10Rnd Rahim Mag", "10Rnd_762x54_Mag", 150],
	["7.62mm 20Rnd Mag", "20Rnd_762x51_Mag", 250],
	["7.62mm 30Rnd AKM Mag", "30Rnd_762x39_Mag_F", 200],
	["7.62mm 30Rnd AKM Mag T-Y", "30Rnd_762x39_Mag_Tracer_F", 150],
	["7.62mm 30Rnd AKM Mag T-G", "30Rnd_762x39_Mag_Tracer_Green_F", 150],
	["7.62mm 30Rnd AK12 Mag", "30Rnd_762x39_AK12_Mag_F", 200],
	["7.62mm 30Rnd AK12 Mag T-Y", "30Rnd_762x39_AK12_Mag_Tracer_F", 150],
	["7.62mm 30Rnd AK12 Mag (Arid)", "30rnd_762x39_AK12_Arid_Mag_F", 250],
	["7.62mm 30Rnd AK12 Mag (Arid) T-Y", "30rnd_762x39_AK12_Arid_Mag_Tracer_F", 200],
	["7.62mm 30Rnd AK12 Mag (Lush)", "30rnd_762x39_AK12_Lush_Mag_F", 250],
	["7.62mm 30Rnd AK12 Mag (Lush) T-Y", "30rnd_762x39_AK12_Lush_Mag_Tracer_F", 200],
	["7.62mm 75Rnd AKM Mag", "75Rnd_762x39_Mag_F", 750],
	["7.62mm 75Rnd AKM Mag T-Y", "75Rnd_762x39_Mag_Tracer_F", 650],
	["7.62mm 75Rnd AK12 Mag", "75rnd_762x39_AK12_Mag_F", 750],
	["7.62mm 75Rnd AK12 Mag T-Y", "75rnd_762x39_AK12_Mag_Tracer_F", 650],
	["7.62mm 75Rnd AK12 Mag (Arid)", "75rnd_762x39_AK12_Arid_Mag_F", 800],
	["7.62mm 75Rnd AK12 Mag (Arid) T-Y", "75rnd_762x39_AK12_Arid_Mag_Tracer_F", 700],
	["7.62mm 75Rnd AK12 Mag (Lush)", "75rnd_762x39_AK12_Lush_Mag_F", 800],
	["7.62mm 75Rnd AK12 Mag (Lush) T-Y", "75rnd_762x39_AK12_Lush_Mag_Tracer_F", 700],
	["7.62mm 150Rnd Box", "150Rnd_762x54_Box", 1500],
	["7.62mm 150Rnd Box T-G", "150Rnd_762x54_Box_Tracer", 1250],
	[".338 LM 10Rnd Mag", "10Rnd_338_Mag", 500],
	[".338 NM 130Rnd Belt", "130Rnd_338_Mag", 1500],
	["9.3mm 10Rnd Mag", "10Rnd_93x64_DMR_05_Mag", 500],
	["9.3mm 150Rnd Belt", "150Rnd_93x64_Mag", 1500],
	[".408 7Rnd Cheetah Mag", "7Rnd_408_Mag", 500],
	["12.7mm 5Rnd Mag", "5Rnd_127x108_Mag", 500],
	["12.7mm 5Rnd Armor-Piercing Mag", "5Rnd_127x108_APDS_Mag", 600],
	["12.7mm 10Rnd Subsonic Mag", "10Rnd_127x54_Mag", 750],
	[".50 BW 10Rnd Mag", "10Rnd_50BW_Mag_F", 500],             //                 hit                      hit,  radius
	["PG-7VM HEAT Grenade", "RPG7_F", 3000],                   // Direct damage:  343     | Splash damage:  13,  3.0m     | Guidance: none
	["RPG-42 AT Rocket", "RPG32_F", 3000],                     //                 422     |                 28,  2.5m     |           none
	["RPG-42 HE Rocket", "RPG32_HE_F", 2000],                  //                 200     |                 50,  6.0m     |           none
	["MAAWS HEAT 75 Rocket", "MRAWS_HEAT_F", 5000],            //                 435     |                 14,  2.0m     |           none
	["MAAWS HE 44 Rocket", "MRAWS_HE_F", 4000],                //                 200     |                 50,  6.0m     |           none
	["9M135 HEAT Missile", "Vorona_HEAT", 8000],              //                 634     |                 28,  2.5m     |           mouse
	//["9M135 HE Missile", "Vorona_HE", 5500],                   //                 220     |                 45,  8.0m     |           mouse
	["PCML AT Missile", "NLAW_F", 2500],                       //                 462     |                 25,  2.4m     |           laser/IR, cold/hot ground vehicles
	["Titan Anti-Tank Missile", "Titan_AT", 8000],            //                 515     |                 20,  2.0m     |           mouse, laser/IR, hot ground vehicles
	//["Titan Anti-Personnel Missile", "Titan_AP", 3500],        //                 100     |                 25, 10.0m     |           mouse, laser/IR
	["Titan AA Missile", "Titan_AA", 3500],                    //                  80     |                 60,  6.0m     |           aircraft
//*** MODDING START ***

	["Compact mag", "CUP_10Rnd_9x19_Compact", 100],
	["Phantom mag", "CUP_18Rnd_9x19_Phantom", 100],
	["7 Rnd .50 AE", "CUP_7Rnd_50AE_Deagle", 100],
	["30 Rnd .45 ACP MAC-10", "CUP_30Rnd_45ACP_MAC10_M", 100],
	["30 Rnd .45 ACP MAC-10 (Yellow Tracers)", "CUP_30Rnd_45ACP_Yellow_Tracer_MAC10_M", 100],
	["30 Rnd .45 ACP MAC-10 (Green Tracers)", "CUP_30Rnd_45ACP_Green_Tracer_MAC10_M", 100],
	["Makarow-Mag", "CUP_8Rnd_9x18_Makarov_M", 100],
	["MakarowSD-Mag", "CUP_8Rnd_9x18_MakarovSD_M", 100],
	["Mk23 SOCCOM-Mag", "CUP_12Rnd_45ACP_mk23", 100],
	["40 Rnd MP7 4,6x30mm Mag", "BWA3_40Rnd_46x30_MP7", 200],
	["40 Rnd MP7 (SD) 4,6x30mm Mag", "BWA3_40Rnd_46x30_MP7_SD", 200],
	["20 Rnd MP7A1", "CUP_20Rnd_46x30_MP7", 100],
	["40 Rnd MP7A1", "CUP_40Rnd_46x30_MP7", 200],
	["P2A1 26.5mm DM516 Flare", "BWA3_1Rnd_Flare_Illum", 100],
	["P2A1 26.5mm DM55 Flare (White)", "BWA3_1Rnd_Flare_Singlestar_White", 100],
	["P2A1 26.5mm DM51 Flare (Green)", "BWA3_1Rnd_Flare_Singlestar_Green", 100],
	["P2A1 26.5mm DM53 Flare (Red)", "BWA3_1Rnd_Flare_Singlestar_Red", 100],
	["P2A1 26.5mm DM25 Flare (White)", "BWA3_1Rnd_Flare_Multistar_White", 100],
	["P2A1 26.5mm DM21 Flare (Green)", "BWA3_1Rnd_Flare_Multistar_Green", 100],
	["P2A1 26.5mm DM23 Flare (Red)", "BWA3_1Rnd_Flare_Multistar_Red", 100],
	["15 Rnd P8 9mm", "BWA3_15Rnd_9x19_P8", 120],
	["12 Rnd PMM-12", "CUP_12Rnd_9x18_PMM_M", 100],
	["10 Rnd Sa-61 Mag", "CUP_10Rnd_B_765x17_Ball_M", 100],
	["20 Rnd Sa-61 Mag", "CUP_20Rnd_B_765x17_Ball_M", 200],
	["50 Rnd Sa-61 Mag", "CUP_50Rnd_B_765x17_Ball_M", 500],
	[".45 ACP", "CUP_6Rnd_45ACP_M", 150],
	["TEC9 mag", "CUP_32Rnd_9x19_TEC9", 100],
	["G17 Mag", "CUP_17Rnd_9x19_glock17", 100],
	["PDW Mag", "CUP_30Rnd_9x19_UZI", 100],
	["30 Rnd 9x19mm (7N21) Vityaz Mag", "CUP_30Rnd_9x19AP_Vityaz", 300],
	["10 Rnd 9x19mm Saiga-9 Mag", "CUP_10Rnd_9x19_Saiga9", 100],
	["Bizon-Mag", "CUP_64Rnd_9x19_Bizon_M", 100],
	["Bizon-Mag (Green Tracer)", "CUP_64Rnd_Green_Tracer_9x19_Bizon_M", 100],
	["Bizon-Mag (Red Tracer)", "CUP_64Rnd_Red_Tracer_9x19_Bizon_M", 100],
	["Bizon-Mag (White Tracer)", "CUP_64Rnd_White_Tracer_9x19_Bizon_M", 100],
	["Bizon-Mag (Yellow Tracer)", "CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M", 100],
	//
	["Leuchtbüchse 84 mm", "BWA3_CarlGustav", 8000],
	["84mm Leuchtpatrone", "BWA3_CarlGustav_Illum", 8000],
	["84mm HE Gefechtskopf", "BWA3_CarlGustav_HE", 8000],
	["84mm HEAT-T Gefechtskopf", "BWA3_CarlGustav_HEAT", 8000],
	["84mm HEDP Gefechtskopf", "BWA3_CarlGustav_HEDP", 8000],
	["84mm Rauchpatrone", "BWA3_CarlGustav_Smoke", 8000],
	["Fliegerfaust 2 Stinger", "BWA3_Fliegerfaust", 8000],
	["Fliegerfaust 2 Lenkflugkörper", "BWA3_Fliegerfaust_Mag", 8000],
	["Javalin Rocket", "CUP_Javelin_M", 8000],
	["PG-7VM", "CUP_PG7VM_M", 8000],
	["PG-7VL", "CUP_PG7VL_M", 8000],
	["PG-7VR", "CUP_PG7VR_M", 8000],
	["Granate PG-7VM HEAT", "RPG7_F", 8000],
	["OG-7V", "CUP_OG7_M", 8000],
	["TBG-7V", "CUP_TBG7V_M", 8000],
	["Metis-M 9K115-2", "CUP_AT13_M", 8000],
	["M47 Rakete", "CUP_Dragon_EP1_M", 8000],
	["5Rnd Mk153 Mod 0 Spotting Round", "CUP_SMAW_Spotting", 8000],
	["Mk 6 Mod 0 HEAA", "CUP_SMAW_HEAA_M", 8000],
	["Mk 3 Mod 0 HEDP", "CUP_SMAW_HEDP_M", 8000],
	["Mk 80 Mod 0 NE", "CUP_SMAW_NE_M", 8000],
	["Strela-2 9K32 Rocket", "CUP_Strela_2_M", 8000],
	["FIM-92 Stinger Rocket", "CUP_Stinger_M", 8000],
	["Igla 9K38 Rocket", "CUP_Igla_M", 8000],
	["M136 AT-4 Rocket", "CUP_M136_M", 8000],
	["RPG 18 Rocket", "CUP_RPG18_M", 8000],
	["RGW90 HH Rocket", "BWA3_RGW90_HH", 8000],
	
	// ["", "CUP_15Rnd_9x19_M9", 100], //
	["30 Rnd 5.56mm AUG Mag", "CUP_30Rnd_556x45_AUG", 250],
	["30 Rnd 5.56mm AUG Mag (Red Tracer)", "CUP_30Rnd_TE1_Red_Tracer_556x45_AUG", 200],
	["30 Rnd 5.56mm AUG Mag (Yellow Tracer)", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_AUG", 200],
	["30 Rnd 5.56mm AUG Mag (Green Tracer)", "CUP_30Rnd_TE1_Green_Tracer_556x45_AUG", 200],
	["30 Rnd AK-101", "CUP_30Rnd_556x45_AK", 200],
	["30 Rnd AK-101 (Red Tracer)", "CUP_30Rnd_TE1_Red_Tracer_556x45_AK", 150],
	["30 Rnd AK-101 (Green Tracer)", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK", 150],
	["30 Rnd AK-101 (Yellow Tracer)", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_AK", 150],
	["30 Rnd CZ 805 Mag", "CUP_30Rnd_556x45_CZ805", 200],
	["30 Rnd CZ 805 Mag (Red Tracer)", "CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805", 150],
	["30 Rnd CZ 805 Mag (Green Tracer)", "CUP_30Rnd_TE1_Green_Tracer_556x45_CZ805", 150],
	["30 Rnd CZ 805 Mag (Yellow Tracer)", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_CZ805", 150],
	["30 Rnd G36 Mag", "CUP_30Rnd_556x45_G36", 200],
	["30 Rnd G36 Mag (Red Tracer)", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36", 150],
	["30 Rnd G36 Mag (Green Tracer)", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36", 150],
	["30 Rnd G36 Mag (Yellow Tracer)", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36", 150],
	["100 Rnd 5.56mm C36 Beta-C Mag ", "CUP_100Rnd_556x45_BetaCMag", 900],
	["XM8-Mag", "CUP_30Rnd_556x45_XM8", 200],
	["XM8-Mag (Red Tracer)", "CUP_30Rnd_TE1_Red_Tracer_556x45_XM8", 250],
	["XM8-Mag (Green Tracer)", "CUP_30Rnd_TE1_Green_Tracer_556x45_XM8", 250],
	["XM8-Mag (Yellow Tracer)", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_XM8", 250],
	// ["", "CUP_15Rnd_9x19_M9", 100],
	["20 Rnd AA12 Pellets", "CUP_20Rnd_B_AA12_Pellets", 200],
	["20 Rnd AA12 Slug", "CUP_20Rnd_B_AA12_74Slug", 200],
	["20 Rnd AA12 HE", "CUP_20Rnd_B_AA12_HE", 200],
	["Lee Enfield Mag", "CUP_10x_303_M", 300],
	["30 Rnd 7.62mm CZ 807 Mag", "CUP_30Rnd_762x39_CZ807", 250],
	["30 Rnd 7.62mm CZ 807 Mag (Yellow Tracer)", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_CZ807", 200],
	["30 Rnd 7.62mm CZ 807 Mag (Red Tracer)", "CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807", 200],
	["30 Rnd 7.62mm CZ 807 Mag (Green Tracer)", "CUP_30Rnd_TE1_Green_Tracer_762x39_CZ807", 200],
	["FN FAL 7.62mm Mag", "CUP_20Rnd_762x51_FNFAL_M", 250],
	["30 Rnd Fort-224", "CUP_30Rnd_545x39_Fort224_M", 200],
	["20 Rnd G27 7.62mm", "BWA3_20Rnd_762x51_G28", 150],
	["20 Rnd G27 7.62mm Mag (Tracer)", "BWA3_20Rnd_762x51_G28_Tracer", 100],
	["20 Rnd G27 7.62mm Mag (IR-DIM)", "BWA3_20Rnd_762x51_G28_Tracer_Dim", 100],
	["20 Rnd G27 7.62mm Mag (SD)", "BWA3_20Rnd_762x51_G28_SD", 150],
	["20 Rnd G27 7.62mm Mag (AP)", "BWA3_20Rnd_762x51_G28_AP", 150],
	["10 Rnd G28 7.62mm Mag", "BWA3_10Rnd_762x51_G28", 150],
	["10 Rnd G28 7.62mm Mag (Tracer)", "BWA3_10Rnd_762x51_G28_Tracer", 100],
	["10 Rnd G28 7.62mm Mag (IR-DIM)", "BWA3_10Rnd_762x51_G28_Tracer_Dim", 100],
	["10 Rnd G28 7.62mm Mag (SD)", "BWA3_10Rnd_762x51_G28_SD", 150],
	["10 Rnd G28 7.62mm Mag (AP)", "BWA3_10Rnd_762x51_G28_AP", 150],
	["10 Rnd G28 N118LR 7,62mm Mag (LR)", "BWA3_10Rnd_762x51_G28_LR", 100],
	["30 Rnd G36 DM11 Mag", "BWA3_30Rnd_556x45_G36", 200],
	["30 Rnd G36 DM21 Mag", "BWA3_30Rnd_556x45_G36_Tracer", 200],
	["30 Rnd G36 Mag (IR-DIM)", "BWA3_30Rnd_556x45_G36_Tracer_Dim", 200],
	["30 Rnd G36 Mag (SD)", "BWA3_30Rnd_556x45_G36_SD", 200],
	["30 Rnd G36 DM31 Mag (AP)", "BWA3_30Rnd_556x45_G36_AP", 200],
	["20 Rnd G3 Mag", "CUP_20Rnd_762x51_G3", 150],
	["20 Rnd G3 Mag (Red Tracer)", "CUP_20Rnd_TE1_Red_Tracer_762x51_G3", 100],
	["20 Rnd G3 Mag (Green Tracer)", "CUP_20Rnd_TE1_Green_Tracer_762x51_G3", 100],
	["20 Rnd G3 Mag (Yellow Tracer)", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_G3", 100],
	["20 Rnd 7.62mm HK417 Mag", "CUP_20Rnd_762x51_HK417", 200],
	["30 Rnd Sa-58 Mag", "CUP_30Rnd_Sa58_M", 150],
	["30 Rnd Sa-58 Mag (Red Tracer)", "CUP_30Rnd_Sa58_M_TracerG", 100],
	["30 Rnd Sa-58 Mag (Green Tracer)", "CUP_30Rnd_Sa58_M_TracerR", 100],
	["30 Rnd Sa-58 Mag (Yellow Tracer)", "CUP_30Rnd_Sa58_M_TracerY", 100],
	["5 Rnd Saiga 12K Slug", "CUP_8Rnd_B_Saiga12_74Slug_M", 100],
	["5 Rnd Saiga 12K Pellets", "CUP_8Rnd_B_Saiga12_74Pellets_M", 100],
	["12 Rnd Saiga 12K Slug", "CUP_20Rnd_B_Saiga12_74Slug_M", 200],
	["12 Rnd Saiga 12K Pellets", "CUP_20Rnd_B_Saiga12_74Pellets_M", 200],
	["10 Rnd Saiga Mk03 762x39mm", "CUP_10Rnd_762x39_SaigaMk03_M", 300],
	["30 Rnd SR-3M 9x39mm Mag", "CUP_30Rnd_9x39_SP5_VIKHR_M", 200],
	["20 Rnd VSS 9x39mm Mag", "CUP_20Rnd_9x39_SP5_VSS_M", 250],
	["10 Rnd VSS 9x39mm Mag", "CUP_10Rnd_9x39_SP5_VSS_M", 100],
	["CZ 550-Magazin", "CUP_5x_22_LR_17_HMR_M", 200],
	["1 Rnd CZ 584 Slug", "CUP_1Rnd_B_CZ584_74Slug", 100],
	["1 Rnd CZ 584 Pellets", "CUP_1Rnd_B_CZ584_74Pellets", 100],
	["1 Rnd CZ 584 Slug (OFP)", "CUP_7Rnd_B_CZ584_OFP", 150],
	["1 Rnd CZ 584 Ball", "CUP_1Rnd_762x51_CZ584", 150],
	["10 Rnd CZ750 Mag", "CUP_10Rnd_762x51_CZ750", 300],
	["10 Rnd CZ750 Mag Tracer", "CUP_10Rnd_762x51_CZ750_Tracer", 250],
	["5 Rnd 12.7x99mm NATO Mag", "CUP_5Rnd_127x99_as50_M", 400],
	["5 Rnd .300 7.62mmmm Win Mag", "CUP_5Rnd_762x67_G22", 500],
	["5 Rnd KSVK 12.7x108mm Mag", "CUP_5Rnd_127x108_KSVK_M", 750],
	["10 Rnd M107 12.7x99mm Mag", "CUP_10Rnd_127x99_M107", 100],
	["20 Rnd M110 7.62x51mm Mag", "CUP_20Rnd_762x51_B_M110", 250],
	["5 Rnd M24 7.62x51mm Mag", "CUP_5Rnd_762x51_M24", 400],
	["5 Rnd .338 Lapua Magnum Mag", "CUP_5Rnd_86x70_L115A1", 400],
	["100 Rnd M240 Belt TE4 (White Tracer)", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 1000],
	["100 Rnd M240 Belt TE4 (Red Tracer)", "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 1000],
	["100 Rnd M240 Belt TE4 (Green Tracer)", "CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M", 1000],
	["100 Rnd M240 Belt TE4 (Yellow Tracer)", "CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M", 1000],
	["120 Rnd Belt 7.62x51mm", "BWA3_120Rnd_762x51_soft", 1500],
	["120 Rnd Belt Tracer 7.62x51mm ", "BWA3_120Rnd_762x51_Tracer_soft", 1500],
	["120 Rnd Box 7.62x51mm", "BWA3_120Rnd_762x51", 1650],
	["120 Rnd Box Tracer 7.62x51mm", "BWA3_120Rnd_762x51_Tracer", 1550],
	["200 Rnd Box MG4 5.56x45mm", "BWA3_200Rnd_556x45", 1650],
	["200 Rnd Box MG4 Tracer 5.56x45mm", "BWA3_200Rnd_556x45_Tracer", 1550],
	["50 Rnd UK59 Tracer 7.62x54mm", "CUP_50Rnd_UK59_762x54R_Tracer", 500],
	["20 Rnd Mk17 7.62x51mm Mag", "CUP_20Rnd_762x51_B_SCAR", 200],
	["20 Rnd Mk17 Mag (Yellow Tracer)", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR", 150],
	["20 Rnd Mk17 Mag (Red Tracer)", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR", 150],
	["20 Rnd Mk17 Mag (Green Tracer)", "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR", 150],
	["20 Rnd Mk17 Mag (White Tracer)", "CUP_20Rnd_TE1_White_Tracer_762x51_SCAR", 150],
	["30 Rnd Mk17 Stick Mag", "CUP_30Rnd_762x51_1_B_SCAR", 200],
	["50 Rnd Mk17 Drum Mag", "CUP_50Rnd_762x51_B_SCAR", 200],
	["30 Rnd Mk17 Curved Mag", "CUP_30Rnd_762x51_2_B_SCAR", 200],
	["120 Rnd MG-3 Gurt TE4 (White Tracer)", "CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 1500],
	["120 Rnd MG-3 Gurt TE4 (Red Tracer)", "CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 1500],
	["120 Rnd MG-3 Gurt TE4 (Green Tracer)", "CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M", 1500],
	["120 Rnd MG-3 Gurt TE4 (Yellow Tracer)", "CUP_120Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M", 1500],
	["6 Rnd VOG-25", "CUP_6Rnd_HE_GP25_M", 5500],
	["1 Rnd VOG-25", "CUP_1Rnd_HE_GP25_M", 1500],
	["VG-400P Illumination Flare (White)", "CUP_IlumFlareWhite_GP25_M", 250],
	["VG-400P Illumination Flare (Red)", "CUP_IlumFlareRed_GP25_M", 250],
	["VG-400P Illumination Flare (Green)", "CUP_IlumFlareGreen_GP25_M", 250],
	["VGS-40 Flare (White)", "CUP_FlareWhite_GP25_M", 250],
	["VGS-40 Flare (Green)", "CUP_FlareGreen_GP25_M", 250],
	["VGS-40 Flare (Red)", "CUP_FlareRed_GP25_M", 250],
	["VGS-40 Flare (Yellow)", "CUP_FlareYellow_GP25_M", 250],
	["VGD-40 Smoke", "CUP_1Rnd_SMOKE_GP25_M", 500],
	["VGD-40 Smoke (Red)", "CUP_1Rnd_SmokeRed_GP25_M", 500],
	["VGD-40 Smoke (Green)", "CUP_1Rnd_SmokeGreen_GP25_M", 500],
	["VGD-40 Smoke (Yellow)", "CUP_1Rnd_SmokeYellow_GP25_M", 500],
	["6 Rnd VGS-40 Flare (White)", "CUP_6Rnd_FlareWhite_GP25_M", 2000],
	["6 Rnd VGS-40 Flare (Green)", "CUP_6Rnd_FlareGreen_GP25_M", 2000],
	["6 Rnd VGS-40 Flare (Yellow)", "CUP_6Rnd_FlareYellow_GP25_M", 2000],
	["6 Rnd VGS-40 Flare (Red)", "CUP_6Rnd_FlareRed_GP25_M", 2000],
	["6 Rnd VGD-40 Smoke", "CUP_6Rnd_Smoke_GP25", 2800],
	["6 Rnd VGD-40 Smoke (Red)", "CUP_6Rnd_SmokeRed_GP25", 2800],
	["6 Rnd VGD-40 Smoke (Green)", "CUP_6Rnd_SmokeGreen_GP25", 2800],
	["6 Rnd VGD-40 Smoke (Yellow)", "CUP_6Rnd_SmokeYellow_GP25", 2800],
	// ["", "CUP_15Rnd_9x19_M9", 100],
//*** MODDING END ***
	["40mm HE Grenade Round", "1Rnd_HE_Grenade_shell", 1250],
	["40mm 3Rnd HE Grenades", "3Rnd_HE_Grenade_shell", 2500],
	["40mm Smoke Round (White)", "1Rnd_Smoke_Grenade_shell", 500],
	["40mm Smoke Round (Purple)", "1Rnd_SmokePurple_Grenade_shell", 500],
	["40mm Smoke Round (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 500],
	["40mm Tear Gas", "1Rnd_SmokeYellow_Grenade_shell", 1500],
	["40mm Toxic Gas", "1Rnd_SmokGreen_Grenade_shell", 1500],
	["40mm Smoke Round (Yellow)", "1Rnd_SmokeYellow_Grenade_shell", 500],
	["40mm Smoke Round (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 500],
	["40mm Smoke Round (Red)", "1Rnd_SmokeRed_Grenade_shell", 500],
	["40mm 3Rnd Smokes (White)", "3Rnd_Smoke_Grenade_shell", 1000],
	["40mm 3Rnd Smokes (Purple)", "3Rnd_SmokePurple_Grenade_shell", 1000],
	["40mm 3Rnd Smokes (Blue)", "3Rnd_SmokeBlue_Grenade_shell", 1000],
	["40mm 3Rnd Toxic (Damage Gas)", "3Rnd_SmokeGreen_Grenade_shell", 3500],
	["40mm 3Rnd Tear Gas)", "3Rnd_SmokeYellow_Grenade_shell", 3500],
	["40mm 3Rnd Smokes (Orange)", "3Rnd_SmokeOrange_Grenade_shell", 1000],
	["40mm 3Rnd Smokes (Red)", "3Rnd_SmokeRed_Grenade_shell", 1000],
	["40mm Flare Round (White)", "UGL_FlareWhite_F", 250],
	["40mm Flare Round (Green)", "UGL_FlareGreen_F", 250],
	["40mm Flare Round (Yellow)", "UGL_FlareYellow_F", 250],
	["40mm Flare Round (Red)", "UGL_FlareRed_F", 250],
	["40mm Flare Round (IR)", "UGL_FlareCIR_F", 250],
	["40mm 3Rnd Flares (White)", "3Rnd_UGL_FlareWhite_F", 500],
	["40mm 3Rnd Flares (Green)", "3Rnd_UGL_FlareGreen_F", 500],
	["40mm 3Rnd Flares (Yellow)", "3Rnd_UGL_FlareYellow_F", 500],
	["40mm 3Rnd Flares (Red)", "3Rnd_UGL_FlareRed_F", 500],
	["40mm 3Rnd Flares (IR)", "3Rnd_UGL_FlareCIR_F", 500]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	["Suppressor 9mm", "muzzle_snds_L", 500, "item"],
	["Suppressor .45 ACP", "muzzle_snds_acp", 750, "item"],
	["Suppressor 5.56mm", "muzzle_snds_M", 1000, "item"],
	["Suppressor 5.56mm (Khaki)", "muzzle_snds_m_khk_F", 1000, "item"],
	["Suppressor 5.56mm (Sand)", "muzzle_snds_m_snd_F", 1000, "item"],
	["Suppressor 5.7mm", "muzzle_snds_570", 1000, "item"],
	["Suppressor 5.8mm", "muzzle_snds_58_blk_F", 1000, "item"],
	["Suppressor 5.8mm (Hex)", "muzzle_snds_58_hex_F", 100, "item"],
	["Suppressor 5.8mm (G Hex)", "muzzle_snds_58_ghex_F", 100, "item"],
	["Suppressor 6.5mm", "muzzle_snds_H", 1000, "item"],
	["Suppressor 6.5mm (Khaki)", "muzzle_snds_H_khk_F", 1000, "item"],
	["Suppressor 6.5mm (Sand)", "muzzle_snds_H_snd_F", 1000, "item"],
	["Suppressor 6.5mm LMG", "muzzle_snds_H_MG", 1250, "item"],
	["Suppressor 6.5mm LMG (Black)", "muzzle_snds_H_MG_blk_F", 1250, "item"],
	["Suppressor 6.5mm LMG (Khaki)", "muzzle_snds_H_MG_khk_F", 1250, "item"],
	["Suppressor 6.5mm Stealth", "muzzle_snds_65_TI_blk_F", 1250, "item"],
	["Suppressor 6.5mm Stealth (Hex)", "muzzle_snds_65_TI_hex_F", 1250, "item"],
	["Suppressor 6.5mm Stealth (G Hex)", "muzzle_snds_65_TI_ghex_F", 1250, "item"],
	["Suppressor 7.62mm", "muzzle_snds_B", 1250, "item"],
	["Suppressor 7.62mm (Khaki)", "muzzle_snds_B_khk_F", 1250, "item"],
	["Suppressor 7.62mm (Sand)", "muzzle_snds_B_snd_F", 1250, "item"],
	["Suppressor 7.62mm (Arid)", "muzzle_snds_B_arid_F", 1250, "item"],
	["Suppressor 7.62mm (Lush)", "muzzle_snds_B_lush_F", 1250, "item"],
	["Suppressor .338", "muzzle_snds_338_black", 1500, "item"],
	["Suppressor .338 (Green)", "muzzle_snds_338_green", 1500, "item"],
	["Suppressor .338 (Sand)", "muzzle_snds_338_sand", 1750, "item"],
	["Suppressor 9.3mm", "muzzle_snds_93mmg", 1750, "item"],
	["Suppressor 9.3mm (Tan)", "muzzle_snds_93mmg_tan", 1750, "item"],
	["Flash Hider (5.56x45mm/Black)", "CUP_muzzle_mfsup_Flashhider_556x45_Black", 100, "item"],
	["Flash Hider (5.56x45mm/OD)", "CUP_muzzle_mfsup_Flashhider_556x45_OD", 100, "item"],
	["Flash Hider (5.56x45mm/Tan)", "CUP_muzzle_mfsup_Flashhider_556x45_Tan", 100, "item"],
	["G36 Silencer (Black)", "CUP_muzzle_snds_G36_black", 100, "item"],
	["G36 Silencer (Desert)", "CUP_muzzle_snds_G36_desert", 100, "item"],
	["G36 Silencer (Woodland)", "CUP_muzzle_snds_G36_wood", 100, "item"],
	["KAC QDSS NT4 (5.56mm)", "BWA3_muzzle_snds_QDSS", 100, "item"],
	["KAC QDSS NT4 (5.56mm, Green)", "BWA3_muzzle_snds_QDSS_green", 100, "item"],
	["KAC QDSS NT4 (5.56mm, Tan)", "BWA3_muzzle_snds_QDSS_tan", 100, "item"],
	["Mk 16 Flash Hider", "CUP_muzzle_mfsup_SCAR_L", 100, "item"],
	["Mk 16 Silencer", "CUP_muzzle_snds_SCAR_L", 100, "item"],
	["QDSS NT4 5.56mm Suppressor (Black)", "CUP_muzzle_snds_M16", 100, "item"],
	["QDSS NT4 5.56mm Suppressor (Coyote)", "CUP_muzzle_snds_M16_coyote", 100, "item"],
	["QDSS NT4 5.56mm Suppressor (Desert)", "CUP_muzzle_snds_M16_desert", 100, "item"],
	["QDSS NT4 5.56mm Suppressor (Woodland)", "CUP_muzzle_snds_M16_camo", 100, "item"],
	["Rotex III Compact (5.56mm)", "BWA3_muzzle_snds_Rotex_IIIC", 100, "item"],
	["Rotex III Compact (5.56mm, Green)", "BWA3_muzzle_snds_Rotex_IIIC_green", 100, "item"],
	["Rotex III Compact (5.56mm) Tan", "BWA3_muzzle_snds_Rotex_IIIC_tan", 100, "item"],
	["XM8 Silencer", "CUP_muzzle_snds_XM8", 100, "item"],
	["Flash Hider (7.62x39mm/Black)", "CUP_muzzle_mfsup_Flashhider_762x39_Black", 100, "item"],
	["Flash Hider (7.62x39mm/OD)", "CUP_muzzle_mfsup_Flashhider_762x39_OD", 100, "item"],
	["Flash Hider (7.62x39mm/Tan)", "CUP_muzzle_mfsup_Flashhider_762x39_Tan", 100, "item"],
	["KZRZP (7.62x39mm)", "CUP_muzzle_snds_KZRZP_AK762", 100, "item"],
	["KZRZP (7.62x39mm/Desert)", "CUP_muzzle_snds_KZRZP_AK762_desert", 100, "item"],
	["KZRZP (7.62x39mm/Woodland)", "CUP_muzzle_snds_KZRZP_AK762_woodland", 100, "item"],
	["PBS-1 Silencer", "CUP_muzzle_Bizon", 100, "item"],
	["KZRZP (5.45x39mm)", "CUP_muzzle_snds_KZRZP_AK545", 100, "item"],
	["KZRZP (5.45x39mm/Desert)", "CUP_muzzle_snds_KZRZP_AK545_desert", 100, "item"],
	["KZRZP (5.45x39mm/Woodland)", "CUP_muzzle_snds_KZRZP_AK545_woodland", 100, "item"],
	["PBS-4 Silencer", "CUP_muzzle_PBS4", 100, "item"],
	["TGP-A Silencer", "CUP_muzzle_TGPA", 100, "item"],
	["TGP-A Silencer (Desert)", "CUP_muzzle_TGPA_desert", 100, "item"],
	["TGP-A Silencer (Woodland)", "CUP_muzzle_TGPA_woodland", 100, "item"],
	["Mk 17 Flash Hider", "CUP_muzzle_mfsup_SCAR_H", 100, "item"],
	["Mk 17 Silencer", "CUP_muzzle_snds_SCAR_H", 100, "item"],
	["Rotex IIA (7.62mm)", "BWA3_muzzle_snds_Rotex_IIA", 100, "item"],
	["BFA", "CUP_acc_bfa", 100, "item"],
	["L85 Silencer", "CUP_muzzle_snds_L85", 100, "item"],
	["Surefire Flash Hider", "CUP_acc_sffh", 100, "item"],
	["M107 Suppressor .50 BMG (Black)", "CUP_muzzle_mfsup_Suppressor_M107_Black", 100, "item"],
	["M107 Suppressor .50 BMG (Desert)", "CUP_muzzle_mfsup_Suppressor_M107_Desert", 100, "item"],
	["M107 Suppressor .50 BMG (Grey)", "CUP_muzzle_mfsup_Suppressor_M107_Grey", 100, "item"],
	["M107 Suppressor .50 BMG (Snow)", "CUP_muzzle_mfsup_Suppressor_M107_Snow", 100, "item"],
	["M107 Suppressor .50 BMG (Woodland)", "CUP_muzzle_mfsup_Suppressor_M107_Woodland", 100, "item"],
	["M110 Suppressor (Black)", "CUP_muzzle_snds_M110_black", 100, "item"],
	["M110 Suppressor (Tan)", "CUP_muzzle_snds_M110", 100, "item"],
	["M110 Suppressor (Woodland)", "CUP_muzzle_snds_M110_woodland", 100, "item"],
	["Silencer (M14)", "CUP_muzzle_snds_M14", 100, "item"],
	["Silencer Sa-61", "CUP_muzzle_snds_SA61", 100, "item"],
	["Silencer SR-3M", "CUP_muzzle_snds_SR3M", 100, "item"],
	["KZRZP (SVD 7.62x54R)", "CUP_muzzle_snds_KZRZP_SVD", 100, "item"],
	["KZRZP (SVD 7.62x54R/Desert)", "CUP_muzzle_snds_KZRZP_SVD_desert", 100, "item"],
	["KZRZP (SVD 7.62x54R/Woodland)", "CUP_muzzle_snds_KZRZP_SVD_woodland", 100, "item"],
	["1A2 S-BRM Bipod", "BWA3_bipod_Harris", 100, "item"],
	["1A2 S-BRM Bipod (Green)", "BWA3_bipod_Harris_green", 100, "item"],
	["1A2 S-BRM Bipod (Tan)", "BWA3_bipod_Harris_tan", 100, "item"],
	["BT10-LW17 ADM Bipod", "BWA3_bipod_Atlas", 100, "item"],
	["Harris 1A2-L Bipod (worn)", "CUP_bipod_Harris_1A2_L", 100, "item"],
	["VLTOR Modpod Bipod (Black)", "CUP_bipod_VLTOR_Modpod_black", 100, "item"],
	["VLTOR Modpod Bipod (OD)", "CUP_bipod_VLTOR_Modpod_od", 100, "item"],
	["VLTOR Modpod Bipod (Tan)", "CUP_bipod_VLTOR_Modpod", 100, "item"],
	["G36 Bipod", "CUP_Bipod_G36", 100, "item"],
	["G36 Bipod (Desert)", "CUP_Bipod_G36_desert", 100, "item"],
	["G36 Bipod (Woodland)", "CUP_Bipod_G36_wood", 100, "item"],
	["Bipod (NATO)", "bipod_01_F_blk", 1000, "item", "noDLC"],
	["Bipod (CSAT)", "bipod_02_F_blk", 1000, "item", "noDLC"],
	["Bipod (AAF)", "bipod_03_F_blk", 1000, "item", "noDLC"],
	["Bipod (MTP)", "bipod_01_F_mtp", 1000, "item", "noDLC"],
	["Bipod (Hex)", "bipod_02_F_hex", 1000, "item", "noDLC"],
	["Bipod (Olive)", "bipod_03_F_oli", 1000, "item", "noDLC"],
	["Bipod (Sand)", "bipod_01_F_snd", 1000, "item", "noDLC"],
	["Bipod (Tan)", "bipod_02_F_tan", 1000, "item", "noDLC"],
	["Bipod (Khaki)", "bipod_01_F_khk", 1000, "item"],
	["Bipod (Arid)", "bipod_02_F_arid", 1000, "item", "noDLC"],
	["Bipod (Lush)", "bipod_02_F_lush", 1000, "item", "noDLC"],
	["Flashlight", "acc_flashlight", 250, "item"],
	["Pistol Flashlight" ,"acc_flashlight_pistol", 250, "item"],
	["IR Laser Pointer", "acc_pointer_IR", 250, "item"],
	["Yorris J2 (Zubr)", "optic_Yorris", 250, "item"],
	["MRD (4-five)", "optic_MRD", 250, "item"],
	["MRD (4-five) (Black)", "optic_MRD_black", 250, "item"],
	["ACO SMG (Red)", "optic_aco_smg", 500, "item"],
	["ACO SMG (Green)", "optic_ACO_grn_smg", 500, "item"],
	["ACO (Red)", "optic_Aco", 750, "item"],
	["ACO (Green)", "optic_Aco_grn", 750, "item"],
	["Holosight SMG", "optic_Holosight_smg", 500, "item"],
	["Holosight", "optic_Holosight", 750, "item"],
	["Holosight (Khaki)", "optic_Holosight_khk_F", 750, "item"],
	["Holosight SMG (Khaki)", "optic_Holosight_smg_khk_F", 750, "item"],
	["Holosight (Black)", "optic_Holosight_blk_F", 750, "item"],
	["Holosight SMG (Black)", "optic_Holosight_blk_khk_F", 750, "item"],
	["Holosight", "optic_Holosight_arid_F", 750, "item"],
	["Holosight", "optic_Holosight_lush_F", 750, "item"],
	["Promet Modular Sight (Green)", "optic_ico_01_f", 800, "item"],
	["Promet Modular Sight (Sand)", "optic_ico_01_sand_f", 800, "item"],
	["Promet Modular Sight (Black)", "optic_ico_01_black_f", 800, "item"],
	["Promet Modular Sight (Camo)", "optic_ico_01_camo_f", 800, "item"],
	["MRCO", "optic_MRCO", 1000, "item"],
	["ERCO", "optic_ERCO_blk_F", 1000, "item"],
	["ERCO (Khaki)", "optic_ERCO_khk_F", 1000, "item"],
	["ERCO (Sand)", "optic_ERCO_snd_F", 1000, "item"],
	["ARCO", "optic_Arco", 1250, "item"],
	["ARCO (Black)", "optic_Arco_blk_F", 1250, "item"],
	["ARCO (G Hex)", "optic_Arco_ghex_F", 1250, "item"],
	["ARCO (Arid)", "optic_Arco_arid_F", 1250, "item"],
	["ARCO (Lush)", "optic_Arco_lush_F", 1250, "item"],
	["ARCO AK (Arid)", "optic_Arco_AK_arid_F", 1250, "item"],
	["ARCO AK (Schwarz)", "optic_Arco_AK_blk_F", 1250, "item"],
	["ARCO AK (Lush)", "optic_Arco_AK_lush_F", 1250, "item"],
	["RCO", "optic_Hamr", 1500, "item"],
	["RCO (Khaki)", "optic_Hamr_khk_F", 1500, "item"],
	["MOS", "optic_SOS", 1500, "item"],
	["MOS (Khaki)", "optic_SOS_khk_F", 1500, "item"],
	["DMS", "optic_DMS", 1750, "item"],
	["DMS (G Hex)", "optic_DMS_ghex_F", 1750, "item"],
	["DMS (Old)", "optic_DMS_weathered_F", 1750, "item"],
	["DMS Kir (Old)", "optic_DMS_weathered_Kir_F", 1750, "item"],
	["Kahlia (Sightless)", "optic_KHS_old", 2000, "item"],
	["Kahlia", "optic_KHS_blk", 2250, "item"],
	["Kahlia (Hex)", "optic_KHS_hex", 2250, "item"],
	["Kahlia (Tan)", "optic_KHS_tan", 2250, "item"],
	["AMS", "optic_AMS", 250, "item"],
	["AMS (Khaki)", "optic_AMS_khk", 2500, "item"],
	["AMS (Sand)", "optic_AMS_snd", 2500, "item"],
	["LRPS", "optic_LRPS", 3000, "item"],
	["LRPS (G Hex)", "optic_LRPS_ghex_F", 3000, "item"],
	["LRPS (Tropic)", "optic_LRPS_tna_F", 3000, "item"],
	["Aimpoint CompM2", "BWA3_optic_CompM2", 100, "item"],
	["Aimpoint CompM2 (Green)", "BWA3_optic_CompM2_green", 100, "item"],
	["Aimpoint CompM2 (Tan)", "BWA3_optic_CompM2_tan", 100, "item"],
	["Aimpoint CompM4 (Black)", "CUP_optic_CompM4", 100, "item"],
	// ["Aimpoint Micro T-1", "CUP_optic_MicroT1", 100, "item"],
	// ["Aimpoint Micro T-1 (Coyote)", "CUP_optic_MicroT1_coyote", 100, "item"],
	["Aimpoint MicroT1", "BWA3_optic_MicroT1", 500, "item"],
	["RSAS", "BWA3_optic_RSAS", 500, "item"],
	["RSAS (Brown)", "BWA3_optic_RSAS_brown", 100, "item"],
	["RSAS (Green)", "BWA3_optic_RSAS_green", 100, "item"],
	["RSAS (Tan)", "BWA3_optic_RSAS_tan", 100, "item"],
	["RSAS (Desert)", "BWA3_optic_RSAS_sand", 100, "item"],
	["1,1-8x24 PM II ShortDot Dual CC", "BWA3_optic_PMII_ShortdotCC", 2500, "item"],
	["3-20x50 PM II DMR", "BWA3_optic_PMII_DMR", 2700, "item"],
	["3-20x50 PM II DMR (MicroT1 back)", "BWA3_optic_PMII_DMR_MicroT1_rear", 2700, "item"],
	["3-20x50 PM II DMR (MicroT1 front)", "BWA3_optic_PMII_DMR_MicroT1_front", 2700, "item"],
	["5-25x56 M5Xi Military (MSR, MicroT2)", "BWA3_optic_M5Xi_MSR_MicroT2", 3000, "item"],
	["5-25x56 M5Xi Military (MSR)", "BWA3_optic_M5Xi_MSR", 3000, "item"],
	["5-25x56 M5Xi Military (Tremor 3)", "BWA3_optic_M5Xi_Tremor3", 3300, "item"],
	["5-25x56 M5Xi Military (Tremor 3, MicroT2)", "BWA3_optic_M5Xi_Tremor3_MicroT2", 3300, "item"],
	["6-24x72 Hensoldt", "BWA3_optic_Hensoldt", 4000, "item"],
	["Elcan M145", "CUP_optic_ElcanM145", 1200, "item"],
	["Elcan SpecterDR 1x/4x (Black)", "CUP_optic_Elcan_SpecterDR_black", 1500, "item"],
	["Elcan SpecterDR 1x/4x (Coyote)", "CUP_optic_Elcan_SpecterDR", 1500, "item"],
	["Elcan SpecterDR 1x/4x (OD)", "CUP_optic_Elcan_SpecterDR_od", 1500, "item"],
	["Elcan SpecterDR 1x/4x (RMR Reflex/Black)", "CUP_optic_Elcan_SpecterDR_RMR_black", 1500, "item"],
	["Elcan SpecterDR 1x/4x (RMR Reflex/Coyote)", "CUP_optic_Elcan_SpecterDR_RMR", 1500, "item"],
	["Elcan SpecterDR 1x/4x (RMR Reflex/OD)", "CUP_optic_Elcan_SpecterDR_RMR_od", 1500, "item"],
	["Elcan SpecterOS4x (Black)", "CUP_optic_Elcan", 1650, "item"],
	["Elcan SpecterOS4x (Coyote)", "CUP_optic_Elcan_Coyote", 1650, "item"],
	["Elcan SpecterOS4x (OD)", "CUP_optic_Elcan_OD", 1650, "item"],
	["Elcan SpecterOS4x (RMR Reflex/Black)", "CUP_optic_Elcan_reflex", 1750, "item"],
	["Elcan SpecterOS4x (RMR Reflex/Coyote)", "CUP_optic_Elcan_reflex_Coyote", 1750, "item"],
	["Elcan SpecterOS4x (RMR Reflex/OD)", "CUP_optic_Elcan_reflex_OD", 1750, "item"],
	["EOTech 553 + G33 (Black)", "CUP_optic_G33_HWS_BLK", 500, "item"],
	["EOTech 553 + G33 (Coyote)", "CUP_optic_G33_HWS_COYOTE", 500, "item"],
	["EOTech 553 + G33 (Tan)", "CUP_optic_G33_HWS_TAN", 500, "item"],
	["EOTech 553 + G33 Magnifier (OD)", "CUP_optic_G33_HWS_OD", 500, "item"],
	["Hensoldt ZO", "CUP_optic_HensoldtZO", 800, "item"],
	["Hensoldt ZO (RDS)", "CUP_optic_HensoldtZO_RDS", 80, "item"],
	["Leupold Mark 4 8.5-25x50 LR/T (Desert)", "CUP_optic_LeupoldMk4_25x50_LRT_DESERT", 1250, "item"],
	["Leupold Mark 4 8.5-25x50 LR/T (Snow)", "CUP_optic_LeupoldMk4_25x50_LRT_SNOW", 1250, "item"],
	["Leupold Mark 4 8.5-25x50 LR/T (Woodland)", "CUP_optic_LeupoldMk4_25x50_LRT_WOODLAND", 1250, "item"],
	["Leupold VX-3 4.5-14x50mm", "CUP_optic_Leupold_VX3", 1450, "item"],
	["Leupold Mark 4 10x40mm LR/T", "CUP_optic_LeupoldMk4", 1650, "item"],
	["Leupold Mark 4 10x40mm LR/T (Desert)", "CUP_optic_LeupoldMk4_10x40_LRT_Desert", 1650, "item"],
	["Leupold Mark 4 10x40mm LR/T (Woodland)", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", 1650, "item"],
	["Leupold Mark 4 3-9x36mm MR/T", "CUP_optic_LeupoldM3LR", 1750, "item"],
	["Leupold Mk4 CQ/T 1-3x14mm", "CUP_optic_LeupoldMk4_CQ_T", 1650, "item"],
	["MARS", "CUP_optic_MARS", 500, "item"],
	["Meopta Rapid Acquisition Dot", "CUP_optic_MRad", 500, "item"],
	["Schmidt and Bender 1.1-4x20 PM ShortDot", "CUP_optic_SB_11_4x20_PM", 1000, "item"],
	["Schmidt and Bender 1.1-4x20 PM ShortDot (OD)", "CUP_optic_SB_11_4x20_PM_od", 1000, "item"],
	["Schmidt and Bender 1.1-4x20 PM ShortDot (Tan)", "CUP_optic_SB_11_4x20_PM_tan", 1000, "item"],
	["Schmidt and Bender 3-12x50 PM II", "CUP_optic_SB_3_12x50_PMII", 1300, "item"],
	["Schmidt and Bender 3-12x50 PM II (Tan)", "CUP_optic_SB_3_12x50_PMII_Tan", 1300, "item"],
	["SUSAT L9A1", "CUP_optic_SUSAT", 700, "item"],
	["Trijicon ACOG TA01B", "CUP_optic_ACOG_TA01B_Black", 750, "item"],
	["Trijicon ACOG TA01B (Coyote)", "CUP_optic_ACOG_TA01B_Coyote", 750, "item"],
	["Trijicon ACOG TA01B (OD)", "CUP_optic_ACOG_TA01B_OD", 750, "item"],
	["Trijicon ACOG TA01B (RMR)", "CUP_optic_ACOG_TA01B_RMR_Black", 750, "item"],
	["Trijicon ACOG TA01B (RMR/Coyote)", "CUP_optic_ACOG_TA01B_RMR_Coyote", 750, "item"],
	["Trijicon ACOG TA01B (RMR/OD)", "CUP_optic_ACOG_TA01B_RMR_OD", 750, "item"],
	["Trijicon ACOG TA01B (RMR/Tan)", "CUP_optic_ACOG_TA01B_RMR_Tan", 750, "item"],
	["Trijicon ACOG TA01B (RMR/Tropic)", "CUP_optic_ACOG_TA01B_RMR_Tropic", 750, "item"],
	["Trijicon ACOG TA01B (Tan)", "CUP_optic_ACOG_TA01B_Tan", 750, "item"],
	["Trijicon ACOG TA01B (Tropic)", "CUP_optic_ACOG_TA01B_Tropic", 750, "item"],
	["Trijicon ACOG TA01NSN (Coyote)", "CUP_optic_RCO", 800, "item"],
	["Trijicon ACOG TA01NSN (Desert)", "CUP_optic_RCO_desert", 800, "item"],
	["Trijicon ACOG TA01NSN (OD)", "CUP_optic_ACOG_TA01NSN_OD", 800, "item"],
	["Trijicon ACOG TA01NSN (RMR)", "CUP_optic_ACOG_TA01NSN_RMR_Black", 800, "item"],
	["Trijicon ACOG TA01NSN (RMR/Coyote)", "CUP_optic_ACOG_TA01NSN_RMR_Coyote", 800, "item"],
	["Trijicon ACOG TA01NSN (RMR/OD)", "CUP_optic_ACOG_TA01NSN_RMR_OD", 800, "item"],
	["Trijicon ACOG TA01NSN (RMR/Tan)", "CUP_optic_ACOG_TA01NSN_RMR_Tan", 800, "item"],
	["Trijicon ACOG TA01NSN (RMR/Tropic)", "CUP_optic_ACOG_TA01NSN_RMR_Tropic", 800, "item"],
	["Trijicon ACOG TA01NSN (Tan)", "CUP_optic_ACOG_TA01NSN_Tan", 800, "item"],
	["Trijicon ACOG TA01NSN (Tropic)", "CUP_optic_ACOG_TA01NSN_Tropic", 800, "item"],
	["Trijicon ACOG TA31F (Reflex)", "CUP_optic_ACOG", 850, "item"],
	["Trijicon ACOG TA31F (Reflex/Desert)", "CUP_optic_ACOG_Reflex_Desert", 850, "item"],
	["Trijicon ACOG TA31F (Reflex/Woodland)", "CUP_optic_ACOG_Reflex_Wood", 850, "item"],
	["Trijicon ACOG TA31F", "CUP_optic_ACOG2", 850, "item"],
	["ZO 4x30", "BWA3_optic_ZO4x30", 800, "item"],
	["ZO 4x30 (Brown)", "BWA3_optic_ZO4x30_brown", 800, "item"],
	["ZO 4x30 (MicroT2)", "BWA3_optic_ZO4x30_MicroT2", 800, "item"],
	["ZO 4x30 (MicroT2, Brown)", "BWA3_optic_ZO4x30_MicroT2_brown", 800, "item"],
	["ZO 4x30 (RSAS)", "BWA3_optic_ZO4x30_RSAS", 800, "item"],
	["ZO 4x30 (RSAS, Brown)", "BWA3_optic_ZO4x30_RSAS_brown", 800, "item"],
	["ZO 4x30i", "BWA3_optic_ZO4x30i", 900, "item"],
	["ZO 4x30i (MicroT2)", "BWA3_optic_ZO4x30i_MicroT2", 900, "item"],
	["ZO 4x30i (MicroT2, Desert)", "BWA3_optic_ZO4x30i_MicroT2", 900, "item"],
	["ZO 4x30i (RSAS)", "BWA3_optic_ZO4x30i_MicroT2_sand", 900, "item"],
	// ["", "CUP_15Rnd_9x19_M9", 100, "item"],
	["ZO 4x30i (RSAS, Desert)", "BWA3_optic_ZO4x30i_RSAS_sand", 900, "item"],
	["ZO 4x30i (Desert)", "BWA3_optic_ZO4x30i_sand", 900, "item"],
	["1P36", "CUP_optic_1p63", 500, "item"],
	["EKP-8-02", "CUP_optic_ekp_8_02", 500, "item"],
	["Kobra Reflex Sight", "CUP_optic_Kobra", 500, "item"],
	["Pecheneg 1P78 Scope", "CUP_optic_PechenegScope", 1000, "item"],
	["PSO-1-1 Scope", "CUP_optic_PSO_1_1", 1200, "item"],
	["PSO-1-1 Scope (w/o eyepiece)", "CUP_optic_PSO_1_1_open", 1200, "item"],
	["PSO-1 Scope", "CUP_optic_PSO_1", 1400, "item"],
	["PSO-1 Scope (AK)", "CUP_optic_PSO_1_AK", 1400, "item"],
	["PSO-1 Scope (w/o eyepiece)", "CUP_optic_PSO_1_open", 1400, "item"],
	["PSO-1 Scope (w/o eyepiece/AK)", "CUP_optic_PSO_1_AK_open", 1400, "item"],
	["PSO-3 Scope", "CUP_optic_PSO_3", 1600, "item"],
	["PSO-3 Scope (w/o eyepiece)", "CUP_optic_PSO_3_open", 1600, "item"],
	["NSPU Scope / 1PN34", "CUP_optic_NSPU", 7500, "item"],
	["AN/PVS-10 NVS", "CUP_optic_AN_PVS_10", 6500, "item"],
	["AN/PVS-10 NVS (Black)", "CUP_optic_AN_PVS_10_black", 6500, "item"],
	["AN/PVS-10 NVS (OD)", "CUP_optic_AN_PVS_10_od", 6500, "item"],
	["AN/PVS-4 NVS", "CUP_optic_AN_PVS_4", 5000, "item"],
	["AN/PVS-4 NVS (M14)", "CUP_optic_AN_PVS_4_M14", 5200, "item"],
	["AN/PVS-4 NVS (M16)", "CUP_optic_AN_PVS_4_M16", 5300, "item"],
	["NVS", "optic_NVS", 5000, "item"]
	//["TWS", "optic_tws", 50000, "item", "HIDDEN"], // To hide from store list, add "HIDDEN" after "item", like "item", "HIDDEN"]
	//["TWS MG", "optic_tws_mg", 60000, "item", "HIDDEN"],
	//["Nightstalker", "optic_Nightstalker", 75000, "item", "HIDDEN"],
	// ["CWS", "CUP_optic_CWS", 75000, "item", "HIDDEN"],
	// ["AN/PAS 13C1 TWS", "CUP_optic_AN_PAS_13c1", 75000, "item", "HIDDEN"],
	// ["AN/PAS 13C2 HTWS", "CUP_optic_AN_PAS_13c2", 75000, "item", "HIDDEN"],
	// "CUP_optic_GOSHAWK_RIS"; //Goshawk TWS (RIS)
	// "CUP_optic_GOSHAWK"; //Goshawk TWS (no RIS)
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	["Gas Mask (NATO)", "H_CrewHelmetHeli_B", 1000, "hat"],
	["Gas Mask (CSAT)", "H_CrewHelmetHeli_O", 1000, "hat"],
	["Gas Mask (AAF)", "H_CrewHelmetHeli_I", 1000, "hat"],
	["Gas Mask (LDF)", "H_CrewHelmetHeli_I_E", 1000, "hat"],
	["Modular Helmet (Digi)", "H_HelmetIA", 500, "hat"],
	// ["MICH (Camo)", "H_HelmetIA_net", 250, "hat"],
	// ["MICH 2 (Camo)", "H_HelmetIA_camo", 250, "hat"],
	["Combat Helmet", "H_HelmetB", 250, "hat"],
	["Combat Helmet (Black)", "H_HelmetB_black", 250, "hat"],
	["Combat Helmet (Camonet)", "H_HelmetB_camo", 250, "hat"],
	["Combat Helmet (Woodland)", "H_HelmetB_plain_wdl", 250, "hat", "noDLC"],
	// ["Light Combat Helmet (Woodland)", "H_HelmetB_light_wdl", 250, "hat", "noDLC"],
	["Crew Helmet (Soft CSAT)", "H_Tank_black_F", 250, "hat"],
	["Crew Helmet (Soft LDF)", "H_Tank_eaf_F", 250, "hat"],
	["Stealth Combat Helmet", "H_HelmetB_TI_tna_F", 275, "hat"],
	["Enhanced Combat Helmet", "H_HelmetSpecB", 275, "hat"],
	["Enhanced Combat Helmet (Black)", "H_HelmetSpecB_blk", 275, "hat"],
	["Enhanced Combat Helmet (Snakeskin)", "H_HelmetSpecB_snakeskin", 275, "hat"],
	["Enhanced Combat Helmet (ApexDLC Tropic)", "H_HelmetB_Enh_tna_F", 275, "hat", "noDLC"],
	["Enhanced Combat Helmet (Woodland)", "H_HelmetSpecB_wdl", 275, "hat", "noDLC"],
	["Advanced Modular Helmet", "H_HelmetHBK_headset_F", 500, "hat"],
	["Advanced Modular Helmet (Chops)", "H_HelmetHBK_chops_F", 500, "hat"],
	["Advanced Modular Helmet (Ear Protectors)", "H_HelmetHBK_ear_F", 500, "hat"],
	["Advanced Modular Helmet (Olive)", "H_HelmetHBK_F", 500, "hat"],
	["Avenger Helmet", "H_HelmetAggressor_F", 500, "hat"],
	["Avenger Helmet (Cover B)", "H_HelmetAggressor_cover_F", 500, "hat"],
	["Avenger Helmet (Cover T)", "H_HelmetAggressor_cover_taiga_F", 500, "hat"],
	["Protector Helmet (Hex)", "H_HelmetO_ocamo", 260, "hat"],
	["Protector Helmet (Urban)", "H_HelmetO_oucamo", 260, "hat"],
	["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 275, "hat"],
	["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 275, "hat"],
	["Defender Helmet (Hex)", "H_HelmetLeaderO_ocamo", 300, "hat"],
	["Defender Helmet (Urban)", "H_HelmetLeaderO_oucamo", 300, "hat"],
	["Defender Helmet (ApexDLC G Hex)", "H_HelmetLeaderO_ghex_F", 300, "hat", "noDLC"],
	["Pilot Helmet (NATO)", "H_PilotHelmetFighter_B", 260, "hat"],
	["Pilot Helmet (CSAT)", "H_PilotHelmetFighter_O", 260, "hat"],
	["Pilot Helmet (AAF)", "H_PilotHelmetFighter_I", 260, "hat"],
	["Pilot Helmet (LDF)", "H_PilotHelmetFighter_I_E", 260, "hat", "noDLC"],
	["Crew Helmet (NATO)", "H_HelmetCrew_B", 260, "hat"],
	["Crew Helmet (CSAT)", "H_HelmetCrew_O", 260, "hat"],
	["Crew Helmet (AAF)", "H_HelmetCrew_I", 260, "hat"],
	["Crew Helmet (LDF)", "H_HelmetCrew_I_E", 260, "hat"],
	// ["Special Purpose Helmet (GHex)", "H_HelmetO_ViperSP_ghex_F", 2500, "hat"],
	// ["Special Purpose Helmet (Hex)", "H_HelmetO_ViperSP_hex_F", 2500, "hat"],
	["Heli Pilot Helmet (NATO)", "H_PilotHelmetHeli_B", 250, "hat"],
	["Heli Pilot Helmet (CSAT)", "H_PilotHelmetHeli_O", 250, "hat"],
	["Heli Pilot Helmet (AAF)", "H_PilotHelmetHeli_I", 250, "hat"],
	["Heli Pilot Helmet (LDF)", "H_PilotHelmetHeli_I_E", 250, "hat"],
	["Military Cap (Blue)", "H_MilCap_blue", 100, "hat"],
	["Military Cap (Gray)", "H_MilCap_gry", 100, "hat"],
	["Military Cap (Urban)", "H_MilCap_oucamo", 100, "hat"],
	["Military Cap (Russia)", "H_MilCap_rucamo", 100, "hat"],
	["Military Cap (MTP)", "H_MilCap_mcamo", 100, "hat"],
	["Military Cap (Hex)", "H_MilCap_ocamo", 100, "hat"],
	["Military Cap (AAF)", "H_MilCap_dgtl", 100, "hat"],
	["Military Cap (Green)", "H_MilCap_grn", 100, "hat", "noDLC"],
	["Military Cap (Taiga)", "H_MilCap_taiga", 100, "hat", "noDLC"],
	["Military Cap (Woodland)", "H_MilCap_wdl", 100, "hat", "noDLC"],
	["Military Cap (LDF)", "H_MilCap_eaf", 100, "hat", "noDLC"],
	["Military Cap (ApexDLC Tropic)", "H_MilCap_tna_F", 100, "hat", "noDLC"],
	["Military Cap (ApexDLC G HEX)", "H_MilCap_ghex_F", 100, "hat", "noDLC"],
	["Skater Helmet (ApexDLC)", "H_Helmet_Skate", 100, "hat", "noDLC"],
	["Strawhat (Dark)", "H_StrawHat_dark", 100, "hat"],
	["Strawhat", "H_StrawHat", 100, "hat"],
	["Rangemaster Cap", "H_Cap_headphones", 100, "hat"],
	["Bandana (Black)", "H_Bandanna_gry", 100, "hat"],
	["Bandana (Blue)", "H_Bandanna_blu", 100, "hat"],
	["Bandana (Coyote)", "H_Bandanna_cbr", 100, "hat"],
	["Bandana (Headset)", "H_Bandanna_khk_hs", 100, "hat"],
	["Bandana (Khaki)", "H_Bandanna_khk", 100, "hat"],
	["Bandana (MTP)", "H_Bandanna_mcamo", 100, "hat"],
	["Bandana (Sage)", "H_Bandanna_sgg", 100, "hat"],
	["Bandana (Sand)", "H_Bandanna_sand", 100, "hat"],
	["Bandana (Surfer)", "H_Bandanna_surfer", 100, "hat"],
	["Bandana (Surfer, Black)", "H_Bandanna_surfer_blk", 100, "hat"],
	["Bandana (Surfer, Green)", "H_Bandanna_surfer_grn", 100, "hat"],
	["Bandana (Woodland)", "H_Bandanna_camo", 100, "hat"],
	// ["Bandanna Mask (Black)", "H_BandMask_blk", 100, "hat"],
	// ["Bandanna Mask (Demon)", "H_BandMask_demon", 100, "hat"],
	// ["Bandanna Mask (Khaki)", "H_BandMask_khk", 100, "hat"],
	// ["Bandanna Mask (Reaper)", "H_BandMask_reaper", 100, "hat"],
	["Beanie (Black)", "H_Watchcap_blk", 100, "hat"],
	["Beanie (Brown)", "H_Watchcap_cbr", 100, "hat"],
	["Beanie (Khaki)", "H_Watchcap_khk", 100, "hat"],
	["Beanie (Navy)", "H_Watchcap_sgg", 100, "hat"],
	["Beanie (Olive)", "H_Watchcap_camo", 100, "hat"],
	["Beanie (LDF)", "H_Beret_EAF_01_F", 100, "hat"],
	["Beret (Black)", "H_Beret_blk", 100, "hat"],
	["Beret (Colonel)", "H_Beret_Colonel", 100, "hat"],
	["Beret (NATO)", "H_Beret_02", 100, "hat"],
	["RED Beret (TBD)", "H_Beret_CSAT_01_F", 100, "hat"], //OLDMAN DLC
	// ["Beret (Green)", "H_Beret_grn", 100, "hat"],
	// ["Beret (Police)", "H_Beret_blk_POLICE", 100, "hat"],
	// ["Beret (Red)", "H_Beret_red", 100, "hat"],
	// ["Beret (SAS)", "H_Beret_brn_SF", 100, "hat"],
	// ["Beret (SF)", "H_Beret_grn_SF", 100, "hat"],
	// ["Beret (RED)", "H_Beret_ocamo", 100, "hat"],
	// ["Black Turban", "H_TurbanO_blk", 100, "hat"],
	// ["Booniehat (Dirty)", "H_Booniehat_dirty", 100, "hat"],
	// ["Booniehat (Green)", "H_Booniehat_grn", 100, "hat"],
	// ["Booniehat (Khaki)", "H_Booniehat_indp", 100, "hat"],
	["Booniehat (AAF)", "H_Booniehat_dgtl", 100, "hat"],
	["Booniehat (Headset)", "H_Booniehat_khk_hs", 100, "hat"],
	["Booniehat (Khaki)", "H_Booniehat_khk", 100, "hat"],
	["Booniehat (MTP)", "H_Booniehat_mcamo", 100, "hat"],
	["Booniehat (Olive)", "H_Booniehat_oli", 100, "hat"],
	["Booniehat (Sand)", "H_Booniehat_tan", 100, "hat"],
	["Booniehat (Green)", "H_Booniehat_mgrn", 100, "hat", "noDLC"],
	["Booniehat (Taiga)", "H_Booniehat_taiga", 100, "hat", "noDLC"],
	["Booniehat (Woodland)", "H_Booniehat_wdl", 100, "hat", "noDLC"],
	["Booniehat (LDF)", "H_Booniehat_eaf", 100, "hat", "noDLC"],
	["Booniehat (ApexDLC Tropic)", "H_Booniehat_tna_F", 100, "hat", "noDLC"],
	["Tin Foil Hat", "H_Hat_Tinfoil_F", 100, "hat"],
	["Fedora (Blue)", "H_Hat_blue", 100, "hat"],
	["Fedora (Brown)", "H_Hat_brown", 100, "hat"],
	["Fedora (Camo)", "H_Hat_camo", 100, "hat"],
	["Fedora (Checker)", "H_Hat_checker", 100, "hat"],
	["Fedora (Gray)", "H_Hat_grey", 100, "hat"],
	["Fedora (Tan)", "H_Hat_tan", 100, "hat"],
	["Cap (BI)", "H_Cap_grn_BI", 100, "hat"],
	["Cap (Black)", "H_Cap_blk", 100, "hat"],
	["Cap (Blue)", "H_Cap_blu", 100, "hat"],
	["Cap (CMMG)", "H_Cap_blk_CMMG", 100, "hat"],
	["Cap (Green)", "H_Cap_grn", 100, "hat"],
	["Cap (ION)", "H_Cap_blk_ION", 100, "hat"],
	["Cap (Olive)", "H_Cap_oli", 100, "hat"],
	["Cap (Olive, Headset)", "H_Cap_oli_hs", 100, "hat"],
	["Cap (Police)", "H_Cap_police", 100, "hat"],
	["Cap (Press)", "H_Cap_press", 100, "hat"],
	["Cap (Red)", "H_Cap_red", 100, "hat"],
	["Cap (Surfer)", "H_Cap_surfer", 100, "hat"],
	["Cap (Tan)", "H_Cap_tan", 100, "hat"],
	["Cap (UK)", "H_Cap_khaki_specops_UK", 100, "hat"],
	["Cap (US Black)", "H_Cap_usblack", 100, "hat"],
	["Cap (US MTP)", "H_Cap_tan_specops_US", 100, "hat"],
	["Cap (AAF)", "H_Cap_blk_Raven", 100, "hat"],
	["Cap (OPFOR)", "H_Cap_brn_SPECOPS", 100, "hat"],
	["IDAP Cap (LawsDLC Orange)", "H_Cap_Orange_IDAP_F", 100, "hat", "noDLC"],
	["IDAP Cap (LawsDLC Black)", "H_Cap_Black_IDAP_F", 100, "hat", "noDLC"],
	["IDAP Cap (LawsDLC White)", "H_Cap_White_IDAP_F", 100, "hat", "noDLC"],
	["Earplugs (LawsDLC Yellow)", "H_EarProtectors_yellow_F", 100, "hat", "noDLC"],
	["Earplugs (LawsDLC Orange)", "H_EarProtectors_orange_F", 100, "hat", "noDLC"],
	["Earplugs (LawsDLC Red)", "H_EarProtectors_red_F", 100, "hat", "noDLC"],
	["Earplugs (LawsDLC Black)", "H_EarProtectors_black_F", 100, "hat", "noDLC"],
	["Press Neck Helmet (LawsDLC Blue)", "H_PASGT_neckprot_blue_press_F", 100, "hat", "noDLC"],
	["Press Helmet (LawsDLC Blue)", "H_PASGT_basic_blue_press_F", 100, "hat", "noDLC"],
	["Shemag (Olive)", "H_Shemag_olive", 205, "hat"],
	["Shemag (Olive, Headset)", "H_Shemag_olive_hs", 205, "hat"],
	["Shemag (Tan)", "H_ShemagOpen_tan", 205, "hat"],
	["Shemag (White)", "H_ShemagOpen_khk", 205, "hat"],
	// ["Shemag mask (Tan)", "H_Shemag_tan", 25, "hat"],
	["Racing Helmet (KartDLC Black)", "H_RacingHelmet_1_black_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Blue)", "H_RacingHelmet_1_blue_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Green)", "H_RacingHelmet_1_green_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Yellow)", "H_RacingHelmet_1_yellow_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Orange)", "H_RacingHelmet_1_orange_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Red)", "H_RacingHelmet_1_red_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC White)", "H_RacingHelmet_1_white_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Fuel)", "H_RacingHelmet_1_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Bluking)", "H_RacingHelmet_2_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Redstone)", "H_RacingHelmet_3_F", 125, "hat", "noDLC"],
	["Racing Helmet (KartDLC Vrana)", "H_RacingHelmet_4_F", 125, "hat", "noDLC"],
	["Safari Hat (LawsDLC Olive)", "H_Hat_Safari_olive_F", 110, "hat", "noDLC"],
	["Safari Hat (LawsDLC Sand)", "H_Hat_Safari_sand_F", 110, "hat", "noDLC"],
	["Standard Helmet (LawsDLC Blue)", "H_PASGT_basic_blue_F", 110, "hat", "noDLC"],
	["Standard Helmet (LawsDLC Olive)", "H_PASGT_basic_olive_F", 210, "hat", "noDLC"],
	["Standard Helmet (LawsDLC White)", "H_PASGT_basic_white_F", 210, "hat", "noDLC"],
	["Standard Helmet (LawsDLC Black)", "H_PASGT_basic_black_F", 210, "hat", "noDLC"],
	["Construction Helmet (LawsDLC Yellow)", "H_Construction_earprot_yellow_F", 220, "hat", "noDLC"],
	["Construction Helmet (LawsDLC Orange)", "H_Construction_earprot_orange_F", 220, "hat", "noDLC"],
	["Construction Helmet (LawsDLC Red)", "H_Construction_earprot_red_F", 220, "hat", "noDLC"],
	["Construction Helmet (LawsDLC Black)", "H_Construction_earprot_black_F", 220, "hat", "noDLC"],
	["Construction Helmet (LawsDLC Vrana)", "H_Construction_earprot_vrana_F", 220, "hat", "noDLC"],
	["Construction Helmet (LawsDLC White)", "H_Construction_earprot_white_F", 220, "hat", "noDLC"],
	["Bloody Bandage (LawsDLC)", "H_HeadBandage_bloody_F", 150, "hat", "noDLC"],
	["Stained Bandage (LawsDLC)", "H_HeadBandage_stained_F", 150, "hat", "noDLC"],
	["Clean Bandage (LawsDLC)", "H_HeadBandage_clean_F", 150, "hat", "noDLC"],
	//["Viper Tropic Test (ApexDLC)", "H_HelmetO_ViperSP_ghex_F", 120000, "hat", "noDLC"], //Disable Thermal Script noch nicht fertig
	//["Viper Desert Test (ApexDLC)", "H_HelmetO_ViperSP_hex_F", 120000, "hat", "noDLC"] //Disable Thermal Script noch nicht fertig
	["6B27 Helmet (Beige Digital/Goggles/Headset)", "CUP_H_RUS_6B27_cover_BeigeDigital_headset_goggles", 250, "hat"], //Armor II
	["6B27 Helmet (EMR/Goggles/Headset)", "CUP_H_RUS_6B27_cover_headset_goggles", 250, "hat"], //Armor II
	["6B27 Helmet (Green)", "CUP_H_RUS_6B27_olive", 250, "hat"], //Armor II
	["6B27 Helmet (Olive/Goggles/Headset)", "CUP_H_RUS_6B27_headset_goggles", 250, "hat"], //Armor II
	["6B27 Helmet (Desert/Goggles/Headset)", "CUP_H_RUS_6B47_headset_goggles_desert", 200, "hat"], //Armor I
	["ACVC (Green)", "CUP_H_USMC_ACVC_WDL", 200, "hat"], //Armor I
	["ACVC (Sand)", "CUP_H_USMC_ACVC_DES", 200, "hat"], //Armor I
	["Altyn Combat Helmet (Black/Shield down)", "CUP_H_RUS_Altyn_Shield_Down_black", 350, "hat"], //Armor IV
	["Altyn Combat Helmet (Green/Shield down)", "CUP_H_RUS_Altyn_Shield_Down", 350, "hat"], //Armor IV
	["Altyn Combat Helmet (Olive/Shield down)", "CUP_H_RUS_Altyn_Shield_Down_khaki", 350, "hat"], //Armor IV
	["Barett (Fallschirmjaeger) Red", "BWA3_Beret_Falli", 100, "hat"],
	["Barett (Jaeger) Green", "BWA3_Beret_Jaeger", 100, "hat"],
	["Barett (Wachbattalion, Blau)", "BWA3_Beret_Wach_blue", 100, "hat"],
	["Beanie (Black)", "CUP_H_PMC_Beanie_Black", 100, "hat"],
	["Beanie (Black/White)", "CUP_H_C_Beanie_01", 100, "hat"],
	["Beanie (Brown/Yellow)", "CUP_H_C_Beanie_03", 100, "hat"],
	["Beanie (Brown)", "CUP_H_C_Beanie_04", 100, "hat"],
	["Beanie (Green)", "CUP_H_SLA_BeanieGreen", 100, "hat"],
	["eanie (Headphones/Black)", "CUP_H_PMC_Beanie_Headphones_Black", 100, "hat"],
	["Beanie (Headphones/Khaki)", "CUP_H_PMC_Beanie_Headphones_Khaki", 100, "hat"],
	["Beanie (Headphones/Winter)", "CUP_H_PMC_Beanie_Headphones_Winter", 100, "hat"],
	["Beanie (Khaki)", "CUP_H_PMC_Beanie_Khaki", 100, "hat"],
	["Beanie (Winter)", "CUP_H_PMC_Beanie_Winter", 100, "hat"],
	["Beanie (Woodland Digital)", "CUP_H_ChDKZ_Beanie", 100, "hat"],
	["Beret (Brown check)", "CUP_H_C_Beret_04", 100, "hat"],
	["Beret (Purple/Gold)", "CUP_H_C_Beret_03", 100, "hat"],
	["Beret (RACS)", "CUP_H_RACS_Beret_Blue", 100, "hat"],
	["Beret (SLA Especas)", "CUP_H_SLA_Beret", 100, "hat"],
	["Beret (Spetsnaz)", "CUP_H_RUS_Beret_Spetsnaz", 100, "hat"],
	["Beret (Takistani Officer)", "CUP_H_TK_Beret", 100, "hat"],
	["Beret (UN)", "CUP_H_CDF_Beret_UN", 100, "hat"],
	["Beret (VDV)", "CUP_H_RUS_Beret_VDV", 100, "hat"],
	["Beret ACR", "CUP_H_CZ_Hat01", 100, "hat"],
	["Boonie (Flecktarn)", "CUP_H_Ger_Boonie2_Flecktarn", 100, "hat"],
	["Boonie (M81)", "CUP_H_USA_Boonie_wdl", 100, "hat"],
	["Boonie (Tropentarn)", "CUP_H_Ger_Boonie2_desert", 100, "hat"],
	["Boonie ACR", "CUP_H_CZ_Hat02", 100, "hat"],
	["Boonie ACR (Desert)", "CUP_H_CZ_Booniehat_vz95_des", 100, "hat"],
	["Boonie ACR (Desert/Folded)", "CUP_H_CZ_Booniehat_fold_des", 100, "hat"],
	["Boonie ACR (Folded)", "CUP_H_CZ_Hat03", 100, "hat"],
	["Boonie w/headset (Flecktarn)", "CUP_H_Ger_Boonie_Flecktarn", 100, "hat"],
	["Boonie w/headset (MARPAT)", "CUP_H_FR_BoonieMARPAT", 100, "hat"],
	["Boonie w/headset (Tropentarn)", "CUP_H_Ger_Boonie_desert", 100, "hat"],
	["Boonie w/headset (WDL)", "CUP_H_FR_BoonieWDL", 100, "hat"],
	["Boonie w/PRR (MARPAT Woodland)", "CUP_H_USMC_BOONIE_PRR_WDL", 100, "hat"],
	["Boonie w/PRR (WDL)", "CUP_H_FR_PRR_BoonieWDL", 100, "hat"],
	["BoonieHat (SLA Desert)", "CUP_H_SLA_Boonie_DES", 100, "hat"],
	["BoonieHat (SLA Urban)", "CUP_H_SLA_Boonie_URB", 100, "hat"],
	["BoonieHat (SLA Woodland)", "CUP_H_SLA_Boonie", 100, "hat"],
	["Buschhut (Flecktarn)", "BWA3_Booniehat_Fleck", 100, "hat"],
	["Buschhut (Multitarn)", "BWA3_Booniehat_Multi", 100, "hat"],
	["Buschhut (Tropentarn)", "BWA3_Booniehat_Tropen", 100, "hat"],
	["Cup (ACU)", "CUP_H_USA_Cap", 100, "hat"],
	["Cup (Burberry)", "CUP_H_PMC_Cap_Burberry", 100, "hat"],
	["Cup (Grey)", "CUP_H_PMC_Cap_Grey", 100, "hat"],
	["Cup (KSK Olive Flag)", "CUP_H_Ger_Cap_Grn2", 100, "hat"],
	["Cup (KSK Tan Flag)", "CUP_H_Ger_Cap_Tan2", 100, "hat"],
	["Cup (Officer MARPAT)", "CUP_H_USMC_Officer_Cap", 100, "hat"],
	["Cup (Tan)", "CUP_H_PMC_Cap_Tan", 100, "hat"],
	["Cup ACR (Desert//DEF)", "CUP_H_CZ_Cap_Headphones_des", 100, "hat"],
	["Cup ACR (Green/DEF)", "CUP_H_CZ_Cap_Headphones", 100, "hat"],
	["Cup Backwards (Burberry)", "CUP_H_PMC_Cap_Back_Burberry", 100, "hat"],
	["Cup Backwards (Grey)", "CUP_H_PMC_Cap_Back_Grey", 100, "hat"],
	["Cup Backwards (Tan)", "CUP_H_PMC_Cap_Back_Tan", 100, "hat"],
	["Cup Backwards w/DEF (Grey)", "CUP_H_PMC_Cap_Back_EP_Grey", 100, "hat"],
	["Cup Backwards w/DEF (Tan)", "CUP_H_PMC_Cap_Back_EP_Tan", 100, "hat"],
	["Cup Backwards w/PRR (Burberry)", "CUP_H_PMC_Cap_Back_PRR_Burberry", 100, "hat"],
	["Cup Backwards w/PRR (Grey)", "CUP_H_PMC_Cap_Back_PRR_Grey", 100, "hat"],
	["Cup Backwards w/PRR (Tan)", "CUP_H_PMC_Cap_Back_PRR_Tan", 100, "hat"],
	["Cup w/Headset (Officer MARPAT)", "CUP_H_FR_Cap_Officer_Headset", 100, "hat"],
	["CDF Office Cap (Tri Color Desert)", "CUP_H_CDF_OfficerCap_DST", 100, "hat"],
	["CDF Office Cap (Tri Color Forest)", "CUP_H_CDF_OfficerCap_FST", 100, "hat"],
	["CDF Office Cap (Tri Color Mountain)", "CUP_H_CDF_OfficerCap_MNT", 100, "hat"],
	["CDF Office Cap (Tri Color Winter)", "CUP_H_CDF_OfficerCap_SNW", 100, "hat"],
	["CDF Office Cap (UN)", "CUP_H_CDF_OfficerCap_UN", 100, "hat"],
	["CDF PASGT (Tri-Color Desert)", "CUP_H_CDF_H_PASGT_DST", 250, "hat"], //Armor II
	["CDF PASGT (Tri-Color Forest)", "CUP_H_CDF_H_PASGT_FST", 250, "hat"], //Armor II
	["CDF PASGT (Tri-Color Mountain)", "CUP_H_CDF_H_PASGT_MNT", 250, "hat"], //Armor II
	["CDF PASGT (Tri-Color Winter)", "CUP_H_CDF_H_PASGT_SNW", 250, "hat"], //Armor II
	["CDF PASGT (UN)", "CUP_H_CDF_H_PASGT_UN", 250, "hat"], //Armor II
	["Combat Helmet ACR (Desert)", "CUP_H_CZ_Helmet01", 250, "hat"], //Armor II
	["Combat Helmet ACR (Desert/Googles)", "CUP_H_CZ_Helmet02", 250, "hat"], //Armor II
	["Combat Helmet ACR (Woodland)", "CUP_H_CZ_Helmet03", 250, "hat"], //Armor II
	["Combat Helmet ACR (Woodland/Googles)", "CUP_H_CZ_Helmet04", 250, "hat"], //Armor II
	["Crew Helmet (USMC)", "CUP_H_USMC_Crew_Helmet", 200, "hat"], //Armor I
	["Crew Helmet ACR", "CUP_H_CZ_Helmet05", 250, "hat"], //Armor I
	["Crewman KSK Helm", "BWA3_CrewmanKSK", 250, "hat"], //Armor II
	["Crewman KSK Helm (Flecktarn)", "BWA3_CrewmanKSK_Fleck", 250, "hat"], //Armor II
	["Crewman KSK Helm (Flecktarn, Headset)", "BWA3_CrewmanKSK_Fleck_Headset", 250, "hat"], //Armor II
	["Crewman KSK Helm (Headset)", "BWA3_CrewmanKSK_Headset", 250, "hat"], //Armor II
	["Crewman KSK Helm (Tropentarn)", "BWA3_CrewmanKSK_Tropen", 250, "hat"], //Armor II
	["Crewman KSK Helm (Tropentarn, Headset)", "BWA3_CrewmanKSK_Tropen_Headset", 250, "hat"], //Armor II
	["Defender Headset", "CUP_H_PMC_EP_Headset", 250, "hat"], //Armor II
	["ECH (Black)", "CUP_H_USArmy_Helmet_ECH1_Black", 250, "hat"], //Armor II
	["ECH (Sand)", "CUP_H_FR_ECH", 250, "hat"], //Armor II
	["ECH (Sand)", "CUP_H_USArmy_Helmet_ECH1_Sand", 250, "hat"], //Armor II
	["Fedora (Indiana Jones)", "CUP_H_NAPA_Fedora", 250, "hat"],
	["Gefechtshelm M92 (Flecktarn)", "BWA3_M92_Fleck", 250, "hat"], //Armor II
	["Gefechtshelm M92 (Multitarn)", "BWA3_M92_Multi", 250, "hat"], //Armor II
	["Gefechtshelm M92 (Tropentarn)", "BWA3_M92_Tropen", 250, "hat"], //Armor II
	["Headband w/Headset (Woodland)", "CUP_H_FR_Headband_Headset", 100, "hat"],
	["Headset (light)", "CUP_H_FR_Headset", 100, "hat"],
	["K6-3 Combat Helmet (Black/Goggles)", "CUP_H_RUS_K6_3_Goggles_black", 350, "hat"], //Armor IV
	["K6-3 Combat Helmet (Black/Shield down)", "CUP_H_RUS_K6_3_Shield_Down_black", 350, "hat"], //Armor IV
	["K6-3 Combat Helmet (Green/Shield down)", "CUP_H_RUS_K6_3_Shield_Down", 350, "hat"], //Armor IV
	["K6-3 Combat Helmet (Khaki/Shield down)", "CUP_H_RUS_K6_3_Shield_Down_khaki", 350, "hat"], //Armor IV
	["LWH (Flecktarn)", "CUP_H_GER_LWH_Flecktarn", 250, "hat"], //Armor II
	["LWH (MARPAT Desert)", "CUP_H_USMC_LWH_DES", 250, "hat"], //Armor II
	["LWH (MARPAT Woodland - ESS)", "CUP_H_USMC_Goggles_HelmetWDL", 250, "hat"], //Armor II
	["LWH (MARPAT Woodland - Headset)", "CUP_H_USMC_Headset_HelmetWDL", 250, "hat"], //Armor II
	["LWH (MARPAT Woodland)", "CUP_H_USMC_LWH_WDL", 250, "hat"], //Armor II
	["LWH (MARPAT Desert)", "CUP_H_USMC_HelmetWDL", 250, "hat"], //Armor II
	["LWH (Olive - Headset)", "CUP_H_RACS_Helmet_Headset_olive", 250, "hat"], //Armor II
	["LWH (RACS Desert - Headset)", "CUP_H_RACS_Helmet_Headset_DES", 250, "hat"], //Armor II
	["LWH (RACS Mech Inf - Headset)", "CUP_H_RACS_Helmet_Headset_mech", 250, "hat"], //Armor II
	["LWH (RACS Urban - Headset)", "CUP_H_RACS_Helmet_Headset_TPAT", 250, "hat"], //Armor II
	["LWH (RACS Woodland - Headset)", "CUP_H_RACS_Helmet_Headset_wdl", 250, "hat"], //Armor II
	["LWH (Tan)", "CUP_H_RACS_Helmet_tan", 250, "hat"], //Armor II
	["LWH (Tropentarn)", "CUP_H_GER_LWH_Tropentarn", 250, "hat"], //Armor II
	["LWH W/ESS (MARPAT Desert)", "CUP_H_USMC_LWH_ESS_DES", 250, "hat"],
	["LWH W/ESS (MARPAT Woodland)", "CUP_H_USMC_LWH_ESS_WDL", 250, "hat"], //Armor II
	["M1 (Cup/CUP)", "CUP_H_USArmy_Helmet_M1_btp", 200, "hat"], //Armor I
	["M1 (Cup/Olive)", "CUP_H_USArmy_Helmet_M1_Olive", 200, "hat"], //Armor I
	["M1 (Cup/Woodland)", "CUP_H_USArmy_Helmet_M1_m81", 200, "hat"], //Armor I
	["M92 Helmet (Black)", "CUP_H_Ger_M92_Black", 250, "hat"], //Armor II
	["M92 Helmet (Olive)", "CUP_H_Ger_M92", 250, "hat"], //Armor II
	["M92 Helmet (Ranger Green)", "CUP_H_Ger_M92_RGR", 250, "hat"], //Armor II
	["M92 Helmet (Tan)", "CUP_H_Ger_M92_Tan", 250, "hat"], //Armor II
	["M92 Helmet Covered (Flecktarn)", "CUP_H_Ger_M92_Cover", 200, "hat"],
	["M92 Helmet Covered (Tropentarn)", "CUP_H_Ger_M92_Cover_Trop", 200, "hat"],
	["M92 Helmet Covered Goggles (Flecktarn)", "CUP_H_Ger_M92_Cover_GG", 200, "hat"],
	["M92 Helmet Covered Goggles (Tropentarn)", "CUP_H_Ger_M92_Cover_Trop_GG", 200, "hat"],
	["MICH 2000 (DCU - Ear Pro)", "CUP_H_USArmy_HelmetMICH_earpro_DCU", 200, "hat"],
	["MICH 2000 (M81 - Ear Pro)", "CUP_H_USArmy_HelmetMICH_earpro_wdl", 200, "hat"],
	["Mk7 Helmet PRR Scrim (A)(MTP)", "CUP_H_BAF_MTP_Mk7_PRR_SCRIM_A", 250, "hat"],
	["Mk7 Helmet PRR Scrim (B)(MTP)", "CUP_H_BAF_MTP_Mk7_PRR_SCRIM_B", 250, "hat"],
	["Cap (Polizei)", "CUP_H_C_Policecap_01", 100, "hat"],
	["Navy Carrier Crew Uniform (Blue)", "CUP_H_Navy_CrewHelmet_Blue", 250, "hat"],
	["Navy Carrier Crew Uniform (Yellow)", "CUP_H_Navy_CrewHelmet_Yellow", 250, "hat"],
	["Navy Carrier Crew Uniform (Red)", "CUP_H_Navy_CrewHelmet_Red", 250, "hat"],
	["Ops-Core FAST Helm", "BWA3_OpsCore", 250, "hat"],
	["Ops Core FAST (Black)", "CUP_H_OpsCore_Black", 250, "hat"],
	["Ops Core FAST (Sprayed)", "CUP_H_OpsCore_Spray", 250, "hat"],
	["Ops Core FAST Covered SF (Tigerstripe)", "CUP_H_OpsCore_Covered_Tigerstripe_SF", 300, "hat"],
	["Ops Core FAST Covered SF (Multicam)", "CUP_H_OpsCore_Covered_MCAM_SF", 300, "hat"], //Armor III
	["Pakol (Brown/HS)", "CUP_H_CZ_Pakol_headset_f_brown", 100, "hat"],
	["Pakol (Grey/HS)", "CUP_H_CZ_Pakol_headset_b_grey", 100, "hat"],
	["PASGT Helmet (ERDL Highland)", "CUP_H_PASGTv2_ERDL_highland", 250, "hat"], //Armor II
	["PASGT Helmet (ERDL Lowland)", "CUP_H_PASGTv2_ERDL_lowland", 250, "hat"], //Armor II
	["PASGT Helmet (M81 Woodland)", "CUP_H_PASGTv2_WDL", 250, "hat"], //Armor II
	["Patrol Cap (ERDL Highland)", "CUP_H_US_patrol_cap_ERDL_highland", 100, "hat"],
	["Patrol Cap (ERDL Lowland)", "CUP_H_US_patrol_cap_ERDL", 100, "hat"],
	["Patrol Cap (ERDL Woodland)", "CUP_H_US_patrol_cap_WDL", 100, "hat"],
	["Patrol Cap ACR", "CUP_H_CZ_Patrol_Cap", 100, "hat"],
	["Pilot Helmet (Takistani)", "CUP_H_TK_PilotHelmet", 200, "hat"], //Armor I
	["Pilot Helmet ACR", "CUP_H_CZ_Helmet06", 200, "hat"], //Armor I
	["Pro-Tec", "CUP_H_USArmy_Helmet_Pro", 200, "hat"], //Armor I
	["SSh-60 (Cover/Net)", "CUP_H_TK_Helmet", 200, "hat"], //Armor I
	["SSh-60 (Olive/Worn)", "CUP_H_SLA_Helmet_OD_worn", 200, "hat"], //Armor I
	["SSh-60 (Grey/Worn)", "CUP_H_SLA_Helmet_URB_worn", 200, "hat"], //Armor I
	["SSh-60 (Desert/Worn)", "CUP_H_SLA_Helmet_DES_worn", 200, "hat"], //Armor I
	["SSh-68 (Berezka)", "CUP_H_RUS_SSH68_cover_berezka", 200, "hat"], //Armor I
	["SSh-68 (Olive)", "CUP_H_RUS_SSH68_olive", 200, "hat"], //Armor I
	["SSh-68 (VSR-84 Dubok)", "CUP_H_RUS_SSH68_cover_vsr84_dubok", 200, "hat"], //Armor I
	["SSh-68 (VSR-93)", "CUP_H_RUS_SSH68_cover_vsr93", 200, "hat"], //Armor I
	["SSh-68 (VSR-98)", "CUP_H_RUS_SSH68_cover_vsr98", 200, "hat"], //Armor I
	["Takistani Lungee (Black-SF)", "CUP_H_TK_Lungee", 100, "hat"],
	["Takistani Lungee (open Pattern 1)", "CUP_H_TKI_Lungee_Open_01", 100, "hat"],
	["Takistani Lungee (open Pattern 4)", "CUP_H_TKI_Lungee_Open_04", 100, "hat"],
	["Takistani Lungee (open Pattern 6)", "CUP_H_TKI_Lungee_Open_06", 100, "hat"],
	["Takistani Lungee (Pattern 1)", "CUP_H_TKI_Lungee_01", 100, "hat"],
	["Takistani Lungee (Pattern 4)", "CUP_H_TKI_Lungee_04", 100, "hat"],
	["Takistani Lungee (Pattern 5)", "CUP_H_TKI_Lungee_05", 100, "hat"],
	["Takistani Lungee (Pattern 6)", "CUP_H_TKI_Lungee_06", 100, "hat"],
	["Takistani Skull cap (Pattern 2)", "CUP_H_TKI_SkullCap_02", 100, "hat"],
	["Takistani Skull cap (Pattern 5)", "CUP_H_TKI_SkullCap_05", 100, "hat"],
	["TSh-4 (Black)", "CUP_H_SLA_TankerHelmet", 200, "hat"], //Armor I
	["TSh-4 (Desert)", "CUP_H_RUS_TSH_4_Brown", 200, "hat"], //Armor I
	["TSh-4 (Tan)", "CUP_H_TK_TankerHelmet", 200, "hat"], //Armor I
	["Ushanka (Dark Brown)", "CUP_H_C_Ushanka_03", 100, "hat"],
	["Ushanka (Green)", "CUP_H_C_Ushanka_02", 100, "hat"],
	["Ushanka (Light Brown)", "CUP_H_C_Ushanka_01", 100, "hat"],
	["ZSh-1 Combat Helmet (Green)", "CUP_H_RUS_ZSH_1", 300, "hat"], //Armor IV
	["ZSh-7 Pilot Helmet (Shield Down)", "CUP_H_RUS_ZSH_Shield_Down", 200, "hat"] //Armor I
];

uniformArray = compileFinal str
[
	["Wetsuit", "U_B_Wetsuit", 1000, "uni"],
	["Wetsuit", "U_O_Wetsuit", 1000, "uni"],
	["Wetsuit", "U_I_Wetsuit", 1000, "uni"],
	["Light Ghillie", "U_B_GhillieSuit", 2500, "uni"],
	["Light Ghillie", "U_O_GhillieSuit", 2500, "uni"],
	["Light Ghillie", "U_I_GhillieSuit", 2500, "uni"],
	["Light Ghillie (ApexDLC Jungle)", "U_B_T_Sniper_F", 2500, "uni", "noDLC"],
	["Light Ghillie (ApexDLC Jungle)", "U_O_T_Sniper_F", 2500, "uni", "noDLC"],
	["Full Ghillie (Arid)", "U_B_FullGhillie_ard", 4500, "uni"],
	["Full Ghillie (Arid)", "U_O_FullGhillie_ard", 4500, "uni"],
	["Full Ghillie (Arid)", "U_I_FullGhillie_ard", 4500, "uni"],
	["Full Ghillie (Lush)", "U_B_FullGhillie_lsh", 4500, "uni"],
	["Full Ghillie (Lush)", "U_O_FullGhillie_lsh", 4500, "uni"],
	["Full Ghillie (Lush)", "U_I_FullGhillie_lsh", 4500, "uni"],
	["Full Ghillie (Semi-Arid)", "U_B_FullGhillie_sard", 4500, "uni"],
	["Full Ghillie (Semi-Arid)", "U_O_FullGhillie_sard", 4500, "uni"],
	["Full Ghillie (Semi-Arid)", "U_I_FullGhillie_sard", 4500, "uni"],
	["Full Ghillie (ApexDLC Jungle)", "U_B_T_FullGhillie_tna_F", 4500, "uni", "noDLC"],
	["Full Ghillie (ApexDLC Jungle)", "U_O_T_FullGhillie_tna_F", 4500, "uni", "noDLC"],
	["CTRG Stealth Uniform", "U_B_CTRG_Soldier_F", 2000, "uni"],
	["Special Purpose Suit (ApexDLC Hex)", "U_O_V_Soldier_Viper_hex_F", 2000, "uni", "noDLC"],
	["Special Purpose Suit (ApexDLC G Hex)", "U_O_V_Soldier_Viper_F", 2000, "uni", "noDLC"],
	["Survival Fatigues (NATO)", "U_B_survival_uniform", 200, "uni"],
	["Default Uniform (NATO)", "U_B_CombatUniform_mcam", 125, "uni"],
	["Default Uniform (CSAT)", "U_O_OfficerUniform_ocamo", 125, "uni"],
	["Default Uniform 2 (CSAT)", "U_O_officer_noInsignia_hex_F", 125, "uni", "noDLC"],
	["Default Uniform (AAF)", "U_I_CombatUniform", 125, "uni"],
	["Recon Fatigues (MTP)", "U_B_CombatUniform_mcam_vest", 125, "uni"],
	["Combat Fatigues (ApexDLC Tropic)", "U_B_T_Soldier_F", 125, "uni", "noDLC"],
	["Combat Fatigues Shirt (ApexDLC Tropic)", "U_B_T_Soldier_AR_F", 125, "uni", "noDLC"],
	["Combat Fatigues (Tee)", "U_B_CombatUniform_mcam_tshirt", 125, "uni"],
	["Combat Fatigues (Gangsta)", "U_I_G_resistanceLeader_F", 125, "uni"],
	["Combat Fatigues (Rolled-up)", "U_I_CombatUniform_shortsleeve", 125, "uni"],
	["Combat Fatigues (Officer)", "U_I_E_Uniform_01_officer_F", 125, "uni", "noDLC"],
	["Combat Fatigues (Rolled-up)", "U_I_E_Uniform_01_shortsleeve_F", 125, "uni", "noDLC"],
	["Combat Fatigues (Tank Top)", "U_I_E_Uniform_01_tanktop_F", 125, "uni", "noDLC"],
	["Combat Fatigues (Woodland)", "U_B_CombatUniform_mcam_wdl_f", 125, "uni", "noDLC"],
	["Combat Fatigues (Woodland, Tee)", "U_B_CombatUniform_tshirt_mcam_wdL_f", 125, "uni", "noDLC"],
	["Combat Fatigues (LDF)", "U_I_E_Uniform_01_F", 125, "uni", "noDLC"],
	["Recon Fatigues (Woodland)", "U_B_CombatUniform_vest_mcam_wdl_f", 125, "uni", "noDLC"],
	["City Uniform (ApexDLC)", "U_B_CTRG_Soldier_urb_1_F", 125, "uni", "noDLC"],
	["City Uniform (ApexDLC Short)", "U_B_CTRG_Soldier_urb_3_F", 125, "uni", "noDLC"],
	["City Uniform (ApexDLC Shirt)", "U_B_CTRG_Soldier_urb_2_F", 125, "uni", "noDLC"],
	["Camo Uniform (ApexDLC)", "U_B_CTRG_Soldier_F", 125, "uni", "noDLC"],
	["Camo Uniform (ApexDLC Short)", "U_B_CTRG_Soldier_3_F", 125, "uni", "noDLC"],
	["Camo Uniform (ApexDLC Shirt)", "U_B_CTRG_Soldier_2_F", 125, "uni", "noDLC"],
	["City Uniform", "U_B_CTRG_Soldier_urb_1_F", 125, "uni"],
	["CTRG Combat Uniform", "U_B_CTRG_1", 125, "uni"],
	["CTRG Combat Uniform (Tee)", "U_B_CTRG_2", 125, "uni"],
	["CTRG Combat Uniform (Rolled-up)", "U_B_CTRG_3", 125, "uni"],
	["Fatigues (Hex)", "U_O_CombatUniform_ocamo", 250, "uni"],
	["Fatigues (Urban)", "U_O_CombatUniform_oucamo", 250, "uni"],
	["Fatigues (ApexDLC G Hex)", "U_O_T_Soldier_F", 250, "uni", "noDLC"],
	["Paramilitary (ApexDLC Jacket)", "U_I_C_Soldier_Para_2_F", 125, "uni", "noDLC"],
	["Paramilitary (ApexDLC Muscle)", "U_I_C_Soldier_Para_4_F", 125, "uni", "noDLC"],
	["Paramilitary (ApexDLC Shirt)", "U_I_C_Soldier_Para_3_F", 125, "uni", "noDLC"],
	["Paramilitary (ApexDLC Shorts)", "U_I_C_Soldier_Para_5_F", 125, "uni", "noDLC"],
	["Paramilitary (ApexDLC T-Shirt)", "U_I_C_Soldier_Para_1_F", 125, "uni", "noDLC"],
	["Pioneer (ApexDLC Tropic)", "U_B_T_Soldier_SL_F", 125, "uni", "noDLC"],
	["Officer Fatigues", "U_I_OfficerUniform", 125, "uni"],
	["Officer (ApexDLC CSAT)", "U_O_T_Officer_F", 125, "uni", "noDLC"],
	["Pilot Coveralls", "U_B_PilotCoveralls", 125, "uni"],
	["Pilot Coveralls", "U_O_PilotCoveralls", 125, "uni"],
	["Pilot Coveralls", "U_I_pilotCoveralls", 125, "uni"],
	["Heli Pilot Coveralls", "U_B_HeliPilotCoveralls", 125, "uni"],
	["Heli Pilot Coveralls", "U_I_HeliPilotCoveralls", 125, "uni"],
	["Gendamerie Commando Uniform (ApexDLC)", "U_B_GEN_Commander_F", 125, "uni", "noDLC"],
	["Gendamerie Uniform (ApexDLC)", "U_B_GEN_Soldier_F", 125, "uni", "noDLC"],
	["Guerilla Garment", "U_BG_Guerilla1_1", 125, "uni"],  // BLUFOR
	["Guerilla Garment New", "U_BG_Guerilla1_2_F", 125, "uni", "noDLC"],
	["Guerilla Outfit (Plain, Dark)", "U_BG_Guerilla2_1", 125, "uni"],
	["Guerilla Outfit (Pattern)", "U_BG_Guerilla2_2", 125, "uni"],
	["Guerilla Outfit (Plain, Light)", "U_BG_Guerilla2_3", 125, "uni"],
	["Guerilla Smocks", "U_BG_Guerilla3_1", 125, "uni"],
	["Guerilla Apparel", "U_BG_Guerrilla_6_1", 125, "uni"],
	["Guerilla Uniform", "U_BG_leader", 125, "uni"],
	["Guerilla Garment", "U_OG_Guerilla1_1", 125, "uni"], // OPFOR
	["Guerilla Outfit (Plain, Dark)", "U_OG_Guerilla2_1", 125, "uni"],
	["Guerilla Outfit (Pattern)", "U_OG_Guerilla2_2", 125, "uni"],
	["Guerilla Outfit (Plain, Light)", "U_OG_Guerilla2_3", 125, "uni"],
	["Guerilla Smocks", "U_OG_Guerilla3_1", 125, "uni"],
	["Guerilla Apparel", "U_OG_Guerrilla_6_1", 125, "uni"],
	["Guerilla Uniform", "U_OG_leader", 125, "uni"],
	["Guerilla Garment", "U_IG_Guerilla1_1", 125, "uni"], // Independent
	["Guerilla Outfit (Plain, Dark)", "U_IG_Guerilla2_1", 125, "uni"],
	["Guerilla Outfit (Pattern)", "U_IG_Guerilla2_2", 125, "uni"],
	["Guerilla Outfit (Plain, Light)", "U_IG_Guerilla2_3", 125, "uni"],
	["Guerilla Smocks", "U_IG_Guerilla3_1", 125, "uni"],
	["Guerilla Apparel", "U_IG_Guerrilla_6_1", 125, "uni"],
	["Guerilla Uniform", "U_IG_leader", 125, "uni"],
	["Looter Clothes (Camo)", "U_I_L_Uniform_01_camo_F", 125, "uni", "noDLC"],
	["Looter Clothes (Deserter)", "U_I_L_Uniform_01_deserter_F", 125, "uni", "noDLC"],
	["Looter Clothes (Leather Jacket)", "U_C_E_LooterJacket_01_F", 125, "uni"],
	["Looter Clothes (T-Shirt, Black)", "U_I_L_Uniform_01_tshirt_black_F", 125, "uni"],
	["Looter Clothes (T-Shirt, Olive)", "U_I_L_Uniform_01_tshirt_olive_F", 125, "uni"],
	["Looter Clothes (T-Shirt, Skull)", "U_I_L_Uniform_01_tshirt_skull_F", 125, "uni"],
	["Looter Clothes (T-Shirt, Sport)", "U_I_L_Uniform_01_tshirt_sport_F", 125, "uni"],
	["Heli Pilot Coveralls (LDF)", "U_I_E_Uniform_01_coveralls_F", 125, "uni", "noDLC"],
	["CBRN Suit (Blue)", "U_C_CBRN_Suit_01_Blue_F", 500, "uni"],
	["CBRN Suit (MTP)", "U_B_CBRN_Suit_01_MTP_F", 500, "uni"],
	["CBRN Suit (Tropic)", "U_B_CBRN_Suit_01_Tropic_F", 500, "uni"],
	["CBRN Suit (White)", "U_C_CBRN_Suit_01_White_F", 500, "uni"],
	["CBRN Suit (Woodland)", "U_B_CBRN_Suit_01_Wdl_F", 500, "uni"],
	["CBRN Suit (AAF)", "U_I_CBRN_Suit_01_AAF_F", 500, "uni"],
	["CBRN Suit (LDF)", "U_I_E_CBRN_Suit_01_EAF_F", 500, "uni"],
	["Granit-B-Suit", "U_O_R_Gorka_01_F", 500, "uni"],
	["Granit-B-Suit (Weathered)", "U_O_R_Gorka_01_brown_F", 500, "uni"],
	["Granit-T-Suit", "U_O_R_Gorka_01_camo_F", 500, "uni"],
	["Tracksuit (Black)", "U_O_R_Gorka_01_black_F", 500, "uni"],
	["Farmer Outfit", "U_C_Uniform_Farmer_01_F", 125, "uni"],
	["Scientist Outfit (Formal, Blue)", "U_C_Uniform_Scientist_01_formal_F", 125, "uni"],
	["Scientist Outfit (Formal, White)", "U_C_Uniform_Scientist_01_F", 125, "uni"],
	["Scientist Outfit (Informal, Black)", "U_C_Uniform_Scientist_02_F", 125, "uni"],
	["Scientist Outfit (Informal, Red)", "U_C_Uniform_Scientist_02_formal_F", 125, "uni"],
	["Worker Coveralls", "U_C_WorkerCoveralls", 125, "uni"], // can only be worn by civilian units
	["T-Shirt (Blue)", "U_C_Poor_1", 125, "uni"],
	["Polo (Red/white)", "U_C_Poloshirt_redwhite", 125, "uni"],
	["Polo (Salmon)", "U_C_Poloshirt_salmon", 125, "uni"],
	["Polo (Tri-color)", "U_C_Poloshirt_tricolour", 125, "uni"],
	["Polo (Navy)", "U_C_Poloshirt_blue", 125, "uni"],
	["Polo (Burgundy)", "U_C_Poloshirt_burgundy", 125, "uni"],
	["Polo (Blue/green)", "U_C_Poloshirt_stripped", 125, "uni"],
	["Polo (Competitor)", "U_Competitor", 125, "uni"],
	["Polo (Rangemaster)", "U_Rangemaster", 125, "uni"],
	["T-Shirt (ApexDLC Blue)", "U_C_Man_casual_2_F", 125, "uni", "noDLC"],
	["T-Shirt (ApexDLC Green)", "U_C_Man_casual_3_F", 125, "uni", "noDLC"],
	["T-Shirt (ApexDLC Dark Blue)", "U_C_Man_casual_1_F", 125, "uni", "noDLC"],
	["Summer Uniform (ApexDLC Yellow)", "U_C_Man_casual_5_F", 125, "uni", "noDLC"],
	["Summer Uniform (ApexDLC Blue)", "U_C_Man_casual_4_F", 125, "uni", "noDLC"],
	["Summer Uniform (ApexDLC Red)", "U_C_Man_casual_6_F", 125, "uni", "noDLC"],
	["Sport Uniform (ApexDLC Blue)", "U_C_man_sport_3_F", 125, "uni", "noDLC"],
	["Sport Uniform (ApexDLC Orange)", "U_C_man_sport_2_F", 125, "uni", "noDLC"],
	["Sport Uniform (ApexDLC Beach)", "U_C_man_sport_1_F", 125, "uni", "noDLC"],
	["Commander (TacOpsDLC Brown)", "U_O_officer_noInsignia_hex_F", 125, "uni", "noDLC"],
	["Jacket and Shorts", "U_OrestesBody", 125, "uni"],
	["Hunting Uniform", "U_C_HunterBody_grn", 125, "uni"],
	["Journalist Uniform", "U_C_Journalist", 125, "uni"],
	["Scientist Uniform", "U_C_Scientist", 250000, "uni"],
	["Business Uniform", "U_NikosBody", 125, "uni"],
	["Chiller Uniform", "U_NikosAgedBody", 125, "uni"],
	["T-Shirt (White)", "U_Marshal", 125, "uni"],
	["T-Shirt (LawsDLC Yellow)", "U_C_Mechanic_01_F", 125, "uni", "noDLC"],
	["Bandit (ApexDLC)", "U_I_C_Soldier_Bandit_4_F", 125, "uni", "noDLC"],
	["Bandit (ApexDLC Muscle)", "U_I_C_Soldier_Bandit_5_F", 125, "uni", "noDLC"],
	["Bandit (ApexDLC Polo)", "U_I_C_Soldier_Bandit_1_F", 125, "uni", "noDLC"],
	["Bandit (ApexDLC Shirt)", "U_I_C_Soldier_Bandit_3_F", 125, "uni", "noDLC"],
	["Bandit (ApexDLC Death)", "U_I_C_Soldier_Bandit_2_F", 125, "uni", "noDLC"],
	["Syndikat Uniform (ApexDLC Death)", "U_I_C_Soldier_Camo_F", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Black)", "U_C_Driver_1_black", 125, "uni", "noDLC"], // can only be worn by civilian units
	["Racing Suit (KartDLC Blue)", "U_C_Driver_1_blue", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Green)", "U_C_Driver_1_green", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Yellow)", "U_C_Driver_1_yellow", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Orange)", "U_C_Driver_1_orange", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Red)", "U_C_Driver_1_red", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC White)", "U_C_Driver_1_white", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Fuel)", "U_C_Driver_1", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Bluking)", "U_C_Driver_2", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Redstone)", "U_C_Driver_3", 125, "uni", "noDLC"],
	["Racing Suit (KartDLC Vrana)", "U_C_Driver_4", 125, "uni", "noDLC"],
	["IDAP Cargo (LawsDLC)", "U_C_IDAP_Man_cargo_F", 125, "uni", "noDLC"],
	["IDAP Jeans (LawsDLC)", "U_C_IDAP_Man_Jeans_F", 125, "uni", "noDLC"],
	["IDAP Casual (LawsDLC)", "U_C_IDAP_Man_casual_F", 125, "uni", "noDLC"],
	["IDAP Shorts (LawsDLC)", "U_C_IDAP_Man_shorts_F", 125, "uni", "noDLC"],
	["IDAP Tee (LawsDLC)", "U_C_IDAP_Man_Tee_F", 125, "uni", "noDLC"],
	["IDAP TeeShorts (LawsDLC)", "U_C_IDAP_Man_TeeShorts_F", 125, "uni", "noDLC"],
	["Construction (LawsDLC Vrana)", "U_C_ConstructionCoverall_Vrana_F", 125, "uni", "noDLC"],
	["Construction (LawsDLC Red)", "U_C_ConstructionCoverall_Red_F", 125, "uni", "noDLC"],
	["Construction (LawsDLC Blue)", "U_C_ConstructionCoverall_Blue_F", 125, "uni", "noDLC"],
	["Construction (LawsDLC Black)", "U_C_ConstructionCoverall_Black_F", 125, "uni", "noDLC"],
	["Mechanican (LawsDLC)", "U_C_Mechanic_01_F", 125, "uni", "noDLC"],
	["Paramedic (LawsDLC)", "U_C_Paramedic_01_F", 125, "uni", "noDLC"],
	["Tron Light Suit (Blue)", "U_B_Protagonist_VR", 5000, "uni"],
	["Tron Light Suit (Red)", "U_O_Protagonist_VR", 5000, "uni"],
	["Tron Light Suit (Green)", "U_I_Protagonist_VR", 5000, "uni"],
	["Tron Light Suit (Violet)", "U_C_Protagonist_VR", 5000, "uni"],
	["ACR Combat Fatigues (Desert)", "CUP_U_B_CZ_DST_NoKneepads", 100, "uni"],
	["ACR Combat Fatigues (Woodland)", "CUP_U_B_CZ_WDL_NoKneepads", 100, "uni"],
	["ACR Ghillie (Woodland)", "CUP_U_B_CZ_WDL_Ghillie", 100, "uni"],
	["ACR Pilot Coveralls (Woodland)", "CUP_U_B_CZ_Pilot_WDL", 100, "uni"],
	["AFRF Commander (TTsKO)", "CUP_U_O_RUS_Commander", 100, "uni"],
	["AFRF Ghillie (Woodland)", "CUP_U_O_RUS_Ghillie", 100, "uni"],
	["AFRF Uniform (Beige Digital)", "CUP_U_O_RUS_BeigeDigital_MSV", 100, "uni"],
	["AFRF Uniform (EMR)", "CUP_U_O_RUS_EMR_1", 100, "uni"],
	["AFRF Uniform (EMR/Gloves/Kneepads)", "CUP_U_O_RUS_EMR_gloves_pads", 100, "uni"],
	["AFRF Uniform (TTsKO)", "CUP_U_O_RUS_Flora_1", 100, "uni"],
	["AFRF Uniform (VSR-93)", "CUP_U_O_RUS_VSR93_MSV", 100, "uni"],
	["AFRF Uniform (VSR-93/Worn/Gloves)", "CUP_U_O_RUS_VSR93_worn_gloves_MSV", 100, "uni"],
	["AFRF Uniform (VSR-98)", "CUP_U_O_RUS_VSR98_MSV", 100, "uni"],
	["AFRF Uniform (VSR-98/Worn/Gloves)", "CUP_U_O_RUS_VSR98_worn_gloves_MSV", 100, "uni"],
	["AFRF Uniform VDV (KSOR)", "CUP_U_O_RUS_BeigeDigital_VDV", 100, "uni"],
	["AFRF Uniform VDV (TTsKO/Gloves)", "CUP_U_O_RUS_Flora_3", 100, "uni"],
	["AFRF Uniform VDV (VSR-93/Rolled Up/Gloves)", "CUP_U_O_RUS_VSR93_VDV_rolled_up_gloves2", 100, "uni"],
	["AFRF Uniform VDV (VSR-93/Worn/Gloves)", "CUP_U_O_RUS_VSR93_worn_gloves_VDV", 100, "uni"],
	["Anorak (Brown)", "CUP_U_I_GUE_Anorak_01", 100, "uni"],
	["Anorak (Brown, no hood) with Jeans", "CUP_U_I_GUE_Anorak_03", 100, "uni"],
	["Anorak (Brown, no hood) with Khaki", "CUP_U_I_GUE_Anorak_02", 100, "uni"],
	["BDU (CEU, Gloves/Dirty)", "CUP_U_B_BDUv2_gloves_dirty_CEU", 100, "uni"], //Dunkel Grün Camo
	["BDU (DCU, Gloves)", "CUP_U_B_BDUv2_gloves_DCU", 100, "uni"],
	["BDU (DDPM, Gloves)", "CUP_U_B_BDUv2_gloves_DDPM", 100, "uni"],
	["BDU (Desert, Gloves/Dirty)", "CUP_U_B_BDUv2_gloves_dirty_desert", 100, "uni"], //Desert Hellbraun dreckig
	["BDU (DPM, Gloves)", "CUP_U_B_BDUv2_gloves_DPM", 100, "uni"], //Grünbraun dunkel
	["BDU (ERDL Highland, Dirty)", "CUP_U_B_BDUv2_dirty_ERDL_highland", 100, "uni"], //Hellbraun, Braun, Schwarz, Grün klein camo
	["BDU (ERDL Lowland, Dirty)", "CUP_U_B_BDUv2_dirty_ERDL_lowland", 100, "uni"], //Hellgrün, Grün, Schwarz, Braun klein camo
	["BDU (M81, Dirty)", "CUP_U_B_BDUv2_dirty_M81", 100, "uni"], //Braun, Hellbraun, Grün Camo groß
	["BDU (OD, Gloves)", "CUP_U_B_BDUv2_gloves_OD", 100, "uni"], //Dunkelgrün
	["BDU (T-pattern, Gloves/Dirty)", "CUP_U_B_BDUv2_gloves_dirty_Tpattern", 100, "uni"], //Gray Camo Boxes
	["BDU (Tigerstripe, Dirty)", "CUP_U_B_BDUv2_dirty_Tigerstripe", 100, "uni"], //Grün, Braun, Hellbrown line camo, black lines
	["BDU (Urban, Dirty)", "CUP_U_B_BDUv2_dirty_Urban", 100, "uni"], //Gray, Darkgray, Black round Camo
	["BDU (Winter, Dirty)", "CUP_U_B_BDUv2_dirty_Winter", 100, "uni"], //White dirty
	["BW Combat Uniform (Flecktarn)", "BWA3_Uniform2_Fleck", 100, "uni"],
	["BW Combat Uniform (Flecktarn, Sleeves)", "BWA3_Uniform2_sleeves_Fleck", 100, "uni"], //Braun, Grün, Schwarz
	["BW Combat Uniform (Multitarn)", "BWA3_Uniform2_Multi", 100, "uni"],
	["BW Combat Uniform (Multitarn, Sleeves)", "BWA3_Uniform2_sleeves_Multi", 100, "uni"], //Weiß, Grün, Braun (Hell)
	["BW Combat Uniform (Tropentarn)", "BWA3_Uniform2_Tropen", 100, "uni"],
	["BW Combat Uniform (Tropentarn, Sleeves)", "BWA3_Uniform2_sleeves_Tropen", 100, "uni"], //Weiß, Braun (Hell)
	["BW Ghillie (Flecktarn)", "BWA3_Uniform2_Ghillie_Fleck", 100, "uni"],
	["BW Ghillie (Multitarn)", "BWA3_Uniform2_Ghillie_Multi", 100, "uni"],
	["BW Ghillie (Tropentarn)", "BWA3_Uniform2_Ghillie_Tropen", 100, "uni"],
	["CDF Combat Uniform (Tri-Color Desert)", "CUP_U_B_CDF_DST_1", 100, "uni"], 
	["CDF Combat Uniform (Tri-Color Forest)", "CUP_U_B_CDF_FST_1", 100, "uni"], //Grün Camo Wald
	["CDF Combat Uniform (Tri-Color Mountain)", "CUP_U_B_CDF_MNT_1", 100, "uni"],  //Braun Camo Berg
	["CDF Combat Uniform (Tri-Color Winter)", "CUP_U_B_CDF_SNW_1", 100, "uni"], //White Braun Grau Camo Winter
	["ChDKZ Outfit (Bardak)", "CUP_U_O_CHDKZ_Bardak", 100, "uni"],
	["ChDKZ Tracksuit (Lopotev)", "CUP_U_O_CHDKZ_Lopotev", 100, "uni"],
	["ChDKZ Uniform (Kamysh Woodland)", "CUP_U_O_CHDKZ_Kam_02", 100, "uni"], //Bambus style - grün, gelb, braun
	["ChDKZ Uniform (Kamysh Woodland)", "CUP_U_O_CHDKZ_Commander", 100, "uni"], //Bambus winter style - weiss, grau, braun
	["ChDKZ Uniform 2 (Smog)", "CUP_U_O_CHDKZ_Kam_06", 100, "uni"], //Grün, Braun, Beige Camo
	["Biker Clothes (Brown)", "CUP_U_C_Citizen_02", 100, "uni"], //Biker
	["Biker Clothes (Red Brown)", "CUP_U_C_Citizen_01", 100, "uni"],//Biker
	["Biker Clothes (Dark Brown)", "CUP_U_C_Citizen_04", 100, "uni"], //Biker
	["Biker Clothes (Wood Brown)", "CUP_U_C_Citizen_03", 100, "uni"], //Biker
	["Crye ATACS-AU Full", "CUP_U_CRYE_ATACSAU_Full", 100, "uni"], //Hellgrau standard uniform
	["Crye ATACS-FG Full", "CUP_U_CRYE_ATACSFG_Full", 100, "uni"], //Hellgrün standard uniform
	["Crye Black Full (Jocking)", "CUP_U_CRYE_BLK_Full", 100, "uni"],
	["Crye Black Russia (Jocking)", "CUP_U_CRYE_BLK_RUS_Full", 100, "uni"],
	["Crye Flecktarn", "CUP_U_B_GER_Fleck_Crye", 100, "uni"], //BW
	["Crye Ranger Green Full", "CUP_U_CRYE_RGR_Full", 100, "uni"], //Braun standard uniform
	["Crye Rolled Sleeves Flecktarn", "CUP_U_B_GER_Fleck_Crye2", 100, "uni"], //BW
	["Crye Rolled Sleeves Tropentarn", "CUP_U_B_GER_Crye2", 100, "uni"], //BW Hell
	["Firefighter Clothes", "CUP_U_C_Fireman_01", 100, "uni"],
	["Ghillie Suit MTP", "CUP_U_B_BAF_MTP_GHILLIE", 100, "uni"],
	["Ghillie Suit DDPM", "CUP_U_B_BAF_DDPM_GHILLIE", 100, "uni"],
	["Ghillie Suit DPM", "CUP_U_B_BAF_DPM_GHILLIE", 100, "uni"],
	["Ghillie ACR (Desert)", "CUP_U_B_CZ_DST_Ghillie", 100, "uni"],
	["Gorka (Gloves)", "CUP_U_O_RUS_Gorka_Green_gloves2", 100, "uni"], //Olive
	["Gorka (Partizan Autumn/Gloves/Kneepads)", "CUP_U_O_RUS_Gorka_Partizan_A_gloves_kneepads", 100, "uni"], //Brown
	["Gorka (Partizan Summer/Gloves/Kneepads)", "CUP_U_O_RUS_Gorka_Partizan_gloves_kneepads", 100, "uni"], //Brown+Green
	["Half-Ghilie (Wesert)", "CUP_U_O_TK_Ghillie_Top", 100, "uni"],
	["Half-Ghilie (Woodland)", "CUP_U_I_Ghillie_Top", 100, "uni"],
	["IdZ-Combat Uniform (Flecktarn)", "BWA3_Uniform_Fleck", 100, "uni"], //BW
	["IdZ-Combat Uniform (Multitarn)", "BWA3_Uniform_Multi", 100, "uni"], //BW
	["IdZ-Combat Uniform (Tropentarn)", "BWA3_Uniform_Tropen", 100, "uni"], //BW
	["IdZ-Ghillie (Flecktarn)", "BWA3_Uniform_Ghillie_Fleck", 100, "uni"], //BW Ghillie
	["IdZ-Ghillie (Multitarn)", "BWA3_Uniform_Ghillie_Multi", 100, "uni"], //BW Ghillie
	["IdZ-Ghillie (Tropentarn)", "BWA3_Uniform_Ghillie_Tropen", 100, "uni"], //BW Ghillie
	["Khet Partug (Black)", "CUP_O_TKI_Khet_Partug_04", 100, "uni"],
	["Khet Partug (Brown)", "CUP_O_TKI_Khet_Partug_02", 100, "uni"],
	["Khet Partug (Grey)", "CUP_O_TKI_Khet_Partug_01", 100, "uni"],
	["Khet Partug (White)", "CUP_O_TKI_Khet_Partug_03", 100, "uni"],
	["Labcoat (Blue)", "CUP_U_C_Labcoat_02", 100, "uni"],
	["Labcoat (Grey)", "CUP_U_C_Labcoat_03", 100, "uni"],
	["Labcoat (White)", "CUP_U_C_Labcoat_01", 100, "uni"],
	["MARPAT (Officer)", "CUP_U_B_USMC_Officer", 100, "uni"],
	["MARPAT (Woodland)", "CUP_U_B_USMC_MARPAT_WDL_Sleeves", 100, "uni"],
	["Mechanic Overall (Green)", "CUP_U_C_Mechanic_03", 100, "uni"],
	["NAPA Woodland/Olive", "CUP_U_I_GUE_Woodland1", 100, "uni"],
	["NAPA Flecktarn/Jeans", "CUP_U_I_GUE_Flecktarn2", 100, "uni"],
	["NAPA Flecktarn/Jeans Hooded ", "CUP_U_I_GUE_Flecktarn3", 100, "uni"], //(SPAWNEN #1 als INDP)
	["ODKB Uniform VDV (KSOR)", "CUP_U_O_ODKB_KSOR_VDV", 100, "uni"],
	["Partisan Uniform (TTsKO)", "CUP_U_O_Partisan_TTsKO", 100, "uni"],
	["Pilot Clothes (Civilian)", "CUP_U_C_Pilot_01", 100, "uni"],
	["Pilot Coveralls (BW)", "CUP_U_B_GER_Fleck_Overalls_Pilot", 100, "uni"], //Schwarz
	["PMC Shirt/Cargopants (Black)", "CUP_I_B_PMC_Unit_17", 100, "uni"], //SpecOps
	["PMC Shirt/Pants w/Gloves Rolled (Burberry/Grey)", "CUP_I_B_PMC_Unit_43", 100, "uni"],
	["PMC Shirt/Pants w/Gloves Rolled (Burgundy/Black)", "CUP_I_B_PMC_Unit_40", 100, "uni"],
	["PMC Shirt/Pants w/Gloves Rolled (Plaid/Khaki)", "CUP_I_B_PMC_Unit_37", 100, "uni"],
	["PMC Sweater/Cargo Pants (Arctic)", "CUP_I_B_PMC_Unit_28", 100, "uni"], //SpecOps White
	["PMC Sweater/Cargo Pants (Black)", "CUP_I_B_PMC_Unit_24", 100, "uni"], //SpecOps Black
	["PMC Winter Jacket/Pants (Camo 2)", "CUP_I_B_PMC_Unit_29", 100, "uni"], //Winter Jack mit Hoodie
	["PMC Winter Jacket/Pants (Camo)", "CUP_I_B_PMC_Unit_26", 100, "uni"], //Winter Jack mit Hoodie
	["Police Uniform", "CUP_U_C_Policeman_01", 100, "uni"],
	["Priest Uniform", "CUP_U_C_Priest_01", 100, "uni"],
	["Profiteer Clothes", "CUP_U_C_Profiteer_03", 100, "uni"], //Hosties
	["Profiteer Clothes (Red)", "CUP_U_C_Profiteer_04", 100, "uni"], //Hosties
	["Racketeer Clothes 2", "CUP_U_C_racketeer_02", 100, "uni"], //Hosties
	["Racketeer Clothes 4", "CUP_U_C_racketeer_04", 100, "uni"], //Hosties
	["RACS Pilot Overall", "CUP_U_I_RACS_PilotOverall", 100, "uni"], //Hosties
	["RACS Uniform (Woodland)", "CUP_U_I_RACS_WDL_1", 100, "uni"],
	["Rocker Clothes (Black)", "CUP_U_C_Rocker_01", 100, "uni"],
	["Rocker Clothes (Brown)", "CUP_U_C_Rocker_02", 100, "uni"],
	["Rocker Clothes (Green)", "CUP_U_C_Rocker_04", 100, "uni"],
	["Rescue Clothing", "CUP_U_C_Rescuer_01", 100, "uni"],
	["SLA Officer Uniform", "CUP_U_O_SLA_Officer_Suit", 100, "uni"],
	["SLA Overalls (Pilot)", "CUP_U_O_SLA_Overalls_Pilot", 100, "uni"], //Totally Blue
	["SLA Uniform (Camo)", "CUP_U_O_SLA_MixedCamo", 100, "uni"],
	["SLA Uniform (Desert)", "CUP_U_O_SLA_Desert", 100, "uni"],
	["SLA Uniform (Militia)", "CUP_U_O_SLA_Green", 100, "uni"],
	["SLA Uniform (Urban)", "CUP_U_O_SLA_Urban", 100, "uni"],
	["Suit (Black)", "CUP_U_C_Suit_01", 100, "uni"],
	["Suit (Brown)", "CUP_U_C_Suit_02", 100, "uni"],
	["Suit (Maroon)", "CUP_U_C_Suit_03", 100, "uni"],
	["Suit with jacket (Brown)", "CUP_U_C_Functionary_jacket_01", 100, "uni"],
	["Suit with jacket (Black)", "CUP_U_C_Functionary_jacket_02", 100, "uni"],
	["Takistani Uniform (Colonel)", "CUP_U_O_TK_Officer", 100, "uni"],
	["Takistani Uniform (Green)", "CUP_U_O_TK_Green", 100, "uni"],
	["Tanker Coveralls (Flecktarn)", "CUP_U_B_GER_Fleck_Overalls_Tank", 100, "uni"],
	["Tanker Coveralls (Tropentarn)", "CUP_U_B_GER_Overalls_Tank", 100, "uni"],
	["Uniform M-88", "CUP_U_O_RUS_M88_MSV", 100, "uni"],
	["US Army (Modern/ACU)", "CUP_U_B_USArmy_Base", 100, "uni"],
	["US BDU (M81)", "CUP_U_B_BDUv2_M81_US", 100, "uni"],
	["US BDU (M81, Gloves/Dirty)", "CUP_U_B_BDUv2_gloves_dirty_M81_US", 100, "uni"],
	["US BDU (OD)", "CUP_U_B_BDUv2_OD_US", 100, "uni"],
	["US BDU (OD, Gloves/Dirty)", "CUP_U_B_BDUv2_gloves_dirty_OD_US", 100, "uni"],
	["Villager Clothes (Blue)", "CUP_U_C_Villager_01", 100, "uni"], //Bauer Hosties
	["Villager Clothes (Green)", "CUP_U_C_Villager_02", 100, "uni"], //Bauer Hosties
	["Villager Clothes (Brown)", "CUP_U_C_Villager_03", 100, "uni"], //Bauer Hosties
	["Woodlander Clothes (Blue)", "CUP_U_C_Woodlander_01", 100, "uni"],
	["Woodlander Clothes (Brown)", "CUP_U_C_Woodlander_02", 100, "uni"],
	["Woodlander Clothes (Camo)", "CUP_U_C_Woodlander_03", 100, "uni"],
	["Woodlander Clothes (Green)", "CUP_U_C_Woodlander_04", 100, "uni"],
	["Worker Clothes (Blue)", "CUP_U_C_Worker_03", 100, "uni"], //Arbeiter Hosties
	["Worker Clothes (Green)", "CUP_U_C_Worker_02", 100, "uni"] //Arbeiter Hosties********
];

vestArray = compileFinal str
[
	["Rebreather (NATO)", "V_RebreatherB", 200, "vest"],
	["Rebreather (CSAT)", "V_RebreatherIR", 200, "vest"],
	["Rebreather (AAF)", "V_RebreatherIA", 200, "vest"],
	["Leg Strap Bag (LawsDLC Coyote)", "V_LegStrapBag_coyote_F", -1, "vest", "noDLC"],
	["Leg Strap Bag (LawsDLC Olive)", "V_LegStrapBag_olive_F", -1, "vest", "noDLC"],
	["Leg Strap Bag (LawsDLC Black)", "V_LegStrapBag_black_F", -1, "vest", "noDLC"],
	["Carrier Lite (Green)", "V_PlateCarrier1_rgr", -1, "vest"],
	["Carrier Lite (Black)", "V_PlateCarrier1_blk", -1, "vest"],
	["Carrier Lite (Woodland)", "V_PlateCarrier1_wdl", -1, "vest"],
	["Carrier Lite (CTRG)", "V_PlateCarrierL_CTRG", -1, "vest"],
	["Carrier Lite (ApexDLC Tropic)", "V_PlateCarrier1_tna_F", -1, "vest", "noDLC"],
	["Carrier Lite (ApexDLC Green)", "V_PlateCarrier1_rgr_noflag_F", -1, "vest", "noDLC"],
	["Carrier Rig (Green)", "V_PlateCarrier2_rgr", -1, "vest"],
	["Carrier Rig (Black)", "V_PlateCarrier2_blk", -1, "vest"],
	["Carrier Rig (CTRG)", "V_PlateCarrierH_CTRG", -1, "vest"],
	["Carrier Rig (Woodland)", "V_PlateCarrier2_wdl", -1, "vest"],
	["Carrier Rig (ApexDLC Tropic)", "V_PlateCarrier2_tna_F", -1, "vest", "noDLC"],
	["Carrier GL Rig (Green)", "V_PlateCarrierGL_rgr", -1, "vest"],
	["Carrier GL Rig (Black)", "V_PlateCarrierGL_blk", -1, "vest"],
	["Carrier GL Rig (MTP)", "V_PlateCarrierGL_mtp", -1, "vest"],
	["Carrier GL Rig (Woodland)", "V_PlateCarrierGL_wdl", -1, "vest", "noDLC"],
	["Carrier GL Rig (ApexDLC Tropic)", "V_PlateCarrierGL_tna_F", -1, "vest", "noDLC"],
	["Carrier Special Rig (Green)", "V_PlateCarrierSpec_rgr", -1, "vest"],
	["Carrier Special Rig (Black)", "V_PlateCarrierSpec_blk", -1, "vest"],
	["Carrier Special Rig (MTP)", "V_PlateCarrierSpec_mtp", -1, "vest"],
	["Carrier Special Rig (Woodland)", "V_PlateCarrierSpec_wdl", -1, "vest"],
	["Carrier Special Rig (ApexDLC Tropic)", "V_PlateCarrierSpec_tna_F", -1, "vest", "noDLC"],
	["GA Carrier Lite (Digi)", "V_PlateCarrierIA1_dgtl", -1, "vest"],
	["GA Carrier Rig (Digi)", "V_PlateCarrierIA2_dgtl", -1, "vest"],
	["GA Carrier GL Rig (Digi)", "V_PlateCarrierIAGL_dgtl", -1, "vest"],
	["GA Carrier GL Rig (Olive)", "V_PlateCarrierIAGL_oli", -1, "vest"],
	["Kipchak Vest", "V_SmershVest_01_F", -1, "vest"],
	["Kipchak Vest (Tactical Radio)", "V_SmershVest_01_radio_F", -1, "vest"],
	["Modular Carrier GL Rig (Geometric)", "V_CarrierRigKBT_01_heavy_EAF_F", -1, "vest"],
	["Modular Carrier GL Rig (Olive)", "V_CarrierRigKBT_01_heavy_Olive_F", -1, "vest"],
	["Modular Carrier Lite (Geometric)", "V_CarrierRigKBT_01_light_EAF_F", -1, "vest"],
	["Modular Carrier Lite (Olive)", "V_CarrierRigKBT_01_light_Olive_F", -1, "vest"],
	["Modular Carrier Rig (Geometric)", "V_CarrierRigKBT_01_EAF_F", -1, "vest"],
	["Modular Carrier Rig (Olive)", "V_CarrierRigKBT_01_Olive_F", -1, "vest"],
	["EOD Blue Vest (LawsDLC)", "V_EOD_blue_F", -1, "vest", "noDLC"],
	["EOD IDAP Vest (LawsDLC)", "V_EOD_IDAP_blue_F", -1, "vest", "noDLC"],
	["EOD Coyote Vest (LawsDLC)", "V_EOD_coyote_F", -1, "vest", "noDLC"],
	["EOD Olive Vest (LawsDLC)", "V_EOD_olive_F", -1, "vest", "noDLC"],
	["LBV Harness", "V_HarnessO_brn", -1, "vest"],
	["LBV Harness (Gray)", "V_HarnessO_gry", -1, "vest"],
	["LBV Grenadier Harness", "V_HarnessOGL_brn", -1, "vest"],
	["LBV Grenadier Harness (Gray)", "V_HarnessOGL_gry", -1, "vest"],
	["Slash Bandolier (Black)", "V_BandollierB_blk", -1, "vest"],
	["Slash Bandolier (Coyote)", "V_BandollierB_cbr", -1, "vest"],
	["Slash Bandolier (Green)", "V_BandollierB_rgr", -1, "vest"],
	["Slash Bandolier (Khaki)", "V_BandollierB_khk", -1, "vest"],
	["Slash Bandolier (Olive)", "V_BandollierB_oli", -1, "vest"],
	["Chest Rig (Khaki)", "V_Chestrig_khk", -1, "vest"],
	["Chest Rig (Green)", "V_Chestrig_rgr", -1, "vest"],
	["Fighter Chestrig (Black)", "V_Chestrig_blk", -1, "vest"],
	["Fighter Chestrig (Olive)", "V_Chestrig_oli", -1, "vest"],
	["Pocketed Coyote Vest (LawsDLC)", "V_Pocketed_coyote_F", -1, "vest", "noDLC"],
	["Pocketed Olive Vest (LawsDLC)", "V_Pocketed_olive_F", -1, "vest", "noDLC"],
	["Pocketed Black Vest (LawsDLC)", "V_Pocketed_black_F", -1, "vest", "noDLC"],
	["LBV-Grenadier Vest (ApexDLC)", "V_HarnessOGL_ghex_F", -1, "vest", "noDLC"],
	["LBV Vest (ApexDLC)", "V_HarnessO_ghex_F", -1, "vest", "noDLC"],
	["Tactical Chestrig (ApexDLC Green)", "V_TacChestrig_grn_F", -1, "vest", "noDLC"],
	["Tactical Chestrig (ApexDLC Kojote)", "V_TacChestrig_cbr_F", -1, "vest", "noDLC"],
	["Tactical Chestrig (ApexDLC Olive)", "V_TacChestrig_oli_F", -1, "vest", "noDLC"],
	["Carrier (ApexDLC Green noFlag)", "V_PlateCarrier2_rgr_noflag_F", -1, "vest", "noDLC"],
	["Carrier (ApexDLC Tropic)", "V_PlateCarrier2_tna_F", -1, "vest", "noDLC"],
	["Carrier (ApexDLC Tropic Grenade)", "V_PlateCarrierGL_tna_F", -1, "vest", "noDLC"],
	["Carrier (ApexDLC Tropic Special)", "V_PlateCarrierSpec_tna_F", -1, "vest", "noDLC"],
	["Tactical Vest (Black)", "V_TacVest_blk", -1, "vest"],
	["Tactical Vest (Brown)", "V_TacVest_brn", -1, "vest"],
	["Tactical Vest (Camo)", "V_TacVest_camo", -1, "vest"],
	["Tactical Vest (Khaki)", "V_TacVest_khk", -1, "vest"],
	["Tactical Vest (Olive)", "V_TacVest_oli", -1, "vest"],
	["Tactical Vest (Police)", "V_TacVest_blk_POLICE", -1, "vest"],
	["Tactical Vest (Gendamerie)", "V_TacVest_gen_F", -1, "vest"],
	["Raven Night Vest", "V_TacVestIR_blk", -1, "vest"],
	["Press Vest", "V_Press_F", -1, "vest"],
	["Safety Blue Vest (LawsDLC)", "V_Safety_blue_F", -1, "vest", "noDLC"],
	["Safety Yellow Vest (LawsDLC)", "V_Safety_yellow_F", -1, "vest", "noDLC"],
	["Safety Orange Vest (LawsDLC)", "V_Safety_orange_F", -1, "vest", "noDLC"],
	["Plain Crystal Vest (LawsDLC)", "V_Plain_crystal_F", -1, "vest", "noDLC"],
	["Plain Medical Vest (LawsDLC)", "V_Plain_medical_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (LawsDLC Blue)", "V_DeckCrew_blue_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (LawsDLC Green)", "V_DeckCrew_green_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (LawsDLC Yellow)", "V_DeckCrew_yellow_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (LawsDLC Red)", "V_DeckCrew_red_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (LawsDLC Brown)", "V_DeckCrew_brown_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (LawsDLC Violet)", "V_DeckCrew_violet_F", -1, "vest", "noDLC"],
	["Deck Crew Vest (LawsDLC White)", "V_DeckCrew_white_F", -1, "vest", "noDLC"],
	["6B3 (Green)", "CUP_V_CDF_6B3_1_Green", -1, "vest"], // Armor III
	["6B3 (SLA Desert)", "CUP_V_O_SLA_6B3_1_DES", -1, "vest"],
	["6B3 (SLA Urban)", "CUP_V_O_SLA_6B3_1_URB", -1, "vest"],
	["6B3 (SLA Woodland)", "CUP_V_O_SLA_6B3_1_WDL", -1, "vest"],
	["6B3 (Tri-Color Desert)", "CUP_V_CDF_6B3_1_DST", -1, "vest"],
	["6B3 (Tri-Color Forest)", "CUP_V_CDF_6B3_1_FST", -1, "vest"],
	["6B3 (Tri-Color Mountain)", "CUP_V_CDF_6B3_1_MNT", -1, "vest"],
	["6B3 (Tri-Color Winter)", "CUP_V_CDF_6B3_1_SNW", -1, "vest"],
	["6B3 (VSR-93)", "CUP_V_RUS_6B3_1", -1, "vest"], // Armor III
	["6B3 (VSR-98 Flora)", "CUP_V_RUS_6B3_Flora_1", -1, "vest"], // Armor III
	["6B3 Flak Vest", "CUP_V_O_SLA_Flak_Vest03", -1, "vest"], // Armor II
	["6B45 Vest (Beige Digital)", "CUP_V_RUS_6B45_1_BeigeDigital", -1, "vest"], //Armor III
	["6B45 Vest (EMR)", "CUP_V_RUS_6B45_1", -1, "vest"], //Armor III
	["ACR Carried Vest (Heavy/Empty)", "CUP_V_CZ_vest01", -1, "vest"], //Armor III
	["ACR Carried Vest (Light/Combat Knife)", "CUP_V_CZ_vest16", -1, "vest"], //Armor I
	["ACR Carried Vest (Light/Empty)", "CUP_V_CZ_vest15", -1, "vest"], //Armor I
	["ACR Carrier Vest Grenadier (Heavy)", "CUP_V_CZ_vest05", -1, "vest"], //Armor III
	["ACR Carrier Vest Machinegunner (Heavy)", "CUP_V_CZ_vest11", -1, "vest"], //Armor III
	["ACR NPP-2006 (Black Vest)", "CUP_V_CZ_NPP2006_nk_black", -1, "vest"], //Armor IV
	["ACR NPP-2006 (Desert)", "CUP_V_CZ_NPP2006_nk_des", -1, "vest"], //Armor IV
	["ACR NPP-2006 (Woodland)", "CUP_V_CZ_NPP2006_nk_vz95", -1, "vest"], //Armor IV
	["ACR Pilot Vest", "CUP_V_CZ_vest20", -1, "vest"],
	["ALICE Webbing", "CUP_V_B_ALICE", -1, "vest"],
	["Armatus Plate Carrier (Black)", "CUP_V_B_Armatus_Black", -1, "vest"], //Armor IV
	["Armatus Plate Carrier (Coyote)", "CUP_V_B_Armatus_Coyote", -1, "vest"], //Armor IV
	["Armatus Plate Carrier (Woodland)", "CUP_V_B_GER_Armatus_Fleck", -1, "vest"], //Armor IV
	["Armatus Plate Carrier (Multicam)", "CUP_V_B_Armatus_MCam", -1, "vest"], //Armor IV
	["Armatus Plate Carrier (Olive Drab)", "CUP_V_B_Armatus_OD", -1, "vest"], //Armor IV
	["Armatus Plate Carrier (Tropentarn KSK)", "CUP_V_B_GER_Armatus_Trop", -1, "vest"], //Armor IV
	["Armatus Plate Carrier w/ Battlebelt (Black)", "CUP_V_B_Armatus_BB_Black", -1, "vest"], //Armor IV
	["Armatus Plate Carrier w/ Battlebelt (Coyote)", "CUP_V_B_Armatus_BB_Coyote", -1, "vest"], //Armor IV
	["Armatus Plate Carrier w/ Battlebelt (Flecktarn KSK)", "CUP_V_B_GER_Armatus_BB_Fleck", -1, "vest"], //Armor IV
	["Armatus Plate Carrier w/ Battlebelt (Multicam US)", "CUP_V_B_Armatus_BB_US_MCam", -1, "vest"], //Armor IV
	["Carrier Vest w/ pouches (Flecktarn)", "CUP_V_B_GER_Carrier_Vest_3", -1, "vest"], //Armor III
	["Carrier Vest w/ pouches (Desert)", "CUP_V_I_RACS_Carrier_Vest_3", -1, "vest"], //Armor III
	["No Front Pouch", "CUP_V_B_Ciras_Black2", -1, "vest"], //Armor IV
	["CIRAS Driver (Black)", "CUP_V_PMC_CIRAS_Black_Veh", -1, "vest"], //Armor III
	["CIRAS Driver (Coyote)", "CUP_V_PMC_CIRAS_Coyote_Veh", -1, "vest"], //Armor III
	["CIRAS Driver (Winter)", "CUP_V_PMC_CIRAS_Winter_Veh", -1, "vest"], //Armor III
	["Ciras Olive (No Front Pouch)", "CUP_V_B_Ciras_Olive2", -1, "vest"], //Armor IV
	["Ciras Khaki (No Front Pouch)", "CUP_V_B_Ciras_Khaki2", -1, "vest"], //Armor IV
	["German Protection Vest (Flecktarn Grenadier)", "CUP_V_B_GER_PVest_Fleck_Gren", -1, "vest"], //Armor IV
	["German Protection Vest (Flecktarn MGunner)", "CUP_V_B_GER_PVest_Fleck_MG", -1, "vest"], //Armor IV
	["German Protection Vest (Flecktarn Officer)", "CUP_V_B_GER_PVest_Fleck_OFC", -1, "vest"], //Armor IV
	["Guerilla Jacket", "CUP_V_I_Guerilla_Jacket", -1, "vest"], //Guerilla Jacket
	["IdZ Weste (Flecktarn)", "BWA3_Vest_Fleck", -1, "vest"], //Armor IV
	["IdZ Weste (Flecktarn) - Grenadier", "BWA3_Vest_Grenadier_Fleck", -1, "vest"], //Armor IV
	["IdZ Weste (Multitarn)", "BWA3_Vest_Multi", -1, "vest"], //Armor IV
	["IdZ Weste (Multitarn) - Grenadier", "BWA3_Vest_Grenadier_Multi", -1, "vest"], //Armor IV
	["IdZ Weste (Tropentarn)", "BWA3_Vest_Tropen", -1, "vest"], //Armor IV
	["IdZ Weste (Tropentarn) - Grenadier", "BWA3_Vest_Grenadier_Tropen", -1, "vest"], //Armor IV
	["Interceptor (Coyote Brown Base)", "CUP_V_B_Interceptor_Base_Coyote", -1, "vest"], //Armor III
	["Interceptor (Coyote Brown Grenadier)", "CUP_V_B_Interceptor_Grenadier_Coyote", -1, "vest"], //Armor III
	["Interceptor (Coyote Brown Rifleman)", "CUP_V_B_Interceptor_Rifleman_Coyote", -1, "vest"], //Armor III
	["Interceptor (Grey Base)", "CUP_V_B_Interceptor_Base_Grey", -1, "vest"], //Armor III
	["Interceptor (Grey Grenadier)", "CUP_V_B_Interceptor_Grenadier_Grey", -1, "vest"], //Armor III
	["Interceptor (Grey Rifleman)", "CUP_V_B_Interceptor_Rifleman_Grey", -1, "vest"], //Armor III
	["Interceptor (M81 Base)", "CUP_V_B_Interceptor_Base_M81", -1, "vest"], //Armor III
	["Interceptor (M81 Grenadier)", "CUP_V_B_Interceptor_Grenadier_M81", -1, "vest"], //Armor III
	["Interceptor (M81 Rifleman)", "CUP_V_B_Interceptor_Rifleman_M81", -1, "vest"], //Armor III
	["Interceptor (DCU Base)", "CUP_V_B_Interceptor_Base_DCU", -1, "vest"], //Armor III
	["Interceptor (DCU Grenadier)", "CUP_V_B_Interceptor_Grenadier_DCU", -1, "vest"], //Armor III
	["Interceptor (DCU Rifleman)", "CUP_V_B_Interceptor_Rifleman_DCU", -1, "vest"], //Armor III
	["Interceptor (Olive Base)", "CUP_V_B_Interceptor_Base_Olive", -1, "vest"], //Armor III
	["Interceptor (Olive Grenadier)", "CUP_V_B_Interceptor_Grenadier_Olive", -1, "vest"], //Armor III
	["Interceptor (Olive Rifleman)", "CUP_V_B_Interceptor_Rifleman_Olive", -1, "vest"], //Armor III
	["IOTV Grenadier (Black)", "CUP_V_PMC_IOTV_Black_Gren", -1, "vest"], //Armor III
	["IOTV Grenadier (Coyote)", "CUP_V_PMC_IOTV_Coyote_Gren", -1, "vest"], //Armor III
	["JPC Vest Light (Flecktarn)", "CUP_V_B_JPC_Fleck_Light", -1, "vest"], //Armor III
	["JPC Vest Light (Tropentarn)", "CUP_V_B_JPC_MCam_Light", -1, "vest"], //Armor III
	["LBT Load Bearing Vest w/Plate (Black)", "CUP_V_B_LBT_LBV_Black", -1, "vest"], //Armor IV
	["LBT Load Bearing Vest w/Plate (Flecktarn)", "CUP_V_B_GER_Carrier_Vest", -1, "vest"], //Armor IV
	["M23 Pioneer (Brown)", "CUP_V_O_SLA_M23_1_BRN", -1, "vest"], 
	["M23 Pioneer (Green)", "CUP_V_O_SLA_M23_1_OD", -1, "vest"],
	["M23 Pioneer (Takistani)", "CUP_V_O_TK_Vest_1", -1, "vest"],
	["Marom IDF Tacitcal Vest", "CUP_V_IDF_Vest", -1, "vest"], //Armor III
	["Miltec Chest Rig (Brown)", "CUP_V_B_GER_Carrier_Rig_2_Brown", -1, "vest"],
	["Miltec Chest Rig (Desert)", "CUP_V_I_RACS_Carrier_Rig_2", -1, "vest"],
	["Miltec Chest Rig (Flecktarn)", "CUP_V_B_GER_Carrier_Rig_2", -1, "vest"],
	["Miltec Chest Rig (Olive)", "CUP_V_I_RACS_Carrier_Rig_wdl_2", -1, "vest"],
	["Modular Tactical Vest (Big Pouch)", "CUP_V_B_MTV_Pouches", -1, "vest"], //Armor III
	["NAVY Personal Vest (Blue)", "CUP_V_B_LHDVest_Blue", -1, "vest"],
	["NAVY Personal Vest (Red)", "CUP_V_B_LHDVest_Red", -1, "vest"],
	["NAVY Personal Vest (Yellow)", "CUP_V_B_LHDVest_Yellow", -1, "vest"],
	["Osprey Mk3 DDPM (Automatic Rifleman)", "CUP_V_B_BAF_DDPM_Osprey_Mk3_AutomaticRifleman", -1, "vest"], //Armor III
	["Osprey Mk3 DPM (Automatic Rifleman)", "CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman", -1, "vest"], //Armor III
	["Osprey Mk4 (Automatic Rifleman)", "CUP_V_B_BAF_MTP_Osprey_Mk4_AutomaticRifleman", -1, "vest"], //Armor III
	["PASGT Vest (M81)", "CUP_V_B_PASGT", -1, "vest"], //Armor II
	["PASGT Vest (Olive)", "CUP_V_B_PASGT_OD", -1, "vest"], //Armor II
	["PASGT Vest Light (M81)", "CUP_V_B_PASGT_no_bags", -1, "vest"], //Armor II
	["PASGT Vest Light (Olive)", "CUP_V_B_PASGT_no_bags_OD", -1, "vest"], //Armor II
	["Pilot Vest (US Army)", "CUP_V_B_USArmy_PilotVest", -1, "vest"], //Armor I
	["Pilot Vest (USMC)", "CUP_V_B_PilotVest", -1, "vest"], //Armor I
	["RRV Carrier (Delta 1)", "CUP_V_B_Delta_1", -1, "vest"], //Armor III
	["RRV Carrier (Delta 2)", "CUP_V_B_Delta_2", -1, "vest"], //Armor III
	["Tactical Vest (Flecktarn)", "CUP_V_B_GER_Tactical_Fleck", -1, "vest"],
	["Tactical Vest (Tropentarn)", "CUP_V_B_GER_Tactical_Trop", -1, "vest"],
	["Takistani Jacket (Black)", "CUP_V_OI_TKI_Jacket1_04", -1, "vest"],
	["Takistani Jacket (Brown)", "CUP_V_OI_TKI_Jacket1_06", -1, "vest"],
	["Takistani Jacket (Snow)", "CUP_V_OI_TKI_Jacket1_02", -1, "vest"],
	["Takistani Jacket (Woodland)", "CUP_V_OI_TKI_Jacket1_03", -1, "vest"],
	["Takistani Jacket/pouches (Blue/Grey)", "CUP_V_OI_TKI_Jacket4_04", -1, "vest"],
	["Takistani Jacket/pouches (Brown)", "CUP_V_OI_TKI_Jacket4_05", -1, "vest"],
	["Takistani Jacket/pouches (Desert)", "CUP_V_OI_TKI_Jacket4_02", -1, "vest"],
	["Takistani Jacket/pouches (Tri-Color Desert)", "CUP_V_OI_TKI_Jacket4_03", -1, "vest"],
	["Takistani Jacket/pouches (Woodland)", "CUP_V_OI_TKI_Jacket4_01", -1, "vest"]
];

backpackArray = compileFinal str
[
	//["Parachute", "B_Parachute", 200, "backpack"],
	["Czech Scout Pack (M95)", "CUP_B_ACRScout_m95", 150, "backpack"],
	["Messenger Pack (Gray)", "B_Messenger_Gray_F", 280, "backpack", "noDLC"],
	["Messenger Pack (Dust)", "B_Messenger_Coyote_F", 280, "backpack", "noDLC"],
	["Messenger Pack (Olive)", "B_Messenger_Olive_F", 280, "backpack", "noDLC"],
	["Messenger Pack (Black)", "B_Messenger_Black_F", 280, "backpack", "noDLC"],
	["Messenger Pack (IDAP)", "B_Messenger_IDAP_F", 280, "backpack", "noDLC"],
	
	["USMC Assault Pack (Green)", "CUP_B_USMC_AssaultPack", 400, "backpack"],

	["Assault Pack (Black)", "B_AssaultPack_blk", 500, "backpack"],
	["Assault Pack (Green)", "B_AssaultPack_rgr", 500, "backpack"],
	["Assault Pack (MTP)", "B_AssaultPack_mcamo", 500, "backpack"],
	["Assault Pack (Hex)", "B_AssaultPack_ocamo", 500, "backpack"],
	["Assault Pack (Tropic)", "B_AssaultPack_tna_F", 500, "backpack", "noDLC"],
	["Assault Pack (Geometric)", "B_AssaultPack_eaf_F", 500, "backpack", "noDLC"],
	["Assault Pack (Woodland)", "B_AssaultPack_wdl_F", 500, "backpack", "noDLC"],
	["Angriffspack (BW-Fleck)", "BWA3_AssaultPack_Fleck", 500, "backpack"],
	["Angriffspack (BW-Multi)", "BWA3_AssaultPack_Multi", 500, "backpack"],
	["Angriffspack (BW-Tropic)", "BWA3_AssaultPack_Tropen", 500, "backpack"],
	
	["RPG-Pack", "CUP_B_RPGPack_Khaki", 650, "backpack"],

	["Field Pack (Black)", "B_FieldPack_blk", 800, "backpack"],
	["Field Pack (Coyote)", "B_FieldPack_cbr", 800, "backpack"],
	["Field Pack (Khaki)", "B_FieldPack_khk", 800, "backpack"],
	["Field Pack (Urban)", "B_FieldPack_oucamo", 800, "backpack"],
	["Field Pack (G Hex)", "B_FieldPack_ghex_F", 800, "backpack", "noDLC"],
	["Field Pack (Green)", "B_FieldPack_green_F", 800, "backpack", "noDLC"],
	["Field Pack (Taiga)", "B_FieldPack_taiga_F", 800, "backpack", "noDLC"],
	["Feldpack (BW-Fleck)", "BWA3_FieldPack_Fleck", 800, "backpack"],
	["Feldpack (BW-Multi)", "BWA3_FieldPack_Multi", 800, "backpack"],
	["Feldpack (BW-Tropic)", "BWA3_FieldPack_Tropen", 800, "backpack"],
	
	["Medical Bag (SLA)", "CUP_B_SLA_Medicbag", 800, "backpack"],

	["Kitbag (Coyote)", "B_Kitbag_cbr", 1200, "backpack"],
	["Kitbag (Green)", "B_Kitbag_rgr", 1200, "backpack"],
	["Kitbag (MTP)", "B_Kitbag_mcamo", 1200, "backpack"],
	["Kitbag (Sage)", "B_Kitbag_sgg", 1200, "backpack"],
	["Kitbag (Flecktarn)", "BWA3_Kitbag_Fleck", 1200, "backpack"],
	["Kitbag (Multitarn)", "BWA3_Kitbag_Multi", 1200, "backpack"],
	["Kitbag (Tropentarn)", "BWA3_Kitbag_Tropen", 1200, "backpack"],
	
	["Tactical Backpack (Flecktarn)", "BWA3_TacticalPack_Fleck", 1300, "backpack"],
	["Tactical Backpack (Multitarn)", "BWA3_TacticalPack_Multi", 1300, "backpack"],
	["Tactical Backpack (Tropentarn)", "BWA3_TacticalPack_Tropen", 1300, "backpack"],

	["Viper Light Harness (Black)", "B_ViperLightHarness_blk_F", 1600, "backpack", "noDLC"],
	["Viper Light Harness (Hex)", "B_ViperLightHarness_hex_F", 1600, "backpack", "noDLC"],
	["Viper Light Harness (G Hex)", "B_ViperLightHarness_ghex_F", 1600, "backpack", "noDLC"],
	["Viper Light Harness (Khaki)", "B_ViperLightHarness_khk_F", 1600, "backpack", "noDLC"],
	["Viper Light Harness (Olive)", "B_ViperLightHarness_oli_F", 1600, "backpack", "noDLC"],
	
	["Spetsnaz Backpack (Green)", "CUP_B_RUS_Backpack", 1650, "backpack"],
	
	["KSK Tactical Backpack (Flecktarn)", "CUP_B_GER_Pack_Flecktarn", 1700, "backpack"],
	["KSK Tactical Backpack (Tropentarn)", "CUP_B_GER_Pack_Tropentarn", 1700, "backpack"],
	
	["Civilian Assault Pack (Woodland)", "CUP_B_CivPack_WDL", 1800, "backpack"],
	["Czech Paratrooper Backpack (M95)", "CUP_B_ACRPara_m95", 1900, "backpack"],
	["Alice Pack (Khaki)", "CUP_B_AlicePack_Khaki", 2000, "backpack"],
	["Motherlode (MTP)", "CUP_B_Motherlode_MTP", 2100, "backpack"],
	["Predator (MTP)", "CUP_B_Predator_MTP", 2150, "backpack"],

	["Viper Harness (Black)", "B_ViperHarness_blk_F", 2200, "backpack", "noDLC"],
	["Viper Harness (Hex)", "B_ViperHarness_hex_F", 2200, "backpack", "noDLC"],
	["Viper Harness (G Hex)", "B_ViperHarness_ghex_F", 2200, "backpack", "noDLC"],
	["Viper Harness (Khaki)", "B_ViperHarness_khk_F", 2200, "backpack", "noDLC"],
	["Viper Harness (Olive)", "B_ViperHarness_oli_F", 2200, "backpack", "noDLC"],
	
	["USMC MOLLE Pack (Green)", "CUP_B_USMC_MOLLE", 2300, "backpack"],
	["USMC MOLLE Pack (Woodland)", "CUP_B_USMC_MOLLE_WDL", 2300, "backpack"],
	
	["Kombat (Olive)", "CUP_B_Kombat_Olive", 2500, "backpack"],
	["Hiking Pack", "CUP_B_HikingPack_Civ", 2500, "backpack"],
	
	["Coyote Backpack", "CUP_B_USPack_Coyote", 2900, "backpack"],
	
	["Carryall (Khaki)", "B_Carryall_khk", 3500, "backpack"],
	["Carryall (MTP)", "B_Carryall_mcamo", 3500, "backpack"],
	["Carryall (Olive)", "B_Carryall_oli", 3500, "backpack"],
	["Carryall (Urban)", "B_Carryall_oucamo", 3500, "backpack"],
	["Carryall (G Hex)", "B_Carryall_ghex_F", 3500, "backpack", "noDLC"],
	["Carryall (Geometric)", "B_Carryall_eaf_F", 3500, "backpack", "noDLC"],
	["Carryall (Green)", "B_Carryall_green_F", 3500, "backpack", "noDLC"],
	["Carryall (Taiga)", "B_Carryall_taiga_F", 3500, "backpack", "noDLC"],
	["Carryall (Woodland)", "B_Carryall_wdl_F", 3500, "backpack", "noDLC"],
	["Carryall (BW-Fleck)", "BWA3_Carryall_Fleck", 3500, "backpack"],
	["Carryall (BW-Multi)", "BWA3_Carryall_Multi", 3500, "backpack"],
	["Carryall (BW-Tropic)", "BWA3_Carryall_Tropen", 3500, "backpack"],
	
	["Kampfrucksack (Flecktarn)", "BWA3_PatrolPack_Fleck", 4500, "backpack"],
	["Kampfrucksack (Multitarn)", "BWA3_PatrolPack_Multi", 4500, "backpack"],
	["Kampfrucksack (Tropentarn)", "BWA3_PatrolPack_Tropen", 4500, "backpack"],

	["Bergen (Digital)", "B_Bergen_dgtl_F", 6500, "backpack"],
	["Bergen (Hex)", "B_Bergen_hex_F", 6500, "backpack", "noDLC"],
	["Bergen (MTP)", "B_Bergen_mcamo_F", 6500, "backpack", "noDLC"],
	["Bergen (Tropic)", "B_Bergen_tna_F", 6500, "backpack", "noDLC"],
	["Self-Contained Breathing Apparatus", "B_SCBA_01_F", 2500, "backpack"],
	
	["Combination Unit Respirator", "B_CombinationUnitRespirator_01_F", 2500, "backpack"],
	["Radio Pack (Black)", "B_RadioBag_01_black_F", 1500, "backpack"],
	["Radio Pack (Digital)", "B_RadioBag_01_digi_F", 1500, "backpack"],
	["Radio Pack (Geometric)", "B_RadioBag_01_eaf_F", 1500, "backpack"],
	["Radio Pack (Green Hex)", "B_RadioBag_01_ghex_F", 1500, "backpack"],
	["Radio Pack (Hex)", "B_RadioBag_01_hex_F", 1500, "backpack"],
	["Radio Pack (MTP)", "B_RadioBag_01_mtp_F", 1500, "backpack"],
	["Radio Pack (Tropic)", "B_RadioBag_01_tropic_F", 1500, "backpack"],
	["Radio Pack (Urban)", "B_RadioBag_01_oucamo_F", 1500, "backpack"],
	["Radio Pack (Woodland)", "B_RadioBag_01_wdl_F", 1500, "backpack"]
];

goggleArray = compileFinal str
[
	["Diving Goggles", "G_Diving", 1000, "gogg"],
	["Stealth Balaclava (Black)", "G_Balaclava_TI_blk_F", 2000, "gogg"],
	["Stealth Balaclava (Black, Goggles)", "G_Balaclava_TI_G_blk_F", 2500, "gogg"],
	["Stealth Balaclava (Green)", "G_Balaclava_TI_tna_F", 2000, "gogg"],
	["Stealth Balaclava (Green, Goggles)", "G_Balaclava_TI_G_tna_F", 2500, "gogg"],
	["Combat Goggles", "G_Combat", 250, "gogg"],
	["Combat Goggles (Green)", "G_Combat_Goggles_tna_F", 250, "gogg", "noDLC"],
	["VR Goggles", "G_Goggles_VR", 250, "gogg"],
	["Balaclava (Black)", "G_Balaclava_blk", 250, "gogg"],
	["Balaclava (Combat Goggles)", "G_Balaclava_combat", 250, "gogg"],
	["Balaclava (Low Profile Goggles)", "G_Balaclava_lowprofile", 250, "gogg"],
	["Balaclava (Olive)", "G_Balaclava_oli", 250, "gogg"],
	["Bandana (Aviator)", "G_Bandanna_aviator", 125, "gogg"],
	["Bandana (Beast)", "G_Bandanna_beast", 125, "gogg"],
	["Bandana (Black)", "G_Bandanna_blk", 125, "gogg"],
	["Bandana (Khaki)", "G_Bandanna_khk", 125, "gogg"],
	["Bandana (Olive)", "G_Bandanna_oli", 125, "gogg"],
	["Bandana (Shades)", "G_Bandanna_shades", 125, "gogg"],
	["Bandana (Sport)", "G_Bandanna_sport", 125, "gogg"],
	["Bandana (Tan)", "G_Bandanna_tan", 125, "gogg"],

	["Aviator Glasses", "G_Aviator", 100, "gogg"],
	["Ladies Shades", "G_Lady_Blue", 100, "gogg"],
	["Ladies Shades (Fire)", "G_Lady_Red", 100, "gogg"],
	["Ladies Shades (Iridium)", "G_Lady_Mirror", 100, "gogg"],
	["Ladies Shades (Sea)", "G_Lady_Dark", 100, "gogg"],
	["Low Profile Goggles", "G_Lowprofile", 100, "gogg"],
	["Shades (Black)", "G_Shades_Black", 100, "gogg"],
	["Shades (Blue)", "G_Shades_Blue", 100, "gogg"],
	["Shades (Green)", "G_Shades_Green", 100, "gogg"],
	["Shades (Red)", "G_Shades_Red", 100, "gogg"],
	["Spectacle Glasses", "G_Spectacles", 100, "gogg"],
	["Sport Shades (Fire)", "G_Sport_Red", 100, "gogg"],
	["Sport Shades (Poison)", "G_Sport_Blackyellow", 100, "gogg"],
	["Sport Shades (Shadow)", "G_Sport_BlackWhite", 100, "gogg"],
	["Sport Shades (Style)", "G_Sport_Checkered", 100, "gogg"],
	["Sport Shades (Vulcan)", "G_Sport_Blackred", 100, "gogg"],
	["Sport Shades (Yetti)", "G_Sport_Greenblack", 100, "gogg"],
	["Square Shades", "G_Squares_Tinted", 100, "gogg"],
	["Square Spectacles", "G_Squares", 100, "gogg"],
	["Tactical Glasses", "G_Tactical_Clear", 100, "gogg"],
	["Tactical Shades", "G_Tactical_Black", 100, "gogg"],
	["Respirator (Blue)", "G_Respirator_blue_F", 150, "gogg", "noDLC"],
	["Respirator (Yellow)", "G_Respirator_yellow_F", 150, "gogg", "noDLC"],
	["Respirator (White)", "G_Respirator_white_F", 150, "gogg", "noDLC"],
	["Wireless Earpiece", "G_WirelessEarpiece_F", 150, "gogg", "noDLC"],
	["EyeProtectors", "G_EyeProtectors_F", 100, "gogg", "noDLC"],
	["EarNEyeProtectors", "G_EyeProtectors_Earpiece_F", 100, "gogg", "noDLC"],
	["Tinted Spectacles", "G_Spectacles_Tinted", 100, "gogg"],
	["APR (Black CSAT)", "G_AirPurifyingRespirator_02_black_F", 10000, "gogg"],
	["APR (Olive CSAT)", "G_AirPurifyingRespirator_02_olive_F", 10000, "gogg"],
	["APR (Sand CSAT)", "G_AirPurifyingRespirator_02_sand_F", 10000, "gogg"],
	["APR (NATO)", "G_AirPurifyingRespirator_01_F", 10000, "gogg"],
	["Regulator Mask", "G_RegulatorMask_F", 10000, "gogg"],
	["Blindfold (Black)", "G_Blindfold_01_black_F", 100, "gogg"],
	["Blindfold (White)", "G_Blindfold_01_white_F", 100, "gogg"],
	["BW Brille (Clear)", "BWA3_G_Combat_clear", 100, "gogg"],
	["BW Brille (Orange)", "BWA3_G_Combat_orange", 100, "gogg"],
	["BW Brille (Black)", "BWA3_G_Combat_black", 100, "gogg"],
	["ESS Goggles Black (Dark Tint)", "CUP_G_ESS_BLK_Dark", 100, "gogg"],
	["ESS Goggles Black (Ember Tint)", "CUP_G_ESS_BLK_Ember", 100, "gogg"],
	["ESS Goggles Black", "CUP_G_ESS_BLK", 100, "gogg"]
];

genItemArray = compileFinal str
[
	["UAV Terminal (NATO)", "B_UavTerminal", 2000, "gps"],
	["UAV Terminal (CSAT)", "O_UavTerminal", 2000, "gps"],
	["UAV Terminal (AAF)", "I_UavTerminal", 2000, "gps"],
	// ["UAV Terminal (LDF)", "I_E_UavTerminal", 2000, "gps"],
	["Quadrotor UAV (NATO)", "B_UAV_01_backpack_F", 50000, "backpack"],
	["Quadrotor UAV (CSAT)", "O_UAV_01_backpack_F", 50000, "backpack"],
	["Quadrotor UAV (AAF)", "I_UAV_01_backpack_F", 50000, "backpack"],
	// ["Quadrotor UAV (LDF)", "I_E_UAV_01_backpack_F", 50000, "backpack"],
	["AL-6 UAV (NATO)", "B_UAV_06_backpack_F", 60000, "backpack"],
	["AL-6 UAV (CSAT)", "O_UAV_06_backpack_F", 60000, "backpack"],
	["AL-6 UAV (AAF)", "I_UAV_06_backpack_F", 60000, "backpack"],
	["AL-6 UAV (LDF)", "I_E_UAV_06_backpack_F", 60000, "backpack"],
	["AL-6 UAV Med (NATO)", "B_UAV_06_medical_backpack_F", 60000, "backpack"],
	["AL-6 UAV Med (CSAT)", "O_UAV_06_medical_backpack_F", 60000, "backpack"],
	["AL-6 UAV Med (AAF)", "I_UAV_06_medical_backpack_F", 60000, "backpack"],
	["AL-6 UAV Med (LDF)", "I_E_UAV_06_medical_backpack_F", 60000, "backpack"],
	// ["Hexacopter Demining UAV", "C_IDAP_UAV_06_antimine_backpack_F", 100000, "backpack"],
	["Remote Designator (Sand)", "B_Static_Designator_01_weapon_F", 7500, "backpack"],
	["Remote Designator (Hex)", "O_Static_Designator_02_weapon_F", 7500, "backpack"],
	["Remote Designator (Khaki)", "B_W_Static_Designator_01_weapon_F", 7500, "backpack"],
	["ED-1D UGV (IDAP)", "C_IDAP_UGV_02_Demining_backpack_F", 60000, "backpack"],
	["ED-1D UGV (AAF)", "I_UGV_02_Demining_backpack_F", 60000, "backpack"],
	["ED-1D UGV (CSAT)", "O_UGV_02_Demining_backpack_F", 60000, "backpack"],
	["ED-1D UGV (LDF)", "I_E_UGV_02_Demining_backpack_F", 60000, "backpack"],
	["ED-1D UGV (NATO)", "B_UGV_02_Demining_backpack_F", 60000, "backpack"],
	["ED-1E UGV (AAF)", "I_UGV_02_Science_backpack_F", 20000, "backpack"],
	["ED-1E UGV (CSAT)", "O_UGV_02_Science_backpack_F", 20000, "backpack"],
	["ED-1E UGV (LDF)", "I_E_UGV_02_Science_backpack_F", 20000, "backpack"],
	["ED-1E UGV (NATO)", "B_UGV_02_Science_backpack_F", 20000, "backpack"],
	["GPS", "ItemGPS", 1000, "gps"],
	["First Aid Kit", "FirstAidKit", 250, "item"],
	["Medikit", "Medikit", 1500, "item"],
	["Toolkit", "ToolKit", 1500, "item"],
	["Mine Detector", "MineDetector", 1000, "item"],
	["Diving Goggles", "G_Diving", 1000, "gogg"],
	["Regulator Mask", "G_RegulatorMask_F", 10000, "gogg"],
	["NV Goggles (Brown)", "NVGoggles", 450, "nvg"],
	["NV Goggles (Black)", "NVGoggles_OPFOR", 450, "nvg"],
	["NV Goggles (Green)", "NVGoggles_INDEP", 450, "nvg"],
	["NV Goggles (Tropic)", "NVGoggles_tna_F", 450, "nvg"],
	["Compact NVG (Hex)", "O_NVGoggles_hex_F", 900, "nvg"],
	["Compact NVG (G Hex)", "O_NVGoggles_ghex_F", 900, "nvg"],
	["Compact NVG (Urban)", "O_NVGoggles_urb_F", 900, "nvg"],
	["Compact NVG (Green)", "O_NVGoggles_grn_F", 900, "nvg"],
	["Binoculars", "Binocular", 500, "binoc"],
	["Rangefinder", "Rangefinder", 1500, "binoc"],
	["Laser Designator (Sand)", "Laserdesignator", 2500, "binoc", "noDLC"], // Increase price to 2500 if A3W_disableBuiltInThermal = 0
	["Laser Designator (Olive)", "Laserdesignator_03", 2500, "binoc", "noDLC"],
	["Laser Designator (Khaki)", "Laserdesignator_01_khk_F", 2500, "binoc", "noDLC"],
	["Laser Designator (Hex)", "Laserdesignator_02", 3000, "binoc", "noDLC"],
	["Laser Designator (G Hex)", "Laserdesignator_02_ghex_F", 3000, "binoc", "noDLC"],
	["IR Grenade", "B_IR_Grenade", 500, "mag", "WEST"],
	["IR Grenade", "O_IR_Grenade", 500, "mag", "EAST"],
	["IR Grenade", "I_IR_Grenade", 500, "mag", "GUER"],
	["Chemlight (Blue)", "Chemlight_blue", 250, "mag"],
	["Chemlight (Green)", "Chemlight_green", 250, "mag"],
	["Chemlight (Yellow)", "Chemlight_yellow", 250, "mag"],
	["Chemlight (Red)", "Chemlight_red", 250, "mag"]
];

gasItemArray = compileFinal str
[	
	["Gas Mask (NATO)", "H_CrewHelmetHeli_B", 1000, "hat"],
	["Gas Mask (CSAT)", "H_CrewHelmetHeli_O", 1000, "hat"],
	["Gas Mask (AAF)", "H_CrewHelmetHeli_I", 1000, "hat"],
	["Gas Mask (LDF)", "H_CrewHelmetHeli_I_E", 1000, "hat"],
	["APR (Black CSAT)", "G_AirPurifyingRespirator_02_black_F", 10000, "gogg"],
	["APR (Olive CSAT)", "G_AirPurifyingRespirator_02_olive_F", 10000, "gogg"],
	["APR (Sand CSAT)", "G_AirPurifyingRespirator_02_sand_F", 10000, "gogg"],
	["APR (NATO)", "G_AirPurifyingRespirator_01_F", 10000, "gogg"],
	["Regulator Mask", "G_RegulatorMask_F", 10000, "gogg"]
];


allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray + call goggleArray);

genObjectsArray = compileFinal str
[
	["Camo Net", "CamoNet_INDP_open_F", 2000, "object", "HIDDEN"], // unlisted, only for object saving
	["Pier Ladder", "Land_PierLadder_F", 2500, "object"],
	["Ammo Cache", "Box_FIA_Support_F", 2500, "ammocrate"],
	//["Metal Barrel", "Land_MetalBarrel_F", 2500, "object"],
	//["Toilet Box", "Land_ToiletBox_F", 2500, "object"],
	["Lamp Post (Harbour)", "Land_LampHarbour_F", 900, "object"],
	["Lamp Post (Shabby)", "Land_LampShabby_F", 900, "object"],
	["Boom Gate", "Land_BarGate_F", 900, "object"],
	["Pipes", "Land_Pipes_Large_F", 900, "object"],
	["Concrete Frame", "Land_CncShelter_F", 500, "object"],
	["Highway Guardrail", "Land_Crash_barrier_F", 1000, "object"],
	["Concrete Barrier", "Land_CncBarrier_F", 300, "object"],
	["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 800, "object"],
	["Concrete Barrier (Long)", "Land_CncBarrierMedium4_F", 1000, "object"],
	["HBarrier (1 block)", "Land_HBarrier_1_F", 100, "object"],
	["HBarrier (3 blocks)", "Land_HBarrier_3_F", 400, "object"],
	["HBarrier (5 blocks)", "Land_HBarrier_5_F", 600, "object"],
	["HBarrier Big", "Land_HBarrierBig_F", 1000, "object"],
	["HBarrier Wall (4 blocks)", "Land_HBarrierWall4_F", 1500, "object"],
	["HBarrier Wall (6 blocks)", "Land_HBarrierWall6_F", 1600, "object"],
	["HBarrier Watchtower", "Land_HBarrierTower_F", 3000, "object"],
	["Concrete Wall", "Land_CncWall1_F", 600, "object"],
	["Concrete Military Wall", "Land_Mil_ConcreteWall_F", 1500, "object"],
	["Concrete Wall (Long)", "Land_CncWall4_F", 600, "object"],
	["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 1500, "object"],
	//["Shoot House Wall", "Land_Shoot_House_Wall_F", 180, "object"],
	["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 1200, "object"],
	["Canal Stairs", "Land_Canal_Wall_Stairs_F", 2000, "object"],
	["Bag Fence (Corner)", "Land_BagFence_Corner_F", 800, "object"],
	["Bag Fence (End)", "Land_BagFence_End_F", 800, "object"],
	["Bag Fence (Long)", "Land_BagFence_Long_F", 850, "object"],
	["Bag Fence (Round)", "Land_BagFence_Round_F", 900, "object"],
	["Bag Fence (Short)", "Land_BagFence_Short_F", 800, "object"],
	["Bag Bunker (Small)", "Land_BagBunker_Small_F", 900, "object"],
	["Bag Bunker (Large)", "Land_BagBunker_Large_F", 1000, "object"],
	["Bag Bunker Tower", "Land_BagBunker_Tower_F", 5000, "object"],
	["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 4000, "object"],
	["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 11000, "object"],
	["Concrete Ramp", "Land_RampConcrete_F", 1500, "object"],
	["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 1600, "object"],
	["Scaffolding", "Land_Scaffolding_F", 2500, "object"]
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call gasItemArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
	// SKIPSAVE = will not be autosaved until first manual force save, good for cheap vehicles that usually get abandoned

	["Kart", "C_Kart_01_F", 5000, "vehicle", "SKIPSAVE"],

	["Quadbike (Civilian)", "C_Quadbike_01_F", 5000, "vehicle", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
	["Quadbike (NATO)", "B_Quadbike_01_F", 5000, "vehicle", "SKIPSAVE", "HIDDEN"], //
	["Quadbike (CSAT)", "O_Quadbike_01_F", 5000, "vehicle", "SKIPSAVE", "HIDDEN"], //
	["Quadbike (AAF)", "I_Quadbike_01_F", 5000, "vehicle", "SKIPSAVE", "HIDDEN"], //
	["Quadbike", "I_G_Quadbike_01_F", 5000, "vehicle", "SKIPSAVE"],
	
	["M1030 (Motorrad)", "CUP_B_M1030_USMC", 4000, "vehicle", "SKIPSAVE"],
	
	["TT650", "CUP_O_TT650_TKA", 4000, "vehicle", "SKIPSAVE"], //Opfor Rust
	// ["TT650 Flames", "CUP_I_TT650_NAPA", 4000, "vehicle", "SKIPSAVE"], //Indp Flames
	// CUP_O_TT650_CHDKZ //Opfor Flames
	// ["TT650 Rusty", "CUP_C_TT650_TK_CIV", 4000, "vehicle", "SKIPSAVE"], //Civ Rostig
	// ["TT650 Red White", "CUP_C_TT650_CIV", 4000, "vehicle", "SKIPSAVE"], //Civ RotWeis CUP_C_TT650_RU

	["Hatchback", "C_Hatchback_01_F", 8000, "vehicle", "SKIPSAVE"],
	["Hatchback Sport", "C_Hatchback_01_sport_F", 10000, "vehicle", "SKIPSAVE"],
	["SUV", "C_SUV_01_F", 11000, "vehicle", "SKIPSAVE"],
	
	// ["Lada", "CUP_C_Lada_White_CIV", 8000, "vehicle", "SKIPSAVE"],
	// ["Lada (Green)", "CUP_C_Lada_GreenTK_CIV", 8000, "vehicle", "SKIPSAVE"],
	["Lada", "CUP_LADA_LM_CIV", 8000, "vehicle", "SKIPSAVE"],
	["Golf (Red)", "CUP_C_Golf4_red_Civ", 9000, "vehicle", "SKIPSAVE"],
	["Skoda 105 L (Blue)", "CUP_C_Skoda_Blue_CIV", 7000, "vehicle", "SKIPSAVE"],
	// ["Volha (Limo)", "CUP_C_Volha_Limo_TKCIV", 6000, "vehicle", "SKIPSAVE"],
	["Volha", "CUP_O_Volha_SLA", 6000, "vehicle", "SKIPSAVE"],
	["Datsun 620 Pickup (Covered)", "CUP_C_Datsun_Covered", 6500, "vehicle", "SKIPSAVE"],
	["Datsun 620 Pickup (PK)", "CUP_I_Datsun_PK_Random", 6500, "vehicle", "SKIPSAVE"],
	["Datsun 620 Pickup (AA)", "CUP_I_Datsun_PK_Random", 6500, "vehicle", "SKIPSAVE"], //*Neu
	["Datsun 620 Pickup (4Seat)", "CUP_I_Datsun_PK_Random", 6500, "vehicle", "SKIPSAVE"], //*Neu
	
	["SUV (Random Color)", "CUP_C_SUV_CIV", 15000, "vehicle", "SKIPSAVE"],
	["SUV (Van)", "CUP_I_SUV_ION", 15000, "vehicle", "SKIPSAVE"],
	["SUV (Van) MG", "CUP_I_SUV_Armored_ION", 25000, "vehicle", "SKIPSAVE"],

	["MB 4WD", "C_Offroad_02_unarmed_F", 10000, "vehicle", "SKIPSAVE"],
	["MB 4WD (Guerilla)", "I_C_Offroad_02_unarmed_F", 12000, "vehicle", "SKIPSAVE", "HIDDEN"],
	["MB 4WD LMG", "I_C_Offroad_02_LMG_F", 15000, "vehicle", "SKIPSAVE"],
	["MB 4WD AT", "I_C_Offroad_02_AT_F", 30000, "vehicle"],

	["Offroad", "C_Offroad_01_F", 11000, "vehicle", "SKIPSAVE"],
	["Offroad Camo", "B_G_Offroad_01_F", 12500, "vehicle", "SKIPSAVE"],
	["Offroad Police", "B_GEN_Offroad_01_gen_F", 12500, "vehicle", "SKIPSAVE"],
	["Offroad Repair", "C_Offroad_01_repair_F", 15000, "vehicle", "SKIPSAVE"],
	["Offroad HMG", "B_G_Offroad_01_armed_F", 25000, "vehicle", "SKIPSAVE"],
	
	["Offroad Covered", "C_Offroad_01_covered_F", 12500, "vehicle", "SKIPSAVE"],
	["Offroad Covered (Com)", "C_Offroad_01_comms_F", 12500, "vehicle", "SKIPSAVE"],
	["Offroad Covered (Pol)", "B_GEN_Offroad_01_covered_F", 12500, "vehicle", "SKIPSAVE"],

	["Tractor", "C_Tractor_01_F", 3000, "vehicle", "SKIPSAVE"],
	// ["Towing Tractor", "CUP_B_TowingTractor_CZ", 3000, "vehicle", "SKIPSAVE"],
	// ["Old Tractor", "CUP_C_Tractor_CIV", 3000, "vehicle", "SKIPSAVE"],
	// ["Towing Tractor 2", "CUP_O_Tractor_Old_TKA", 3000, "vehicle", "SKIPSAVE"],
	
	["Ikarus 260", "CUP_C_Ikarus_TKC", 6000, "vehicle", "SKIPSAVE"],

	["Truck", "C_Van_01_transport_F", 7000, "vehicle", "SKIPSAVE"],
	["Truck Camo", "I_G_Van_01_transport_F", 8000, "vehicle", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
	["Truck Box", "C_Van_01_box_F", 9000, "vehicle", "SKIPSAVE"],
	["Fuel Truck", "C_Van_01_fuel_F", 20000, "vehicle", "SKIPSAVE"],
	["Fuel Truck Camo", "I_G_Van_01_fuel_F", 2100, "vehicle", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
	
	// ["Skoda S1203", "CUP_C_S1203_CIV", 5000, "vehicle", "SKIPSAVE"],
	["Skoda S1203", "CUP_C_S1203_Militia_CIV", 5000, "vehicle", "SKIPSAVE"],
	// ["Skoda S1203 (Ambulance)", "CUP_B_S1203_Ambulance_CDF", 5000, "vehicle", "SKIPSAVE"],
	
	["Van Cargo", "C_Van_02_vehicle_F", 5000, "vehicle", "SKIPSAVE"],
	["Van Transport", "C_Van_02_transport_F", 5000, "vehicle", "SKIPSAVE"],
	["Van Police Cargo", "B_GEN_Van_02_vehicle_F", 1250, "vehicle", "SKIPSAVE"],
	["Van Police Transport", "B_GEN_Van_02_transport_F", 1250, "vehicle", "SKIPSAVE"],
	["Van Ambulance", "C_Van_02_medevac_F", 5500, "vehicle", "SKIPSAVE"],
	["Van Repair", "C_Van_02_service_F", 6000, "vehicle", "SKIPSAVE"],

	["HEMTT Flatbed", "B_T_Truck_01_flatbed_F", 5000, "vehicle"],
	["HEMTT Cargo", "B_T_Truck_01_cargo_F", 5000, "vehicle"],
	["HEMTT Mover", "B_Truck_01_mover_F", 4000, "vehicle"],
	["HEMTT Resupply", "B_Truck_01_ammo_F", 5000, "vehicle"],
	//["HEMTT Box", "B_Truck_01_box_F", 5000, "vehicle"],
	["HEMTT Transport", "B_Truck_01_transport_F", 6000, "vehicle"],
	["HEMTT Covered", "B_Truck_01_covered_F", 7000, "vehicle"],
	["HEMTT Fuel", "B_Truck_01_fuel_F", 21000, "vehicle"],
	["HEMTT Medical", "B_Truck_01_medical_F", 15000, "vehicle"],
	["HEMTT Repair", "B_Truck_01_Repair_F", 25000, "vehicle"],

	["Tempest Device", "O_Truck_03_device_F", 4000, "vehicle"],
	["Tempest Resupply", "O_Truck_03_ammo_F", 5000, "vehicle"],
	["Tempest Transport", "O_Truck_03_transport_F", 6000, "vehicle"],
	["Tempest Covered", "O_Truck_03_covered_F", 7000, "vehicle"],
	["Tempest Fuel", "O_Truck_03_fuel_F", 20000, "vehicle"],
	["Tempest Medical", "O_Truck_03_medical_F", 14000, "vehicle"],
	["Tempest Repair", "O_Truck_03_repair_F", 24000, "vehicle"],
	
	["Zamak Resupply", "I_Truck_02_ammo_F", 4000, "vehicle"],
	["Zamak Transport", "I_Truck_02_transport_F", 6000, "vehicle"],
	["Zamak Covered", "I_Truck_02_covered_F", 7000, "vehicle"],
	["Zamak Fuel", "I_Truck_02_fuel_F", 20000, "vehicle"],
	["Zamak Medical", "I_Truck_02_medical_F", 14000, "vehicle"],
	["Zamak Repair", "I_Truck_02_box_F", 24000, "vehicle"],
	["Ural (ZU-23)", "CUP_B_Ural_ZU23_CDF", 20000, "vehicle"],
	["Ural (Repair)", "CUP_B_Ural_Repair_CDF", 24000, "vehicle"],
	["Ural (Refuel)", "CUP_B_Ural_Refuel_CDF", 20000, "vehicle"],
	["Ural (Empty)", "CUP_B_Ural_Empty_CDF", 4000, "vehicle"], //*Neu
	["Ural", "CUP_B_Ural_CDF", 6000, "vehicle"],
	["Ural (Ammo)", "CUP_B_Ural_Reammo_CDF", 5000, "vehicle"],
	["Ural (Open)", "CUP_B_Ural_Open_CDF", 6000, "vehicle"],
	["Tatra T810 (Repair)", "CUP_B_T810_Repair_CZ_DES", 24000, "vehicle"],
	["Tatra T810 (MG/Covered)", "CUP_B_T810_Armed_CZ_DES", 7000, "vehicle"],
	["Tatra T810 (Fuel)", "CUP_B_T810_Refuel_CZ_DES", 20000, "vehicle"],
	["Tatra T810 (Covered)", "CUP_B_T810_Unarmed_CZ_WDL", 7000, "vehicle"],
	["Tatra T810 (Ammo)", "CUP_B_T810_Reammo_CZ_WDL", 5000, "vehicle"],
	["MTVR (Repair)", "CUP_B_MTVR_Repair_USA", 24000, "vehicle"],
	["MTVR (Refuel)", "CUP_B_MTVR_Refuel_USA", 20000, "vehicle"],
	["MTVR", "CUP_B_MTVR_USA", 6000, "vehicle"],
	["MTVR (Ammo)", "CUP_B_MTVR_Ammo_USA", 5000, "vehicle"],
	["Praga V3S", "CUP_I_V3S_Open_TKG", 6000, "vehicle"],
	["Praga V3S (Rearm)", "CUP_I_V3S_Rearm_TKG", 5000, "vehicle"],
	["Praga V3S (Refuel)", "CUP_I_V3S_Refuel_TKG", 20000, "vehicle"],
	["Praga V3S (Covered)", "CUP_I_V3S_Covered_TKG", 7000, "vehicle"],
	["Praga V3S (Repair)", "CUP_I_V3S_Repair_TKG", 24000, "vehicle"],
	["Ural (Worker) (Open)", "CUP_C_Ural_Open_Civ_03", 6000, "vehicle"],
	["Ural (Worker) ", "CUP_C_Ural_Civ_03", 7000, "vehicle"],
	["Praga V3S (Civ Covered)", "CUP_C_V3S_Covered_TKC", 7000, "vehicle"],
	["Praga V3S (Civ Open)", "CUP_C_V3S_Open_TKC", 6000, "vehicle"],
	["GAZ Vodnik (2x PKM)", "CUP_O_GAZ_Vodnik_PK_RU", 30000, "vehicle"],
	// ["GAZ Vodnik (Medical)", "CUP_O_GAZ_Vodnik_MedEvac_RU", 20000, "vehicle"],
	["GAZ Vodnik (AGS-30/PKM)", "CUP_O_GAZ_Vodnik_AGS_RU", 30000, "vehicle"],
	["GAZ Vodnik (BPPU)", "CUP_O_GAZ_Vodnik_BPPU_RU", 70000, "vehicle"]

	//["UGV Stomper (NATO)", "B_UGV_01_F", 25000, "vehicle"],
	//["UGV Stomper RCWS (NATO)", "B_UGV_01_rcws_F", 100000, "vehicle"],
	//["UGV Stomper (AAF)", "I_UGV_01_F", 25000, "vehicle"],
	//["UGV Stomper RCWS (AAF)", "I_UGV_01_rcws_F", 100000, "vehicle"]
	//["UGV Saif (CSAT)", "O_UGV_01_F", 10000, "vehicle"],
	//["UGV Saif RCWS (CSAT)", "O_UGV_01_rcws_F", 80000, "vehicle"]
];

armoredArray = compileFinal str
[
	["UAZ (SPG-9)", "CUP_B_UAZ_SPG9_CDF", 30000, "vehicle", "SKIPSAVE"], // +Raketenwerfer
	["UAZ (Open)", "CUP_B_UAZ_Open_CDF", 5000, "vehicle", "SKIPSAVE"],
	["UAZ (Closed)", "CUP_O_UAZ_Militia_SLA", 5000, "vehicle", "SKIPSAVE"],
	["UAZ (Metis-M)", "CUP_B_UAZ_METIS_CDF", 70000, "vehicle", "SKIPSAVE"], // +Raketenwerfer
	["UAZ (DShKM)", "CUP_B_UAZ_MG_CDF", 20000, "vehicle", "SKIPSAVE"], //+MG
	["UAZ (AGS-30) ", "CUP_B_UAZ_AGS30_CDF", 20000, "vehicle", "SKIPSAVE"], //MG
	["UAZ (AA) ", "CUP_B_UAZ_AA_CDF", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["UAZ", "CUP_B_UAZ_Unarmed_CDF", 11000, "vehicle", "SKIPSAVE"],
	// ["UAZ (Ambulance)", "CUP_O_UAZ_AMB_RU", 11000, "vehicle", "SKIPSAVE"], //*Neu
	["Land Rover 110 (Transport)", "CUP_C_LR_Transport_CTK", 11000, "vehicle", "SKIPSAVE"],
	["Land Rover 110 (M2)", "CUP_B_LR_MG_CZ_W", 20000, "vehicle", "SKIPSAVE"],
	["Land Rover 110 (Ambulance)", "CUP_B_LR_Ambulance_GB_D", 11000, "vehicle", "SKIPSAVE"], //Desert Variant Needed?
	["Land Rover 110 (GMG Special)", "CUP_B_LR_Special_GMG_GB_D", 20000, "vehicle", "SKIPSAVE"],
	["Land Rover 110 (SPG-9)", "CUP_O_LR_SPG9_TKA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["Land Rover 110 (AA)", "CUP_O_LR_AA_TKA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["Land Rover 110 (Special)", "CUP_B_LR_Special_Des_CZ_D", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["Land Rover 110 (M2 Special)", "CUP_B_LR_Special_M2_GB_D", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMWV M1151 M2", "CUP_B_HMMWV_M2_GPK_ACR", 20000, "vehicle", "SKIPSAVE"],
	["HMMWV M1151 (Mk. 19)", "CUP_B_M1151_Mk19_USA", 20000, "vehicle", "SKIPSAVE"],
	["HMMWV M1151 (M2)", "CUP_B_M1151_M2_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMWV M1151 (M2) Deployment", "CUP_B_M1151_Deploy_USA", 20000, "vehicle", "SKIPSAVE"],
	["HMMWV M1151 (MK19)", "CUP_B_M1151_Mk19_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMWV M1114 DSHKM", "CUP_B_HMMWV_DSHKM_GPK_ACR", 20000, "vehicle", "SKIPSAVE"],
	["HMMWV M1152 ECV", "CUP_B_M1152_USA", 11000, "vehicle", "SKIPSAVE"],
	["HMMWV M1167 (TOW-2)", "CUP_B_M1167_USA", 70000, "vehicle", "SKIPSAVE"],
	["HMMWV M1165 GMV (M134)", "CUP_B_M1165_GMV_USA", 11000, "vehicle", "SKIPSAVE"],
	["HMMWV CROWS M2", "CUP_B_HMMWV_Crows_M2_USA", 25000, "vehicle", "SKIPSAVE"],
	["HMMWV CROWS MK19", "CUP_B_HMMWV_Crows_MK19_USA", 28000, "vehicle", "SKIPSAVE"],
	["HMMMV (Ambulance)", "CUP_B_HMMWV_Ambulance_ACR", 11000, "vehicle", "SKIPSAVE"],
	["HMMMV SOV (Mk19)", "CUP_B_HMMWV_SOV_USA", 20000, "vehicle", "SKIPSAVE"],
	["HMMMV SOV (M2)", "CUP_B_HMMWV_SOV_M2_USA", 20000, "vehicle", "SKIPSAVE"],
	["HMMMV M1114 AGS", "CUP_B_HMMWV_AGS_GPK_ACR", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMMV UAV Terminal", "CUP_B_HMMWV_Terminal_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMMV M2", "CUP_B_HMMWV_M2_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMMV Unarmed", "CUP_B_HMMWV_Unarmed_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMMV Transport", "CUP_B_HMMWV_Transport_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMMV MK19", "CUP_B_HMMWV_MK19_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMMV TOW", "CUP_B_HMMWV_TOW_USA", 20000, "vehicle", "SKIPSAVE"], //*Neu
	["HMMWV Avenger", "CUP_B_HMMWV_Avenger_USMC", 120000, "vehicle", "SKIPSAVE"],
	["Dingo 2 (MG)", "CUP_B_Dingo_GER_Des", 25000, "vehicle", "SKIPSAVE"],
	["Dingo 2 (GL)", "CUP_B_Dingo_GL_GER_Des", 28000, "vehicle", "SKIPSAVE"],
	["RG-31 Mk.19", "CUP_B_RG31_Mk19_USA", 28000, "vehicle", "SKIPSAVE"],
	["RG-31 Mk5E M2", "CUP_B_RG31E_M2_USA", 25000, "vehicle", "SKIPSAVE"],
	["RG-31 Nyala M2", "CUP_B_RG31_M2_USA", 25000, "vehicle", "SKIPSAVE"],
	["Eagle IV (FLW 100)", "BWA3_Eagle_FLW100_Fleck", 25000, "vehicle", "SKIPSAVE"],
	["Eagle IV", "BWA3_Eagle_Fleck", 25000, "vehicle", "SKIPSAVE"],
	["Prowler Light", "B_CTRG_LSV_01_light_F", 1500, "vehicle", "SKIPSAVE"],
	["Prowler", "B_T_LSV_01_unarmed_F", 2000, "vehicle", "SKIPSAVE"],
	["Prowler HMG", "B_T_LSV_01_armed_F", 6000, "vehicle", "SKIPSAVE"],
	["Prowler AT", "B_T_LSV_01_AT_F", 70000, "vehicle"],
	["Qilin", "O_T_LSV_02_unarmed_F", 2000, "vehicle", "SKIPSAVE"],
	["Qilin Minigun", "O_T_LSV_02_armed_F", 6000, "vehicle", "SKIPSAVE"],
	["Qilin AT", "O_T_LSV_02_AT_F", 70000, "vehicle"],
	["Hunter", "B_MRAP_01_F", 5000, "vehicle", "SKIPSAVE"],
	["Hunter HMG", "B_MRAP_01_hmg_F", 25000, "vehicle"],
	["Hunter GMG", "B_MRAP_01_gmg_F", 28000, "vehicle"],
	["Ifrit", "O_MRAP_02_F", 5000, "vehicle", "SKIPSAVE"],
	["Ifrit HMG", "O_MRAP_02_hmg_F", 25000, "vehicle"],
	["Ifrit GMG", "O_MRAP_02_gmg_F", 28000, "vehicle"],
	["Strider", "I_MRAP_03_F", 5000, "vehicle", "SKIPSAVE"],
	["Strider HMG", "I_MRAP_03_hmg_F", 25000, "vehicle"],
	["Strider GMG", "I_MRAP_03_gmg_F", 28000, "vehicle"],
	["MSE-3 Marid", "O_APC_Wheeled_02_rcws_v2_F", 50000, "vehicle"],
	["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 70000, "vehicle"],
	["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F", 90000, "vehicle"],
	["Rhino AT", "B_AFV_Wheeled_01_cannon_F", 90000, "vehicle"],
	// ["Rhino Missile", "B_AFV_Wheeled_01_up_cannon_F", 90000, "vehicle"],
	["Coyote GMG", "CUP_B_BAF_Coyote_GMG_D", 25000, "vehicle"],
	["Coyote L2A1", "CUP_B_BAF_Coyote_L2A1_D", 25000, "vehicle"],
	["Jackal2 GMG", "CUP_B_Jackal2_GMG_GB_W", 25000, "vehicle"],
	["Jackal2 L2A1", "CUP_B_Jackal2_L2A1_GB_W", 25000, "vehicle"],
	["Mastiff PPV GMG", "CUP_B_Mastiff_GMG_GB_D", 25000, "vehicle"],
	["Mastiff PPV HMG", "CUP_B_Mastiff_HMG_GB_D", 25000, "vehicle"],
	["Mastiff PPV LMG", "CUP_B_Mastiff_LMG_GB_D", 25000, "vehicle"],
	["Wolfhound TSV LMG", "CUP_B_Wolfhound_LMG_GB_W", 25000, "vehicle"], //*New
	["Wolfhound TSV GMG", "CUP_B_Wolfhound_GMG_GB_W", 25000, "vehicle"], //*New
	["Wolfhound TSV HMG", "CUP_B_Wolfhound_HMG_GB_W", 25000, "vehicle"], //*New
	["Ridgeback PPV HMG", "CUP_B_Ridgback_HMG_GB_W", 25000, "vehicle"], //*New
	["Ridgeback PPV LMG", "CUP_B_Ridgback_LMG_GB_W", 25000, "vehicle"], //*New
	["Ridgeback PPV GMG", "CUP_B_Ridgback_GMG_GB_W", 25000, "vehicle"], //*New

	["FV432 Mortar", "CUP_B_FV432_Mortar", 100000, "vehicle"],
	["FV432 GPMG", "CUP_B_FV432_GB_GPMG", 70000, "vehicle"],
	["FV432 Bulldog M2 RWS", "CUP_B_FV432_Bulldog_GB_D_RWS", 50000, "vehicle"],
	["FV432 Bulldog M2", "CUP_B_FV432_Bulldog_GB_D", 48000, "vehicle"], //*New
	["FV432 Ambulance", "CUP_B_FV432_GB_Ambulance", 45000, "vehicle"],
	["FV510 Warrior", "CUP_B_FV510_GB_D", 70000, "vehicle"],
	["MCV-80 Warrior", "CUP_B_MCV80_GB_D", 70000, "vehicle"],
	["MT-LB LV", "CUP_B_MTLB_pk_CDF", 70000, "vehicle"],
	["T72", "CUP_B_T72_CDF", 130000, "vehicle"],
	["MT-LB LV", "CUP_B_MTLB_pk_Winter_CDF", 70000, "vehicle"],
	["BMP-2 Ambulance", "CUP_B_BMP2_AMB_CDF", 45000, "vehicle"],
	["M1128 MGS", "CUP_B_M1128_MGS_Desert", 42000, "vehicle"], //*New
	["M1126 ICV M2 CROWS", "CUP_B_M1126_ICV_M2_Woodland", 45000, "vehicle"], //*New
	["M1126 ICV MK19 CROWS", "CUP_B_M1126_ICV_MK19_Desert", 45000, "vehicle"], //*New
	["M6 Linebacker", "CUP_B_M6LineBacker_USA_W", 90000, "vehicle"], //*New
	["BMP-2", "CUP_B_BMP2_CDF", 70000, "vehicle"],
	["BMP-2K", "CUP_B_BMP_HQ_CDF", 70000, "vehicle"],
	["BRDM-2 (HQ)", "CUP_B_BRDM2_HQ_CDF", 45000, "vehicle"],
	["BRDM-2 (ATGM)", "CUP_B_BRDM2_ATGM_CDF", 100000, "vehicle"],
	["BRDM-2", "CUP_B_BRDM2_CDF", 45000, "vehicle"],
	["M7 Bradley", "CUP_B_M7Bradley_USA_D", 100000, "vehicle"],
	["M2A3 ERA Bradley IFV", "CUP_B_M2A3Bradley_USA_D", 100000, "vehicle"],
	["M2A2 Bradley IFV", "CUP_B_M2Bradley_USA_D", 100000, "vehicle"],
	["M1135 ATGMV", "CUP_B_M1135_ATGMV_Desert", 70000, "vehicle"],
	["M1133 MEV", "CUP_B_M1133_MEV_Desert", 45000, "vehicle"],
	["M1133 CV M2 CROWS", "CUP_B_M1130_CV_M2_Desert", 45000, "vehicle"], //*New
	["M113", "CUP_B_M113_USA", 45000, "vehicle"],
	["M113A Super-Gavin", "CUP_I_M113_RACS_URB", 70000, "vehicle"],
	["M113A Medi-Gavin", "CUP_I_M113_Med_RACS", 70000, "vehicle"],
	["LAV-25A1", "CUP_B_LAV25_USMC", 70000, "vehicle"],
	["AAVP7/A1", "CUP_B_AAV_USMC", 45000, "vehicle"],
	["AAVC7/A1 (Command)", "CUP_B_AAV_Unarmed_USMC", 45000, "vehicle"],
	["LAV-25A1 (240)", "CUP_B_LAV25M240_USMC", 70000, "vehicle"],
	["LAV-C2", "CUP_B_LAV25_HQ_USMC", 45000, "vehicle"],
	["BTR-80", "CUP_O_BTR80_TK", 47000, "vehicle"], //*New
	["BTR-80A", "CUP_O_BTR80A_TK", 47000, "vehicle"], //*New
	["SPz Puma", "BWA3_Puma_Fleck", 70000, "vehicle"],
	["BMP-1", "CUP_I_BMP1_TK_GUE", 70000, "vehicle"],
	["BMP-3", "CUP_O_BMP3_RU", 72000, "vehicle"], //*New
	["BTR-40 (DSHKM)", "CUP_O_BTR40_MG_TKA", 15000, "vehicle"],
	["BMP-1P TKA", "CUP_O_BMP1P_TKA", 70000, "vehicle"],
	["BTR60 TK", "CUP_O_BTR60_TK", 60000, "vehicle"],
	["BTR40 TKA", "CUP_O_BTR40_TKA", 15000, "vehicle"],
	["BTR90", "CUP_O_BTR90_RU", 80000, "vehicle"],
	["BTR90 (HQ)", "CUP_O_BTR90_HQ_RU", 82000, "vehicle"] //*New
];

tanksArray = compileFinal str
[
	["AWC 303 Nyx Recon", "I_LT_01_scout_F", 30000, "vehicle"],
	["AWC 304 Nyx Autocannon", "I_LT_01_cannon_F", 50000, "vehicle"],
	["AWC 301 Nyx AT", "I_LT_01_AT_F", 90000, "vehicle"],
	["AWC 302 Nyx AA", "I_LT_01_AA_F", 90000, "vehicle"],
	["CRV-6e Bobcat (Resupply)", "B_APC_Tracked_01_CRV_F", 45000, "vehicle"],
	["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 50000, "vehicle"],
	["FV-720 Mora", "I_APC_tracked_03_cannon_F", 90000, "vehicle"],
	["FV-720 Odyniec (Missile)", "I_E_APC_tracked_03_cannon_F", 120000, "vehicle"],
	["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F", 90000, "vehicle"],
	["IFV-6a Cheetah AA", "B_APC_Tracked_01_AA_F", 130000, "vehicle"],
	["ZSU-39 Tigris AA", "O_APC_Tracked_02_AA_F", 120000, "vehicle"],
	["M2A1 Slammer", "B_MBT_01_cannon_F", 130000, "vehicle"],
	["M2A4 Slammer HMG", "B_MBT_01_TUSK_F", 135000, "vehicle"], // Commander gun variant
	["T-100 Varsuk", "O_MBT_02_cannon_F", 130000, "vehicle"],
	["MBT-52 Kuma", "I_MBT_03_cannon_F", 135000, "vehicle"],
	["T-140 Angara", "O_MBT_04_cannon_F", 145000, "vehicle"],
	["T-140K Angara", "O_MBT_04_command_F", 150000, "vehicle"],
	["FV4034 Challenger 2", "CUP_B_Challenger2_Desert_BAF", 200000, "vehicle"],
	["ZSU-23-4", "CUP_B_ZSU23_CDF", 80000, "vehicle"],
	["M1A2 Abrams TUSK", "CUP_B_M1A2_TUSK_MG_DES_US_Army", 140000, "vehicle"],
	["M1A1 Abrams TUSK", "CUP_B_M1A1_DES_US_Army", 140000, "vehicle"],
	["M60A3", "CUP_B_M60A3_USMC", 90000, "vehicle"],
	["M60A3 TTS", "CUP_B_M60A3_TTS_USMC", 90000, "vehicle"],
	["Leopard 2A6", "CUP_B_Leopard2A6_GER", 140000, "vehicle"],
	["KPz Leopard 2", "BWA3_Leopard2_Fleck", 145000, "vehicle"],
	["T-34-85M", "CUP_I_T34_TK_GUE", 70000, "vehicle"],
	["T-55", "CUP_O_T55_CHDKZ", 80000, "vehicle"],
	["M163A1 VADS", "CUP_B_M163_USA", 80000, "vehicle"], //*Neu
	["T-90A", "CUP_O_T90_RU", 150000, "vehicle"]
];


helicoptersArray = compileFinal str
[
	// ["Hexacopter Demining UAV", "C_IDAP_UAV_06_antimine_F", (call genItemArray) select {_x select 1 == "C_IDAP_UAV_06_antimine_backpack_F"} select 0 select 2, "vehicle", "HIDDEN"], // for resupply price
	["M-900 LittleBird", "C_Heli_Light_01_civil_F", 4000, "vehicle"], // MH-6, no flares
	["MH-9 Hummingbird", "B_Heli_Light_01_F", 5000, "vehicle"], // MH-6
	["EH302", "C_IDAP_Heli_Transport_02_F", 6000, "vehicle"], // EH302
	["PO-30 Orca (Unarmed)", "O_Heli_Light_02_unarmed_F", 7000, "vehicle"], // Ka-60
	["WY-55 Hellcat (Unarmed)", "I_Heli_light_03_unarmed_F", 7000, "vehicle"], // AW159
	["CH-49 Mohawk", "I_Heli_Transport_02_F", 8000, "vehicle"], // AW101

	// ["Mi-290 Taru (Resupply)", "O_Heli_Transport_04_ammo_F", 7500, "vehicle"],
	// ["Mi-290 Taru (Crane)", "O_Heli_Transport_04_F", 7500, "vehicle"], // CH-54
	// ["Mi-290 Taru (Box)", "O_Heli_Transport_04_box_F", 8000, "vehicle"],
	// ["Mi-290 Taru (Fuel)", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
	// ["Mi-290 Taru (Bench)", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
	// ["Mi-290 Taru (Transport)", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
	// ["Mi-290 Taru (Medical)", "O_Heli_Transport_04_medevac_F", 12500, "vehicle"],
	// ["Mi-290 Taru (Repair)", "O_Heli_Transport_04_repair_F", 25000, "vehicle"],

	["CH-67 Huron (Unarmed)", "B_Heli_Transport_03_unarmed_F", 10000, "vehicle"], // CH-47
	["CH-67 Huron (Armed)", "B_Heli_Transport_03_F", 35000, "vehicle"], // CH-47 with 2 side miniguns

	["UH-80 Ghost Hawk", "B_Heli_Transport_01_F", 30000, "vehicle"], // UH-60 Stealth with 2 side miniguns
	["AH-9 Pawnee (Gun-Only)", "B_Heli_Light_01_dynamicLoadout_F", 50000, "vehicle", "variant_pawneeGun"], // Armed AH-6
	["AH-9 Pawnee (Delta)", "B_Heli_Light_01_dynamicLoadout_F", 125000, "vehicle", "variant_pawneeDelta"], // Armed AH-6
	["AH-9 Pawnee", "B_Heli_Light_01_dynamicLoadout_F", 65000, "vehicle", "variant_pawneeNormal"],
	["PO-30 Orca (DAR)", "O_Heli_Light_02_dynamicLoadout_F", 65000, "vehicle", "variant_orcaDAR"], // Armed Ka-60 with orca paintjob
	["PO-30 Orca (DAGR)", "O_Heli_Light_02_dynamicLoadout_F", 65000, "vehicle", "variant_orcaDAGR"], // Armed Ka-60, add "HIDDEN" if you don't want it, but don't remove the line!
	["WY-55 Hellcat (Armed)", "I_Heli_light_03_dynamicLoadout_F", 70000, "vehicle"], // Armed AW159
	["WY-55 Czalpa (AG-Armed)", "I_E_Heli_light_03_dynamicLoadout_F", 125000, "vehicle", "variant_CzalpaAG"], // Armed AW159
	["AH-99 Blackfoot", "B_Heli_Attack_01_dynamicLoadout_F", 150000, "vehicle"], // RAH-66 with gunner
	["Mi-48 Kajman AG", "O_Heli_Attack_02_dynamicLoadout_F", 125000, "vehicle","variant_KajmanAG"],
	["Mi-48 Kajman Delta", "O_Heli_Attack_02_dynamicLoadout_F", 150000, "vehicle","variant_KajmanDelta"], //by AryX
	
	
	["Mi-171Sh (Rockets)", "CUP_B_Mi171Sh_ACR", 120000, "vehicle"],
	["Mi-171Sh", "CUP_B_Mi171Sh_Unarmed_ACR", 20000, "vehicle"],
	["Mi-35", "CUP_B_Mi35_Dynamic_CZ", 140000, "vehicle"],
	["SA-330 Puma HC1", "CUP_B_SA330_Puma_HC1_BAF", 10000, "vehicle"],
	["SA-330 Puma HC2", "CUP_B_SA330_Puma_HC2_BAF", 10000, "vehicle"],
	["Merlin HM2", "CUP_B_Merlin_HC4_GB", 10000, "vehicle"],
	["Merlin HC3A (Armed)", "CUP_B_Merlin_HC3A_Armed_GB", 15000, "vehicle"],
	["Merlin HC3A", "CUP_B_Merlin_HC3A_GB", 10000, "vehicle"],
	["Merlin HC3 (VIV)", "CUP_B_Merlin_HC3_VIV_GB", 10000, "vehicle"],
	["Merlin HC3 (Armed)", "CUP_B_Merlin_HC3_Armed_GB", 15000, "vehicle"],
	["Merlin HC3", "CUP_B_Merlin_HC3_GB", 10000, "vehicle"],
	["AH1", "CUP_B_AH1_DL_BAF", 140000, "vehicle"],
	["Chinook HC-4", "CUP_B_CH47F_GB", 20000, "vehicle"],
	["Chinook HC-4 (VIV)", "CUP_B_CH47F_VIV_GB", 20000, "vehicle"],
	["Chinook HC-6", "CUP_B_MH47E_GB", 20000, "vehicle"],
	["AW159 Wildcat (Black Cat)", "CUP_B_AW159_RN_Blackcat", 70000, "vehicle"],
	["AW159 Wildcat (Black Cat, Unarmed)", "CUP_B_AW159_Unarmed_RN_Blackcat", 10000, "vehicle"],
	["i-6A Hook (VIV)", "CUP_B_MI6A_CDF", 20000, "vehicle"],
	["Mi-6T Hook", "CUP_B_MI6T_CDF", 20000, "vehicle"],
	["Mi-8MT Medevac", "CUP_B_Mi17_medevac_CDF", 20000, "vehicle"],
	["Mi-8MT (VIV)", "CUP_B_Mi17_VIV_CDF", 10000, "vehicle"],
	["Mi-8MT", "CUP_B_Mi17_CDF", 10000, "vehicle"],
	["MH-60S Seahawk (M3M)", "CUP_B_UH60S_USN", 10000, "vehicle"],
	["MH-60S Seahawk", "CUP_B_MH60S_USMC", 10000, "vehicle"],
	["MH-60S Seahawk (FFV)", "CUP_B_MH60S_FFV_USMC", 10000, "vehicle"],
	["AH-1Z", "CUP_B_AH1Z_Dynamic_USMC", 110000, "vehicle"],
	["UH-1Y Venom (Gunship)", "CUP_B_UH1Y_Gunship_Dynamic_USMC", 70000, "vehicle"],
	["UH-1Y Venom (MEDVAC)", "CUP_B_UH1Y_MEV_USMC", 20000, "vehicle"],
	["UH-1Y Venom (Transport)", "CUP_B_UH1Y_UNA_USMC", 15000, "vehicle"],
	["UH-60M (FFV)", "CUP_B_UH60M_FFV_US", 10000, "vehicle"],
	["UH-60M unarmed (FFV)", "CUP_B_UH60M_Unarmed_FFV_US", 10000, "vehicle"], //*Neu

	["UH_60L DAP (2 Stores)", "CUP_B_MH60L_DAP_2x_US", 50000, "vehicle"],
	["UH_60L DAP (2 Stores) AT", "CUP_B_MH60L_DAP_2x_US", 87500, "vehicle", "variant_UH60LAT2"], // by jared

	["UH_60L DAP (4 Stores)", "CUP_B_MH60L_DAP_4x_US", 75000, "vehicle"],
	["UH_60L DAP (4 Stores) AT", "CUP_B_MH60L_DAP_4x_US", 100000, "vehicle", "variant_UH60LAT4"], // jared
	["UH_60L DAP (4 Stores) Delta", "CUP_B_MH60L_DAP_4x_US", 130000, "vehicle", "variant_UH60LDelta"], // jared

	["MH-6J Little Bird", "CUP_B_MH6J_USA", 8000, "vehicle"],
	["MH-6J Recon", "CUP_B_MH6J_OBS_USA", 8000, "vehicle"],
	["MH-6M MELB", "CUP_B_MH6M_USA", 8000, "vehicle"],
	["MH-6M Recon", "CUP_B_MH6M_OBS_USA", 8000, "vehicle"],
	["AH-6J", "CUP_B_AH6J_USA", 50000, "vehicle"],
	["AH-6M", "CUP_B_AH6M_USA", 50000, "vehicle"],

	["AH-64D", "CUP_B_AH64D_DL_USA", 125000, "vehicle"],
	["AH-64D Delta", "CUP_B_AH64D_DL_USA", 150000, "vehicle", "variant_AH64DDelta"], // jared

	["AH-64", "CUP_B_AH64_DL_USA", 115000, "vehicle"],
	["UH-1D", "CUP_B_UH1D_GER_KSK", 15000, "vehicle"],
	["UH-1D (Armed)", "CUP_B_UH1D_armed_GER_KSK_Des", 50000, "vehicle"],
	["UH-1D (Gunship)", "CUP_B_UH1D_gunship_GER_KSK_Des", 70000, "vehicle"],
	["UH-1D (Slick)", "CUP_B_UH1D_slick_GER_KSK_Des", 15000, "vehicle"],
	["CH-53G Super Stallion", "CUP_B_CH53E_GER", 20000, "vehicle"],
	["CH-53G Super Stallion (VIV)", "CUP_B_CH53E_VIV_GER", 20000, "vehicle"],
	["UH Tiger Gundpod (Heavy)", "BWA3_Tiger_Gunpod_Heavy", 120000, "vehicle"],
	["UH Tiger RMK (Heavy)", "BWA3_Tiger_RMK_Heavy", 120000, "vehicle"],
	["UH Tiger Gundpod (PARS)", "BWA3_Tiger_Gunpod_PARS", 120000, "vehicle"],
	["UH Tiger RMK (PARS)", "BWA3_Tiger_RMK_PARS", 120000, "vehicle"],
	["UH Tiger RMK (FZ Rockets)", "BWA3_Tiger_RMK_FZ", 120000, "vehicle"],
	["UH Tiger Gundpod (FZ Rockets)", "BWA3_Tiger_Gunpod_FZ", 120000, "vehicle"],
	["UH Tiger RMK (Universal)", "BWA3_Tiger_RMK_Universal", 120000, "vehicle"],
	["Ka-60 Kasatka Black (M3 Rockets)", "CUP_I_Ka60_GL_Blk_ION", 55000, "vehicle"],
	["Ka-60 Kasatka Black (Rockets)", "CUP_I_Ka60_Blk_ION", 50000, "vehicle"],
	["Ka-50 Black Shark", "CUP_O_Ka50_DL_SLA", 50000, "vehicle"], //*Neu
	["Ka-52", "CUP_O_Ka52_RU", 130000, "vehicle"],
	["Mi-24 Superhind Mk.3", "CUP_I_Mi24_Mk3_ION", 150000, "vehicle"],
	["Mi-24 Superhind Mk.4 (S8)", "CUP_I_Mi24_Mk4_ION", 150000, "vehicle"],
	["Mi-24V ", "CUP_O_Mi24_V_Dynamic_RU", 125000, "vehicle"],
	["Mi-24D", "CUP_O_Mi24_D_Dynamic_SLA", 130000, "vehicle"],
	["Mi-24P", "CUP_O_Mi24_P_Dynamic_RU", 120000, "vehicle"],
	["Mi-24D MEV", "CUP_B_Mi24_D_MEV_Dynamic_CDF", 70000, "vehicle"],
	["UH-1H (Armed)", "CUP_O_UH1H_armed_SLA", 50000, "vehicle"],
	["UH-1H (Gunship)", "CUP_O_UH1H_gunship_SLA", 70000, "vehicle"],
	["UH-1H", "CUP_O_UH1H_SLA", 15000, "vehicle"],
	["UH-1H (Slick)", "CUP_O_UH1H_slick_SLA", 15000, "vehicle"]
	//["MQ-12 Falcon UAV", "B_T_UAV_03_F", 150000, "vehicle", "SKIPSAVE"], // Do NOT use "B_T_UAV_03_dynamicLoadout_F" (doesn't support ASRAAM pylons)
	// ["MQ-12 DynamicLoadout Falcon UAV", "B_T_UAV_03_dynamicLoadout_F", 150000, "vehicle", "SKIPSAVE"]
];

planesArray = compileFinal str
[
	["Caesar BTT", "C_Plane_Civil_01_F", 6000, "vehicle"],
	["Caesar Racing", "C_Plane_Civil_01_racing_F", 8000, "vehicle"],
	
	["A-143 Buzzard AA", "I_Plane_Fighter_03_dynamicLoadout_F", 200000, "vehicle", "variant_buzzardEX"],
	["A-143 Buzzard CAS", "I_Plane_Fighter_03_dynamicLoadout_F", 200000, "vehicle", "variant_buzzardCAS"],

	// ["A-149 Gryphon AA XL", "I_Plane_Fighter_04_F", 500000, "vehicle", "variant_GryphonXL"],
	// ["A-149 Gryphon AA", "I_Plane_Fighter_04_F", 350000, "vehicle", "variant_GryphonAA"],
	// ["A-149 Gryphon CAS", "I_Plane_Fighter_04_F", 350000, "vehicle", "variant_GryphonCAS"],
	
	// ["F/A-181 Black Wasp (Gun-Only)", "B_Plane_Fighter_01_Stealth_F", 320000, "vehicle"], // no missiles or bombs
	
	// ["F/A-181 Black Wasp AA", "B_Plane_Fighter_01_F", 380000, "vehicle", "variant_blackwaspAA"],
	// ["F/A-181 Black Wasp CAS", "B_Plane_Fighter_01_F", 380000, "vehicle", "variant_blackwaspCAS"],
	// ["F/A-181 Black Wasp AA XL", "B_Plane_Fighter_01_F", 700000, "vehicle", "variant_blackwaspXL"],
	// //["F/A-181 Black Wasp CAS", "B_Plane_Fighter_01_F", 190000, "vehicle"],
	
	// ["To-201 Shikra (Gun-Only)", "O_Plane_Fighter_02_Stealth_F", 350000, "vehicle", "variant_shikraDEF"], // no missiles or bombs
	// ["To-201 Shikra AA XL", "O_Plane_Fighter_02_F", 600000, "vehicle", "variant_shikraXL"],
	// ["To-201 Shikra AA", "O_Plane_Fighter_02_F", 380000, "vehicle", "variant_shikraEX"],
	// ["To-201 Shikra CAS", "O_Plane_Fighter_02_F", 400000, "vehicle", "variant_shikraCAS"],
	// ["To-201 Shikra CAS", "O_Plane_Fighter_02_F", 200000, "vehicle"],
	
	["A-164 Wipeout CAS", "B_Plane_CAS_01_dynamicLoadout_F", 200000, "vehicle"],
	["To-199 Neophron CAS", "O_Plane_CAS_02_dynamicLoadout_F", 150000, "vehicle"],
	
	["L-39ZA", "CUP_B_L39_CZ", 130000, "vehicle"], //(Grün)
	["Boeing P-8 Poseidon (Ambient)", "CUP_B_P8Poseidon_RAAF", 125000, "vehicle"],
	
	["F-35B Lightning II CAS", "CUP_B_F35B_BAF", 160000, "vehicle", "variant_F35bCAS"], // by jared
	["F-35B Lightning II AA", "CUP_B_F35B_BAF", 175000, "vehicle", "variant_F35bAA"], // by jared
	// ["F-35B Lightning II", "CUP_B_F35B_BAF", 150000, "vehicle"],

	["Harrier GR.9", "CUP_B_GR9_DYN_GB", 120000, "vehicle"],

	["SU-25 Frogfoot", "CUP_B_Su25_Dyn_CDF", 150000, "vehicle"],
	["SU-25 Frogfoot AT", "CUP_B_Su25_Dyn_CDF", 180000, "vehicle", "variant_Su25AT"],

	["Su-34", "CUP_B_SU34_CDF", 200000, "vehicle"],
	["AC-47D Spooky", "CUP_B_AC47_Spooky_USA", 25000, "vehicle"],

	["A-10A Thunderbolt II", "CUP_B_A10_DYN_USA", 150000, "vehicle"],
	["A-10A Thunderbolt II Gun", "CUP_B_A10_DYN_USA", 100000, "vehicle", "variant_A10aGun"], // by jared
	["A-10A Thunderbolt II Warthog", "CUP_B_A10_DYN_USA", 185000, "vehicle", "variant_A10aWarthog"], // by jared

	["AV-8B Harrier II", "CUP_B_AV8B_DYN_USMC", 145000, "vehicle"],
	["AV-8B Harrier II AA", "CUP_B_AV8B_DYN_USMC", 160000, "vehicle", "variant_Av8bAA"], // by jared
	["AV-8B Harrier II AT", "CUP_B_AV8B_DYN_USMC", 175000, "vehicle", "variant_Av8bAT"], // by jared
	["AV-8B Harrier II Mk82", "CUP_B_AV8B_DYN_USMC", 145000, "vehicle", "variant_Av82MK82"], // by jared

	["C-47 Skytrain", "CUP_B_C47_USA", 20000, "vehicle"],
	["Li-2 (Chernavia)", "CUP_C_DC3_ChernAvia_CIV", 30000, "vehicle"],
	["Li-2 (Military)", "CUP_O_C47_SLA", 40000, "vehicle"],
	["MV-22B Osprey", "CUP_B_MV22_USMC", 30000, "vehicle"],
	["MV-22B Osprey (Ramp Gun)", "CUP_B_MV22_USMC_RAMPGUN", 40000, "vehicle"],
	["MV-22B Osprey (VIV)", "CUP_B_MV22_VIV_USMC", 30000, "vehicle"],
	["Antonov An-2", "CUP_C_AN2_CIV", 20000, "vehicle"],
	["Antonov An-2 (Military)", "CUP_O_AN2_TK", 30000, "vehicle"],
	["C-130J", "CUP_B_C130J_GB", 80000, "vehicle"],
	["C-130J (VIV)", "CUP_B_C130J_Cargo_GB", 80000, "vehicle"],

	["V-44 X Blackfish (Infantry)", "B_T_VTOL_01_infantry_F", 100000, "vehicle"],
 	["V-44 X Blackfish (Gunship)", "B_T_VTOL_01_armed_F", 200000, "vehicle"],

	["Y-32 Xi'an Anti Inf", "O_T_VTOL_02_infantry_dynamicLoadout_F", 200000, "vehicle", "variant_xianAntiInf"],
	["Y-32 Xi'an AG", "O_T_VTOL_02_infantry_dynamicLoadout_F", 325000, "vehicle", "variant_xianAG"],
	["Y-32 Xi'an AA", "O_T_VTOL_02_infantry_dynamicLoadout_F", 325000, "vehicle", "variant_xianEX"],
	["Y-32 Xi'an Delta", "O_T_VTOL_02_infantry_dynamicLoadout_F", 400000, "vehicle", "variant_xianDelta"]
	
	//["KH-3A Fenghuang Missile UAV", "O_T_UAV_04_CAS_F", 85000, "vehicle", "SKIPSAVE"],
	
	//["MQ4A Greyhawk Missile UAV", "B_UAV_02_dynamicLoadout_F", 200000, "vehicle", "variant_greyhawkMissile", "SKIPSAVE"],
	//["K40 Ababil-3 Missile UAV", "O_UAV_02_dynamicLoadout_F", 200000, "vehicle", "variant_greyhawkMissile", "SKIPSAVE"],
	//["K40 Ababil-3 Missile UAV", "I_UAV_02_dynamicLoadout_F", 200000, "vehicle", "variant_greyhawkMissile", "SKIPSAVE"],
	
	//["MQ4A Greyhawk Bomber UAV", "B_UAV_02_dynamicLoadout_F", 150000, "vehicle", "variant_greyhawkBomber", "SKIPSAVE"], 
	// Bomber UAVs are a lot harder to use, hence why they are cheaper than Missile ones
	//["K40 Ababil-3 Bomber UAV", "O_UAV_02_dynamicLoadout_F", 150000, "vehicle", "variant_greyhawkBomber", "SKIPSAVE"],
	//["K40 Ababil-3 Bomber UAV", "I_UAV_02_dynamicLoadout_F", 150000, "vehicle", "variant_greyhawkBomber", "SKIPSAVE"],
	
	//["MQ4A Greyhawk DAGR UAV", "B_UAV_02_dynamicLoadout_F", 220000, "vehicle", "variant_greyhawkDAGR", "SKIPSAVE"],
	//["K40 Ababil-3 DAGR UAV", "O_UAV_02_dynamicLoadout_F", 220000, "vehicle", "variant_greyhawkDAGR", "SKIPSAVE"],
	//["K40 Ababil-3 DAGR UAV", "I_UAV_02_dynamicLoadout_F", 220000, "vehicle", "variant_greyhawkDAGR", "SKIPSAVE"],

	//["MQ4A Greyhawk Cluster UAV", "B_UAV_02_dynamicLoadout_F", 175000, "vehicle", "variant_greyhawkCluster", "SKIPSAVE"],
	//["K40 Ababil-3 Cluster UAV", "O_UAV_02_dynamicLoadout_F", 175000, "vehicle", "variant_greyhawkCluster", "SKIPSAVE"],
	//["K40 Ababil-3 Cluster UAV", "I_UAV_02_dynamicLoadout_F", 175000, "vehicle", "variant_greyhawkCluster", "SKIPSAVE"],
	//["UCAV Sentinel Missile", "B_UAV_05_F", 200000, "vehicle", "variant_sentinelMissile", "SKIPSAVE"],
	//["UCAV Sentinel Bomber", "B_UAV_05_F", 150000, "vehicle", "variant_sentinelBomber", "SKIPSAVE"],
	//["UCAV Cluster Bomber", "B_UAV_05_F", 175000, "vehicle", "variant_clusterBomber", "SKIPSAVE"]

];
boatsArray = compileFinal str
[
	["Water Scooter", "C_Scooter_Transport_01_F", 3000, "boat"],
	["Rescue Boat", "C_Rubberboat", 5000, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
	["Rescue Boat (NATO)", "B_Lifeboat", 5000, "boat", "SKIPSAVE", "HIDDEN"], //
	["Rescue Boat (CSAT)", "O_Lifeboat", 5000, "boat", "SKIPSAVE", "HIDDEN"], //
	["Assault Boat (NATO)", "B_Boat_Transport_01_F", 6000, "boat", "SKIPSAVE"],
	["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 6000, "boat", "SKIPSAVE", "HIDDEN"], //
	["Assault Boat (AAF)", "I_Boat_Transport_01_F", 6000, "boat", "SKIPSAVE", "HIDDEN"], //
	["Assault Boat (FIA)", "B_G_Boat_Transport_01_F", 6000, "boat", "SKIPSAVE", "HIDDEN"], //
	
	["LCU Mk.10", "CUP_B_MK10_GB", 3000, "boat"],
	["LCU-1610", "CUP_B_LCU1600_USMC", 3000, "boat"],
	["Fishing Boat", "CUP_C_Fishing_Boat_Chernarus", 3000, "boat"],
	["LCVP", "CUP_O_LCVP_SLA", 3000, "boat"],
	
	["RHIB","I_C_Boat_Transport_02_F", 10000, "boat", "SKIPSAVE"],
	["Motorboat", "C_Boat_Civil_01_F", 10000, "boat", "SKIPSAVE"],
	["Cup RHIB", "CUP_I_RHIB_RACS", 10000, "boat", "SKIPSAVE"], //*Neu
	["Cup RHIB (Mk19)", "CUP_I_RHIB2Turret_RACS", 12000, "boat", "SKIPSAVE"], //*Neu
	["Motorboat Rescue", "C_Boat_Civil_01_rescue_F", 9000, "boat", "SKIPSAVE", "HIDDEN"], //
	["Motorboat Police", "C_Boat_Civil_01_police_F", 11000, "boat", "SKIPSAVE", "HIDDEN"], //
	["Speedboat HMG (CSAT)", "O_Boat_Armed_01_hmg_F", 25000, "boat", "SKIPSAVE"],
	["Speedboat Minigun (NATO)", "B_Boat_Armed_01_minigun_F", 30000, "boat", "SKIPSAVE"],
	["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 30000, "boat", "SKIPSAVE", "HIDDEN"], //
	["SDV Submarine (NATO)", "B_SDV_01_F", 20000, "submarine", "SKIPSAVE"],
	["SDV Submarine (CSAT)", "O_SDV_01_F", 20000, "submarine", "SKIPSAVE"],
	["SDV Submarine (AAF)", "I_SDV_01_F", 20000, "submarine", "SKIPSAVE"]
	
	// ["ANZAC Class Frigate", "CUP_B_Frigate_ANZAC", 2000000, "boat", "SKIPSAVE"], //*Neu Test
	// ["MEKO 200 Frigate", "CUP_I_Frigate_RACS", 2000000, "boat", "SKIPSAVE"] //*Neu Test
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray);

uavArray = compileFinal str
[
	// Deprecated
];

noColorVehicles = compileFinal str
[
	// Deprecated
];

rgbOnlyVehicles = compileFinal str
[
	// Deprecated
];

_color = "#(rgb,1,1,1)color";
_texDir = "client\images\vehicleTextures\";
_kartDir = "\A3\soft_f_kart\Kart_01\Data\";
_mh9Dir = "\A3\air_f\Heli_Light_01\Data\";
_mohawkDir = "\A3\air_f_beta\Heli_Transport_02\Data\";
_eh302Dir = "\A3\Air_F_Orange\Heli_Transport_02\Data\";
_BusDir = "\A3\soft_f_orange\Van_02\Data\";
_wreckDir = "\A3\structures_f\wrecks\data\";
_gorgonDir = "\A3\armor_f_gamma\APC_Wheeled_03\data\";
_mrapDir = "\A3\soft_f_exp\mrap_01\data\";
_mrapDir2 = "\A3\data_f_exp\vehicles\";

colorsArray = compileFinal str
[
	[ // Main colors
		"All",
		[
			["Black", _color + "(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
			["Gray", _color + "(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
			["White", _color + "(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(1,1,1,0.5) //0.75,0.75,0.75,1
			["Dark Blue", _color + "(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
			["Blue", _color + "(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
			["Teal", _color + "(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
			["Green", _color + "(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
			["Yellow", _color + "(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
			["Orange", _color + "(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
			["Red", _color + "(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
			["Pink", _color + "(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
			["Purple", _color + "(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
			["NATO Tan", _texDir + "nato.paa"], // #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
			["CSAT Brown", _texDir + "csat.paa"], // #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
			["AAF Green", _texDir + "aaf.paa"], // #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
			["Bloodshot", _texDir + "bloodshot.paa"],
			["Bloody", _texDir + "axbloody.paa"],
			["Blue Camo", _texDir + "axbluecamo.paa"],
			["Carbon", _texDir + "carbon.paa"],
			["Confederate", _texDir + "confederate.paa"],
			["Crazy", _texDir + "axcrazy.paa"],
			["Denim", _texDir + "denim.paa"],
			["Desert Camo", _texDir + "axdesertcamo.paa"],
			["Digital", _texDir + "digi.paa"],
			["Digital Black", _texDir + "digi_black.paa"],
			["Digital Desert", _texDir + "digi_desert.paa"],
			["Digital Woodland", _texDir + "digi_wood.paa"],
			["Doritos", _texDir + "doritos.paa"],
			["Drylands", _texDir + "drylands.paa"],
			["Error", _texDir + "axerror.paa"],
			["Extinction", _texDir + "axextinction.paa"],
			["Flower Power", _texDir + "axflowerpower.paa"],
			["Gras Camo", _texDir + "axgrascamo.paa"],
			["Green Camo", _texDir + "axgreencamo.paa"],
			["Hearty", _texDir + "axhearty.paa"],
			["Hex", _texDir + "hex.paa"],
			["Hippie", _texDir + "hippie.paa"],
			["Leopard", _texDir + "leopard.paa"],
			["Metallic", _texDir + "axrusty.paa"],
			["Murica", _texDir + "murica.paa"],
			["Orange Camo", _texDir + "camo_orange.paa"],
			["Pink Camo", _texDir + "camo_pink.paa"],
			["Pirates", _texDir + "axpirates.paa"],
			["Pride", _texDir + "pride.paa"],
			["Psych", _texDir + "psych.paa"],
			["Red Camo", _texDir + "camo_red.paa"],
			["RednGray Camo", _texDir + "axredcamo.paa"],
			["Rusty", _texDir + "rusty.paa"],
			["Sand", _texDir + "sand.paa"],
			["Snake", _texDir + "snake.paa"],
			["Stars", _texDir + "axstars.paa"],
			["Stripes", _texDir + "stripes.paa"],
			["Stripes 2", _texDir + "stripes2.paa"],
			["Stripes 3", _texDir + "stripes3.paa"],
			["Swamp", _texDir + "swamp.paa"],
			["Tiger", _texDir + "tiger.paa"],
			["Trippy", _texDir + "rainbow.paa"],
			["Union Jack", _texDir + "unionjack.paa"],
			["Urban", _texDir + "urban.paa"],
			["Weed", _texDir + "weed.paa"],
			["Weedy", _texDir + "axweed.paa"],
			["WhitenRed", _texDir + "axwhitered.paa"],
			["Woodland", _texDir + "woodland.paa"],
			["Woodland Dark", _texDir + "wooddark.paa"],
			["Woodland Tiger", _texDir + "woodtiger.paa"],
			["Dust Bundeswehr Camo", _texDir + "zero_dustbw.paa"],
			["Tropic Bundeswehr Camo", _texDir + "zero_tropicbw.paa"]
		]
	],
	[ // Kart colors
		"Kart_01_Base_F",
		[
			["Red - Kart", [[0, _kartDir + "kart_01_base_red_co.paa"]]] // no red TextureSource :(
		]
	],
	[ // MH-9 colors
		"Heli_Light_01_base_F",
		[
			["AAF Camo (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_indp_co.paa"]]],
			["Blue 'n White (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_blue_co.paa"]]],
			["Blueline (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_blueline_co.paa"]]],
			["Cream Gravy (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_co.paa"]]],
			["Digital (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_digital_co.paa"]]],
			["Elliptical (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["Furious (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_furious_co.paa"]]],
			["Graywatcher (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["ION (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_ion_co.paa"]]],
			["Jeans (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_jeans_co.paa"]]],
			["Light (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_light_co.paa"]]],
			["Shadow (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_shadow_co.paa"]]],
			["Sheriff (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["Speedy (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_speedy_co.paa"]]],
			["Sunset (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sunset_co.paa"]]],
			["Vrana (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_vrana_co.paa"]]],
			["Wasp (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wasp_co.paa"]]],
			["Wave (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wave_co.paa"]]]
		]
	],
	[ // EH302 colors
		"C_IDAP_Heli_Transport_02_F",
		[
			["IDAP (EH302)", [
				[0, _eh302Dir + "Heli_Transport_02_1_IDAP_CO.paa"],
				[1, _eh302Dir + "Heli_Transport_02_2_IDAP_CO.paa"],
				[2, _eh302Dir + "Heli_Transport_02_3_IDAP_CO.paa"],
				[3, _eh302Dir + "Heli_Transport_02_int_02_IDAP_CO.paa"]
			]]
		]
	],
	[ // Blackfoot paintjob
		"Heli_Attack_01_base_F",
		[
			["Rusty (Blackfoot)", [[0, _wreckDir + "wreck_heli_attack_01_co.paa"]]]
		]
	],
	[ // Kajman paintjobs
		"Heli_Attack_02_base_F",
		[
			["Black (Kajman)", ["Black"]],
			["Rusty (Kajman)", [
				[0, _wreckDir + "wreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "wreck_heli_attack_02_body2_co.paa"]
			]],
			["Mossy (Kajman)", [
				[0, _wreckDir + "uwreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "uwreck_heli_attack_02_body2_co.paa"]
			]]
		]
	],
	[ // Gorgon NATO color
		"APC_Wheeled_03_base_F",
		[
			["Guerilla 1 (Gorgon)", ["Guerilla_01"]],
			["Guerilla 2 (Gorgon)", ["Guerilla_02"]],
			["Guerilla 3 (Gorgon)", ["Guerilla_03"]],
			["Tan (Gorgon)", [
				[0, _gorgonDir + "apc_wheeled_03_ext_co.paa"],
				[1, _gorgonDir + "apc_wheeled_03_ext2_co.paa"],
				[2, _gorgonDir + "rcws30_co.paa"],
				[3, _gorgonDir + "apc_wheeled_03_ext_alpha_co.paa"]
			]]
		]
	],
	[ // Hatchback wreck paintjob
		"Hatchback_01_base_F",
		[
			["Rusty (Hatchback)", [[0, _wreckDir + "civilcar_extwreck_co.paa"]]]
		]
	]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200],  // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
	["Quad Bike", "quad", localize "STR_WL_ShopDescriptions_Quad", "client\icons\quad.paa", 1000, 500, "HIDDEN"],
	["Stash", "stash", localize "STR_WL_ShopDescriptions_Stash", "client\icons\stash.paa", 15000, 5000, "HIDDEN"],
	["LSD", "lsd", localize "STR_WL_ShopDescriptions_LSD", "client\items\drugs\icons\lsd.paa", 12500, 5000],
	["Marijuana", "marijuana", localize "STR_WL_ShopDescriptions_Marijuana", "client\items\drugs\icons\marijuana.paa", 10000, 4000],
	["Cocaine", "cocaine", localize "STR_WL_ShopDescriptions_Cocaine", "client\items\drugs\icons\cocaine.paa", 14000, 6500],
	["Heroin", "heroin", localize "STR_WL_ShopDescriptions_Heroin", "client\items\drugs\icons\heroin.paa", 15000, 7500],
	["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\waterbottle.paa", 30, 15],
	["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],
	["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 2000, 250],
	["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\spawnbeacon.paa", 50000, 750],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 200, 100],
	["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\syphonhose.paa", 200, 100],
	["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\energydrink.paa", 100, 50],
	["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\warchest.paa", 20000, 500, "HIDDEN"] 
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";