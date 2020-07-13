// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev, AryX
// DLC Variablee;
private _player = _this;

private _uniform = [_player, "uniform"] call getDefaultClothing;
private _goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player forceAddUniform _uniform };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";
removeAllItems _player;
removeAllWeapons _player;
removeBackpack _player;

//Level 1 Free
if (player getVariable ["bmoney",0] < 2000000) then {
	systemChat "Gear Level 1 Loaded";
	
	player call playerGearLevel1;
};

//Level 2 2.000.000
if ((player getVariable ["bmoney",0] >= 2000000) && (player getVariable ["bmoney",0] < 4000000))then {
	systemChat "Gear Level 2 Loaded";
	
	player call playerGearLevel2;
};

//Level 3 4.000.000
if ((player getVariable ["bmoney",0] >= 4000000) && (player getVariable ["bmoney",0] < 8000000))then {
	systemChat "Gear Level 3 Loaded";
	
	player call playerGearLevel3;
};

//Level 4 8.000.000
if ((player getVariable ["bmoney",0] >= 8000000) && (player getVariable ["bmoney",0] < 16000000))then {
	systemChat "Gear Level 4 Loaded";
	
	player call playerGearLevel4;
};

//Level 5 16.000.000
if ((player getVariable ["bmoney",0] >= 16000000) && (player getVariable ["bmoney",0] < 32000000))then {
	systemChat "Gear Level 5 Loaded";
	
	player call playerGearLevel5;
};

//Level 6 32.000.000
if ((player getVariable ["bmoney",0] >= 32000000) && (player getVariable ["bmoney",0] < 48000000))then {
	systemChat "Gear Level 6 Loaded";
	
	player call playerGearLevel6;
};

//Level 7 48.000.000
if ((player getVariable ["bmoney",0] >= 48000000) && (player getVariable ["bmoney",0] < 64000000))then {
	systemChat "Gear Level 7 Loaded";
	
	player call playerGearLevel7;
};

//Level 8 64.000.000
if (player getVariable ["bmoney",0] >= 64000000) then {
	systemChat "Gear Level 8 Loaded";
	
	player call playerGearLevel8;
};

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "NVGoggles";

switch (true) do {
	case (["_medic_", typeOf _player] call fn_findString != -1): {
		_player addItemToBackpack "Medikit";
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1): {
		_player addItem "Toolkit";
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1): {
		_player addWeapon "Rangefinder";
	};
};

if (_player isEqualTo player) then {
	thirstLevel = 100;
	hungerLevel = 100;
};