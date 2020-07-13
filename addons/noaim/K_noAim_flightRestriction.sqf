/*

	File: K_noAim_flightRestriction.sqf
	Author: Kohjin
	Description: Restrict players flying above a certain height
	
*/

// CHANGE THIS VARIABLE TO SET MAXIMUM HEIGHT (meters)
K_noAim_maxHeight = 1500;
// CHANGE THIS VARIABLE TO SET THE TIME TO GET BELOW THE MAXIMUM HEIGHT OR BE KILLED (seconds)
K_noAim_timeToLeave = 60;

// VARIABLE TO CONFIRM MAX ALTITUDE BREACH
K_noAim_maximumAltitudeBreachDetected = false;

// FUNCTION TO HANDLE PLAYER BEING ABOVE THE MAX HEIGHT

K_noAim_handlePlayerAboveMaxAltitude = {
	if !(K_noAim_maximumAltitudeBreachDetected) then {

		K_noAim_maximumAltitudeBreachDetected = true;

		[] spawn {
			
			["<t color='#ff0000' size = '.8'>Warning!<br /></t><t color='#FFFFFF' size = '.8'>You are above the max. altitude! Get below 1500m immediately!</t>",-1,-0.1,60,1,0,789] spawn BIS_fnc_dynamicText;

			for [{_I=0},{_I!=K_noAim_timeToLeave},{_I=_I+1}] do {
				scopeName "loop";

				if (((getPosASL player) select 2) <= K_noAim_maxHeight) then {
					breakOut "loop";
				};
				
				[parseText format ["<t font='PuristaBold' size='1.6'>%1</t>",(K_noAim_timeToLeave-_I)], [0.462,0.05,1,1], nil, 1, 0, 0] spawn BIS_fnc_textTiles; 

				sleep 1;
			};
			
			if (((getPosASL player) select 2) >= K_noAim_maxHeight) then {
				(vehicle player) setDamage 1;
			};

			K_noAim_maximumAltitudeBreachDetected = false;

			["", -1, -1, 1, 0, 0, 789] spawn BIS_fnc_dynamicText;
			["", [0.4,0.05,1,1], nil, 0, 0, 0] spawn BIS_fnc_textTiles; 

		};
	};
};


for "_i" from 0 to 1 step 0 do {

	if ((vehicle player) != player) then { // Player in vehicle
		if ((vehicle player) isKindOf "Air") then {
			if (((getPosASL player) select 2) >= K_noAim_maxHeight) then {

				call K_noAim_handlePlayerAboveMaxAltitude;

			};
		};
	};

	sleep 10;
};
