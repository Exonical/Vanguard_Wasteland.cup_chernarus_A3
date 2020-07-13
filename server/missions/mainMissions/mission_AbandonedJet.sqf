// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
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
		["I_Plane_Fighter_03_dynamicLoadout_F", "buzzardEX"],
		["I_Plane_Fighter_03_dynamicLoadout_F", "buzzardCAS"],
		["I_Plane_Fighter_04_F", "GryphonXL"],
		["I_Plane_Fighter_04_F", "GryphonAA"],
		["B_Plane_Fighter_01_F", "blackwaspCAS"],
		["B_Plane_Fighter_01_F", "blackwaspXL"],
		["O_Plane_Fighter_02_Stealth_F", "shikraDEF"],
		["O_Plane_Fighter_02_F", "shikraEX"],
		"B_Plane_CAS_01_dynamicLoadout_F",
		"O_Plane_CAS_02_dynamicLoadout_F",
		["O_T_VTOL_02_infantry_dynamicLoadout_F", "xianAntiInf"]
	];

	_missionType = "Abandoned Jet";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
