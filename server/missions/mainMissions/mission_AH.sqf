// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_MBT.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitWith {};
#include "mainMissionDefines.sqf";

private "_vehicleClass";
private "_nbUnits";

_setupVars =
{
	_vehicleClass = selectRandom
	[
		["O_Heli_Attack_02_dynamicLoadout_F", "KajmanAG"],
		["O_Heli_Attack_02_dynamicLoadout_F", "KajmanDelta"],
		["B_Heli_Light_01_dynamicLoadout_F", "pawneeGun"],
		["B_Heli_Light_01_dynamicLoadout_F", "pawneeDelta"],
		["B_Heli_Light_01_dynamicLoadout_F", "pawneeNormal"]
	];
	
	_missionType = "Attack Helicopter";

	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
