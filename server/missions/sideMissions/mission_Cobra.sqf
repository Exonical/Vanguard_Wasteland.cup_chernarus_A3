// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Cobra.sqf
//	@file Author: AryX
//	@file Version: 0.4
//	@file Description: Cobra Extra-Mission

if (!isServer) exitWith {};
#include "sideMissionDefines.sqf"

private ["_planeChoices", "_veh", "_randVeh", "_vehVar", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash", "_box1", "_box2"];

_setupVars = {
	_missionType = "Cobra maneuver!";
	_locationsArray = nil;
};

_setupObjects = {
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);
	
	_randVeh = // Blackwasp
	[
		["B_Plane_Fighter_01_F", "blackwaspAA"],
		["B_Plane_Fighter_01_F", "blackwaspCAS"],
		["B_Plane_Fighter_01_F", "blackwaspXL"],
		["O_Plane_Fighter_02_F", "shikraXL"],
		["O_Plane_Fighter_02_F", "shikraEX"],
		["O_Plane_Fighter_02_F", "shikraCAS"],
		["O_Plane_Fighter_02_Stealth_F", "shikraDEF"],
		["I_Plane_Fighter_04_F", "GryphonXL"],
		["I_Plane_Fighter_04_F", "GryphonAA"],
		["I_Plane_Fighter_04_F", "GryphonCAS"]
	];
	_vehVar = _randVeh call BIS_fnc_selectRandom;

	_veh = _vehVar select 0;

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_variant", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;
		_variant = _type param [1,"",[""]];

		if (_type isEqualType []) then
		{
			_type = _type select 0;
		};

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"]; // Added to make it fly
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		
		if (_variant != "") then
		{
			_vehicle setVariable ["A3W_vehicleVariant", _variant, true];
		};
		
		[_vehicle] call vehicleSetup;
		
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

			//_vehicle addMagazineTurret ["60Rnd_CMFlare_Chaff_Magazine", [-1]];
		};
		
		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles =
	[
		[_veh, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0] call _createVehicle
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
		_waypoint setWaypointCombatMode "GREEN";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointFormation "VEE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh >> "displayName");

	_missionHintText = format ["OH Damn <t color='%4'>%1</t> has been spotted! <br/>Bring it down! NOW!! or it will kill you, oh by the way take its cargo!", _vehicleName, sideMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	//Money
	for "_i" from 1 to 12 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", 50000, true];
		_cash setVariable ["owner", "world", true];
	};

	_box1 = createVehicle ["Box_IND_Ammo_F", _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_Gear_Ammo"] call fn_refillbox;

	_box2 = createVehicle ["Box_IND_WpsSpecial_F", _lastPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_LMGs1"] call fn_refillbox;
	
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];

	_successHintMessage = "Cobra maneuver! oh i meant, the Jet came down!";
};

_this call extraMissionProcessor;
