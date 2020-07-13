// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Description: The main init.
// Ich bin der beste by AryX
#include "debugFlag.hpp"

#ifdef A3W_DEBUG
#define DEBUG true
#else
#define DEBUG false
#endif

enableSaving [false, false];

// block script injection exploit
A3W_sessionTimeStart = diag_tickTime;

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

CHVD_allowNoGrass = false;
CHVD_allowTerrain = false; // terrain option has been disabled out from the menu due to terrible code, this variable has currently no effect
CHVD_maxView = 4200; // Set maximum view distance (default: 12000)
CHVD_maxObj = 4200; // Set maximimum object view distance (default: 12000)

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then {
	[] spawn {
		if (hasInterface) then {
			9999 cutText ["Welcome to A3Wasteland, please wait for your client to initialize", "BLACK", 0.01];

			waitUntil {!isNull player};
			player setVariable ["playerSpawning", true, true];
			playerSpawning = true;

			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;

			execVM "client\init.sqf";

			if ((vehicleVarName player) select [0,17] == "BIS_fnc_objectVar") then { player setVehicleVarName "" }; // undo useless crap added by BIS
		} else {
			waitUntil {!isNull player};
			if (getText (configFile >> "CfgVehicles" >> typeOf player >> "simulation") == "headlessclient") then
			{
				execVM "client\headless\init.sqf";
			};
		};
	};
};

if (isServer) then {
	[] execVM "\waste_server\init.sqf";
	diag_log "WASTE SERVER - Init Loaded";
	//no_log format ["############################# %1 #############################", missionName];
	//no_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
	diag_log "WASTELAND SERVER - Init Loaded";
};

if (hasInterface || isServer) then {
	//init 3rd Party Scripts
	[] execVM "addons\parking\functions.sqf";
	[] execVM "addons\storage\functions.sqf";
	[] execVM "addons\vactions\functions.sqf";
	[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
	
	[] execVM "addons\outOfBounds\outOfBoundsPlayer.sqf";
  	[] execVM "addons\outOfBounds\outOfBoundsHeli.sqf";
  	[] execVM "addons\outOfBounds\outOfBoundsPlane.sqf";
  	[] execVM "addons\outOfBounds\outOfBoundsShip.sqf";
  	[] execVM "addons\outOfBounds\outOfBoundsLandVehicle.sqf";
  	[] execVM "addons\outOfBounds\outOfBoundsRemote.sqf";
	//[] execVM "addons\proving_ground\init.sqf";
	
	[] execVM "addons\proving_ground\init.sqf";
	[] execVM "addons\JumpMF\init.sqf";
	[] execVM "addons\outlw_magrepack\MagRepack_init.sqf";
	[] execVM "addons\lsd_nvg\init.sqf";
	[] execVM "addons\stickyCharges\init.sqf";
	
	// noAim Stuff
	[] execVM "addons\APOC_Airdrop_Assistance\init.sqf";  // Airdrop
	[] execVM "addons\JTS_PM\Functions.sqf";			  // messages
	[] execVM "addons\scripts\HvT.sqf";                   // High Value Target
	[] execVM "addons\scripts\HvD.sqf";
	[] execVM "addons\scripts\initGrenades.sqf"; 		  // Toxic Gas Grenades
	[] execVM "addons\zlt_fastrope\zlt_fastrope.sqf";     // Fastrope
	if (isNil "drn_DynamicWeather_MainThread") then { drn_DynamicWeather_MainThread = [] execVM "addons\scripts\DynamicWeatherEffects.sqf" };
	[] execVM "addons\laptop\init.sqf";
	[] execVM "addons\noaim\intro.sqf";
	[] execVM "addons\bounty\init.sqf";
	[] execVM "addons\noaim\repetitive_cleanup.sqf";
};

// Remove line drawings from map
(createTrigger ["EmptyDetector", [0,0,0], false]) setTriggerStatements
[
	"!triggerActivated thisTrigger", 
	"thisTrigger setTriggerTimeout [30,30,30,false]",
	"{if (markerShape _x == 'POLYLINE') then {deleteMarker _x}} forEach allMapMarkers"
];

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		sleep 10;
		0 setFog 0;
		0 setRain 0;
		0 setOvercast 0;
		forceWeatherChange;
		200 setFog 0;
		200 setRain 0;
		200 setOvercast 0;
		sleep 590;
	};
};

// Clean Up
[
	7*60 //Suitcases Cleanup
] execVM "addons\noaim\clean.sqf";
[] execVM "addons\scripts\ir_to_incendiary.sqf";