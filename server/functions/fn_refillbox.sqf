// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private "_boxItems";
private "_item";
private _box = _this select 0;
private _boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearAllItemsFromBackpack _box;

switch (_boxType) do {
	// Heavy Gear
	// Launchers
	case "mission_Launchers1": {
		_boxItems = [
			["wep", ["Laserdesignator", "Laserdesignator_02", "Laserdesignator_03"], 1, 1],
			["wep", ["launch_RPG32_F", "launch_NLAW_F", "launch_RPG32_ghex_F","launch_RPG7_F"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(1,2)],
			["wep", ["launch_NLAW_F",["launch_RPG32_F", "launch_RPG32_ghex_F"],
				["launch_Titan_short_F", "launch_O_Titan_short_F", "launch_I_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_ghex_F"],
				["launch_MRAWS_green_rail_F", "launch_MRAWS_olive_rail_F", "launch_MRAWS_sand_rail_F", "launch_MRAWS_green_F", "launch_MRAWS_olive_F", "launch_MRAWS_sand_F"],
				["launch_O_Vorona_brown_F", "launch_O_Vorona_green_F"]
			], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(1,3)],
			["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "ClaymoreDirectionalMine_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", ["SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", "HandGrenade", RANDOM_BETWEEN(5,10)],
			["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(5,10)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [
				["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], // Lite
				["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], // Rig
				["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
				["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"] // GL
			], RANDOM_BETWEEN(1,4)]
		];
	};
	case "mission_Launchers2": {
		_boxItems = [
			["wep", ["SMG_03_TR_khaki", "SMG_03C_TR_khaki"], RANDOM_BETWEEN(2,4)], //Weapons
			["wep", ["launch_MRAWS_green_F", "launch_O_Vorona_green_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(3,7)], //Weapons
			["itm", ["V_PlateCarrier1_rgr", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier2_tna_F", "V_PlateCarrier1_tna_F","V_PlateCarrier1_rgr_noflag_F"], RANDOM_BETWEEN(2,5)], //Vests
			["bac", ["B_ViperLightHarness_ghex_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F"], RANDOM_BETWEEN(3,5)], //Backpack
			["itm", ["U_O_V_Soldier_Viper_F","U_O_V_Soldier_Viper_hex_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["H_HelmetB_TI_tna_F","H_PASGT_basic_olive_F"], RANDOM_BETWEEN(3,6)], //Headgear
			["mag", "30Rnd_9x21_Mag_SMG_02", RANDOM_BETWEEN(5,20)], //Ammo
			["mag", ["MRAWS_HEAT_F", "MRAWS_HE_F", "MRAWS_HEAT55_F"], RANDOM_BETWEEN(2,4)], //Ammo
			["mag", ["Vorona_HEAT", "Vorona_HE"], RANDOM_BETWEEN(2,4)] //Ammo
		];
	};
	case "mission_Launchers3": { //Umbau
		_boxItems = [
			["wep", ["arifle_AK12_GL_F", "arifle_AK12_GL_arid_F", "arifle_AK12_GL_lush_F"], RANDOM_BETWEEN(1,4)], //Weapons
			["wep", ["arifle_CTAR_GL_ghex_F", "arifle_CTAR_GL_blk_F", "arifle_CTAR_GL_hex_F"], RANDOM_BETWEEN(3,8)], //Weapons
			["wep", "arifle_Katiba_GL_F", RANDOM_BETWEEN(1,4)], //Weapons
			["wep", "arifle_MX_GL_khk_F", RANDOM_BETWEEN(1,3)], //Weapons
			["wep", "arifle_MX_GL_F", RANDOM_BETWEEN(2,4)], //Weapons
			["wep", ["launch_MRAWS_green_rail_F", "launch_MRAWS_olive_rail_F", "launch_MRAWS_sand_rail_F"], RANDOM_BETWEEN(1,3)], //Weapons
			["wep", ["launch_MRAWS_green_F", "launch_MRAWS_olive_F", "launch_MRAWS_sand_F"], RANDOM_BETWEEN(1,3)], //Weapons
			["wep", ["launch_O_Vorona_brown_F", "launch_O_Vorona_green_F"], RANDOM_BETWEEN(1,3)], //Weapons
			["itm", ["optic_ACO_grn", "optic_Aco"], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", "U_Tank_green_F", RANDOM_BETWEEN(2,4)], //Uniform
			["bac", ["B_Bergen_dgtl_F", "B_Bergen_hex_F", "B_Bergen_mcamo_F", "B_Bergen_tna_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["H_Tank_black_F", "H_Tank_eaf_F"], RANDOM_BETWEEN(2,4)], //Headgear
			["mag", "30rnd_762x39_AK12_Lush_Mag_F", RANDOM_BETWEEN(3,10)], //Ammo
			["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(7,10)], //Ammo
			["mag", ["UGL_FlareWhite_F", "UGL_FlareGreen_F"], RANDOM_BETWEEN(5,8)], //Ammo
			["mag", ["UGL_FlareRed_F", "UGL_FlareYellow_F"], RANDOM_BETWEEN(2,5)], //Ammo
			["mag", ["1Rnd_SmokeYellow_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell"], RANDOM_BETWEEN(2,5)], //Ammo
			["mag", ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell"], RANDOM_BETWEEN(2,5)], //Ammo
			["mag", "30Rnd_580x42_Mag_F", RANDOM_BETWEEN(2,8)], //Ammo
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(2,8)], //Ammo
			["mag", "30Rnd_65x39_caseless_khaki_mag", RANDOM_BETWEEN(2,4)], //Ammo
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(4,8)], //Ammo
			["mag", "3Rnd_HE_Grenade_shell", RANDOM_BETWEEN(2,4)], //Ammo
			["mag", ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], RANDOM_BETWEEN(2,4)], //Ammo
			["mag", ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell"], RANDOM_BETWEEN(2,4)], //Ammo
			["mag", ["MRAWS_HEAT_F", "MRAWS_HE_F", "MRAWS_HEAT55_F"], RANDOM_BETWEEN(2,4)], //Ammo
			["mag", ["Vorona_HEAT", "Vorona_HE"], RANDOM_BETWEEN(2,4)] //Ammo
		];
	};
	
	case "mission_Launchers4": {
		_boxItems = [
			["wep", ["srifle_DMR_07_blk_F", "arifle_MXM_Black_F"], RANDOM_BETWEEN(2,4)], //Weapons
			["wep", ["launch_MRAWS_green_F", "launch_O_Vorona_green_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(3,7)], //Weapons
			["itm", ["V_PlateCarrierSpec_blk", "V_PlateCarrier2_blk", "V_PlateCarrier1_blk"], RANDOM_BETWEEN(2,5)], //Vests
			["bac", ["B_ViperLightHarness_ghex_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F"], RANDOM_BETWEEN(3,5)], //Backpack
			["itm", ["U_O_R_Gorka_01_black_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["H_Tank_black_F", "H_PASGT_basic_black_F", "H_HelmetSpecO_blk"], RANDOM_BETWEEN(3,6)], //Headgear
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(4,8)], //Ammo
			["mag", "20Rnd_650x39_Cased_Mag_F", RANDOM_BETWEEN(2,4)], //Ammo
			["mag", ["MRAWS_HEAT_F", "MRAWS_HE_F", "MRAWS_HEAT55_F"], RANDOM_BETWEEN(2,4)], //Ammo
			["mag", ["Vorona_HEAT", "Vorona_HE"], RANDOM_BETWEEN(2,4)] //Ammo
		];
	};

	// LMGs
	case "mission_LMGs1": {
		_boxItems = [
			["wep", ["MMG_02_black_F", "MMG_02_camo_F","MMG_02_sand_F","MMG_01_hex_F","MMG_01_tan_F"], RANDOM_BETWEEN(1,3)], //Weapons
			["wep", ["arifle_RPK12_lush_F", "arifle_RPK12_arid_F", "arifle_RPK12_F"], RANDOM_BETWEEN(2,3)], //Weapons
			["wep", ["launch_O_Titan_ghex_F", "launch_RPG7_F", "launch_NLAW_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)], //Weapons
			["bac", ["B_Carryall_mcamo", "B_Kitbag_mcamo"], RANDOM_BETWEEN(2,5)], //Backpack
			["itm", ["V_PlateCarrierIAGL_dgtl", "V_TacVest_camo", "V_PlateCarrierGL_rgr"], RANDOM_BETWEEN(1,8)], //Vests
			["itm", ["bipod_01_F_blk", "bipod_02_F_hex"], RANDOM_BETWEEN(2,4)], //Bipods
			["itm", ["optic_DMS","optic_AMS","optic_KHS_blk"], RANDOM_BETWEEN(3,5)], //Scopes
			["itm", "ItemGPS", RANDOM_BETWEEN(0,1)],
			["itm", ["muzzle_snds_338_black", "muzzle_snds_338_sand", "muzzle_snds_93mmg"], RANDOM_BETWEEN(1,2)] //Silencer
		];
	};

	// Normal Weapons
	case "mission_Weapon1": {
		_boxItems = [
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,3)],
			["itm", ["optic_Aco", "optic_Arco_ghex_F", "optic_ERCO_khk_F", "optic_ERCO_snd_F", "optic_Hamr_khk_F","optic_Aco_grn", "optic_MRCO", "optic_Hamr", "optic_Arco"], RANDOM_BETWEEN(2,4)],
			["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp", "muzzle_snds_58_ghex_F", "muzzle_snds_65_TI_ghex_F", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(1,5)],
			["wep", [["MMG_02_sand_F", "MMG_02_camo_F", "MMG_02_black_F"], ["MMG_01_tan_F", "MMG_01_hex_F"]], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["wep", ["LMG_Mk200_F", "LMG_Zafir_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)],
			["wep", ["arifle_AKM_F", "arifle_AKS_F", "arifle_CTARS_hex_F", "arifle_CTAR_hex_F", "arifle_MX_F", "arifle_MXM_F", "arifle_ARX_hex_F", "arifle_SPAR_01_khk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(4,8)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,8)],
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_LRR_tna_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F", "srifle_GM6_ghex_LRPS_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(6,12)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,5)],
			["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_556x45_Stanag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(5,10)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(5,10)],
			["mag", "9Rnd_45ACP_Mag", RANDOM_BETWEEN(5,10)],
			["mag", "16Rnd_9x21_Mag", RANDOM_BETWEEN(5,10)],
			["itm", [["H_HelmetB", "H_HelmetIA"], ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], "H_HelmetLeaderO_ocamo"], RANDOM_BETWEEN(1,4)],
			["itm", [
				["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], // Lite
				["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], // Rig
				["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
				["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"] // GL
			], RANDOM_BETWEEN(1,4)]
		];
	};
	
	case "mission_Weapon2": {
		_boxItems = [
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(5,10)],
			["wep", ["launch_O_Titan_ghex_F", "launch_RPG7_F", "launch_NLAW_F"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(3,5)],
			["itm", ["V_RebreatherB", "V_PlateCarrierIAGL_dgtl", "V_TacVest_camo", "V_PlateCarrierGL_rgr"], RANDOM_BETWEEN(1,8)],
			["bac", ["B_Carryall_mcamo", "B_Kitbag_mcamo"], RANDOM_BETWEEN(1,5)],
			["itm", ["U_B_HeliPilotCoveralls", "U_B_Wetsuit", "U_B_CombatUniform_mcam_vest"], RANDOM_BETWEEN(1,4)],
			["itm", ["H_HelmetCrew_B", "H_CrewHelmetHeli_B", "H_HelmetB_plain_blk", "H_HelmetSpecB"], RANDOM_BETWEEN(1,5)]
		];
	};
	case "mission_Weapon3": {
		_boxItems = [
			["wep", ["SMG_03C_TR_camo", "SMG_03_TR_camo", "SMG_03_TR_hex", "SMG_03C_TR_hex"], RANDOM_BETWEEN(2,5)], //ADRs
			["wep", ["srifle_DMR_05_blk_F", "srifle_DMR_02_F", "LMG_03_F", "MMG_02_camo_F", "srifle_LRR_tna_F"], RANDOM_BETWEEN(3,6)], //Snipers
			["itm", ["optic_DMS", "optic_AMS", "optic_SOS", "optic_NVS"], RANDOM_BETWEEN(4,6)], //Scopes
			["itm", "muzzle_snds_570", RANDOM_BETWEEN(3,5)], //Silencer
			["itm", ["V_PlateCarrier1_rgr", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier2_tna_F", "V_PlateCarrier1_tna_F","V_PlateCarrier1_rgr_noflag_F"], RANDOM_BETWEEN(3,8)], //Vests
			["itm", ["U_O_V_Soldier_Viper_F", "U_O_V_Soldier_Viper_hex_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["H_HelmetB_TI_tna_F", "H_PASGT_basic_olive_F"], RANDOM_BETWEEN(2,5)], //Headgear
			["bac", ["B_ViperLightHarness_ghex_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F"], RANDOM_BETWEEN(2,5)], //Backpack
			["mag", "30Rnd_9x21_Mag_SMG_02", RANDOM_BETWEEN(5,10)], //Ammo
			["mag", "10Rnd_93x64_DMR_05_Mag", RANDOM_BETWEEN(2,5)], //Ammo
			["mag", "10Rnd_338_Mag", RANDOM_BETWEEN(3,5)], //Ammo
			["mag", "7Rnd_408_Mag", RANDOM_BETWEEN(3,5)], //Ammo
			["mag", "130Rnd_338_Mag", RANDOM_BETWEEN(1,2)], //Ammo
			["mag", "200Rnd_556x45_Box_F", RANDOM_BETWEEN(2,5)] //Ammo
		];
	};
	
	case "mission_Weapon_camo": {
		_boxItems = [
			["wep", ["arifle_MSBS65_UBS_camo_F", "arifle_MSBS65_Mark_camo_F", "arifle_MSBS65_GL_camo_F", "arifle_MSBS65_camo_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(4,7)], //Weapons Rifle
			["wep", ["srifle_DMR_06_camo_F", "srifle_DMR_03_woodland_F", "srifle_DMR_03_multicam_F", "srifle_DMR_02_camo_F", "srifle_LRR_camo_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(3,6)], //Weapons Sniper
			["itm", ["optic_Arco_lush_F", "optic_Arco_AK_lush_F"], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", ["V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_Bergen_dgtl_F", "B_Carryall_eaf_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", "H_HelmetB_grass", RANDOM_BETWEEN(2,4)] //Headgear
		];
	};
	case "mission_Weapon_green": {
		_boxItems = [
			["wep", ["arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_khk_F", "arifle_MSBS65_UBS_F", "arifle_MSBS65_Mark_F", "arifle_MSBS65_GL_F", "arifle_MSBS65_F", "arifle_MXC_khk_F", "arifle_MX_khk_F", "arifle_MX_GL_khk_F", "arifle_AK12U_lush_F", "arifle_AK12_GL_lush_F", "arifle_AK12_lush_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(4,7)], //Weapons Rifle
			["wep", ["arifle_SPAR_03_khk_F", "arifle_MXM_khk_F", "srifle_DMR_06_olive_F", "srifle_DMR_03_khaki_F"], RANDOM_BETWEEN(4,8), RANDOM_BETWEEN(4,7)], //Weapons Sniper
			["wep", ["arifle_SPAR_02_khk_F", "arifle_MX_SW_khk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(3,6)], //Weapons MG
			["itm", ["optic_AMS_khk", "optic_ERCO_khk_F", "optic_Holosight_khk_F", "optic_SOS_khk_F", "optic_Hamr_khk_F"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["V_PlateCarrier1_rgr", "V_PlateCarrier2_rgr", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier_Kerry"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_Carryall_oli", "B_ViperHarness_oli_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["G_AirPurifyingRespirator_02_olive_F", "G_Bandanna_oli"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["H_HelmetHBK_headset_F", "H_HelmetHBK_chops_F", "H_HelmetHBK_ear_F", "H_HelmetHBK_F"], RANDOM_BETWEEN(2,4)] //Headgear
		];
	};
	case "mission_Weapon_tropic": {
		_boxItems = [
			["wep", ["arifle_ARX_ghex_F", "arifle_CTAR_GL_ghex_F", "arifle_CTAR_ghex_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(4,7)], //Weapons Rifle
			["wep", ["srifle_LRR_tna_F", "srifle_GM6_ghex_F", "srifle_DMR_07_ghex_F"], RANDOM_BETWEEN(2,8), RANDOM_BETWEEN(4,7)], //Weapons Sniper
			["wep", ["arifle_RPK12_lush_F", "arifle_CTARS_ghex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(3,6)], //Weapons MG
			["itm", ["optic_Arco_ghex_F", "optic_DMS_ghex_F", "optic_LRPS_ghex_F"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["U_B_CombatUniform_vest_mcam_wdl_f", "U_B_CTRG_Soldier_F"], RANDOM_BETWEEN(2,4)], //Uniform Blufor
			["itm", ["U_O_T_Soldier_F", "U_B_CTRG_Soldier_F", "U_O_V_Soldier_Viper_F"], RANDOM_BETWEEN(2,4)], //Uniform Opfor
			["itm", ["U_I_E_Uniform_01_sweater_F", "U_O_T_Officer_F"], RANDOM_BETWEEN(2,4)], //Uniform Indp
			["itm", ["V_PlateCarrier2_tna_F", "V_PlateCarrier1_tna_F"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_Bergen_tna_F", "B_Carryall_ghex_F", "B_ViperHarness_ghex_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", "H_HelmetB_tna_F", RANDOM_BETWEEN(2,4)] //Headgear
		];
	};
	case "mission_Weapon_sand": {
		_boxItems = [
			["wep", ["arifle_ARX_hex_F", "arifle_SPAR_01_GL_snd_F", "arifle_SPAR_01_snd_F", "arifle_MSBS65_Mark_sand_F", "arifle_MSBS65_GL_sand_F", "arifle_MSBS65_sand_F", "arifle_MXC_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_CTAR_GL_hex_F", "arifle_CTAR_hex_F", "arifle_AK12_arid_F", "arifle_AK12_GL_arid_F", "arifle_AK12U_arid_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(4,7)], //Weapons Rifle
			["wep", ["arifle_SPAR_03_snd_F", "arifle_MXM_F", "srifle_DMR_03_tan_F", "srifle_DMR_02_sniper_F", "srifle_GM6_camo_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f", "srifle_DMR_07_hex_F", "srifle_DMR_04_Tan_F"], RANDOM_BETWEEN(2,8), RANDOM_BETWEEN(4,7)], //Weapons Sniper
			["wep", ["MMG_02_sand_F", "arifle_SPAR_02_snd_F", "arifle_RPK12_arid_F", "MMG_01_hex_F", "MMG_01_tan_F", "arifle_MX_SW_F", "LMG_Mk200_F", "arifle_CTARS_hex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(3,6)], //Weapons MG
			["itm", ["optic_AMS_snd", "optic_Arco", "optic_Arco_arid_F", "optic_Arco_AK_arid_F", "optic_ERCO_snd_F"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["optic_KHS_tan", "optic_KHS_hex", "optic_Holosight_arid_F", "optic_Holosight"], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", ["U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_worn"], RANDOM_BETWEEN(2,4)], //Uniform Blufor
			["itm", ["U_O_V_Soldier_Viper_hex_F", "U_O_OfficerUniform_ocamo"], RANDOM_BETWEEN(2,4)], //Uniform Opfor
			["itm", "U_I_C_Soldier_Para_1_F", RANDOM_BETWEEN(2,4)], //Uniform Indp
			["itm", ["V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_Bergen_hex_F", "B_Carryall_khk", "B_ViperHarness_hex_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["G_AirPurifyingRespirator_02_sand_F", "G_Bandanna_khk"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["H_HelmetB_sand", "H_HelmetB_snakeskin", "H_HelmetB_desert"], RANDOM_BETWEEN(2,4)] //Headgear
		];
	};
	
	case "mission_Assault1": {	
		_boxItems = [
			["wep", ["arifle_ARX_hex_F", "arifle_ARX_blk_F", "arifle_ARX_ghex_F", "arifle_AK12_F", "arifle_AKM_F", "arifle_AKS_F"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(3,6)], //Weapons APEX
			["wep", ["arifle_SPAR_01_blk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_khk_F", "arifle_MXC_khk_F", "arifle_MX_khk_F", "arifle_CTAR_hex_F", "arifle_CTAR_ghex_F", "arifle_CTAR_blk_F"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(3,6)], //Weapons APEX
			["wep", ["arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_MX_F", "arifle_MX_Black_F", "arifle_MXC_F", "arifle_MXC_Black_F"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(3,6)], //Weapons Arma 3
			["wep", ["arifle_MSBS65_UBS_F", "arifle_MSBS65_UBS_sand_F", "arifle_MSBS65_UBS_black_F", "arifle_MSBS65_UBS_camo_F", "arifle_AK12U_arid_F", "arifle_AK12U_lush_F","arifle_AK12_arid_F", "arifle_MSBS65_F", "arifle_MSBS65_Mark_camo_F", "arifle_MSBS65_Mark_F", "arifle_MSBS65_camo_F"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(3,6)], //Weapons CONTACT
			["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_01_F", "hgun_ACPC2_F", "hgun_Rook40_F", "hgun_Pistol_heavy_02_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(3,6)], //Handgun A3
			["wep", ["hgun_P07_F", "hgun_P07_khk_F", "hgun_Pistol_heavy_01_green_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(3,6)], //Handgun DLC
			["itm", ["optic_Arco", "optic_Hamr", "optic_Holosight"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["optic_ERCO_khk_F", "optic_ERCO_snd_F", "optic_Hamr_khk_F", "optic_Holosight_khk_F", "optic_Holosight_lush_F", "optic_Holosight_arid_F"], RANDOM_BETWEEN(1,3)], //Scopes DLC
			["itm", ["V_TacVest_camo", "V_I_G_resistanceLeader_F", "V_TacVest_blk", "V_TacVest_oli", "V_TacVest_khk", "V_TacVest_brn"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_ViperHarness_ghex_F", "B_ViperHarness_khk_F", "B_ViperHarness_oli_F", "B_ViperHarness_blk_F", "B_ViperHarness_hex_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["bac", ["B_Carryall_oucamo", "B_Carryall_oli", "B_Carryall_khk"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["G_Balaclava_oli", "G_Balaclava_blk", "G_Balaclava_TI_blk_F", "G_Balaclava_TI_tna_F"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["H_HelmetSpecB_paint2", "H_HelmetSpecB_wdl", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk", "H_HelmetSpecB_snakeskin", "H_HelmetSpecB_sand", "H_HelmetSpecB", "H_HelmetSpecB_paint1"], RANDOM_BETWEEN(2,4)] //Headgear
		];
	};
	
	// Snipers
	case "mission_Snipers1": {
		_boxItems = [
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(5,7)],
			["wep", [["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"], // MAR-10
			         ["srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"], // Mk-I
			         ["srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"], // Cyrus
			         ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F"]], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,7)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(4,7)],
			["wep", "Rangefinder", RANDOM_BETWEEN(1,4)], //Binocular
			["itm", ["optic_SOS", "optic_DMS", "optic_LRPS"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["optic_AMS", "optic_AMS_khk", "optic_AMS_snd", "optic_KHS_blk", "optic_KHS_hex", "optic_KHS_tan"], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", ["bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_02_F_blk", "bipod_02_F_hex", "bipod_02_F_tan", "bipod_03_F_blk", "bipod_03_F_oli"], RANDOM_BETWEEN(2,5)], //Bipods
			["itm", ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"], RANDOM_BETWEEN(1,3)], //Silencer
			["itm", ["muzzle_snds_338_black", "muzzle_snds_338_green", "muzzle_snds_338_sand"], RANDOM_BETWEEN(1,3)], //Silencer
			["itm", "muzzle_snds_B", RANDOM_BETWEEN(1,2)], //Silencer
			["itm", "optic_NVS", RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["V_PlateCarrier1_rgr", "V_PlateCarrier1_blk", "V_PlateCarrierIA1_dgtl"], RANDOM_BETWEEN(1,2)], //Vests
			["itm", ["V_PlateCarrier2_rgr", "V_PlateCarrier2_blk", "V_PlateCarrierIA2_dgtl"], RANDOM_BETWEEN(1,2)], //Vests
			["itm", ["V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], RANDOM_BETWEEN(1,2)], //Vests
			["itm", ["V_PlateCarrierGL_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIAGL_oli"], RANDOM_BETWEEN(1,2)], //Vests
			["itm", ["H_HelmetB", "H_HelmetIA"], RANDOM_BETWEEN(1,2)], //Headgear
			["itm", ["H_HelmetSpecB", "H_HelmetSpecO_ocamo"], RANDOM_BETWEEN(1,2)], //Headgear
			["itm", "H_HelmetLeaderO_ocamo", RANDOM_BETWEEN(1,2)] //Headgear
		];
	};
	
	case "mission_Snipers2": {
		_boxItems = [
			["wep", ["srifle_DMR_04_F", "srifle_DMR_04_Tan_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons ASP
			["wep", ["srifle_DMR_07_ghex_F", "srifle_DMR_07_blk_F", "srifle_DMR_07_hex_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons CMR
			["wep", ["srifle_GM6_ghex_F", "srifle_LRR_tna_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,4)], //Weapons
			["wep", ["srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F", "srifle_DMR_02_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,5)], //Weapons MAR
			["wep", ["srifle_DMR_03_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,5)], //Weapons MK1-Emr
			["wep", ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons Mk14
			["wep", "srifle_EBR_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons Mk18
			["itm", ["optic_KHS_old", "optic_KHS_tan", "optic_KHS_hex", "optic_KHS_blk"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["optic_LRPS", "optic_LRPS_ghex_F", "optic_LRPS_tna_F"], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", "ItemGPS", RANDOM_BETWEEN(0,1)],
			["itm", ["U_I_FullGhillie_lsh", "U_I_FullGhillie_ard", "U_O_T_FullGhillie_tna_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["bac", ["B_Carryall_oucamo", "B_Carryall_oli", "B_Carryall_khk"], RANDOM_BETWEEN(2,4)] //Backpack
		];
	};
	
	case "mission_Snipers3": {
		_boxItems = [
			["wep", ["arifle_MXM_khk_F", "arifle_MXM_F", "arifle_MXM_Black_F"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(2,5)], //Weapons MXM
			["wep", ["srifle_DMR_07_ghex_F", "srifle_DMR_07_blk_F", "srifle_DMR_07_hex_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons CMR
			["wep", ["srifle_DMR_05_tan_f", "srifle_DMR_05_hex_F", "srifle_DMR_05_blk_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons Cyrus
			["wep", ["srifle_GM6_ghex_F", "srifle_LRR_tna_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(1,2)], //Weapons
			["wep", "srifle_DMR_01_F", RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,5)], //Weapons Rahim
			["wep", "srifle_DMR_06_hunter_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,3)], //Weapons Mk14 Hunter
			["wep", ["arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F", "arifle_SPAR_03_blk_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)], //Weapons Spar
			["itm", ["optic_KHS_old", "optic_KHS_tan", "optic_KHS_hex", "optic_KHS_blk"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["optic_LRPS", "optic_LRPS_ghex_F", "optic_LRPS_tna_F"], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", "ItemGPS", RANDOM_BETWEEN(0,1)],
			["itm", ["U_I_FullGhillie_lsh", "U_I_FullGhillie_ard", "U_O_T_FullGhillie_tna_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", "U_O_R_Gorka_01_F", RANDOM_BETWEEN(1,2)], //Uniform
			["bac", ["B_Carryall_oucamo", "B_Carryall_oli", "B_Carryall_khk"], RANDOM_BETWEEN(2,4)] //Backpack
		];
	};
	// SMGs mission_Smgs1 remove
	case "mission_Snipers4": {	
		_boxItems = [
			["itm", "Medikit", RANDOM_BETWEEN(1,2)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,2)],
			["wep", ["srifle_LRR_SOS_F", "srifle_LRR_camo_SOS_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["srifle_GM6_SOS_F", "srifle_GM6_camo_SOS_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(1,2)], //Weapons
			["wep", ["srifle_EBR_DMS_pointer_snds_F", "srifle_EBR_MRCO_pointer_F", "srifle_EBR_ARCO_pointer_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,3)], //Weapons
			["wep", ["srifle_DMR_01_DMS_F", "srifle_DMR_01_SOS_F", "srifle_DMR_01_MRCO_F", "srifle_DMR_01_ACO_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)], //Weapons
			["wep", "Rangefinder", RANDOM_BETWEEN(1,3)], //Binocular
			["itm", ["optic_DMS", "optic_AMS", "optic_SOS", ""], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["U_B_CBRN_Suit_01_Tropic_F", "U_B_CBRN_Suit_01_Wdl_F", "U_I_E_CBRN_Suit_01_EAF_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["V_CarrierRigKBT_01_light_EAF_F", "V_CarrierRigKBT_01_light_Olive_F"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_Kitbag_sgg", "B_Kitbag_rgr", "B_Kitbag_cbr"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["G_Tactical_Clear", "G_Tactical_Black"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", "H_Cap_headphones", RANDOM_BETWEEN(2,4)] //Headgear
		];
	};
	
	// DLC Gear
	case "mission_DLC_marks": {	
		_boxItems = [
			["wep", ["srifle_DMR_05_tan_f", "srifle_DMR_05_hex_F", "srifle_DMR_05_blk_F"], RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F", "srifle_DMR_02_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["srifle_DMR_03_multicam_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_F", "srifle_DMR_03_woodland_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)],//Weapons
			["wep", ["MMG_01_tan_F", "MMG_01_hex_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["MMG_02_sand_F", "MMG_02_camo_F", "MMG_02_black_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,5)] //Weapons
		];
	};
	//
	case "mission_DLC_apex": {	
		_boxItems = [
			["wep", ["hgun_P07_khk_F", "hgun_Pistol_01_F"], RANDOM_BETWEEN(3,6), RANDOM_BETWEEN(2,5)], //Handgun
			["wep", "SMG_05_F", RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(2,5)], //SMG
			["wep", ["arifle_ARX_hex_F", "arifle_ARX_blk_F", "arifle_ARX_ghex_F", "arifle_SPAR_01_blk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_khk_F", "arifle_MXC_khk_F", "arifle_MX_khk_F", "arifle_CTAR_hex_F", "arifle_CTAR_ghex_F", "arifle_CTAR_blk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(4,7)], //RIFLE
			["wep", ["arifle_AK12_F", "arifle_AKM_F", "arifle_AKS_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,7)], //RIFLE
			["wep", ["arifle_SPAR_02_blk_F", "arifle_SPAR_02_snd_F", "arifle_SPAR_02_khk_F", "arifle_MX_SW_khk_F", "arifle_CTARS_hex_F", "arifle_CTARS_blk_F", "arifle_CTARS_ghex_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(4,6)], //LMG
			["wep", "LMG_03_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,4)], //HMG
			["wep", ["arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_snd_F", "arifle_SPAR_01_GL_khk_F", "arifle_MX_GL_khk_F", "arifle_AK12_GL_F", "arifle_CTAR_GL_hex_F", "arifle_CTAR_GL_blk_F", "arifle_CTAR_GL_ghex_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)], //Grenade
			["wep", ["arifle_SPAR_03_blk_F", "arifle_SPAR_03_snd_F", "arifle_SPAR_03_khk_F", "arifle_MXM_khk_F", "srifle_LRR_tna_F", "srifle_GM6_ghex_F", "srifle_DMR_07_hex_F", "srifle_DMR_07_blk_F", "srifle_DMR_07_ghex_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)], //Sniper
			["wep", "launch_RPG32_ghex_F", RANDOM_BETWEEN(1,2)], //Weapons
			["wep", "launch_RPG7_F", RANDOM_BETWEEN(0,2)], //Weapons
			["itm", ["optic_Arco_ghex_F", "optic_Arco_blk_F", "optic_DMS_ghex_F", "optic_ERCO_khk_F", "optic_ERCO_snd_F", "optic_ERCO_blk_F"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["optic_Holosight_khk_F", "optic_Holosight_blk_F", "optic_Holosight_smg_blk_F", "optic_Holosight_smg_khk_F", "optic_Hamr_khk_F", "optic_SOS_khk_F"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["U_B_CTRG_Soldier_urb_1_F", "U_B_CTRG_Soldier_urb_3_F", "U_B_CTRG_Soldier_urb_2_F", "U_B_CTRG_Soldier_F", "U_B_CTRG_Soldier_3_F", "U_B_CTRG_Soldier_2_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["U_B_T_Sniper_F", "U_O_T_Sniper_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["U_B_T_Soldier_SL_F", "U_B_T_Soldier_AR_F", "U_B_T_Soldier_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["U_B_T_FullGhillie_tna_F", "U_O_T_FullGhillie_tna_F"], RANDOM_BETWEEN(1,2)], //Uniform
			["itm", ["U_O_T_Soldier_F", "U_O_T_Officer_F"], RANDOM_BETWEEN(1,2)], //Uniform
			["itm", ["U_O_V_Soldier_Viper_F", "U_O_V_Soldier_Viper_hex_F"], RANDOM_BETWEEN(0,2)], //Uniform
			["itm", ["U_I_C_Soldier_Para_1_F", "U_I_C_Soldier_Para_3_F", "U_I_C_Soldier_Para_4_F", "U_I_C_Soldier_Para_2_F", "U_I_C_Soldier_Camo_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["V_HarnessOGL_ghex_F", "V_HarnessO_ghex_F", "V_TacChestrig_grn_F", "V_TacChestrig_cbr_F", "V_TacChestrig_oli_F", "V_BandollierB_ghex_F"], RANDOM_BETWEEN(2,4)], //Vests
			["itm", ["V_PlateCarrier2_tna_F", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierGL_tna_F", "V_PlateCarrierSpec_tna_F", "V_PlateCarrier1_rgr_noflag_F", "V_PlateCarrier1_tna_F"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_Bergen_dgtl_F", "B_Bergen_hex_F", "B_Bergen_mcamo_F", "B_Bergen_tna_F"], RANDOM_BETWEEN(1,4)], //Backpack
			["bac", "B_Carryall_ghex_F", RANDOM_BETWEEN(1,2)], //Backpack
			["bac", ["B_ViperHarness_ghex_F", "B_ViperHarness_khk_F", "B_ViperHarness_oli_F", "B_ViperHarness_blk_F", "B_ViperHarness_hex_F"], RANDOM_BETWEEN(0,1)], //Backpack
			["itm", ["G_Balaclava_TI_tna_F", "G_Balaclava_TI_G_tna_F", "G_Balaclava_TI_blk_F", "G_Balaclava_TI_G_blk_F"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["H_HelmetCrew_O_ghex_F", "H_HelmetB_tna_F", "H_HelmetB_Light_tna_F", "H_HelmetSpecO_ghex_F", "H_HelmetO_ghex_F", "H_HelmetB_TI_tna_F", "H_HelmetLeaderO_ghex_F", "H_HelmetB_Enh_tna_F"], RANDOM_BETWEEN(2,4)], //Headgear
			["mag", ["RPG32_F", "RPG32_HE_F"], RANDOM_BETWEEN(3,5)], //Ammo
			["mag", "RPG7_F", RANDOM_BETWEEN(2,4)] //Ammo
		];
	};
	
	case "mission_DLC_contact": {	
		_boxItems = [
			["wep", ["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"], RANDOM_BETWEEN(3,4), RANDOM_BETWEEN(2,5)],//Weapons
			["wep", ["arifle_MSBS65_UBS_F", "arifle_MSBS65_UBS_sand_F", "arifle_MSBS65_UBS_black_F", "arifle_MSBS65_UBS_camo_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["arifle_MSBS65_F", "arifle_MSBS65_Mark_camo_F", "arifle_MSBS65_Mark_F", "arifle_MSBS65_camo_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["arifle_AK12U_arid_F", "arifle_AK12U_lush_F","arifle_AK12_arid_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["arifle_RPK12_lush_F", "arifle_RPK12_arid_F", "arifle_RPK12_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", "hgun_Pistol_heavy_01_green_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Handgun
			["itm", ["optic_Holosight_arid_F", "optic_Holosight_lush_F", "optic_ico_01_f", "optic_ico_01_sand_f", "optic_ico_01_black_f", "optic_ico_01_camo_f", "optic_Arco_arid_F", "optic_Arco_lush_F", "optic_Arco_AK_arid_F", "optic_Arco_AK_blk_F", "optic_Arco_AK_lush_F"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["optic_DMS_weathered_Kir_F", "optic_DMS_weathered_F"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", "optic_MRD_black", RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["muzzle_snds_H", "muzzle_snds_H_khk_F", "muzzle_snds_H_snd_F", "muzzle_snds_65_TI_blk_F", "muzzle_snds_65_TI_hex_F", "muzzle_snds_65_TI_ghex_F", "muzzle_snds_B", "muzzle_snds_B_khk_F", "muzzle_snds_B_snd_F", "muzzle_snds_B_arid_F", "muzzle_snds_B_lush_F"], RANDOM_BETWEEN(2,5)], //Silencer
			["itm", ["bipod_02_F_arid", "bipod_02_F_lush"], RANDOM_BETWEEN(1,2)], //Bipods
			["itm", ["U_B_CombatUniform_mcam_wdl_f", "U_B_CombatUniform_vest_mcam_wdl_f", "U_I_E_Uniform_01_shortsleeve_F", "U_I_E_Uniform_01_officer_F", "U_I_E_Uniform_01_tanktop_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl", "V_PlateCarrierGL_wdl", "V_PlateCarrierSpec_wdl", "V_PlateCarrierIAGL_oli", "V_SmershVest_01_F", "V_SmershVest_01_radio_F", "V_CarrierRigKBT_01_heavy_EAF_F", "V_CarrierRigKBT_01_heavy_Olive_F", "V_CarrierRigKBT_01_EAF_F", "V_CarrierRigKBT_01_Olive_F", "V_CarrierRigKBT_01_light_EAF_F", "V_CarrierRigKBT_01_light_Olive_F"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_AssaultPack_wdl_F","B_FieldPack_green_F", "B_FieldPack_taiga_F", "B_Carryall_green_F", "B_Carryall_taiga_F", "B_Carryall_wdl_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["bac", ["B_SCBA_01_F","B_CombinationUnitRespirator_01_F", "B_RadioBag_01_black_F", "B_RadioBag_01_tropic_F"], RANDOM_BETWEEN(1,0)], //Backpack
			["itm", ["G_RegulatorMask_F", "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F"], RANDOM_BETWEEN(1,2)], //Goggles
			["itm", ["H_HelmetB_plain_wdl", "H_Tank_black_F", "H_Tank_eaf_F", "H_HelmetSpecB_wdl", "H_HelmetHBK_headset_F", "H_HelmetHBK_chops_F", "H_HelmetHBK_ear_F", "H_HelmetHBK_F", "H_MilCap_eaf"], RANDOM_BETWEEN(2,4)], //Headgear
			["mag", ["2Rnd_12Gauge_Slug", "2Rnd_12Gauge_Pellets"], RANDOM_BETWEEN(3,10)] //Ammo
		];
	};

	// Spezifiziertes Gear
	case "mission_Gear_Cop": {
		_boxItems = [
			["wep", ["arifle_MSBS65_Mark_black_F", "arifle_MSBS65_black_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(2,4)], //Weapons
			["wep", ["arifle_MX_Black_F", "arifle_MXC_Black_F", "arifle_MXM_Black_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(2,3)], //Weapons
			["wep", ["arifle_Katiba_F", "arifle_Katiba_C_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,3)], //Weapons
			["wep", "hgun_Pistol_heavy_01_green_F", RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(1,3)], //Handgun
			["itm", ["optic_ERCO_blk_F", "optic_Arco_blk_F", "optic_Holosight_blk_F"], RANDOM_BETWEEN(3,8)], //Scopes
			["itm", "optic_MRD_black", RANDOM_BETWEEN(2,5)], //Scopes
			["itm", "muzzle_snds_H", RANDOM_BETWEEN(3,5)], //Silencer
			["itm", ["U_B_GEN_Commander_F", "U_B_GEN_Soldier_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["V_TacVest_blk_POLICE", "V_TacVest_gen_F"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_LegStrapBag_black_F", "B_Messenger_Black_F", "B_ViperLightHarness_blk_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["G_AirPurifyingRespirator_01_F", "G_RegulatorMask_F"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["H_PASGT_basic_blue_F"], RANDOM_BETWEEN(3,5)], //Headgear
			["itm", ["H_Bandanna_blu", "H_Beret_EAF_01_F", "H_Watchcap_blk", "H_MilCap_gen_F", "H_MilCap_blue", "H_Cap_police"], RANDOM_BETWEEN(2,4)] //Headgear kein Schutz
		];
	};
	case "mission_Gear_Ammo": {
		_boxItems = [
			["mag", "50Rnd_570x28_SMG_03", RANDOM_BETWEEN(3,10)], //Ammo
			["mag", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F", "30rnd_762x39_AK12_Arid_Mag_F", "30rnd_762x39_AK12_Arid_Mag_Tracer_F"], RANDOM_BETWEEN(5,10)], //Ammo
			["mag", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F", "75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_Tracer_F", "75rnd_762x39_AK12_Arid_Mag_F", "75rnd_762x39_AK12_Arid_Mag_Tracer_F"], RANDOM_BETWEEN(5,10)], //Ammo
			["mag", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_F", "30Rnd_762x39_Mag_Tracer_Green_F"], RANDOM_BETWEEN(5,10)], //Ammo AKM
			["mag", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], RANDOM_BETWEEN(4,8)], //Ammo RPK
			["mag", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_F", "30Rnd_545x39_Mag_Tracer_Green_F"], RANDOM_BETWEEN(5,10)], //Ammo AKS
			["mag", ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F", "100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F", "100Rnd_580x42_hex_Mag_F", "100Rnd_580x42_hex_Mag_Tracer_F"], RANDOM_BETWEEN(4,8)], //Ammo CARS MG
			["mag", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], RANDOM_BETWEEN(5,10)], //Ammo CAR
			["mag", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], RANDOM_BETWEEN(5,10)], //Katiba, Typ 115
			["mag", ["2Rnd_12Gauge_Slug", "2Rnd_12Gauge_Pellets"], RANDOM_BETWEEN(5,10)], //Ammo Kozlice Shotgun
			["mag", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_F", "200Rnd_556x45_Box_Tracer_Red_F"], RANDOM_BETWEEN(4,8)], //Ammo Lim
			["mag", ["20Rnd_762x51_Mag", "10Rnd_Mk14_762x51_Mag"], RANDOM_BETWEEN(5,10)], //Ammo MK1-Emr, 
			["mag", ["30Rnd_556x45_Stanag_Sand_Tracer_Yellow", "30Rnd_556x45_Stanag_Sand_Tracer_Green", "30Rnd_556x45_Stanag_Sand_Tracer_Red", "30Rnd_556x45_Stanag_Sand_red", "30Rnd_556x45_Stanag_Sand_green", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow", "30Rnd_556x45_Stanag_Tracer_Green"], RANDOM_BETWEEN(5,10)], //Ammo TRG/Mk20
			["mag", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], RANDOM_BETWEEN(4,8)], //Ammo Mk200
			["mag", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_black_mag_Tracer", "30Rnd_65x39_caseless_khaki_mag_Tracer", "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_khaki_mag"], RANDOM_BETWEEN(5,10)], //Ammo MX-Series
			["mag", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_black_mag_tracer", "100Rnd_65x39_caseless_khaki_mag_tracer", "100Rnd_65x39_caseless_mag_Tracer", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_khaki_mag"], RANDOM_BETWEEN(4,8)], //Ammo MX SW
			["mag", ["30Rnd_9x21_Mag", "30Rnd_9x21_Red_Mag", "30Rnd_9x21_Yellow_Mag", "30Rnd_9x21_Green_Mag"], RANDOM_BETWEEN(5,10)], //Ammo PDW, Protector, Sting
			["mag", ["30Rnd_65x39_caseless_msbs_mag_Tracer", "30Rnd_65x39_caseless_msbs_mag"], RANDOM_BETWEEN(5,10)], //Ammo Promet
			["mag", ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"], RANDOM_BETWEEN(5,10)], //Ammo Promet SG
			["mag", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F", "150Rnd_556x45_Drum_Green_Mag_F", "150Rnd_556x45_Drum_Green_Mag_Tracer_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], RANDOM_BETWEEN(4,8)], //Ammo SPARS
			["mag", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", "30Rnd_45ACP_Mag_SMG_01_Tracer_Red", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], RANDOM_BETWEEN(5,10)], //Ammo
			["mag", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], RANDOM_BETWEEN(4,8)], //Ammo
			["mag", "10Rnd_127x54_Mag", RANDOM_BETWEEN(2,4)], //Ammo ASP
			["mag", "20Rnd_650x39_Cased_Mag_F", RANDOM_BETWEEN(2,6)], //Ammo CMR
			["mag", "10Rnd_93x64_DMR_05_Mag", RANDOM_BETWEEN(2,6)], //Ammo Cyrus
			["mag", "5Rnd_127x108_Mag", RANDOM_BETWEEN(2,6)], //Ammo Lynx
			["mag", "7Rnd_408_Mag", RANDOM_BETWEEN(2,6)], //Ammo LRR
			["mag", "10Rnd_338_Mag", RANDOM_BETWEEN(2,6)], //Ammo MAR-10
			["mag", "150Rnd_93x64_Mag", RANDOM_BETWEEN(2,6)], //Ammo Navid
			["mag", "10Rnd_762x54_Mag", RANDOM_BETWEEN(2,6)], //Ammo Rahim
			["mag", "20Rnd_556x45_UW_mag", RANDOM_BETWEEN(2,6)], //Ammo SDAR
			["mag", "130Rnd_338_Mag", RANDOM_BETWEEN(2,6)], //Ammo SPMG
			["mag", "10Rnd_50BW_Mag_F", RANDOM_BETWEEN(2,6)] //Ammo Typ 115
		];
	};

	case "mission_Gear_Diving": {
		_boxItems = [
			["itm", "V_RebreatherB", RANDOM_BETWEEN(2,4)],
			["itm", "V_RebreatherIR", RANDOM_BETWEEN(2,4)],
			["itm", "V_RebreatherIA", RANDOM_BETWEEN(2,4)],
			["itm", "U_B_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "U_O_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "U_I_Wetsuit", RANDOM_BETWEEN(2,4)],
			["itm", "G_Diving", RANDOM_BETWEEN(4,7)],
			["bac", "B_LegStrapBag_black_F", RANDOM_BETWEEN(3,4)],
			["wep", "arifle_SDAR_F", RANDOM_BETWEEN(3,7), RANDOM_BETWEEN(5,10)],
			["itm", ["Chemlight_red", "Chemlight_green", "Chemlight_yellow", "Chemlight_blue"], RANDOM_BETWEEN(6,9)]
		];
	};
	case "mission_Gear_BlackBox": {
		_boxItems = [
			["wep", ["arifle_AK12_F", "arifle_AK12_GL_F", "arifle_AK12U_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["arifle_MSBS65_black_F", "arifle_MSBS65_Mark_F", "arifle_MSBS65_GL_black_F"], RANDOM_BETWEEN(3,8), RANDOM_BETWEEN(2,4)], //Weapons
			["wep", "arifle_CTARS_blk_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)], //Weapons
			["wep", "arifle_SPAR_02_blk_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(1,3)], //Weapons
			["wep", "arifle_ARX_blk_F", RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(2,4)], //Weapons
			["wep", "srifle_DMR_02_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,4)], //Weapons
			["wep", "hgun_Pistol_heavy_01_green_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Handgun
			["itm", ["optic_SOS", "optic_DMS", "optic_LRPS", "optic_AMS", "optic_KHS_blk"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["optic_MRCO", "optic_ERCO_blk_F", "optic_Arco_blk_F", "optic_Arco_AK_blk_F", "optic_Holosight_blk_F"], RANDOM_BETWEEN(3,7)], //Scopes
			["itm", "optic_MRD_black", RANDOM_BETWEEN(1,3)], //Scopes
			["itm", ["muzzle_snds_B", "muzzle_snds_58_blk_F", "muzzle_snds_M", "muzzle_snds_65_TI_blk_F"], RANDOM_BETWEEN(1,3)], //Silencer
			["itm", "muzzle_snds_338_black", RANDOM_BETWEEN(1,4)], //Silencer
			["itm", "bipod_01_F_blk", RANDOM_BETWEEN(1,4)], //Bipods
			["itm", "U_O_R_Gorka_01_black_F", RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["V_Chestrig_blk", "V_Pocketed_black_F", "V_BandollierB_blk"], RANDOM_BETWEEN(4,8)], //Vests kein Schutz
			["itm", ["V_PlateCarrier1_blk", "V_TacVestIR_blk", "V_TacVest_blk", "V_PlateCarrier2_blk"], RANDOM_BETWEEN(3,6)], //Vests Schutz
			["bac", ["B_ViperHarness_blk_F", "B_ViperLightHarness_blk_F", "B_FieldPack_blk", "B_Messenger_Black_F"], RANDOM_BETWEEN(2,4)], //Backpack //B_RadioBag_01_black_F
			["itm", ["G_AirPurifyingRespirator_02_black_F", "G_Bandanna_beast", "G_Balaclava_blk", "G_Balaclava_TI_blk_F"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["H_Bandanna_gry", "H_Beret_blk", "H_Watchcap_blk"], RANDOM_BETWEEN(2,4)], //Headgear kein Schutz
			["itm", ["H_PASGT_basic_black_F", "H_Tank_black_F", "H_Tank_eaf_F", "H_HelmetSpecO_blk"], RANDOM_BETWEEN(2,4)], //Headgear Schutz
			["itm", "Medikit", RANDOM_BETWEEN(1,4)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,4)]
		];
	};
	
	case "mission_Gear_Biohazard": {	
		_boxItems = [
			["itm", ["U_C_CBRN_Suit_01_Blue_F", "U_C_CBRN_Suit_01_White_F"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["V_DeckCrew_white_F", "V_DeckCrew_blue_F"], RANDOM_BETWEEN(2,4)], //Vests
			["itm", ["V_EOD_IDAP_blue_F", "V_EOD_blue_F"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", "B_SCBA_01_F", RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["G_RegulatorMask_F", "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["G_EyeProtectors_F", "G_EyeProtectors_Earpiece_F"], RANDOM_BETWEEN(2,4)] //Goggles
		];
	};
	case "mission_Gear_Night": {	
		_boxItems = [
			["itm", ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"], RANDOM_BETWEEN(2,5)], //NV Goggles
			["itm", "NVGoggles_tna_F", RANDOM_BETWEEN(2,3)], //NV Goggles
			["itm", ["O_NVGoggles_hex_F", "O_NVGoggles_ghex_F", "O_NVGoggles_urb_F", "O_NVGoggles_grn_F"], RANDOM_BETWEEN(2,4)], //NVG Compact
			["itm", "O_NVGoggles_grn_F", RANDOM_BETWEEN(2,4)],  //NVG Compact
			["itm", "optic_NVS", RANDOM_BETWEEN(4,8)] //NVS Scope
		];
	};
	
	case "mission_Gear_Hunter": {
		_boxItems = [
			["wep", ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F"], RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["srifle_DMR_06_hunter_F"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", ["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Weapons
			["wep", "hgun_Pistol_heavy_01_F", RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Handgun
			["itm", ["optic_DMS_weathered_F", "optic_DMS", "optic_DMS_ghex_F", "optic_DMS_weathered_Kir_F"], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["optic_AMS_khk", "optic_AMS_snd", "optic_AMS"], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", "optic_MRD", RANDOM_BETWEEN(2,4)], //Ammo
			["itm", ["U_BG_Guerilla3_1", "U_C_HunterBody_grn"], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["V_BandollierB_cbr", "V_BandollierB_khk", "V_Pocketed_coyote_F", "V_Rangemaster_belt"], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["B_Messenger_Coyote_F", "B_Kitbag_tan", "B_LegStrapBag_coyote_F"], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["G_Bandanna_khk", "G_Bandanna_tan"], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["H_Hat_Safari_sand_F", "H_Hat_Safari_olive_F"], RANDOM_BETWEEN(2,4)], //Headgear
			["mag", "2Rnd_12Gauge_Slug", RANDOM_BETWEEN(2,6)] //Ammo
		];
	};
	case "mission_Gear_RandomXL": {	
		_boxItems = [
			["wep", ["hgun_Pistol_heavy_01_green_F", "hgun_Pistol_heavy_02_F", "hgun_ACPC2_F", "hgun_P07_F", "hgun_Rook40_F", "hgun_Pistol_01_F"], RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(2,5)], //Weapons PISTOLE
			["wep", ["SMG_01_F", "SMG_02_F", "SMG_05_F", "hgun_PDW2000_F", "SMG_03C_TR_black", "SMG_03_TR_black"], RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(2,5)], //Weapons SMG
			["wep", ["arifle_SPAR_01_blk_F", "arifle_MSBS65_Mark_black_F", "arifle_MSBS65_black_F", "arifle_MXC_Black_F", "arifle_MX_Black_F", "arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_CTAR_blk_F", "arifle_AK12U_F", "arifle_AK12_F", "arifle_AKS_F", "arifle_AKM_F"], RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(2,6)], //Weapons RIFLE
			["wep", ["arifle_ARX_blk_F", "arifle_SPAR_01_GL_blk_F", "arifle_MSBS65_GL_black_F", "arifle_MX_GL_Black_F", "arifle_Katiba_GL_F", "arifle_CTAR_GL_blk_F", "arifle_AK12_GL_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Weapons RIFLE GL
			["wep", ["arifle_SPAR_02_blk_F", "arifle_MX_SW_Black_F", "arifle_CTARS_blk_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Weapons Mini MG
			["wep", ["LMG_Zafir_F", "MMG_02_black_F", "arifle_RPK12_F", "MMG_01_hex_F", "LMG_Mk200_black_F", "LMG_03_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)], //Weapons Heavy MG
			["wep", ["arifle_SPAR_03_blk_F", "srifle_DMR_01_F", "arifle_MXM_Black_F", "srifle_EBR_F", "srifle_DMR_06_hunter_F", "srifle_DMR_03_F", "srifle_DMR_02_F", "srifle_LRR_F", "srifle_GM6_F", "srifle_DMR_05_blk_F", "srifle_DMR_07_blk_F", "srifle_DMR_04_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,6)], //Weapons Sniper
			["wep", ["launch_I_Titan_short_F", "launch_B_Titan_olive_F", "launch_O_Vorona_green_F", "launch_MRAWS_green_rail_F", "launch_MRAWS_green_F", "launch_RPG7_F", "launch_RPG32_green_F", "launch_NLAW_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(2,5)], //Weapons Launcher
			["itm", ["optic_Aco", "optic_Arco_blk_F", "optic_ERCO_blk_F", "optic_Holosight_blk_F", "optic_Hamr", "optic_MRCO"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["optic_AMS", "optic_DMS", "optic_LRPS", "optic_SOS"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["U_B_T_Soldier_SL_F", "U_B_CombatUniform_mcam_wdl_f", "U_B_T_Soldier_AR_F", "U_B_T_Soldier_F", "U_B_CTRG_Soldier_2_F", "U_B_CTRG_Soldier_F", "U_B_CTRG_Soldier_urb_1_F", "U_B_CTRG_3", "U_B_CBRN_Suit_01_Wdl_F", "U_B_CBRN_Suit_01_Tropic_F", "U_B_CombatUniform_vest_mcam_wdl_f", "U_B_CBRN_Suit_01_MTP_F"], RANDOM_BETWEEN(2,3)], //Uniform
			["itm", ["U_O_T_Soldier_F", "U_O_V_Soldier_Viper_hex_F", "U_O_V_Soldier_Viper_F", "U_O_SpecopsUniform_ocamo", "U_O_T_Officer_F", "U_O_OfficerUniform_ocamo", "U_O_CombatUniform_oucamo", "U_O_CombatUniform_ocamo", "U_O_officer_noInsignia_hex_F", "U_O_R_Gorka_01_camo_F", "U_O_R_Gorka_01_brown_F", "U_O_R_Gorka_01_F"], RANDOM_BETWEEN(2,3)], //Uniform
			["itm", ["U_I_C_Soldier_Camo_F", "U_I_L_Uniform_01_tshirt_olive_F", "U_I_C_Soldier_Para_1_F", "U_I_C_Soldier_Para_3_F", "U_I_C_Soldier_Para_4_F", "U_I_C_Soldier_Para_2_F", "U_I_E_Uniform_01_F", "U_I_E_Uniform_01_sweater_F", "U_I_E_Uniform_01_officer_F", "U_I_E_Uniform_01_tanktop_F", "U_I_E_Uniform_01_shortsleeve_F", "U_I_L_Uniform_01_deserter_F", "U_I_L_Uniform_01_camo_F", "U_I_E_CBRN_Suit_01_EAF_F"], RANDOM_BETWEEN(2,3)], //Uniform
			["itm", ["V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG", "V_PlateCarrier2_tna_F", "V_PlateCarrier1_tna_F", "V_PlateCarrier1_rgr", "V_PlateCarrier2_rgr", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier_Kerry", "V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl"], RANDOM_BETWEEN(2,3)], //Vests
			["bac", ["B_Bergen_dgtl_F", "B_Carryall_eaf_F", "B_Carryall_oli", "B_ViperHarness_oli_F", "B_Bergen_hex_F", "B_Carryall_khk", "B_ViperHarness_hex_F", "B_Bergen_tna_F", "B_Carryall_ghex_F", "B_ViperHarness_ghex_F"], RANDOM_BETWEEN(2,3)], //Backpack
			["itm", ["G_RegulatorMask_F", "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F"], RANDOM_BETWEEN(2,3)], //Goggles
			["itm", ["H_HelmetB_grass", "H_HelmetB_sand", "H_HelmetB_snakeskin", "H_HelmetB_desert", "H_HelmetB_tna_F", "H_HelmetHBK_headset_F", "H_HelmetHBK_chops_F", "H_HelmetHBK_ear_F", "H_HelmetHBK_F"], RANDOM_BETWEEN(2,3)] //Headgear
		];
	};
	case "mission_Gear_RandomXS": {	
		_boxItems = [
			["wep", ["hgun_Pistol_heavy_01_green_F", "hgun_Pistol_heavy_02_F", "hgun_ACPC2_F", "hgun_P07_F", "hgun_Rook40_F", "hgun_Pistol_01_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons PISTOLE
			["wep", ["SMG_01_F", "SMG_02_F", "SMG_05_F", "hgun_PDW2000_F", "SMG_03C_TR_black", "SMG_03_TR_black"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons SMG
			["wep", ["arifle_SPAR_01_blk_F", "arifle_MSBS65_Mark_black_F", "arifle_MSBS65_black_F", "arifle_MXC_Black_F", "arifle_MX_Black_F", "arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_CTAR_blk_F", "arifle_AK12U_F", "arifle_AK12_F", "arifle_AKS_F", "arifle_AKM_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,6)], //Weapons RIFLE
			["wep", ["arifle_ARX_blk_F", "arifle_SPAR_01_GL_blk_F", "arifle_MSBS65_GL_black_F", "arifle_MX_GL_Black_F", "arifle_Katiba_GL_F", "arifle_CTAR_GL_blk_F", "arifle_AK12_GL_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,5)], //Weapons RIFLE GL
			["wep", ["arifle_SPAR_02_blk_F", "arifle_MX_SW_Black_F", "arifle_CTARS_blk_F"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(2,5)], //Weapons Mini MG
			["wep", ["LMG_Zafir_F", "MMG_02_black_F", "arifle_RPK12_F", "MMG_01_hex_F", "LMG_Mk200_black_F", "LMG_03_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,4)], //Weapons Heavy MG
			["wep", ["arifle_SPAR_03_blk_F", "srifle_DMR_01_F", "arifle_MXM_Black_F", "srifle_EBR_F", "srifle_DMR_06_hunter_F", "srifle_DMR_03_F", "srifle_DMR_02_F", "srifle_LRR_F", "srifle_GM6_F", "srifle_DMR_05_blk_F", "srifle_DMR_07_blk_F", "srifle_DMR_04_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,6)], //Weapons Sniper
			["wep", ["launch_I_Titan_short_F", "launch_B_Titan_olive_F", "launch_O_Vorona_green_F", "launch_MRAWS_green_rail_F", "launch_MRAWS_green_F", "launch_RPG7_F", "launch_RPG32_green_F", "launch_NLAW_F"], RANDOM_BETWEEN(0,1), RANDOM_BETWEEN(2,5)], //Weapons Launcher
			["itm", ["optic_Aco", "optic_Arco_blk_F", "optic_ERCO_blk_F", "optic_Holosight_blk_F", "optic_Hamr", "optic_MRCO"], RANDOM_BETWEEN(2,4)], //Scopes
			["itm", ["optic_AMS", "optic_DMS", "optic_LRPS", "optic_SOS"], RANDOM_BETWEEN(2,3)], //Scopes
			["itm", ["U_B_T_Soldier_SL_F", "U_B_CombatUniform_mcam_wdl_f", "U_B_T_Soldier_AR_F", "U_B_T_Soldier_F", "U_B_CTRG_Soldier_2_F", "U_B_CTRG_Soldier_F", "U_B_CTRG_Soldier_urb_1_F", "U_B_CTRG_3", "U_B_CBRN_Suit_01_Wdl_F", "U_B_CBRN_Suit_01_Tropic_F", "U_B_CombatUniform_vest_mcam_wdl_f", "U_B_CBRN_Suit_01_MTP_F"], RANDOM_BETWEEN(2,3)], //Uniform
			["itm", ["U_O_T_Soldier_F", "U_O_V_Soldier_Viper_hex_F", "U_O_V_Soldier_Viper_F", "U_O_SpecopsUniform_ocamo", "U_O_T_Officer_F", "U_O_OfficerUniform_ocamo", "U_O_CombatUniform_oucamo", "U_O_CombatUniform_ocamo", "U_O_officer_noInsignia_hex_F", "U_O_R_Gorka_01_camo_F", "U_O_R_Gorka_01_brown_F", "U_O_R_Gorka_01_F"], RANDOM_BETWEEN(2,3)], //Uniform
			["itm", ["U_I_C_Soldier_Camo_F", "U_I_L_Uniform_01_tshirt_olive_F", "U_I_C_Soldier_Para_1_F", "U_I_C_Soldier_Para_3_F", "U_I_C_Soldier_Para_4_F", "U_I_C_Soldier_Para_2_F", "U_I_E_Uniform_01_F", "U_I_E_Uniform_01_sweater_F", "U_I_E_Uniform_01_officer_F", "U_I_E_Uniform_01_tanktop_F", "U_I_E_Uniform_01_shortsleeve_F", "U_I_L_Uniform_01_deserter_F", "U_I_L_Uniform_01_camo_F", "U_I_E_CBRN_Suit_01_EAF_F"], RANDOM_BETWEEN(2,3)], //Uniform
			["itm", ["V_PlateCarrierL_CTRG", "V_PlateCarrierH_CTRG", "V_PlateCarrier2_tna_F", "V_PlateCarrier1_tna_F", "V_PlateCarrier1_rgr", "V_PlateCarrier2_rgr", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier_Kerry", "V_PlateCarrier1_wdl", "V_PlateCarrier2_wdl"], RANDOM_BETWEEN(2,3)], //Vests
			["bac", ["B_Bergen_dgtl_F", "B_Carryall_eaf_F", "B_Carryall_oli", "B_ViperHarness_oli_F", "B_Bergen_hex_F", "B_Carryall_khk", "B_ViperHarness_hex_F", "B_Bergen_tna_F", "B_Carryall_ghex_F", "B_ViperHarness_ghex_F"], RANDOM_BETWEEN(2,3)], //Backpack
			["itm", ["G_RegulatorMask_F", "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F"], RANDOM_BETWEEN(2,3)], //Goggles
			["itm", ["H_HelmetB_grass", "H_HelmetB_sand", "H_HelmetB_snakeskin", "H_HelmetB_desert", "H_HelmetB_tna_F", "H_HelmetHBK_headset_F", "H_HelmetHBK_chops_F", "H_HelmetHBK_ear_F", "H_HelmetHBK_F"], RANDOM_BETWEEN(2,3)] //Headgear
		];
	};
	/*case "mission_Vorlage": {	
		_boxItems = [
			["wep", ["", ""], RANDOM_BETWEEN(3,8)], //Weapons
			["wep", ["", ""], RANDOM_BETWEEN(3,8)], //Weapons
			["wep", [""], RANDOM_BETWEEN(1,4)], //Weapons
			["wep", ["", ""], RANDOM_BETWEEN(2,4)], //Weapons
			["wep", "", RANDOM_BETWEEN(2,4)], //Handgun
			["itm", ["", "", "", ""], RANDOM_BETWEEN(2,5)], //Scopes
			["itm", ["", "", ""], RANDOM_BETWEEN(1,3)], //Scopes
			["itm", "", RANDOM_BETWEEN(2,4)] //Ammo
			["itm", ["", ""], RANDOM_BETWEEN(2,4)], //Uniform
			["itm", ["", "", "", ""], RANDOM_BETWEEN(2,4)], //Vests
			["bac", ["", "", ""], RANDOM_BETWEEN(2,4)], //Backpack
			["itm", ["", ""], RANDOM_BETWEEN(2,4)], //Goggles
			["itm", ["", ""], RANDOM_BETWEEN(2,4)], //Headgear
			["mag", "", RANDOM_BETWEEN(3,10)], //Ammo
			["mag", "", RANDOM_BETWEEN(5,10)], //Ammo
			["mag", "", RANDOM_BETWEEN(5,8)], //Ammo
			["mag", "", RANDOM_BETWEEN(2,6)], //Ammo
			["mag", "", RANDOM_BETWEEN(2,6)] //Ammo
		];
	};*/
};

[_box, _boxItems] call processItems;
