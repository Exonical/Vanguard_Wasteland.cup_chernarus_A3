/*
	Author: AryX (noaim)
	Description: Gear Level 7
	Version: 0.7
	Updated: 02.11.2019
	Range: 48000000 to 64000000
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
		_player addHeadgear "H_HelmetSpecO_ocamo";
		_player addVest "V_PlateCarrierSpec_rgr";
		_player addBackpack "B_Carryall_cbr";
	};
	case east: {
		_player addHeadgear "H_HelmetSpecO_ocamo";
		_player addVest "V_PlateCarrierSpec_mtp";
		_player addBackpack "B_Carryall_ocamo";
	};
	case independent: {
		if (DLC_APEX in (getDLCs 1)) then { _player addHeadgear "H_HelmetSpecO_ghex_F"; } else { _player addHeadgear "H_HelmetSpecO_ocamo"; };
		_player addVest "V_PlateCarrierSpec_rgr";
		_player addBackpack "B_Carryall_oli";
	};
};

// Handgun
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_Rook40_F";
_player addItemToUniform "16Rnd_9x21_Mag";
_player addItemToUniform "16Rnd_9x21_Mag";

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
_arma = ["LMG_Mk200_F"];
if (DLC_CONTACT in (getDLCs 1)) then { _dlc = ["arifle_RPK12_F", "LMG_Mk200_black_F"]; };
_game = _arma + _dlc;
_weaponR = selectRandom _game;

_ammoR = getArray (configFile >> "CfgWeapons" >> _weaponR >> "magazines");

_player addMagazine (_ammoR select 0);
_player addItemToVest (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addItemToBackpack (_ammoR select 0);
_player addWeapon _weaponR;
_player selectWeapon _weaponR;

// Primary Weapon Scope
if (DLC_MARKSMEN in (getDLCs 1)) then { _player addPrimaryWeaponItem "optic_AMS"; } else { _player addPrimaryWeaponItem "optic_DMS"; };