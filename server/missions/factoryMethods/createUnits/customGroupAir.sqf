// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev
if (!isServer) exitWith {};

private "_uPos";
private "_unit";

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

	_unit addVest "V_PlateCarrier2_rgr";
	_unit addUniform "U_O_V_Soldier_Viper_F";
	_unit addBackpack "B_LegStrapBag_black_F";
	_unit addHeadgear "H_HelmetB_TI_tna_F";
	_unit addGoggles "G_Balaclava_TI_G_blk_F";
	
	switch (true) do {
		// AT every 5 units
		case (_i % 5 isEqualTo 0): {
			_unit addBackpack "B_ViperHarness_ghex_F";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addWeapon "SMG_03_hex";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addPrimaryWeaponItem "optic_Hamr";
			_unit addMagazine "Vorona_HEAT";
			_unit addWeapon "launch_O_Vorona_green_F";
			_unit addMagazine "Vorona_HE";
			_unit addMagazine "Vorona_HE";
			_unit selectWeapon "launch_O_Vorona_green_F";
		};
		// Sniper every 6 units
		case (_i % 6 isEqualTo 0): {
			_unit addMagazine "10Rnd_93x64_DMR_05_Mag";
			_unit addWeapon "srifle_DMR_05_hex_F";
			_unit addPrimaryWeaponItem "optic_DMS_ghex_F";
			_unit addMagazine "10Rnd_93x64_DMR_05_Mag";
			_unit addMagazine "10Rnd_93x64_DMR_05_Mag";
		};
		// AA every 7 units
		case (_i % 7 isEqualTo 0): {
			_unit addBackpack "B_ViperHarness_ghex_F";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addWeapon "SMG_03C_hex";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addMagazine "50Rnd_570x28_SMG_03";
			_unit addPrimaryWeaponItem "optic_Hamr";
			_unit addMagazine "MRAWS_HEAT_F";
			_unit addWeapon "launch_MRAWS_green_rail_F";
			_unit addMagazine "MRAWS_HE_F";
			_unit addMagazine "MRAWS_HE_F";
			_unit selectWeapon "launch_MRAWS_green_rail_F";
		};
		// Rifleman
		default {
			if (_unit isEqualTo leader _group) then {
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addWeapon "SMG_03_TR_hex";
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addPrimaryWeaponItem "optic_Arco_blk_F";
				_unit addPrimaryWeaponItem "muzzle_snds_570";
				_unit addMagazine "HandGrenade";
				_unit setRank "SERGEANT";
			} else {
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addWeapon "SMG_03C_TR_hex";
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addMagazine "50Rnd_570x28_SMG_03";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addPrimaryWeaponItem "muzzle_snds_570";
				_unit addMagazine "HandGrenade";
			};
		};
	};

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