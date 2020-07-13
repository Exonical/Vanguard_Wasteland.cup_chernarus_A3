//Client Function for Airdrop Assistance (not really a function, as it is called via ExecVM from command menu)
//This takes values from command menu, and some passed variables, and interacts with client and sends commands to server
//Author: Apoc
//Credits: Some methods taken from Cre4mpie's airdrop scripts, props for the idea!
//Starts off much the same as the client start.  This is to find information from config arrays

private _type = _this select 0;
private _selectionNumber = _this select 1;
private _player = _this select 2;
private _heliDirection = _this select 3;

//diag_log format ["SERVER - Apoc's Airdrop Assistance - Player: %1, Drop Type: %2, Selection #: %3",name _player,_type,_selectionNumber];

_selectionArray = [];

switch (_type) do {
	case "vehicle": {_selectionArray = APOC_AA_VehOptions};
	case "vehicle2": {_selectionArray = APOC_AA_Veh2Options};
	case "vehicle3": {_selectionArray = APOC_AA_Veh3Options};
	case "vehicle4": {_selectionArray = APOC_AA_Veh4Options};
	case "supply": 	{_selectionArray = APOC_AA_SupOptions};
	default 		{_selectionArray = APOC_AA_VehOptions};
};

_selectionName 	= (_selectionArray select _selectionNumber) select 0;
_selectionClass = (_selectionArray select _selectionNumber) select 1;
_price 			= (_selectionArray select _selectionNumber) select 2;

private _memberLevel = player getVariable ["memberLevel", 0];

if (_memberLevel isEqualTo 1) then {
	_price = _price * 0.9;
};

_heliType = "B_Heli_Transport_03_unarmed_F";
_center = createCenter civilian;
_grp = createGroup civilian;
if (isNil("_grp2")) then{_grp2 = createGroup civilian;} else {_grp2 = _grp2;};
_flyHeight = 350;
_dropSpot = [(position _player select 0),(position _player select 1),_flyHeight];
_heliDirection = random 360;
_flyHeight = 200;  //Distance from ground that heli will fly at
_heliStartDistance = 2000;
_spos = [(_dropSpot select 0) - (sin _heliDirection) * _heliStartDistance, (_dropSpot select 1) - (cos _heliDirection) * _heliStartDistance, (_flyHeight+200)];

// diag_log format ["AAA - Heli Spawned at %1", _spos];
_heli = createVehicle [_heliType, _spos, [], 0, "FLY"];
_heli allowDamage false;
_heli setVariable ["R3F_LOG_disabled", true, true];
[_heli] call vehicleSetup;

_crew = [_grp, _spos] call createRandomSoldierC;
_crew moveInDriver _heli;
_crew allowDamage false;
_crew setVariable ["NOAI",1,false];  //Disable VCOM for Airdrop Pilot. Just in Case.

_heli setCaptive true;

_heliDistance = 2000;
_dir = ((_dropSpot select 0) - (_spos select 0)) atan2 ((_dropSpot select 1) - (_spos select 1));
_flySpot = [(_dropSpot select 0) + (sin _dir) * _heliDistance, (_dropSpot select 1) + (cos _dir) * _heliDistance, _flyHeight];

_grp setCombatMode "BLUE";
_grp setBehaviour "CARELESS";

{_x disableAI "AUTOTARGET"; _x disableAI "TARGET"; _x disableAI "SUPPRESSION"; _x disableAI "AUTOCOMBAT";} forEach units _grp;

_wp0 = _grp addWaypoint [_dropSpot, 0, 1];
[_grp,1] setWaypointBehaviour "CARELESS";
[_grp,1] setWaypointCombatMode "BLUE";
[_grp,1] setWaypointCompletionRadius 20;
_wp1 = _grp addWaypoint [_flySpot, 0, 2];
[_grp,2] setWaypointBehaviour "CARELESS";
[_grp,2] setWaypointCombatMode "BLUE";
[_grp,2] setWaypointCompletionRadius 20;
_heli flyInHeight _flyHeight;

