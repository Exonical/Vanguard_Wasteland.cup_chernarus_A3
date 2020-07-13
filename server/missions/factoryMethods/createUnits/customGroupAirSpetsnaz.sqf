// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev, AryX
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
	
	_unit addGoggles "G_Balaclava_TI_G_blk_F";
	
	switch (true) do {
		// AT every 5 units
		case (_i % 5 isEqualTo 0): {
			_unit addUniform "U_I_E_Uniform_01_F";
			_unit addVest "V_CarrierRigKBT_01_light_EAF_F";
			_unit addBackpack "B_Carryall_wdl_F";
			_unit addHeadgear "H_HelmetHBK_ear_F";
			_unit addMagazine "30Rnd_65x39_caseless_msbs_mag";
			_unit addWeapon "arifle_MSBS65_F";
			_unit addPrimaryWeaponItem "optic_ico_01_f";
			_unit addMagazine "30Rnd_65x39_caseless_msbs_mag";
			_unit addMagazine "30Rnd_65x39_caseless_msbs_mag";
			_unit addWeapon "launch_I_Titan_short_F";
			_unit addSecondaryWeaponItem "Titan_AT";
			_unit addItemToBackpack "Titan_AT";
			_unit addItemToBackpack "Titan_AT";
		};
		// Sniper every 6 units
		case (_i % 6 isEqualTo 0): {
			_unit addUniform "U_I_E_Uniform_01_F";
			_unit addVest "V_CarrierRigKBT_01_Olive_F";
			_unit addBackpack "B_TacticalPack_oli";
			_unit addHeadgear "H_HelmetHBK_F";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addWeapon "srifle_DMR_06_olive_F";
			_unit addPrimaryWeaponItem "optic_DMS";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
		};
		// AA every 7 units
		case (_i % 7 isEqualTo 0): {
			_unit addUniform "U_I_E_Uniform_01_F";
			_unit addVest "V_CarrierRigKBT_01_light_EAF_F";
			_unit addBackpack "B_Carryall_wdl_F";
			_unit addHeadgear "H_HelmetHBK_ear_F";
			_unit addMagazine "30Rnd_65x39_caseless_msbs_mag";
			_unit addWeapon "arifle_MSBS65_F";
			_unit addPrimaryWeaponItem "optic_ico_01_f";
			_unit addMagazine "30Rnd_65x39_caseless_msbs_mag";
			_unit addMagazine "30Rnd_65x39_caseless_msbs_mag";
			_unit addWeapon "launch_I_Titan_eaf_F";
			_unit addSecondaryWeaponItem "Titan_AA";
			_unit addItemToBackpack "Titan_AA";
			_unit addItemToBackpack "Titan_AA";
		};
		// Rifleman
		default {
			if (_unit isEqualTo leader _group) then {
				_unit addUniform "U_I_E_Uniform_01_officer_F";
				_unit addVest "V_SmershVest_01_F";
				_unit addHeadgear "H_HelmetHBK_ear_F";
				_unit addMagazine "75rnd_762x39_AK12_Lush_Mag_F";
				_unit addWeapon "arifle_RPK12_lush_F";
				_unit addPrimaryWeaponItem "optic_Arco_lush_F";
				_unit addMagazine "75rnd_762x39_AK12_Lush_Mag_F";
				_unit addMagazine "75rnd_762x39_AK12_Lush_Mag_F";
				_unit addMagazine "HandGrenade";
				_unit setRank "SERGEANT";
			} else {
				_unit forceAddUniform "U_I_E_Uniform_01_tanktop_F";
				_unit addVest "V_SmershVest_01_F";
				_unit addHeadgear "H_HelmetHBK_ear_F";
				_unit addMagazine "75rnd_762x39_AK12_Lush_Mag_F";
				_unit addWeapon "arifle_RPK12_lush_F";
				_unit addPrimaryWeaponItem "optic_Arco_lush_F";
				_unit addMagazine "75rnd_762x39_AK12_Lush_Mag_F";
				_unit addMagazine "HandGrenade";
			};
		};
	};
			
	_unit addPrimaryWeaponItem "acc_flashlight";
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