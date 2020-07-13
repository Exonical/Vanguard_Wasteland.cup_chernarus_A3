// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Island.sqf
//	@file Author: AryX
//	@file Version: 0.1
//	@file Description: Island Special-Mission

if (!isServer) exitWith {};
#include "specialMissionDefines.sqf";

private ["_box1", "_flagpost", "_camonet", "_camonet2", "_obj1", "_obj2"];

_setupVars =
{
	_missionType = "Island Conquest";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_markerDir = markerDir _missionLocation;
	
	//delete existing base parts and vehicles at location
	// _baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	// { deleteVehicle _x } forEach _baseToDelete; 	
	
	_flagpost = createVehicle ["Flag_HorizonIslands_F", _missionPos, [], 0, "NONE"];
	_flagpost setDir _markerDir;
	_camonet = createVehicle ["CamoNet_OPFOR_open_F", _flagpost modelToWorld [6.5,-2,-4.1], [], 0, "NONE"];
	_obj1 = createVehicle ["O_Boat_Transport_01_F", _flagpost modelToWorld [6.5,-2,-4.1], [], 0, "NONE"];
	_camonet setDir _markerDir;
	_camonet2 = createVehicle ["CamoNet_OPFOR_open_F", _flagpost modelToWorld [-8,-2,-4.1], [], 0, "NONE"];
	_obj2 = createVehicle ["I_GMG_01_high_F", _flagpost modelToWorld [-8,-2,-4.1], [], 0, "NONE"];
	_camonet2 setDir _markerDir;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, 10, 15] spawn createCustomGroup3;
	
	_missionHintText = format ["<br/>Reportedly armed units try to <br/><t color='%1'>conquer a small island</t>.<br/>Check this island, find the invaders and kick them back to the sea!", specialMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_flagpost, _camonet, _camonet2, _obj1, _obj2];
};

_successExec =
{
	// Mission completed
	// _randomBox = ["mission_Snipers2", "mission_Snipers3", "mission_Snipers4"] call BIS_fnc_selectRandom;
	// _box1 = createVehicle ["Box_FIA_Support_F", _missionPos, [], 5, "None"];
	// _box1 setDir random 360;
	// [_box1, _randomBox] call fn_refillbox;
	// { _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1];
	// { deleteVehicle _x } forEach [_flagpost, _camonet, _camonet2, _obj2];
	
	// _successHintMessage = format ["<br/>Good work! The invaders have been defeated!"];
};