//////// Create Purchased Object //////////////////////////////////////////////
_object = switch (_type) do {
	case "vehicle": { 
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle [_selectionClass, _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];			
   		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["ownerUID", getPlayerUID _player, true];
		[_object, false] call vehicleSetup;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		if (["A3W_vehicleLocking"] call isConfigOn) then {
			[_object, 2] call A3W_fnc_setLockState; // Lock
		};
		_object
	};

	case "vehicle2": { 
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle [_selectionClass, _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];			
   		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["A3W_purchasedVehicle", true, true];
		_object setVariable ["ownerUID", getPlayerUID _player, true];
		[_object, false] call vehicleSetup;
		if (_object getVariable ["A3W_purchasedVehicle", false] && !isNil "fn_manualVehicleSave") then {
			_object call fn_manualVehicleSave;
		};
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		if (["A3W_vehicleLocking"] call isConfigOn) then {
			[_object, 2] call A3W_fnc_setLockState; // Lock
		};
		_object
	};
	
	case "vehicle3": { 
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle [_selectionClass, _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];			
   		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["A3W_purchasedVehicle", true, true];
		_object setVariable ["ownerUID", getPlayerUID _player, true];
		[_object, false] call vehicleSetup;
		if (_object getVariable ["A3W_purchasedVehicle", false] && !isNil "fn_manualVehicleSave") then {
			_object call fn_manualVehicleSave;
		};
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		if (["A3W_vehicleLocking"] call isConfigOn) then {
			[_object, 2] call A3W_fnc_setLockState; // Lock
		};
		_object
	};
	
	case "vehicle4": { 
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle [_selectionClass, _objectSpawnPos, [], 0, "None"];
		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];			
   		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["A3W_purchasedVehicle", true, true];
		_object setVariable ["ownerUID", getPlayerUID _player, true];
		[_object, false] call vehicleSetup;
		if (_object getVariable ["A3W_purchasedVehicle", false] && !isNil "fn_manualVehicleSave") then {
			_object call fn_manualVehicleSave;
		};
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		if (["A3W_vehicleLocking"] call isConfigOn) then {
			[_object, 2] call A3W_fnc_setLockState; // Lock
		};
		_object
	};

	case "supply": {
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["C_IDAP_supplyCrate_F", _objectSpawnPos, [], 0, "None"];
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object setVariable ["R3F_LOG_disabled",false,true];
		[_object, _selectionClass] call fn_refillbox;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
	};
	
	case "base": {
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Land_CargoBox_V1_F", _objectSpawnPos, [], 0, "None"];
		_object allowDamage false;
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		clearBackpackCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		clearWeaponCargoGlobal _object;
		clearItemCargoGlobal _object;
		[_object, [["Land_Canal_Wall_Stairs_F", 2],["Land_BarGate_F", 2],["Land_Cargo_Patrol_V1_F", 2],["Land_HBarrier_3_F", 4],["Land_Canal_WallSmall_10m_F", 6],["Land_LampShabby_F", 10], ["Land_RampConcrete_F",1],["Land_Crash_barrier_F",4],["B_HMG_01_high_F",1],["B_Quadbike_01_F",2]] ] execVM "addons\R3F_LOG\auto_load_in_vehicle.sqf";
		_object
	};
	
	case "base1": {
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Land_Cargo20_yellow_F", _objectSpawnPos, [], 0, "None"];
		_object allowDamage false;
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		clearBackpackCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		clearWeaponCargoGlobal _object;
		clearItemCargoGlobal _object;
		[_object, ["Land_Cargo_Tower_V1_F", ["Land_Canal_Wall_Stairs_F", 4],["Land_BarGate_F", 2],["Land_Cargo_Patrol_V1_F", 2],["Land_HBarrierWall6_F", 4],["Land_Canal_WallSmall_10m_F", 10],["Land_LampShabby_F", 10], ["Land_RampConcreteHigh_F",2], ["Land_RampConcrete_F", 2],["Land_Crash_barrier_F",6],["I_GMG_01_F",2],["B_static_AA_F",1],["B_static_AT_F",1],["B_Quadbike_01_F",4]] ] execVM "addons\R3F_LOG\auto_load_in_vehicle.sqf";
		_object
	};
	
	case "base2": {
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Land_Cargo40_white_F", _objectSpawnPos, [], 0, "None"];
		_object allowDamage false;
		_object setVariable ["A3W_purchasedStoreObject", true];
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		clearBackpackCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		clearWeaponCargoGlobal _object;
		clearItemCargoGlobal _object;
		[_object, [["Land_Cargo_Tower_V1_F",2],["Land_GH_Platform_F",10],["Land_Canal_Wall_Stairs_F", 10],["Land_BarGate_F", 4],["Land_Cargo_Patrol_V1_F", 4],["Land_HBarrierWall6_F", 10],["Land_Canal_WallSmall_10m_F", 20],["Land_LampHalogen_F", 10], ["Land_RampConcreteHigh_F",4], ["Land_RampConcrete_F", 4],["Land_Crash_barrier_F",6],["B_GMG_01_F",2],["B_static_AA_F",2],["B_static_AT_F",2],["B_Quadbike_01_F",4],["C_Heli_light_01_digital_F",1]] ] execVM "addons\R3F_LOG\auto_load_in_vehicle.sqf";
		_object
	};
	
	default {
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["B_supplyCrate_F", _objectSpawnPos, [], 0, "None"];
		_object setVariable ["A3W_purchasedStoreObject", true];
		[_object, "mission_Weapon1"] call fn_refillbox;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
	};
};
_object allowDamage false; //Let's not let these things get destroyed on the way there, shall we?

