// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner setup and control script
//	Author: Na_Palm (BIS forums)
//	credit to: Ed! (404Forums) and [GoT] JoSchaap (GoT2DayZ.nl) for initial script
//-------------------------------------------------------------------------------------
if (!isServer) exitwith {};
private["_buildingname","_chfullfuel","_chperSpot","_class","_dbgloopTime","_dbgloopTimeplU","_dbgTime","_dbgTurns","_dbgTurnsplU","_endloop","_genZadjust","_hndl","_item","_nearLootdist","_pos","_posAdjustZ","_posAdjustZlist","_poscount","_posIdxlist","_posnew","_posOrg","_posViable","_randomweapontestint","_spawnradius","_spInterval","_testpos","_tmpBuild","_tmpPoslist","_tmpTstPlace","_z"];
//-------------------------------------------------------------------------------------
//Switch
swDebugLS = false;                  //Debug messages on/off
swSpZadjust = false;                //needed for ArmA 2 and older Maps/Buildings -> true

//-------------------------------------------------------------------------------------
//Variables
//local
#define LOOT_SPAWN_INTERVAL 5*60   //Time (in sec.) to pass before an building spawns new loot (must also change in LSclientScan.sqf)
#define CHANCES_FULL_FUEL_CAN 35    //Chance (in %) of a spawned fuelcan to be full instead of empty
#define LOOT_Z_ADJUST -0.1          //High adjustment thats generally added to every spawnpoint

_tmpTstPlace = [14730, 16276, 0];   //Coord's, in [x,y,z] of a preferably flat and unocupied piece of land

//"spawnClassChance_list" array of [%weapon, %magazine, %ICV, %backpack, %object]
//                                  %weapon     : chance weight to spawn a weapon on spot
//                                  %magazine   : chance weight to spawn magazines on spot
//                                  %ICV        : chance weight to spawn item/cloth/vests on spot
//                                  %backpack   : chance weight to spawn a backpack on spot
//                                  %object     : chance weight to spawn an world object on spot
//-------------- A VALUE OF '0' RESULTS IN NO LOOT FOR THIS CLASS AND TYPE ----------------
spawnClassChance_list =
[
	[1.0, 0.5, 0.5, 0.25, 0], // civil
	[1.0, 0.5, 0.5, 0.25, 0],  // military
	[1.0, 0.5, 0.5, 0.25, 0], // industrial
	[1.0, 0.5, 0.5, 0.25, 0]       // research
];

if (["A3W_buildingLootWeapons", 1] call getPublicVar == 0) then
{
	{
		_x set [0, 0];
		_x set [1, 0];
		_x set [2, 0];
	} forEach spawnClassChance_list;
};

if (["A3W_buildingLootSupplies", 1] call getPublicVar == 0) then
{
	{
		_x set [3, 0];
		_x set [4, 0];
	} forEach spawnClassChance_list;
};

//"exclcontainer_list" single array of container classnames to NOT to delete if filled
exclcontainer_list = ["ReammoBox_F"];

//-------------------------------------------------------------------------------------
//DONT change these, will be filled in MAIN -------------------------------------------
spawnBuilding_list = [];
Buildingpositions_list = [];
LSusedclass_list = ["GroundWeaponHolder"];
//DONT change these, will be filled in MAIN -------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
fn_getBuildingstospawnLoot = {
	#include "fn_LSgetBuildingstospawnLoot.sqf"
} call mf_compile;

LSdeleter = {
	#include "LSdeleter.sqf"
} call mf_compile;

//Buildings that can spawn loot go in this list
#include "LSlootBuildings.sqf"
//Loot goes in these lists
#include "LSlootLists.sqf"

//-------------------------------------------------------------------------------------
//function only runs once on beginning of mission, not really needs a compile
//fill spawnBuilding_list with buildingnames only
getListBuildingnames = {
	{
		spawnBuilding_list pushBack (_x select 0);
	}forEach Buildingstoloot_list;
};

//-------------------------------------------------------------------------------------
//function only runs once on beginning of mission, not really needs a compile
//get list of all Lootspawner generatable 'Worldobjects'
getUsedclasses = {
	for "_class" from 0 to ((count lootworldObject_list) - 1) do {
		for "_item" from 0 to ((count ((lootworldObject_list select _class) select 1)) - 1) do {
			if !((((lootworldObject_list select _class) select 1) select _item) in LSusedclass_list) then {
				LSusedclass_list pushBack (((lootworldObject_list select _class) select 1) select _item);
			};
			sleep 0.001;
		};
		sleep 0.001;
	};
};

