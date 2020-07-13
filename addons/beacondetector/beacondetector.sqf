//	@file Version: 1.0
//	@file Name: beacondetector.sqf
//	@file Author: wiking.at
//	Allows tracking of spawn beacons
// Check if script is already active
if (BeaconScanInProgress) exitWith {
	["You are already performing another device scan.", 5] call mf_notify_client;
};

_beaconsnear = nearestObjects [player, ["Land_Tentdome_F", "Land_HandyCam_F", "Land_Device_assembled_F"], 500];

if ((count _beaconsnear) > 0 ) then {
	
	playSound "beep9"; ["Device found - tracking started.", 5] call mf_notify_client;
	BeaconScanInProgress = true;
	Beaconscanstop = false;
	
	_distance = 0; //init distance
	
	while {_distance < 500} do {	
		_beaconsnear = nearestObjects [player, ["Land_Tentdome_F", "Land_HandyCam_F", "Land_Device_assembled_F"], 500];
		
		if (Beaconscanstop) exitWith {
			playSound "beep9";
			["Device scan interrupted.", 5] call mf_notify_client;
			BeaconScanInProgress = false;
		};
		
		if (count _beaconsnear == 0) exitWith {
			playSound "beep9";
			["No devices in detector range.", 5] call mf_notify_client;
			BeaconScanInProgress = false;
		};
		
		_nearestbeacon = _beaconsnear select 0;
		_distance = player distance _nearestbeacon;
		_dir = getDir (vehicle player);
		_degree = ((getPos _nearestbeacon select 0) - (getPos player select 0)) atan2 ((getPos _nearestbeacon select 1) - (getPos player select 1));
		if (_degree < 0) then { _degree = _degree + 360};
		_difference = _degree - _dir;
		if (_difference > 180) then { _difference = _difference - 360};
		if (_difference < -180) then { _difference = _difference + 360};
		_adjusteddiff = (abs _difference);
		_beepfreq = ((_adjusteddiff / 50) + 0.25);	
		
		switch (true) do {
			case (_distance < 6) : {playSound "beep6";};
			case (_distance < 10) : {playSound "beep5";};
			case (_distance < 20) : {playSound "beep4";};
			case (_distance < 30) : {playSound "beep3";};
			case (_distance < 50) : {playSound "beep2";};
			case (_distance < 100) : {playSound "beep";};
			default {
				//default case should not happen
				playSound "beep9";
				["There was a malfunction of your device detector.", 5] call mf_notify_client;
			};
		};
		sleep _beepfreq;	
	};
} else {
	playSound "beep9";
	["No device in detector range.", 5] call mf_notify_client;
};