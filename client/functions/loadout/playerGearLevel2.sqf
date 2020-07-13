/*
	Author: AryX (noaim)
	Description: Gear Level 2
	Version: 0.7
	Updated: 02.11.2019
	Range: 2000000 to 4000000
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
		_player addHeadgear "H_HelmetB_light_grass";
		_player addVest "V_TacVest_oli";
		_player addBackpack "B_FieldPack_khk";
	};
	case east: {
		_player addHeadgear "H_HelmetB_light_desert";
		_player addVest "V_TacVest_brn";
		_player addBackpack "B_FieldPack_ocamo";
	};
	case independent: {
		_player addHeadgear "H_HelmetB_light_snakeskin";
		_player addVest "V_TacVest_camo";
		_player addBackpack "B_FieldPack_oli";
	};
};

// Handgun
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_Rook40_F";
_player addItemToVest "16Rnd_9x21_Mag";
_player addItemToVest "16Rnd_9x21_Mag";

// Equipment
_player addWeapon "Binoculars";
_player addItem "ItemGPS";
_player assignItem "ItemGPS";

_player addItemToVest "FirstAidKit";
_player addItemToVest "FirstAidKit";
_player addItemToUniform "SmokeShellPurple";
_player addItemToUniform "SmokeShellPurple";
_player addItemToVest "HandGrenade";
_player addItemToVest "HandGrenade";

_arma = ["arifle_Mk20C_plain_F", "arifle_Mk20_plain_F", "arifle_TRG20_F", "arifle_TRG21_F"];
if (DLC_APEX in (getDLCs 1)) then { _dlc = ["arifle_SPAR_01_snd_F", "arifle_CTAR_hex_F"]; };
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

// Primary Weapon Scope
_player addPrimaryWeaponItem "optic_Holosight";