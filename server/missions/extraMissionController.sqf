// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: sideMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST extraMissions
#define MISSION_CTRL_TYPE_NAME "EXTRA"
#define MISSION_CTRL_FOLDER "extraMissions"
#define MISSION_CTRL_DELAY (["A3W_extraMissionDelay", 17*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE extraMissionColor

#include "extraMissions\extraMissionDefines.sqf"
#include "missionController.sqf";
