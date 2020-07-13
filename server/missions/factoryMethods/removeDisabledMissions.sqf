// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: removeDisabledMissions.sqf
//	@file Author: AgentRev

private "_i";
private "_mission";
private _missionsArray = _this select 0;
private _missionTypes = _this select 1;

{
	private _publicVar = _x select 0;
	private _disabledMissions = _x select 1;

	// Reverse scan of missions array to remove types disabled according to public var
	for "_i" from (count _missionsArray - 1) to 0 step -1 do {
		_mission = _missionsArray select _i;
		if (typeName _mission == "ARRAY") then { _mission = _mission select 0 };

		if ({_mission == _x} count _disabledMissions > 0 && {!([_publicVar] call isConfigOn)}) then {
			_missionsArray deleteAt _i;
		};
	};
} forEach _missionTypes;

_missionsArray
