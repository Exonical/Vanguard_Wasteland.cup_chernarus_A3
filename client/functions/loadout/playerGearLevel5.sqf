/*
	Author: AryX (noaim)
	Description: Gear Level 5
	Version: 0.7
	Updated: 02.11.2019
	Range: 16000000 to 32000000
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

// Clothing
switch (playerSide) do {
	case west: {
		_player addHeadgear "H_HelmetSpecB_paint1";
		_player addVest "V_PlateCarrier2_rgr";
		_player addBackpack "B_Kitbag_tan";
	};
	case east: {
		_player addHeadgear "H_HelmetSpecB_sand";
		_player addVest "V_PlateCarrierH_CTRG";
		_player addBackpack "B_Kitbag_mcamo";
	};
	case independent: {
		_player addHeadgear "H_HelmetSpecB_snakeskin";
		_player addVest "V_PlateCarrier2_rgr";
		_player addBackpack "B_Kitbag_rgr";
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
_player addItemToUniform "SmokeShell";
_player addItemToUniform "SmokeShell";
_player addItemToVest "HandGrenade";
_player addItemToVest "HandGrenade";
_player addItem "MineDetector";
_player addItemToBackpack "DemoCharge_Remote_Mag";

// Primary Weapon
switch (playerSide) do {
	case west: {
		_arma = ["arifle_MXM_Black_F"];
		if (DLC_APEX in (getDLCs 1)) then { _dlc = ["arifle_ARX_blk_F", "arifle_MXM_khk_F"]; };
	};
	case east: {
		_arma = ["arifle_MXM_F"];
		if (DLC_APEX in (getDLCs 1)) then { _dlc = ["arifle_ARX_hex_F"]; };
	};
	case independent: {
		_arma = ["arifle_MXM_Black_F"];
		if (DLC_APEX in (getDLCs 1)) then { _dlc = ["arifle_ARX_ghex_F", "arifle_MXM_khk_F"]; };
	};
};

_game = _arma + _dlc;
_weaponR = selectRandom _game;

_ammoR = getArray (configFile >> "CfgWeapons" >> _weaponR >> "magazines");

_player addMagazine (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addItemToVest (_ammoR select 0);
_player addWeapon _weaponR;
_player selectWeapon _weaponR;

if(_weaponR in ["arifle_ARX_ghex_F", "arifle_ARX_blk_F", "arifle_ARX_hex_F"]) then {
	_player addItemToVest "10Rnd_50BW_Mag_F";
};

// Primary Weapon Scope
_player addPrimaryWeaponItem "optic_DMS";