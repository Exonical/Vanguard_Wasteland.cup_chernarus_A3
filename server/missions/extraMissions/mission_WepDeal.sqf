// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_WepDeal.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, [IOCI] Randleman, AryX
//	@file Version: 0.2
//	@file Description: WepDeal Extra-Mission

if (!isServer) exitWith {};
#include "extraMissionDefines.sqf";

private ["_nbUnits", "_box1", "_box2", "_cash"];

_setupVars = {
	_missionType = "Weapon Deal";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects = {
	_missionPos = markerPos _missionLocation;

	_box1 = createVehicle ["Box_GEN_Equip_F", [(_missionPos select 0) + 10, (_missionPos select 1) + 4, 0], [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_Gear_Cop"] call fn_refillbox;

	_box2 = createVehicle ["Box_GEN_Equip_F", [(_missionPos select 0) + 10, (_missionPos select 1) + 6, 0], [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_Gear_BlackBox"] call fn_refillbox;
	
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup4;
	
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";

	_missionHintText = format ["A<br/><t color='%1'>weapon deal has been spotted</t><br/>Take out all security and the content is yours.", extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
	
	for "_i" from 1 to 12 do
	{
		_cash = createVehicle ["Land_Money_F", _missionPos, [], 5, "None"];
		_cash setPos ([_missionPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", 48000 / 12, true];
		_cash setVariable ["owner", "world", true];
	};
		
	_successHintMessage = "Deal cancelled, well done! <br/>The weapon crates an Money are yours. The crates will despawn in 5 mins.";
};

_this call extraMissionProcessor;