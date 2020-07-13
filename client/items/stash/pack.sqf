// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: pack.sqf
//@file Author: MercyfulFate (script code), Nurdism (idea and some code), AryX
//@file Created: 04/01/2020
//@file Description: Initialisation of Stash

if (!isServer) exitWith {};

for "_i" from 0 to 1 step 0 do { //to save performance
	{
		if (_x getVariable ["stash", false]) then {
				_player = _x getVariable ["player", objNull];
				if (!isNull _player) then {
					if (_player getVariable ["stashOn", 0] != 1) then {
						deleteVehicle _x;
					};
				} else {
				deleteVehicle _x;
			};
		};
	} forEach allSimpleObjects [];
	uiSleep 30;
};