// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Graveyard.sqf
//	@file Author: AryX
//	@file Version: 0.1
//	@file Description: Graveyard Extra-Mission

if (!isServer) exitWith {};
#include "extraMissionDefines.sqf";

private ["_grave", "_shovel1", "_shovel2", "_graveRandom", "_graveStone"];

_setupVars = {
	_missionType = "Graveyard";
	_locationsArray = SniperMissionMarkers;
};

_setupObjects = {
	_missionPos = markerPos _missionLocation;
		
	_graveStone = ["Land_Tombstone_02_F", "Land_Tombstone_03_F", "Land_GardenPavement_01_F", "Land_GardenPavement_02_F", "Land_Mausoleum_01_F", "Land_Grave_07_F", "Land_Grave_04_F"];
	_graveRandom = _graveStone select (floor random (count _graveStone));
	_grave = createVehicle [_graveRandom, _missionPos, [], 0, "NONE"];
	_shovel1 = createVehicle ["Land_Shovel_F", _grave modelToWorld [6.5,-2,-4.1], [], 0, "NONE"];
	_shovel2 = createVehicle ["Land_Shovel_F", _grave modelToWorld [-8,-2,-4.1], [], 0, "NONE"];
	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,12,15] spawn createCustomGroup3;
	
	_missionHintText = format ["<br/>An Miliz raided the graveyard. Seek and Destroy them all. Let them enter the grave.", extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = {
	// Mission failed
	{ deleteVehicle _x } forEach [_grave, _shovel1, _shovel2];	
};

_successExec = {
	// Mission completed
	_randomBox = ["mission_Snipers4","mission_Snipers2"] call BIS_fnc_selectRandom;
	_randomCase = ["Box_FIA_Support_F","Box_FIA_Wps_F","Box_FIA_Ammo_F"] call BIS_fnc_selectRandom;
	
	_box1 = createVehicle [_randomCase, _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, _randomBox] call fn_refillbox;
	
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1];
	{ deleteVehicle _x } forEach [_grave, _shovel1, _shovel2];
	
	_successHintMessage = format ["Good Job! the enemy are now returned to their graves.<br/> Check those crates as a reward!"];
};

_this call extraMissionProcessor;