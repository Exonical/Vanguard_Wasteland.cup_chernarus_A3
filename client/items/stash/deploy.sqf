// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: deploy.sqf
//@file Author: MercyfulFate (script code), Nurdism (idea and some code), AryX
//@file Created: 04/01/2020
//@file Description: Initialisation of Stash

_dice = selectRandom [1,2];

_bush = createSimpleObject ["A3\plants_f\Bush\b_FicusC1s_F.p3d", [0,0,0]];

switch (_dice) do {
	case 1: {
		_bush = createSimpleObject ["A3\plants_f\Bush\b_FicusC1s_F.p3d", [0,0,0]];
		_bush attachTo [_this, [0.7, 0.5, 0.5]];
	};
	case 2: {
		_bush = createSimpleObject ["A3\plants_f\Bush\b_neriumo2d_F.p3d", [0,0,0]];
		_bush attachTo [_this, [0.5, 0.5, 0.5]];
	};
};

_bush setVariable ["stash", true, true];
_bush setVariable ["player", _this, true];

_this setVariable ["stashOn", 1, true];
_this setAnimSpeedCoef 0.5;
_this allowSprint false;

waitUntil {
	_break = false;

	switch (true) do {
		case (!alive _this): { _break = true };
		case (vehicle _this != _this):{ _break = true };
		case (_this getVariable ["stashOn", 0] != 1):{ _break = true };
		case (_this call A3W_fnc_isUnconscious):{ _break = true };
	};
	_break;
};

deleteVehicle _bush;
_this setAnimSpeedCoef 1;
_this allowSprint true;
_this setVariable ["stashOn", 0, true];