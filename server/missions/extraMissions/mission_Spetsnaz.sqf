// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Spetsnaz.sqf
//	@file Author: AryX
//	@file Version: 0.1
//	@file Description: Spetsnaz Extra-Mission

if (!isServer) exitWith {};

#include "extraMissionDefines.sqf"

private ["_nbUnits", "_townName", "_missionPos", "_buildingRadius", "_putOnRoof", "_fillEvenly"];

_setupVars =
{
	_missionType = "Spetsnaz";
	_nbUnits = selectRandom [8,9,10,11,12,13,14,15,16];
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
	private _randomGroup = [createCustomGroupAirSpetsnaz] call BIS_fnc_selectRandom;
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,_nbUnits,20] spawn _randomGroup;
	{
 		_x move _missionPos;
		_x moveTo _missionPos;
	} forEach units _aiGroup;
	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;
	
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "STEALTH";
	
	diag_log format["Spetznaz2: %1", _nbUnits];

	_missionHintText = format ["Spetsnaz parachuted over <br/><t size='1.25' color='%1'>%2</t><br/><br/>There seem to be <t color='%1'>%3 enemies</t> dropping in! Fight them!", extraMissionColor, _townName, _nbUnits];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = nil;

_successExec =
{
	// Mission completed
	private _box1 = createVehicle ["Box_EAF_Wps_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_DLC_contact"] call fn_refillbox;

	private _box2 = createVehicle ["Box_EAF_WpsSpecial_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_LMGs1"] call fn_refillbox;

	_successHintMessage = "Spetsnaz parachutes killed.<br/>Go take their supplies.";
};

_this call extraMissionProcessor;