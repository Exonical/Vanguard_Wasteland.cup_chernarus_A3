// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: deploy.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Deploy a Spawn Beacon
//@file Argument: [player, player, _action, []] the standard "called by an action" values

#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_CANCELLED "Action Cancelled"
#define ERR_IN_VEHICLE "Action Failed! You can't do this in a vehicle"
#define ERR_IN_WATER "Action Failed! You can't do this in water"
#define ERR_IN_BUILDING "Action Failed! You can't do this in that building"
#define STORE_RANGE 300
#define ERR_IN_ZONE "Action Failed! You cannot place a beacon within %1 of a store"
#define ERR_IN_WATER "Action Failed! You cannot place a beacon in water, only on land"
#define ERR_IN_AIR "Action Failed! You cannot place a beacon in the air, only on land"
#define ERR_IN_BUILDING "Action Failed! You cannot place a beacon in a building"
#define ERR_IN_ROCK "Action Failed! You cannot place a beacon in a Rock or another Object"
#define MAX_BEACONS format ["You cannot deploy more then %1 spawnbeacons", [_MaxSpawnbeacons]]

private ["_hasFailed", "_success","_pos","_uid","_beacon","_beacons","_ownedBeacons","_stores","_store","_result"];

_maxSpawnbeacons = ceil (["A3W_maxSpawnBeacons", 3] call getPublicVar);
_beacons = []; 
{ 
	if (_x getVariable ["ownerUID",""] == getPlayerUID player) then 
	{ 
		_beacons pushBack _x; 
	}; 
} forEach pvar_spawn_beacons; 

_ownedBeacons = count _beacons;
_relpos = player getRelPos [20, 0];

_stores = [
	GenStore1, GenStore2, GenStore3, GenStore4, GenStore5, GenStore6, GenStore7, GenStore8,
	GunStore1, GunStore2, GunStore3, GunStore4, GunStore5, GunStore6, GunStore7,
	VehStore1, VehStore2, VehStore3, VehStore4, VehStore5, VehStore6, VehStore7, VehStore8, VehStore9
];

_hasFailed = {
	if (!alive player || player call A3W_fnc_isUnconscious) exitWith { [true, 'dead'] };
	if (doCancelAction) exitWith {
		doCancelAction = false;
		[true, ERR_CANCELLED]
	};
	if (vehicle player != player) exitWith {
		[true, ERR_IN_VEHICLE]
	};
	if (surfaceIsWater position player) exitWith {
		[true, ERR_IN_WATER]
	};
	if (!(underwater (vehicle player)) && !(isTouchingGround (vehicle player))) exitWith {
		[true, ERR_IN_AIR]
	};
	
	if (_ownedBeacons >= _MaxSpawnbeacons) exitWith {
		player spawn deleteBeacon;
		[true, MAX_BEACONS]
	};
	
	_result = 0;

	{
		if (!isNil "_x" && { (player distance2D (getPos _x)) < STORE_RANGE }) exitWith {
			_result = 1;
		};
	} forEach _stores;

	if (_result > 0) exitWith {
		[true, format[ERR_IN_ZONE, STORE_RANGE]]
	};
	
	private _lisCheck = lineIntersectsWith [getPosWorld player, getPosWorld player vectorAdd [0, 0, 50], player, objNull];
	private _isok = 0; // 0 = ok, 1 = rock, 2 = building
	{
		switch (true) do {			
			case (((str _x) find 'rock') != -1): {_isok = 1;};
			case (((str _x) find 'stone') != -1): {_isok = 2;};
			case ((_x isKindOf 'HOUSE') && !((_x) call BIS_fnc_isBuildingEnterable)): {_isok = 3;};
		};
		// exit foreach if bad shit found
		if (_isok > 0) exitWith {};
	} forEach _lisCheck;
	if (_isok > 0) exitWith {
		switch (_isok) do { 
			case 1: {[true, ERR_IN_ROCK]}; 
			case 2: {[true, ERR_IN_ROCK]}; 
			case 3: {[true, ERR_IN_BUILDING]};
		};
	};
	[false, format["Spawn Beacon %1%2 Deployed", round(_progress * 100), "%"]]
};
_success = [MF_ITEMS_SPAWN_BEACON_DURATION, ANIM, _hasFailed, []] call a3w_actions_start;

if (_success) then {
	_uid = getPlayerUID player;
	// Spawn 2m in front of the player
	_beacon = createVehicle [MF_ITEMS_SPAWN_BEACON_DEPLOYED_TYPE, [player, [0,2,0]] call relativePos, [], 0, "CAN_COLLIDE"];
	_beacon setDir (getDir player + 270);
	_beacon setVariable ["allowDamage", true, true];
	_beacon setVariable ["a3w_spawnBeacon", true, true];
	_beacon setVariable ["persistent", true, true];
	_beacon setVariable ["R3F_LOG_disabled", true];
	_beacon setVariable ["side", playerSide, true];
	_beacon setVariable ["ownerName", name player, true];
	_beacon setVariable ["ownerUID", _uid, true];
	_beacon setVariable ["packing", false, true];
	_beacon setVariable ["groupOnly", (playerSide == INDEPENDENT), true];
	/* _isVisible = !(lineIntersects [(eyePos player),(aimPos _beacon), player, _beacon]); */
	// diag_log format["Beacon: %1", _isVisible];
	// hint format["Beacon: %1", _isVisible];
	/* if(_isVisible) then { */
	pvar_spawn_beacons pushBack _beacon;
	publicVariable "pvar_spawn_beacons";
	pvar_manualObjectSave = netId _beacon;
	publicVariableServer "pvar_manualObjectSave";
	["You placed the Spawn Beacon successfully!", 5] call mf_notify_client;
	/* } else {
		deleteVehicle _beacon;
		["You were caught by bug placing a beacon, beacon was removed!", 5] call mf_notify_client;
	}; */
};
_success;