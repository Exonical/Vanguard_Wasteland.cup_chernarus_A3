// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright � 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Roadblock.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitWith {};
#include "moneyMissionDefines.sqf";

private ["_nbUnits", "_box1", "_box2", "_loadout", "_net1", "_buildingRadius","_putOnRoof","_fillEvenly","_drop_item","_drugpilerandomizer","_drugpilerandomizer","_cash"];

_setupVars =
{
	_missionType = "Navy Seals";
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [20,0,0.3,8,1,true];

		while {(count _flatPos) < 2} do {
			_position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [20,0,0.3,8,1,true];
		};

		if ((_flatPos distance (getMarkerPos "noCoastal_1")) > 1200 && (_flatPos distance (getMarkerPos "noCoastal_2")) > 500) then {
			_accepted = true;
		};
	};
	_missionPos = _flatPos;

	_boatPos = [_flatPos, 200, 300, 20, 2, 10, 0] call BIS_fnc_findSafePos;
	_trawlerPos = [_flatPos, 200, 300, 10, 2, 10, 0] call BIS_fnc_findSafePos;

	_randomDir = (random 360);
	sideObj = "Land_Cargo_Tower_V1_F" createVehicle _flatPos;
	waitUntil {alive sideObj};
	sideObj setDir _randomDir;
	sideObj setPos [(getPos sideObj select 0), (getPos sideObj select 1), ((getPos sideObj select 2))];
	sideObj setVectorUp [0,0,1];
	sideObj setVariable ["R3F_LOG_disabled", true, true];

	_box1 = createVehicle ["Box_NATO_WpsSpecial_F", _missionPos, [], 20, "None"];
	_box1 setDir random 360;
	[_box1, "mission_Weapon1"] call fn_refillbox;

	_box2 = createVehicle ["Box_East_WpsSpecial_F", _missionPos, [], 20, "None"];
	_box2 setDir random 360;
	[_box2, "mission_DLC_apex"] call fn_refillbox;

	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];

	// settings for this mission
	_buildingRadius = 100;
	//randomize amount of units
	_nbUnits = _nbUnits + round(random (_nbUnits*0.5));
	// reduce radius for larger towns. for example to avoid endless hide and seek in kavala ;)
	_buildingRadius = if (_buildingRadius > 201) then {(_buildingRadius*0.5)} else {_buildingRadius};
	// 25% change on AI not going on rooftops
	if (random 1 < 0.75) then { _putOnRoof = true } else { _putOnRoof = false };
	// 25% chance on AI trying to fit into a single building instead of spreading out
	if (random 1 < 0.75) then { _fillEvenly = true } else { _fillEvenly = false };
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;
	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;

	_smuggleGroup = createGroup CIVILIAN;
	boat = "O_Boat_Armed_01_hmg_F" createVehicle _boatPos;	
	waitUntil {sleep 0.3; alive boat};
	boat setDir random 360;
		"O_diver_TL_F" createUnit [_boatPos,_smuggleGroup]; "O_diver_F" createUnit [_boatPos,_smuggleGroup]; "O_diver_F" createUnit [_boatPos,_smuggleGroup]; 
		((units _smuggleGroup) select 0) assignAsCommander boat; ((units _smuggleGroup) select 0) moveInCommander boat; ((units _smuggleGroup) select 1) assignAsDriver boat; ((units _smuggleGroup) select 1) moveInDriver boat; ((units _smuggleGroup) select 2) assignAsGunner boat; ((units _smuggleGroup) select 2) moveInGunner boat;
		{_x doWatch _flatPos} forEach units _smuggleGroup;
		((units _smuggleGroup) select 1) setSkill 1;
		((units _smuggleGroup) select 1) allowFleeing 0;	
	_grp = _smuggleGroup;
	_pos = _boatPos;
	_grp allowFleeing 0;
	// Waypoints
	private ["_wp1", "_wp2"];
	_wp1 = _grp addWaypoint [_pos, 0];
	_wp1 setWaypointType "SAD"; // Seek And Destroy
	[_grp, 1] setWaypointBehaviour "SAFE";
	[_grp, 1] setWaypointCombatMode "GREEN";
	[_grp, 1] setWaypointCompletionRadius 75;
	[_grp, 1] setWaypointStatements ["true", "(group this) setCurrentWaypoint [group this, 2]"];
	_wp2 = _grp addWaypoint [_pos, 0];
	_wp2 setWaypointType "DISMISS";
	[_grp, 2] setWaypointBehaviour "SAFE";
	[_grp, 2] setWaypointCombatMode "GREEN";
	[_grp, 2] setWaypointCompletionRadius 75;
	[_grp, 2] setWaypointStatements ["true", "(group this) setCurrentWaypoint [group this, 1]"];	
	
	trawler = "Submarine_01_F" createVehicle _trawlerPos;
	trawler setDir random 360;
	trawler allowDamage false;
	//assaultBoat = "O_Boat_Transport_01_F" createVehicle _assaultBoatPos;
	//assaultBoat setDir random 360;
	{ _x lock 3 } forEach [boat,trawler];
	_missionHintText = "Navy Seals have been spotted approching land and setting up a beach head, intercept them and take the loot";
	{ _x setMarkerPos _flatPos; } forEach ["noCoastal_1"];
};

	//no_log format['xxxxxxxxxxxxxxx CCG Navy Seals Mission Started xxxxxxxxxxxxxxxxxxxxx'];

_failedExec =
{
	// Mission failed
	{boat deleteVehicleCrew _x} forEach crew boat;
	sleep 0.5;
	{ deleteVehicle _x } forEach [_box1, _box2];
	{ deleteVehicle _x } forEach [boat,trawler,sideObj];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, sideObj];
	{boat deleteVehicleCrew _x} forEach crew boat;
	sleep 0.5;
	{ deleteVehicle _x } forEach [boat,trawler];
	_successHintMessage = "The Navy Seals have been eliminated, well done.";

	_drop_item = 
	{
	private["_item", "_pos"];
	_item = _this select 0;
	_pos = _this select 1;

	if (isNil "_item" || {typeName _item != typeName [] || {count(_item) != 2}}) exitWith {};
	if (isNil "_pos" || {typeName _pos != typeName [] || {count(_pos) != 3}}) exitWith {};

	private["_id", "_class"];
	_id = _item select 0;
	_class = _item select 1;

	private["_obj"];
	_obj = createVehicle [_class, _pos, [], 5, "None"];
	_obj setPos ([_pos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
	_obj setVariable ["mf_item_id", _id, true];
	};

	_drugpilerandomizer = [8,12,16];
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
	  [_item, _missionPos] call _drop_item;
	};

	for "_x" from 1 to 5 do
	{
		_cash = "Land_Money_F" createVehicle _missionPos;
		_cash setPos ((_missionPos) vectorAdd ([[2 + random 2,0,0], random 360] call BIS_fnc_rotateVector2D));
		_cash setDir random 360;
		_cash setVariable["cmoney",10000,true];
		_cash setVariable["owner","world",true];
	};
};

_this call moneyMissionProcessor;
