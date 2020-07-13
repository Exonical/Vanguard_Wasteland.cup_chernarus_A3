// ******************************************************************************************
// * Copyright © 2019 Nurdism                                                               *
// ******************************************************************************************
//	@file Name: cleanupObjects.sqf
//	@file Author: Nurdism

if (!isServer) exitWith { _this remoteExecCall ["A3W_fnc_cleanupObjects", 2] };

params [["_player",objNull,[objNull]], ["_type", "", ["0"]], ["_classes", [], [[]]]];

if (isNull _player) exitWith {};
if (isRemoteExecuted && remoteExecutedOwner != clientOwner && !([_player, 4] call A3W_fnc_isAdmin) && (remoteExecutedOwner != owner _player || !(_player isKindOf "Man"))) exitWith {
	["forged cleanupObjects", _this] call A3W_fnc_remoteExecIntruder;
};

_center = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

switch (_type) do {
  case "bodies": {
    _count = 0;
    {
      deleteVehicle _x;
      _count = _count + 1;
	  } forEach (allDeadMen);
    diag_log format ["[ADMIN CLEANUP] - CLEANED UP %1 DEAD BODY(IES)", _count];
    format ["CLEARED %1 DEAD BODY(IES)", _count] remoteExecCall ["hint", _player];
  };
  case "money": {
    _count = 0;
    _ammount = _classes select 0;
    {
      if ((typeof _x) == "Land_Money_F" && _x getVariable ["cmoney", 0] < _ammount) then {
        deleteVehicle _x;
        _count = _count + 1;
      };
    } forEach allMissionObjects "";
    diag_log format ["[ADMIN CLEANUP] - CLEANED UP %1 MONEY OBJECT(S) < %2", _count, _ammount];
    format ["CLEARED %1 MONEY OBJECT(S) < %2", _count, _ammount] remoteExecCall ["hint", _player];
  };
  case "vehicles": {
    _count = 0;
    {
      if(_x == vehicle _x) then {
         deleteVehicle _x;
        _count = _count + 1;
      };
    } forEach (allDead - allDeadMen);
    {
      if((!canMove _x || ["quadbike", (typeof _x)] call UTILS_fnc_inString) && { alive _x } count crew _x == 0) then {
        deleteVehicle _x;
        _count = _count + 1;
      }
	  } forEach (vehicles);
    diag_log format ["[ADMIN CLEANUP] - CLEANED UP %1 VEHICLE(S)", _count];
    format ["CLEARED %1 VEHICLE(S)", _count] remoteExecCall ["hint", _player];
  };
  case "mines": {
    _count = 0;
    {
      deleteVehicle _x;
      _count = _count + 1;
    } forEach allMines;
    diag_log format ["[ADMIN CLEANUP] - CLEANED UP %1 MINE(S)", _count];
    format ["CLEARED %1 MINE(S)", _count] remoteExecCall ["hint", _player];
  };
  case "mission": {
    _count = 0;
    {
      if (_x getVariable ["A3W_Cleanup", -1] > 0) then {
        deleteVehicle _x;
        _count = _count + 1;
      }
    } forEach allMissionObjects "";
    diag_log [format ["[ADMIN CLEANUP] - CLEANED UP %1 MISSION OBJECT(S)", _count], _classes];
    format ["CLEARED %1 MISSION OBJECT(S)", _count] remoteExecCall ["hint", _player];
  };
  default {
    _count = 0;
    {
      if ((typeof _x) in _classes) then {
        deleteVehicle _x;
        _count = _count + 1;
      };
    } forEach allMissionObjects "";
    diag_log [format ["[ADMIN CLEANUP] - CLEANED UP %1 OBJECT(S) [%2]", _count, _type], _classes];
    format ["CLEARED %1 OBJECT(S) (%2)", _count, toUpper (_type)] remoteExecCall ["hint", _player];
  };
};
