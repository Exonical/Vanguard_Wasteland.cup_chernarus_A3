// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HnS.sqf
//	@file Author: AryX
//	@file Version: 0.2
//	@file Description: HnS Extra-Mission

if (!isServer) exitWith {};
#include "extraMissionDefines.sqf";

private ["_moneyAmount", "_moneyText", "_townName", "_missionPos", "_buildingRadius", "_putOnRoof", "_fillEvenly"];

_setupVars = {
	_locArray = ((call cityList) call BIS_fnc_selectRandom);
	_missionPos = markerPos (_locArray select 0);
	_buildingRadius = _locArray select 1;
	_townName = _locArray select 2;
	
	// reduce radius for larger towns. for example to avoid endless hide and seek in kavala ;)
	_buildingRadius = if (_buildingRadius > 201) then {(_buildingRadius*0.5)} else {_buildingRadius};
	_putOnRoof = false;
	_fillEvenly = true;
	
	_missionType = "Hide and Seek";
	_moneyAmount = 50000;
	
	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];
};

_setupObjects = {
	_aiGroup = createGroup CIVILIAN; //this "group" is the Assassin only
	_Assassin = _aiGroup createUnit ["C_man_polo_1_F", _missionPos, [], 0, "None"];
	removeAllWeapons _Assassin;
	removeAllAssignedItems _Assassin;
	removeUniform _Assassin;
	removeVest _Assassin;
	removeBackpack _Assassin;
	removeHeadgear _Assassin;
	removeGoggles _Assassin;
	_Assassin forceaddUniform "U_C_Uniform_Scientist_02_formal_F";  
	_Assassin addHeadgear "H_Hat_Tinfoil_F";
	_Assassin addVest "V_Rangemaster_belt";
	_Assassin addGoggles "G_Blindfold_01_black_F";
	_Assassin addBackpack "B_Messenger_IDAP_F";
	_Assassin addWeapon "sgun_HunterShotgun_01_sawedoff_F";
	_Assassin addMagazine "2Rnd_12Gauge_Slug";
	_Assassin addMagazine "2Rnd_12Gauge_Slug";
	_Assassin addMagazine "2Rnd_12Gauge_Pellets";
	_Assassin addMagazine "2Rnd_12Gauge_Pellets";
	_Assassin addRating 1e11;
	_Assassin spawn refillPrimaryAmmo;
	_Assassin call setMissionSkill;
	_Assassin addEventHandler ["Killed", server_playerDied];
		
	_Assassin = leader _aiGroup;
	
	_Assassin allowDamage false;																// safe until positioning (sometimes placed in walls and he dies)
	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;	// move Ass-assin into a building
	_Assassin allowDamage true;																	// free to kill! :P
	
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "STEALTH";
	
	_missionHintText = format ["<br/>Find the Soldier in<br/><t size='1.35' color='%1'>%2</t><br/><br/>He holds a<br/><t color='%1'>enough money which is worth %3.</t><br/>", extraMissionColor, _townName, _moneyText];
};

_waitUntilMarkerPos = nil; 
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = nil;

_successExec = {
	// Mission completed
	for "_i" from 1 to 12 do {
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[0.5 + random 1,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 12, true];
		_cash setVariable ["owner", "world", true];
	};

	_successHintMessage = "You stopped the Hider, well done!";
};

_this call extraMissionProcessor;
