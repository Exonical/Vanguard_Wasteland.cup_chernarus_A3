// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: mission_WreckedJet.sqf
//	@file Author: Aryx

if (!isServer) exitWith {};
#include "mainMissionDefines.sqf";

private ["_vehicle", "_vehicleName", "_vehDeterminer", "_vehicleClass", "_variant"];

_setupVars =
{
	_vehicleClass =
	[
		["B_Plane_Fighter_01_F", "blackwaspAA"],
		["B_Plane_Fighter_01_F", "blackwaspCAS"],
		["B_Plane_Fighter_01_F", "blackwaspXL"],
		"B_Plane_Fighter_01_Stealth_F",
		["O_Plane_Fighter_02_F", "shikraXL"],
		["O_Plane_Fighter_02_F", "shikraEX"],
		["O_Plane_Fighter_02_F", "shikraCAS"],
		["O_Plane_Fighter_02_Stealth_F", "shikraDEF"],
		["I_Plane_Fighter_04_F", "GryphonXL"],
		["I_Plane_Fighter_04_F", "GryphonAA"],
		["I_Plane_Fighter_04_F", "GryphonCAS"]
	] call BIS_fnc_selectRandom;

	_missionType = "Wrecked Jet";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	
	if (_vehicleClass isEqualType []) then
	{
		_variant = _vehicleClass param [1,"",[""]];
		_vehicleClass = _vehicleClass select 0;
	};

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,12,15] spawn createCustomGroupAirSpecOps;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_vehDeterminer = if ("AEIMO" find (_vehicleName select [0,1]) != -1) then { "An" } else { "A" };

	_missionHintText = format ["%1 <t color='%3'>%2</t> has been immobilized, go get it for your team!", _vehDeterminer, _vehicleName, mainMissionColor];	
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
//_waitUntilCondition = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
};

_successExec =
{
	// Mission completed
	_vehicle lock 1;
	_vehicle setVariable ["R3F_LOG_disabled", false, true];

	_successHintMessage = format ["The %1 has been captured, well done.", _vehicleName];
};

_this call mainMissionProcessor;