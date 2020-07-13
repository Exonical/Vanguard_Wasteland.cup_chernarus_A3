// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_ItemCrate.sqf
//	@file Author: AryX
//	@file Version: 0.2
//	@file Description: ItemCrate Extra-Mission

if (!isServer) exitWith {};
#include "extraMissionDefines.sqf"

private ["_nbUnits", "_box1", "_box2"];

_setupVars =
{
	_missionType = "Item Crate";
	_locationsArray = [ForestMissionMarkers, MissionSpawnMarkers] select (ForestMissionMarkers isEqualTo []);
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_box1 = createVehicle ["Land_PaperBox_closed_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;

 	_box1 setVariable ["R3F_LOG_disabled", true, true];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup4;

	_missionHintText = format ["An<br/><t color='%1'>item cache has been spotted.</t><br/>It contains some usefull stuff like ammokits or repairkits.", extraMissionColor];
	_missionPicture = "\A3\ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	deleteVehicle _box1;
};

_successExec =
{
	// Mission completed
	_box1 setVariable ["R3F_LOG_disabled", false, true];
	private _itemsInBox = [];
	_rand = floor random 100;

	{
		for "_i" from 0 to (round random (_x select 1)) do {
			_itemsInBox pushBack (_x select 0);
		};
	}foreach [
		["repairkit",2],
		["ammokit",1],
		["jerrycanfull",2],
		["spawnbeacon",1],
		["camonet",2],
		["syphonhose",2]
	];

	_box1 setVariable ["virtualItems",[_itemsInBox,count _itemsInBox],true];

	_successHintMessage = "The item box has been captured, well done.";
};

_this call extraMissionProcessor;