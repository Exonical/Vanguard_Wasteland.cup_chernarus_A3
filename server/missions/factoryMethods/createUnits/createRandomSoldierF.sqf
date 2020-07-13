// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomSoldierC.sqf

if (!isServer) exitWith {};

private _soldierTypes = ["C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F"];
private _weaponTypes = ["arifle_MXM_Black_F"];
private _group = _this select 0;
private _position = _this select 1;
private _soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform "U_I_C_Soldier_Para_2_F";
_soldier addVest "V_BandollierB_rgr";
_soldier addHeadgear "H_Shemag_olive";

[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
_soldier addPrimaryWeaponItem "optic_Arco_ghex_F";
_soldier addPrimaryWeaponItem "bipod_02_F_hex";

_soldier spawn refillPrimaryAmmo;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

_soldier
