// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Assassin.sqf
//	@file Author: AryX
//	@file Version: 0.2
//	@file Description: Assassin Extra-Mission

if (!isServer) exitWith {};
#include "extraMissionDefines.sqf";

private ["_moneyAmount", "_moneyText", "_townName", "_missionPos", "_buildingRadius", "_putOnRoof", "_fillEvenly", "_spawn1", "_spawn2", "_spawn3"];

_setupVars = {
	_locArray = ((call cityList) call BIS_fnc_selectRandom);
	_missionPos = markerPos (_locArray select 0);
	_buildingRadius = _locArray select 1;
	_townName = _locArray select 2;
	
	_buildingRadius = if (_buildingRadius > 100) then {(_buildingRadius*0.5)} else {_buildingRadius};
	_putOnRoof = false;
	_fillEvenly = true;
	
	_missionType = "Assassins";
	_moneyAmount = 50000; //value of two mission-rewards
	
	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];
	
};

_setupObjects = {
	_spawn1 = _missionPos;
	_spawn2 = [(_missionPos select 0) + 10, 0, 0];
	_spawn3 = [(_missionPos select 0) - 10, 0, 0];
	
	_aiGroup = createGroup CIVILIAN;
	
	
	//Assassins:
	
	// Loadout Start ***
	// Assassin #1
	_Assassin1 = _aiGroup createUnit ["C_man_polo_1_F", _spawn1, [], 0, "None"];
	removeAllWeapons _Assassin1;
	removeAllAssignedItems _Assassin1;
	removeUniform _Assassin1;
	removeVest _Assassin1;
	removeBackpack _Assassin1;
	removeHeadgear _Assassin1;
	removeGoggles _Assassin1;
	// =======
	_Assassin1 forceaddUniform "U_O_R_Gorka_01_black_F";
	_Assassin1 addHeadgear "H_Watchcap_blk";
	_Assassin1 addVest "V_LegStrapBag_black_F";
	_Assassin1 addBackpack "B_Messenger_Black_F";
	_Assassin1 addGoggles "G_Balaclava_TI_blk_F";
	
	_Assassin1 addMagazine "30Rnd_65x39_caseless_black_mag";
	_Assassin1 addWeapon "arifle_MXM_Black_F";
	_Assassin1 addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
	_Assassin1 addPrimaryWeaponItem "acc_pointer_IR";
	_Assassin1 addPrimaryWeaponItem "optic_Arco_blk_F";
	_Assassin1 addMagazine "30Rnd_65x39_caseless_black_mag";
	_Assassin1 addMagazine "30Rnd_65x39_caseless_black_mag";
	_Assassin1 addMagazine "30Rnd_65x39_caseless_black_mag";
	// =======
	_Assassin1 addRating 1e11;
	_Assassin1 spawn refillPrimaryAmmo;
	_Assassin1 call setMissionSkill;
	_Assassin1 addEventHandler ["Killed", server_playerDied];
	
	// Assassin #2
	_Assassin2 = _aiGroup createUnit ["C_man_polo_1_F", _spawn1, [], 0, "None"];
	removeAllWeapons _Assassin2;
	removeAllAssignedItems _Assassin2;
	removeUniform _Assassin2;
	removeVest _Assassin2;
	removeBackpack _Assassin2;
	removeHeadgear _Assassin2;
	removeGoggles _Assassin2;
	// =======
	_Assassin2 forceaddUniform "U_O_R_Gorka_01_black_F";
	_Assassin2 addHeadgear "H_Watchcap_blk";
	_Assassin2 addVest "V_LegStrapBag_black_F";
	_Assassin2 addBackpack "B_Messenger_Black_F";
	_Assassin2 addGoggles "G_Balaclava_TI_blk_F";
	
	_Assassin2 addMagazine "30Rnd_762x39_AK12_Mag_F";
	_Assassin2 addWeapon "arifle_AK12_F";
	_Assassin2 addPrimaryWeaponItem "muzzle_snds_B";
	_Assassin2 addPrimaryWeaponItem "acc_pointer_IR";
	_Assassin2 addPrimaryWeaponItem "optic_ERCO_blk_F";
	_Assassin2 addMagazine "30Rnd_762x39_AK12_Mag_F";
	_Assassin2 addMagazine "30Rnd_762x39_AK12_Mag_F";
	_Assassin2 addMagazine "30Rnd_762x39_AK12_Mag_F";
	// =======
	_Assassin2 addRating 1e11;
	_Assassin2 spawn refillPrimaryAmmo;
	_Assassin2 call setMissionSkill;
	_Assassin2 addEventHandler ["Killed", server_playerDied];
	
	// Assassin #3
	_Assassin3 = _aiGroup createUnit ["C_man_polo_1_F", _spawn1, [], 0, "None"];
	removeAllWeapons _Assassin3;
	removeAllAssignedItems _Assassin3;
	removeUniform _Assassin3;
	removeVest _Assassin3;
	removeBackpack _Assassin3;
	removeHeadgear _Assassin3;
	removeGoggles _Assassin3;
	// =======
	_Assassin3 forceaddUniform "U_O_R_Gorka_01_black_F";
	_Assassin3 addHeadgear "H_Watchcap_blk";
	_Assassin3 addVest "V_LegStrapBag_black_F";
	_Assassin3 addBackpack "B_Messenger_Black_F";
	_Assassin3 addGoggles "G_Balaclava_TI_blk_F";
	
	_Assassin3 addMagazine "20Rnd_650x39_Cased_Mag_F";
	_Assassin3 addWeapon "srifle_DMR_07_blk_F";
	_Assassin3 addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
	_Assassin3 addPrimaryWeaponItem "optic_AMS";
	_Assassin3 addMagazine "20Rnd_650x39_Cased_Mag_F";
	_Assassin3 addMagazine "20Rnd_650x39_Cased_Mag_F";
	_Assassin3 addMagazine "20Rnd_650x39_Cased_Mag_F";
	// =======
	_Assassin3 addRating 1e11;
	_Assassin3 spawn refillPrimaryAmmo;
	_Assassin3 call setMissionSkill;
	_Assassin3 addEventHandler ["Killed", server_playerDied];
	
	// Loadout End ***
	
	_Assassin1 = leader _aiGroup;
	
	// safe until positioning (sometimes placed in walls and they dies)
	_Assassin1 allowDamage false;	
	_Assassin2 allowDamage false;	
	_Assassin3 allowDamage false;	
	
	// move Ass-assins into a building
	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;	
	
	// free to kill! :P
	_Assassin1 allowDamage true;																	
	_Assassin2 allowDamage true;
	_Assassin3 allowDamage true;
	
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	
	_missionHintText = format ["<br/>Stop the Assassins in<br/><t size='1.35' color='%1'>%2</t><br/><br/>one of 'em holds 2<br/><t color='%1'>files wich are worth %3</t><br/>at the exchangedevice.", extraMissionColor, _townName, _moneyText];
};

_waitUntilMarkerPos = nil; 
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = nil;

// _failedExec = {
	// // Mission failed
// };

_successExec = {
	// Mission completed
	for "_i" from 1 to 12 do {
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[0.5 + random 1,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 12, true];
		_cash setVariable ["owner", "world", true];
	};
	
	_successHintMessage = "You stopped the assassins, well done!";
};

_this call extraMissionProcessor;
