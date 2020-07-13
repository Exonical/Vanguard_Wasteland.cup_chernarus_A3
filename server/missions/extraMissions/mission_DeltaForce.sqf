// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_DeltaForce.sqf
//	@file Author: AryX
//	@file Version: 0.1
//	@file Description: Delta Force Extra-Mission

if (!isServer) exitWith {};

#include "extraMissionDefines.sqf"

private ["_nbUnits", "_townName", "_missionPos", "_buildingRadius", "_putOnRoof", "_fillEvenly"];

_setupVars =
{
	_missionType = "Delta Force";
	_nbUnits = selectRandom [8,9,10,11,12,13];
	_locArray = ((call cityList) call BIS_fnc_selectRandom);
	_missionPos = markerPos (_locArray select 0);
	_missionPos set [2,200];
	_buildingRadius = _locArray select 1;
	_townName = _locArray select 2;
	_buildingRadius = if (_buildingRadius > 201) then {(_buildingRadius*0.5)} else {_buildingRadius};
};

_setupObjects =
{
	_fillEvenly = true;
	_putOnRoof = true;
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,_nbUnits,20] call createCustomGroupAirDesert;
	{
 		_x move _missionPos;
		_x moveTo _missionPos;
	} forEach units _aiGroup;
	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;
	
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "STEALTH";

	_missionHintText = format ["Hostiles parachuted over <br/><t size='1.25' color='%1'>%2</t><br/><br/>There seem to be <t color='%1'>%3 enemies</t> dropping in! Get rid of them all, and take their supplies!", extraMissionColor, _townName, _nbUnits];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = nil;

_successExec =
{
	// Mission completed
	private _box1 = createVehicle ["Box_NATO_Wps_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_Weapon3"] call fn_refillbox;

	private _box2 = createVehicle ["Box_NATO_WpsSpecial_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_LMGs1"] call fn_refillbox;

	_successHintMessage = "Hostiles parachutes killed.<br/>Go take their supplies.";
};

_this call extraMissionProcessor;