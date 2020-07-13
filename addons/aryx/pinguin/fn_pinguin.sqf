/*
	Author: AryX
	Description: Spawns Pinguins

if (!isMultiplayer) exitWith {};
_pinguin1 = briefingName;
if (_pinguin1 != "A3Wasteland Stratis v1.4d/e #25") exitWith {
	[] spawn {
		while {true} do {
			_layer = "normal" cutText ["You spawned Pinguins!","PLAIN"];
			sleep 30;
			if(vehicle player != player) then { vehicle player setDamage 1; };
			_veh = "Bo_GBU12_LGB" createVehicle position player;
			sleep 5;
			_layer = "normal" cutText ["You spawned Pinguins!","PLAIN"];
			player setDamage 1;
			sleep 2;
			"shit" cutText ["", "BLACK", 0.5, true];
			sleep 10;
			["pinguins",false,true] call BIS_fnc_endMission;
		};
	};
};
*/