// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroupCop.sqf
//	@file Author: AgentRev
if (!isServer) exitWith {};

private "_uPos";
private "_unit";
private _group = _this select 0;
private _pos = _this select 1;
private _nbUnits = param [9, 10, [0]];
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
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest "V_TacVest_gen_F";
	_unit addBackpack "B_LegStrapBag_black_F";
	_unit addHeadgear "H_Beret_gen_F";
	_unit addGoggles "G_Balaclava_TI_G_blk_F";
	
	switch (true) do
	{
		// AT every 5 units
		case (_i % 5 isEqualTo 0):
		{
			_unit addUniform "U_B_GEN_Soldier_F";
			_unit addBackpack "B_ViperHarness_blk_F";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addWeapon "arifle_Katiba_C_F";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addPrimaryWeaponItem "optic_Hamr";
			_unit addMagazine "Vorona_HEAT";
			_unit addWeapon "launch_O_Vorona_green_F";
			_unit addMagazine "Vorona_HE";
			_unit addMagazine "Vorona_HE";
			_unit selectWeapon "launch_O_Vorona_green_F";
		};
		// Sniper every 6 units
		case (_i % 6 isEqualTo 0):
		{
			_unit addUniform "U_B_GEN_Soldier_F";
			_unit addMagazine "10Rnd_93x64_DMR_05_Mag";
			_unit addWeapon "srifle_DMR_05_blk_F";
			_unit addPrimaryWeaponItem "optic_DMS";
			_unit addMagazine "10Rnd_93x64_DMR_05_Mag";
			_unit addMagazine "10Rnd_93x64_DMR_05_Mag";
		};
		// AA every 7 units
		case (_i % 7 isEqualTo 0):
		{
			_unit addUniform "U_B_GEN_Soldier_F";
			_unit addBackpack "B_ViperHarness_blk_F";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addWeapon "arifle_Katiba_C_F";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addMagazine "30Rnd_65x39_caseless_green";
			_unit addPrimaryWeaponItem "optic_Hamr";
			_unit addMagazine "MRAWS_HEAT_F";
			_unit addWeapon "launch_MRAWS_green_rail_F";
			_unit addMagazine "MRAWS_HE_F";
			_unit addMagazine "MRAWS_HE_F";
			_unit selectWeapon "launch_MRAWS_green_rail_F";
		};
		// Rifleman
		default
		{
			if (_unit isEqualTo leader _group) then
			{
				_unit addUniform "U_B_GEN_Commander_F";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addWeapon "arifle_Katiba_C_F";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addPrimaryWeaponItem "optic_Arco_blk_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addMagazine "HandGrenade";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addUniform "U_B_GEN_Commander_F";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addWeapon "arifle_Katiba_F";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addMagazine "30Rnd_65x39_caseless_green";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addMagazine "HandGrenade";
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enableGunLights "forceOn";

	_unit addRating 1e11;
	//_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;