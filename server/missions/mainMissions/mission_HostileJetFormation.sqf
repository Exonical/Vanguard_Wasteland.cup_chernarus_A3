// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileJetFormation.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitWith {};
#include "mainMissionDefines.sqf"

private ["_planeChoices", "_convoyVeh", "_veh1", "_veh2", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_vehicleName2", "_numWaypoints", "_cash", "_box1", "_box2"];

_setupVars =
{
	_missionType = "Hostile Jets Formation";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_planeChoices =
	[
		["B_Plane_CAS_01_dynamicLoadout_F", "B_Plane_CAS_01_dynamicLoadout_F"],
		["O_Plane_CAS_02_dynamicLoadout_F", "O_Plane_CAS_02_dynamicLoadout_F"],
		["O_Plane_Fighter_02_F", "O_Plane_Fighter_02_F"],
		["I_Plane_Fighter_04_F", "I_Plane_Fighter_04_F"],
		["B_Plane_Fighter_01_F", "B_Plane_Fighter_01_F"]
	];

	_convoyVeh = _planeChoices call BIS_fnc_selectRandom;

	_veh1 = _convoyVeh select 0;
	_veh2 = _convoyVeh select 1;

	_createVehicle =
	{
		private ["_type","_position","_direction","_vehicle","_soldier"];
		
		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;
		
		_vehicle = createVehicle [_type, _position, [], 0, "FLY"]; // Added to make it fly
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		_vel = [velocity _vehicle, -(_direction)] call BIS_fnc_rotateVector2D; // Added to make it fly
		_vehicle setDir _direction;
		_vehicle setVelocity _vel; // Added to make it fly
		_vehicle setVariable [call vChecksum, true, false];
		_aiGroup addVehicle _vehicle;

		// add pilot
		_soldier = [_aiGroup, _position] call createRandomPilot; 
		_soldier moveInDriver _vehicle;
		// lock the vehicle untill the mission is finished and initialize cleanup on it
		
		// Reset all flares to 0
		if (_type isKindOf "Air") then
		{
			{
				if (["CMFlare", _x] call fn_findString != -1) then
				{
					_vehicle removeMagazinesTurret [_x, [-1]];
				};
			} forEach getArray (configFile >> "CfgVehicles" >> _type >> "magazines");
		};
		
		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_directionToFly = random 360;
	_vehicles =
	[
		[_veh1, ([_missionPos,100,0] call BIS_fnc_relPos), _directionToFly] call _createVehicle,
		[_veh2, ([_missionPos,100,120] call BIS_fnc_relPos), _directionToFly] call _createVehicle
	];

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;
	_leader setRank "LIEUTENANT";
	
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	_aiGroup setFormation "LINE";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointFormation "VEE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh1 >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh1 >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> _veh2 >> "displayName");

	_missionHintText = format ["A formation of Jets containing two <t color='%3'>%1</t> are patrolling the island. Destroy them and recover their cargo!", _vehicleName, _vehicleName2, mainMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

_successExec =
{
	// Mission completed
	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", 50000, true];
		_cash setVariable ["owner", "world", true];
	};

	_box1 = createVehicle ["Box_EAF_WpsSpecial_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_DLC_contact"] call fn_refillbox;
	_box1 allowDamage false;
	
	private _smoke1 = "SmokeShellBlue" createVehicle getPos _box1;
	_smoke1 attachto [_box1,[0,0,-0.5]];
	private _flare1 = "F_40mm_Green" createVehicle getPos _box1;
	_flare1 attachto [_box1,[0,0,-0.5]];

	_box2 = createVehicle ["Box_T_East_WpsSpecial_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_DLC_apex"] call fn_refillbox;
	_box2 allowDamage false;
	
	private _smoke2 = "SmokeShellBlue" createVehicle getPos _box2;
	_smoke2 attachto [_box2,[0,0,-0.5]];
	private _flare2 = "F_40mm_Green" createVehicle getPos _box2;
	_flare2 attachto [_box2,[0,0,-0.5]];
	
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];

	_successHintMessage = "The sky is clear again, the enemy patrol was taken out! Ammo crates and some money have fallen near the pilot.";
};

_this call mainMissionProcessor;