//diag_log format ["Apoc's Airdrop Assistance - Object at %1", position _object];  //A little log love to confirm the location of this new creature

for "_i" from 0 to 1 step 0 do {
	sleep 0.1;
	if (currentWaypoint _grp >= 2) exitWith {};  //Completed Drop Waypoint
};

// Let's handle the money after this tricky spot - This way players won't be charged for non-delivered goods!
_playerMoney = _player getVariable ["bmoney", 0];
if (_price > _playerMoney) exitWith {
	{ _x setDamage 1; } forEach units _grp;
	_heli setDamage 1;
	_object setDamage 1;
	//diag_log format ["Apoc's Airdrop Assistance - Player Account Too Low, Drop Aborted. %1. Bank:$%2. Cost: $%3", _player, _playerMoney, _price];  //A little log love to mark the Scallywag who tried to cheat the valiant pilot
};

//Server Style Money handling
_balance = _player getVariable ["bmoney", 0];
_newBalance = _balance - _price;
_player setVariable ["bmoney", _newBalance, true];
[getPlayerUID _player, [["BankMoney", _newBalance]], []] call fn_saveAccount;

//  Now on to the fun stuff:

//diag_log format ["Apoc's Airdrop Assistance - Object at %1, Detach Up Next", position _object];  //A little log love to confirm the location of this new creature
playSound3D ["a3\sounds_f\air\sfx\SL_rope_break.wss",_heli,false,getPosASL _heli,3,1,500];
detach _object;  //WHEEEEEEEEEEEEE
_objectPosDrop = position _object;
_heli fire "CMFlareLauncher";
_heli fire "CMFlareLauncher";

sleep 2;
playSound3D ["a3\sounds_f\sfx\radio\ambient_radio22.wss",_player,false,getPosASL _player,3,1,25];

//Delete heli once it has proceeded to end point
[_heli,_grp,_flySpot,_dropSpot,_heliDistance] spawn {
	private _heli = _this select 0;
	private _grp = _this select 1;
	private _flySpot = _this select 2;
	private _dropSpot = _this select 3;
	private _heliDistance = _this select 4;
	while{([_heli, _flySpot] call BIS_fnc_distance2D)>200}do{
		if(!alive _heli || !canMove _heli)exitWith{};
		sleep 5;
	};
	waitUntil{([_heli, _dropSpot] call BIS_fnc_distance2D)>(_heliDistance * .5)};
	{ deleteVehicle _x; } forEach units _grp;
	deleteVehicle _heli;
};

//Time based deletion of the heli, in case it gets distracted
[_heli,_grp] spawn {
	private _heli = _this select 0;
	private _grp = _this select 1;
	sleep 30;
	if (alive _heli) then {
		{ deleteVehicle _x; } forEach units _grp;
		deleteVehicle _heli;
	};
};

waitUntil {(((position _object) select 2) < (_flyHeight-20))};
_heli fire "CMFlareLauncher";
_objectPosDrop = position _object;
_para = createVehicle ["B_Parachute_02_F", _objectPosDrop, [], 0, "NONE"];
_object attachTo [_para,[0,0,0]];

_smoke1 = "SmokeShellBlue" createVehicle getPos _object;
_smoke1 attachTo [_object,[0,0,-0.5]];
_flare1 = "F_40mm_Green" createVehicle getPos _object;
_flare1 attachTo [_object,[0,0,-0.5]];

waitUntil {((((position _object) select 2) < 10) || (isNil "_para"))};
detach _object;
_smoke2 = "SmokeShellBlue" createVehicle getPos _object;
_flare2 = "F_40mm_Green" createVehicle getPos _object;
sleep 2;
		
if (_type isEqualTo "vehicle") then {_object allowDamage true;}; //Turn on damage for vehicles once they're in the 'chute.  Could move this until they hit 
if (_type isEqualTo "vehicle2") then {_object allowDamage true;};
if (_type isEqualTo "vehicle3") then {_object allowDamage true;};
if (_type isEqualTo "vehicle4") then {_object allowDamage true;};