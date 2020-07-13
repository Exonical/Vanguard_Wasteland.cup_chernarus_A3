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

_unitTypes = [
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

	_unit addUniform "U_BG_Guerilla3_1";
	_unit addVest "V_Pocketed_coyote_F";
	_unit addBackpack "B_LegStrapBag_coyote_F";
	_unit addHeadgear "H_Hat_Safari_sand_F";
	_unit addGoggles "G_Bandanna_tan";
	
	switch (true) do
	{
		// AT every 5 units
		case (_i % 5 isEqualTo 0):
		{
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addWeapon "srifle_DMR_06_camo_F";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addPrimaryWeaponItem "optic_Hamr";
		};
		// Sniper every 6 units
		case (_i % 6 isEqualTo 0):
		{
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addWeapon "srifle_DMR_06_camo_F";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addPrimaryWeaponItem "optic_DMS";
		};
		// AA every 7 units
		case (_i % 7 isEqualTo 0):
		{
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addWeapon "srifle_DMR_06_camo_F";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addPrimaryWeaponItem "optic_Arco";
		};
		// Rifleman
		default
		{
			if (_unit isEqualTo leader _group) then
			{
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addWeapon "srifle_DMR_06_camo_F";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addPrimaryWeaponItem "optic_ERCO_khk_F";
				_unit addMagazine "HandGrenade";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addWeapon "srifle_DMR_06_camo_F";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addPrimaryWeaponItem "optic_AMS";
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