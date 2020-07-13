// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_falsecops.sqf
//	@file Author: JoSchaap, AgentRev, GriffinZS, RickB, soulkobk
if (!isServer) exitWith {};
#include "sideMissionDefines.sqf";

private ["_camonet", "_hostage", "_obj1", "_obj2", "_obj3", "_vehicleName", "_moneyAmount", "_moneyAmount2", "_cash1", "_cash2"];

_setupVars = {
	_missionType = "Bounty Hunter";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects = {
	_missionPos = markerPos _missionLocation;
	
	//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 
	
	_camonet = createVehicle ["Land_MetalBarrel_F", [_missionPos select 0, _missionPos select 1], [], 0, "CAN_COLLIDE"];
	_camonet allowdamage false;
	_camonet setDir random 360;
	_camonet setVariable ["R3F_LOG_disabled", false];

	_missionPos = getPosATL _camonet;

	_hostage = createVehicle ["C_man_polo_1_F", _missionPos, [], 0, "CAN_COLLIDE"];
	_hostage setPosATL [_missionPos select 0, _missionPos select 1, _missionPos select 2];
	removeAllWeapons _hostage;
	removeAllAssignedItems _hostage;
	removeUniform _hostage;
	removeVest _hostage;
	removeBackpack _hostage;
	removeHeadgear _hostage;
	removeGoggles _hostage;
    _hostage addUniform "U_I_C_Soldier_Bandit_3_F";
	waitUntil {alive _hostage};
	[_hostage, "Acts_ExecutionVictim_Loop"] call switchMoveGlobal;
	_hostage disableAI "anim";

	_obj1 = createVehicle ["C_Offroad_02_unarmed_F", _missionPos,[], 10,"None"]; 
	_obj1 setPosATL [(_missionPos select 0) - 2, (_missionPos select 1) + 2, _missionPos select 2];
	
	_obj2 = createVehicle ["Box_IED_Exp_F", _missionPos,[], 10,"None"]; 
	_obj2 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) + 2, _missionPos select 2];
		
	_obj3 = createVehicle ["Land_MetalBarrel_F", _missionPos,[], 10,"None"]; 
	_obj3 setPosATL [(_missionPos select 0) - 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,10,20] spawn createcustomGroupHunter;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";	
	
	_vehicleName = "Hostage";
	_missionHintText = format ["<br/>Bandits stopped a <t color='%2'>Hunter Offroader</t> and set the driver captive.<br/> This must be a Bounty Hunter!<br/> Kill him, and rescue the Bandit!", _vehicleName, sideSpecMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _hostage};

_failedExec = {
	// Mission failed
	{ deleteVehicle _x } forEach [_camonet, _obj1, _obj2, _obj3, _hostage];
	_failedHintMessage = format ["Well .. the Bandit is dead. And the loot is gone too!"];
};

_successExec = {
	// Mission completed
	{ deleteVehicle _x } forEach [_camonet, _hostage, _obj3];
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_obj1, _obj2, _obj3];

	//Random fake - real money	
	_moneyAmount = [10000,20000,30000,40000,50000,60500,71000,82000,92500] call BIS_fnc_selectRandom;
	
	for "_i" from 1 to 5 do {
		_cash1 = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash1 setPos ([_lastPos, [[0.5 + random 1,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash1 setDir random 360;
		_cash1 setVariable ["cmoney", _moneyAmount, true];
		_cash1 setVariable ["owner", "world", true];
	};
		
	_moneyAmount2 = [10000,20000,30000,40000,50000,60500,71000,82000,92500] call BIS_fnc_selectRandom;
	
	for "_i" from 1 to 3 do {
		_cash2 = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash2 setPos ([_lastPos, [[0.5 + random 1,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash2 setDir random 360;
		_cash2 setVariable ["cmoney", _moneyAmount2, true];
		_cash2 setVariable ["owner", "world", true];
	};
	
	_successHintMessage = format ["Excellent work! Steal the money and get out of there!"];
};

_this call sideMissionProcessor;