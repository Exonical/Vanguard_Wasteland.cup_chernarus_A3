// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev, AryX

if (!isServer) exitWith {};

private ["_uPos", "_unit", "_weapon", "_ammo", "_scope"];

private _group = _this select 0;
private _pos = _this select 1;
private _nbUnits = param [2, 7, [0]];
private _radius = param [3, 10, [0]];

private _unitTypes = [
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do {
	_uPos = _pos vectorAdd ([[random _radius, random _radius, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;
	
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	
	_unit addUniform "U_O_R_Gorka_01_brown_F";
	_unit addVest "V_PlateCarrier2_rgr_noflag_F";
	_unit addBackpack "B_ViperLightHarness_hex_F";
	_unit addHeadgear "H_HelmetB_camo";
	_unit addGoggles "G_Balaclava_TI_G_blk_F";
	
	switch (true) do {
		// Rocket Launcher + Grenade Assault Rifle
		case (_i % 5 isEqualTo 0): {
			_weapon = selectRandom ["arifle_SPAR_01_GL_snd_F", "arifle_MSBS65_GL_sand_F", "arifle_MX_GL_F", "arifle_CTAR_GL_hex_F", "arifle_Mk20_GL_plain_F"];

			_ammo = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

			_unit addMagazine (_ammo select 0);
			_unit addWeapon _weapon;
			_unit addMagazine (_ammo select 0);
			
			_scope = selectRandom ["optic_Holosight", "optic_aco", "optic_ACO_grn"];
			_unit addPrimaryWeaponItem _scope;
			
			_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
			_unit addItemToBackpack "1Rnd_HE_Grenade_shell";
			_unit addItemToBackpack "1Rnd_HE_Grenade_shell";
		
			_unit selectWeapon _weapon;
			
			_unit addMagazine "Vorona_HEAT";
			_unit addWeapon "launch_O_Vorona_brown_F";
			_unit addMagazine "Vorona_HE";
			_unit addMagazine "Vorona_HE";
			_unit selectWeapon "launch_O_Vorona_brown_F";
		};
		// Sniper
		case (_i % 6 isEqualTo 0): {
			_weapon = selectRandom ["srifle_DMR_03_tan_F", "srifle_DMR_02_sniper_F", "srifle_GM6_camo_F", "srifle_DMR_05_tan_f", "srifle_DMR_07_hex_F", "srifle_EBR_F", "arifle_SPAR_03_snd_F"];

			_ammo = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

			_unit addMagazine (_ammo select 0);
			_unit addWeapon _weapon;
			_unit addMagazine (_ammo select 0);
			_unit addMagazine (_ammo select 0);
			_unit addMagazine (_ammo select 0);
			
			_scope = selectRandom ["optic_AMS_snd", "optic_KHS_tan", "optic_LRPS"];
			_unit addPrimaryWeaponItem _scope;
			
			_unit addPrimaryWeaponItem "bipod_01_F_snd";
			_unit selectWeapon _weapon;
		};
		// Machine Gun
		case (_i % 7 isEqualTo 0): {
		
			_weapon = selectRandom ["MMG_01_hex_F", "MMG_02_sand_F"];

			_ammo = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

			_unit addMagazine (_ammo select 0);
			_unit addWeapon _weapon;
			_unit addMagazine (_ammo select 0);
			
			_scope = selectRandom ["optic_ERCO_snd_F", "optic_Arco"];
			_unit addPrimaryWeaponItem _scope;
			
			_unit addPrimaryWeaponItem "bipod_01_F_snd";
			_unit selectWeapon _weapon;
			
			private _dice = selectRandom [1,2];
			if (_dice isEqualTo 1) then {
				_unit addMagazine "MRAWS_HEAT_F";
				_unit addWeapon "launch_MRAWS_sand_rail_F";
				_unit addMagazine "MRAWS_HE_F";
				_unit addMagazine "MRAWS_HE_F";
				_unit selectWeapon "launch_MRAWS_sand_rail_F";
			};
		};
		// Assault Rifle
		default {
			if (_unit isEqualTo leader _group) then {
				_weapon = selectRandom ["arifle_Katiba_C_F", "arifle_Katiba_F"];

				_ammo = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

				_unit addMagazine (_ammo select 0);
				_unit addWeapon _weapon;
				_unit addMagazine (_ammo select 0);
				_unit addMagazine (_ammo select 0);
				_unit addMagazine (_ammo select 0);
				
				_scope = selectRandom ["optic_Holosight", "optic_Arco", "optic_ERCO_snd_F"];
				_unit addPrimaryWeaponItem _scope;
				
				_unit selectWeapon _weapon;
				_unit addMagazine "HandGrenade";
				_unit setRank "SERGEANT";
			} else {
				_weapon = selectRandom ["arifle_ARX_hex_F", "arifle_MSBS65_sand_F", "arifle_MX_F", "arifle_Mk20_plain_F", "arifle_CTAR_hex_F", "arifle_AK12U_arid_F", "arifle_MXC_F"];

				_ammo = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

				_unit addMagazine (_ammo select 0);
				_unit addWeapon _weapon;
				_unit addMagazine (_ammo select 0);
				_unit addMagazine (_ammo select 0);
				_unit addMagazine (_ammo select 0);
				
				_scope = selectRandom ["optic_Holosight", "optic_Arco", "optic_ERCO_snd_F"];
				_unit addPrimaryWeaponItem _scope;
				
				_unit selectWeapon _weapon;
				_unit addMagazine "HandGrenade";
			};
		};
	};
			
	// _unit addPrimaryWeaponItem "acc_flashlight";
	_unit enableGunLights "forceOn";

	_unit addRating 1e11;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_parachute = createVehicle ["Steerable_Parachute_F",(getPosATL _unit),[],0,"CAN_COLLIDE"];
    _parachute allowDamage false;
    _unit assignAsDriver _parachute;
	_unit moveInDriver _parachute;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos, "LandVehicle"] call defendArea;