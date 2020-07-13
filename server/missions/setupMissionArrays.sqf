// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

// Mission filename, spawnrate

MainMissions = [
	["mission_ArmedDiversquad", 1],
	["mission_Coastal_Convoy", 1],
	["mission_Convoy", 1],
	["mission_HostileHeliFormation", 1],
	["mission_HostileJetFormation", 1],
	["mission_APC", 1],
	["mission_MBT", 1],
	["mission_AbandonedJet", 1],
	["mission_wreckedUAV", 0.5],
	["mission_wreckedJet", 0.5],
	["mission_ArmedHeli", 1],
	["mission_CivHeli", 1],
	["mission_AH", 1],
	["mission_ArmedJet", 1],
	["mission_LightTank", 1],
	["mission_SealTeams", 1]
];

SideMissions = [
	["mission_HostileHelicopter", 0.5],
	["mission_HostileJet", 0.5],
	["mission_MiniConvoy", 1],
	["mission_SunkenSupplies", 1],
	["mission_TownInvasion", 1],
	["mission_Outpost", 1],
	["mission_Truck", 1],
	["mission_diplomats", 1],
	["mission_drugsRunners", 1],
	["mission_GeoCache", 1],
	["mission_Smugglers", 1],
	["mission_Sniper", 1],
	["mission_Roadblock", 1],
	["mission_WepCache", 1],
	["mission_FakePolice", 1],
	["mission_Cobra", 0.5],
	["mission_BountyHunter", 1]
];

MoneyMissions = [
	["mission_MoneyShipment", 1],
	["mission_SunkenTreasure", 1],
	["mission_NavySeals", 1],
	["mission_militaryPatrol", 1],
	["mission_armaPatrol", 1],
	["mission_BankRobbery", 1],
	["mission_SkySmuggler", 1],
	["mission_CrimesofWar", 1]
];

ExtraMissions = [
	["mission_DeltaForce", 1],
	["mission_SpecOps", 1],
	["mission_Spetsnaz", 1],
	["mission_Assassin", 1],
	["mission_HnS", 1],
	["mission_HostageRescue", 1],
	["mission_HostilePlane", 1],
	["mission_TransportHeli", 0.5],
	["mission_WepDeal", 1],
	["mission_InfGroup", 1],
	["mission_Pawnee", 1],
	["mission_Fishie", 1],
	["mission_Thunder", 1],
	["mission_Falcon", 0.2],
	["mission_Graveyard", 1],
	["mission_BlackHawkDown", 1]
];

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};
RoadblockMissionMarkers = (allMapMarkers select {["Roadblock_", _x] call fn_startsWith}) apply {[_x, false]};
SniperMissionMarkers = (allMapMarkers select {["Sniper_", _x] call fn_startsWith}) apply {[_x, false]};
PatrolMissionMarkers = (allMapMarkers select {["Patrol_", _x] call fn_startsWith}) apply {[_x, false]};
ClearMissionMarkers = (allMapMarkers select {["Clear_", _x] call fn_startsWith}) apply {[_x, false]};
AirstripMissionMarkers = (allMapMarkers select {["Airstrip_", _x] call fn_startsWith}) apply {[_x, false]};
IslandMissionMarkers = (allMapMarkers select {["Island_", _x] call fn_startsWith}) apply {[_x, false]};
WaterMissionMarkers = (allMapMarkers select {["Water_", _x] call fn_startsWith}) apply {[_x, false]};
FuelstationMissionMarkers = (allMapMarkers select {["Fuelstation_", _x] call fn_startsWith}) apply {[_x, false]};
TrainMissionMarkers = (allMapMarkers select {["Train_", _x] call fn_startsWith}) apply {[_x, false]};

if !(ForestMissionMarkers isEqualTo []) then {
	SideMissions append [
		["mission_AirWreck", 3],
		["mission_WepCache", 3]
	];
};

LandConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf") apply {[_x, false]};
CoastalConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf") apply {[_x, false]};

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation", "mission_HostileJetFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;
{ _x set [2, false] } forEach ExtraMissions;
/*
MissionSpawnMarkers = [];
SniperMissionMarkers = [];
RoadblockMissionMarkers = [];
PatrolMissionsMarkers = [];
{
	switch (true) do {
		case (["Mission_", _x] call fn_startsWith): {
			MissionSpawnMarkers pushBack [_x, false];
		};
		case (["Sniper_", _x] call fn_startsWith): {
			SniperMissionMarkers pushBack [_x, false];
		};
		case (["RoadBlock_", _x] call fn_startsWith): {
			RoadblockMissionMarkers pushBack [_x, false];
		};
		case (["Patrol_", _x] call fn_startsWith): {
			PatrolMissionsMarkers pushBack [_x, false];
		};
	};
} forEach allMapMarkers;*/