//-------------------------------------------------------------------------------------
//function only runs once on beginning of mission, not really needs a compile
//fill Buildingpositions_list with [_buildingname, [_posIdxlist], [_posAdjustZlist]]
getListBuildingPositionjunction = {
	_tmpTstPlace = _this select 0;
	_randomweapontestint = 0.01;    //Sets the highintervals in which weaponpositions are tested. (Lower = slower, but more accurate. Higher = faster, but less accurate.)
	_nearLootdist = 0.5;
	{
		_buildingname = _x;
		_tmpBuild = _buildingname createVehicleLocal _tmpTstPlace;
		//check if the creation was successful
		if (isNil {_tmpBuild}) then {
			diag_log format["--!!ERROR!! LOOTSPAWNER in Buildingstoloot_list: %1 no viable object !!ERROR!!--", _buildingname];
		} else {
			//get spawnpositions from building
			_poscount = 0;
			_posAdjustZlist = [];
			_posIdxlist = [];
			_tmpPoslist = [];
			_endloop = false;
			while {!_endloop} do {
				if((((_tmpBuild buildingPos _poscount) select 0) != 0) && (((_tmpBuild buildingPos _poscount) select 1) != 0)) then {
					//counter loot piling
					_pos = _tmpBuild buildingPos _poscount;
					_posOrg = _pos;
					_posViable = false;
					if (_poscount != 0) then {
						{
							if ((_pos distance _x) > _nearLootdist) exitWith {
								_posViable = true;
							};
						}forEach _tmpPoslist;
					} else {
						_posViable = true;
					};
					_tmpPoslist pushBack _pos;
					//get Z adjustment for position
					if (_posViable) then {
						_posIdxlist pushBack _poscount;
						_posAdjustZ = 0;
						if (swSpZadjust) then {
							if(_pos select 2 < 0) then {
								_pos = [_pos select 0, _pos select 1, 1];
							};
							_z = 0;
							_posnew = _pos;
							_testpos = true;
							while {_testpos} do
							{
								if((!lineIntersects[ATLtoASL(_pos), ATLtoASL([_pos select 0, _pos select 1, (_pos select 2) - (_randomweapontestint * _z)])]) && (!terrainIntersect[(_pos), ([_pos select 0, _pos select 1, (_pos select 2) - (_randomweapontestint * _z)])]) && (_pos select 2 > 0)) then {
									_posnew = [_pos select 0, _pos select 1, (_pos select 2) - (_randomweapontestint * _z)];
									_z = _z + 1;
								} else {
									_testpos = false;
								};
							};
							_posnew = [_posnew select 0, _posnew select 1, (_posnew select 2) + 0.05];
							_posAdjustZ = (_posOrg select 2) - (_posnew select 2);
							_posAdjustZlist pushBack _posAdjustZ;
						} else {
							_posAdjustZlist pushBack _posAdjustZ;
						};
					};
					_poscount = _poscount + 1;
				} else {
					_endloop = true;
				};
			};
			//save final position Index & adjustments to list
			if (_poscount != 0) then {
				Buildingpositions_list pushBack [_buildingname, _posIdxlist, _posAdjustZlist];
			} else {
				//no_log format["-- !!LOOTSPAWNER WARNING!! in Buildingstoloot_list: %1 has no building positions --", _buildingname];
				Buildingpositions_list pushBack [_buildingname, [0], [0]];
			};
		};
		deleteVehicle _tmpBuild;
	}forEach spawnBuilding_list;
};

//-------------------------------------------------------------------------------------
// MAIN
//-------------------------------------------------------------------------------------
//no_log format["-- LOOTSPAWNER initialise ------------------------"];
if ((count Buildingstoloot_list) == 0) then {
	//no_log format["--!!ERROR!! LOOTSPAWNER Buildingstoloot_list in lootBuildings.sqf MUST have one entry at least !!ERROR!!--"];
	//no_log format["-- LOOTSPAWNER disabled --"];
} else {
	_dbgTime = diag_tickTime;
	call getListBuildingnames;

	//no_log format["-- LOOTSPAWNER spawnBuilding_list ready, d: %1s", (diag_tickTime - _dbgTime)];

	_dbgTime = diag_tickTime;
	[_tmpTstPlace] call getListBuildingPositionjunction;

	//no_log format["-- LOOTSPAWNER Buildingpositions_list ready, d: %1s", (diag_tickTime - _dbgTime)];

	_dbgTime = diag_tickTime;
	call getUsedclasses;

	//no_log format["-- LOOTSPAWNER LSusedclass_list ready, d: %1s", (diag_tickTime - _dbgTime)];

	//run loot deleter continously
	LOOT_SPAWN_INTERVAL spawn LSdeleter;
	//no_log format["-- LOOTSPAWNER LSDer started..."];

	if (swDebugLS) then {
		dbgTime = diag_tickTime;
		dbgTurns = 0;
		dbgTurnsplU = 0;
		dbgloopTime = 0;
		dbgloopTimeplU  = 0;
	};

	"pvar_spawnLootBuildings" addPublicVariableEventHandler
	{
		_buildings = [];

		{
			_building = objectFromNetId _x;

			if (!isNull _building) then
			{
				_buildings pushBack _building;
			};
		} forEach (_this select 1);

		if (count _buildings > 0) then
		{
			[_buildings, LOOT_SPAWN_INTERVAL, CHANCES_FULL_FUEL_CAN, LOOT_Z_ADJUST, ["A3W_buildingLootChances", 25] call getPublicVar] spawn fn_getBuildingstospawnLoot;
		};
	};
};
