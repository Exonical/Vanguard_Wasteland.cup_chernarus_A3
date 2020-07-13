/*
	Author: AryX (noaim)
	Description: Gear Level 8
	Version: 0.7
	Updated: 02.11.2019
	Range: 64000000 to 82000000
*/

#define DLC_APEX 395180
#define DLC_LAWSOFWAR 571710 
#define DLC_JETS 601670
#define DLC_MARKSMEN 332350
#define DLC_HELICOPTERS 304380
#define DLC_KARTS 288520
#define DLC_TEST 1337
#define DLC_TANKS 798390
#define DLC_TACOPS 744950
#define DLC_CONTACT 1021790

private "_game";
private "_weaponR";
private _arma = [];
private _dlc = [];
private _dlc2 = [];

private _player = _this;

private _memberLevel = player getVariable ["memberLevel", 0];

if (_memberLevel isEqualTo 1) then {
	systemChat "Member loaded";
};

// Clothing
switch (playerSide) do {
	case west: {
		_player addHeadgear "H_HelmetLeaderO_ocamo";
		_player addVest "V_PlateCarrierSpec_rgr";
		_player addBackpack "B_Carryall_cbr";
	};
	case east: {
		_player addHeadgear "H_HelmetLeaderO_ocamo";
		_player addVest "V_PlateCarrierSpec_mtp";
		_player addBackpack "B_Carryall_ocamo";
	};
	case independent: {
		if (DLC_APEX in (getDLCs 1)) then { _player addHeadgear "H_HelmetLeaderO_ghex_F"; } else { _player addHeadgear "H_HelmetLeaderO_oucamo"; };
		// _player addVest "V_PlateCarrierSpec_rgr";
		if (DLC_CONTACT in (getDLCs 1)) then { _player addVest "V_PlateCarrierSpec_wdl"; } else { _player addVest "V_PlateCarrierSpec_rgr"; };
		_player addBackpack "B_Carryall_oli";
	};
};

// Handgun
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_Rook40_F";
_player addItemToVest "16Rnd_9x21_Mag";
_player addItemToVest "16Rnd_9x21_Mag";

// Equipment
_player addWeapon "Rangefinder";
_player addItem "ItemGPS";
_player assignItem "ItemGPS";

_player addItemToVest "FirstAidKit";
_player addItemToVest "FirstAidKit";
_player addItemToVest "FirstAidKit";
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShell";
_player addItemToVest "HandGrenade";
_player addItemToVest "HandGrenade";
_player addItemToVest "HandGrenade";
_player addItem "MineDetector";
_player addItemToBackpack "SatchelCharge_Remote_Mag";
_player addItemToBackpack "DemoCharge_Remote_Mag";

// Primary Weapon
switch (playerSide) do {
	case west: {
		_arma = ["srifle_EBR_F"];
		if (DLC_MARKSMEN in (getDLCs 1)) then { _dlc = ["srifle_DMR_03_multicam_F", "srifle_DMR_07_blk_F"]; };
		if (DLC_APEX in (getDLCs 1)) then { _dlc2 = ["arifle_SPAR_03_snd_F"]; };
	};
	case east: {
		_arma = ["srifle_EBR_F"];
		if (DLC_MARKSMEN in (getDLCs 1)) then { _dlc = ["srifle_DMR_03_multicam_F", "srifle_DMR_07_hex_F"]; };
		if (DLC_APEX in (getDLCs 1)) then { _dlc2 = ["arifle_SPAR_03_snd_F"]; };
	};
	case independent: {
		_arma = ["srifle_EBR_F"];
		if (DLC_MARKSMEN in (getDLCs 1)) then { _dlc = ["srifle_DMR_03_khaki_F", "srifle_DMR_07_ghex_F"]; };
		if (DLC_APEX in (getDLCs 1)) then { _dlc2 = ["arifle_SPAR_03_khk_F"]; };
	};
};

_game = _arma + _dlc + _dlc2;
_weaponR = selectRandom _game;

// Primary Weapon
if (_memberLevel isEqualTo 1) then {
	_player addItemToVest "SmokeShellGreen";
	if ((player getVariable ["bmoney",0] >= 70000000) && (player getVariable ["bmoney",0] < 80000000))then {
		_weaponR = selectRandom ["srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"];
	};
	if ((player getVariable ["bmoney",0] >= 80000000) && (player getVariable ["bmoney",0] < 85000000))then {
		_weaponR = selectRandom ["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"];
	};
	if (player getVariable ["bmoney",0] >= 85000000) then {
		_weaponR = selectRandom ["srifle_GM6_ghex_F", "srifle_GM6_camo_F", "srifle_GM6_F"];
	};
};

_ammoR = getArray (configFile >> "CfgWeapons" >> _weaponR >> "magazines");

_player addMagazine (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addWeapon _weaponR;
_player selectWeapon _weaponR;

// Primary Weapon Scope
if (DLC_MARKSMEN in (getDLCs 1)) then { _player addPrimaryWeaponItem "optic_AMS"; } else { _player addPrimaryWeaponItem "optic_DMS"; };