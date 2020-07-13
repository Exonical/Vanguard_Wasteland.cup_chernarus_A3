// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_RoadBlock.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, soulkobk, AryX
//	@file Created: 08/12/2012 15:19
//	@file Modified: 4:31 PM 31/10/2019 (AryX)

if (!isServer) exitWith {};

#include "sideMissionDefines.sqf";

private ["_nbUnits", "_box1", "_box2", "_box3", "_box4", "_drop_item", "_drugpilerandomizer", "_drugpile", "_roadBlock", "_objects"];

_setupVars =
{
	_missionType = "Road Block";
	_locationsArray = RoadBlockMissionMarkers;
};
_setupObjects =
{
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
	_missionPos = markerPos _missionLocation;
	_missionDir = markerDir _missionLocation;
	_roadBlock = selectRandom (call compile preprocessFileLineNumbers "server\missions\roadBlocks\roadBlockList.sqf");
	_objects = [_roadBlock, _missionPos, _missionDir] call createRoadBlock; //0 war voher _missionDir
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach _objects;
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits, 15] call createCustomGroup;
	_missionHintText = format ["Enemies have set up a road block and are stopping all traffic! Go and take it over!", sideMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_drop_item = 
{
	private _item = _this select 0;
	private _pos = _this select 1;

	if (isNil "_item" || {typeName _item != typeName [] || {count(_item) != 2}}) exitWith {};
	if (isNil "_pos" || {typeName _pos != typeName [] || {count(_pos) != 3}}) exitWith {};

	private _id = _item select 0;
	private _class = _item select 1;

	private _obj = createVehicle [_class, _pos, [], 5, "None"];
	_obj setPos ([_pos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
	_obj setVariable ["mf_item_id", _id, true];
};

_failedExec =
{
	{ deleteVehicle _x } forEach _objects;
};

_successExec =
{
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach _objects;
	
	[_locationsArray, _missionLocation, _objects] call setLocationObjects;
	
	{ deleteVehicle _x } forEach _objects;
	uiSleep 1;
	
	_successHintMessage = "The road block has been taken over, good work!";
	
	// changed by soulkobk for random number of boxes and random crate loot
	_crateBoxes = 
	[
		"Box_IND_Ammo_F",
		"Box_IND_AmmoOrd_F",
		"Box_IND_Grenades_F",
		"Box_IND_Support_F",
		"Box_IND_Wps_F",
		"Box_IND_WpsLaunch_F",
		"Box_IND_WpsSpecial_F"
	];
	_numBoxes = round(random 2) + 1; // minimum 1, maximum 4.
	switch (_numBoxes) do // because apparently a for _i loop doesnt work with missions... bad coding? pfft.
	{
		case 1: {
			_box1 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box1 setDir random 360;
			_randomBox = ["mission_Weapon1","mission_Launchers1","mission_Snipers1"] call BIS_fnc_selectRandom;
			[_box1, _randomBox] call fn_refillbox;
		};
		case 2: {
			_box1 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box1 setDir random 360;
			_randomBox = ["mission_Weapon2","mission_Launchers2","mission_Snipers2"] call BIS_fnc_selectRandom;
			[_box1, _randomBox] call fn_refillbox;
			_box2 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box2 setDir random 360;
			_randomBox = ["mission_Weapon2","mission_Launchers2","mission_Snipers2"] call BIS_fnc_selectRandom;
			[_box2, _randomBox] call fn_refillbox;
		};
		case 3: {
			_box1 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box1 setDir random 360;
			_randomBox = ["mission_Weapon3","mission_Launchers3","mission_Snipers3"] call BIS_fnc_selectRandom;
			[_box1, _randomBox] call fn_refillbox;
			_box2 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box2 setDir random 360;
			_randomBox = ["mission_Weapon3","mission_Launchers3","mission_Snipers3"] call BIS_fnc_selectRandom;
			[_box2, _randomBox] call fn_refillbox;
			_box3 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box3 setDir random 360;
			_randomBox = ["mission_Weapon3","mission_Launchers3","mission_Snipers3"] call BIS_fnc_selectRandom;
			[_box3, _randomBox] call fn_refillbox;
		};
		case 4: {
			_box1 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box1 setDir random 360;
			_randomBox = ["mission_Weapon_camo","mission_LMGs1","mission_Snipers4"] call BIS_fnc_selectRandom;
			[_box1, _randomBox] call fn_refillbox;
			_box2 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box2 setDir random 360;
			_randomBox = ["mission_Weapon_green","mission_LMGs1","mission_Snipers4"] call BIS_fnc_selectRandom;
			[_box2, _randomBox] call fn_refillbox;
			_box3 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box3 setDir random 360;
			_randomBox = ["mission_Weapon_tropic","mission_Launchers1","mission_DLC_apex"] call BIS_fnc_selectRandom;
			[_box3, _randomBox] call fn_refillbox;
			_box4 = createVehicle [(selectRandom _crateBoxes), _missionPos, [], 15, "None"];
			_box4 setDir random 360;
			_randomBox = ["mission_Weapon_sand","mission_Launchers1","mission_DLC_apex"] call BIS_fnc_selectRandom;
			[_box4, _randomBox] call fn_refillbox;
		};
	};
	
	_drugpilerandomizer = [4,8];
	_drugpile = _drugpilerandomizer call BIS_fnc_SelectRandom;
	
	for "_i" from 1 to _drugpile do 
	{
	  private["_item"];
	  _item = [
	          ["lsd", "Land_WaterPurificationTablets_F"],
	          ["marijuana", "Land_VitaminBottle_F"],
	          ["cocaine","Land_PowderedMilk_F"],
	          ["heroin", "Land_PainKillers_F"]
	        ] call BIS_fnc_selectRandom;
	  [_item, _lastPos] call _drop_item;
	};
};

_this call sideMissionProcessor;
