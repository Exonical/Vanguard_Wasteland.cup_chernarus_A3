// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: serverTimeSync.sqf
//	@file Author: [404] Deadbeat, AgentRev
//	@file Created: 20/11/2012 05:19

if (!isServer) exitWith {};

_timeMultiDay = ["A3W_timeMultiplierDay", 1] call getPublicVar;
_timeMultiNight = ["A3W_timeMultiplierNight", 1] call getPublicVar;

for "_i" from 0 to 1 step 0 do {
//while {true} do { //NO WHILE
	currentDate = date;
	publicVariable "currentDate";

	if (daytime >= [19,18] select (worldName == "Stratis") || daytime < [5,7] select (worldName == "Stratis")) then {
		if (timeMultiplier != _timeMultiNight) then {
			setTimeMultiplier _timeMultiNight;
		};
	} else {
		if (timeMultiplier != _timeMultiDay) then {
			setTimeMultiplier _timeMultiDay;
		};
	};

	uiSleep 30;
};
