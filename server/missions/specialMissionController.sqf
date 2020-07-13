// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: sideMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST specialMissions
#define MISSION_CTRL_TYPE_NAME "SPECIAL"
#define MISSION_CTRL_FOLDER "specialMissions"
#define MISSION_CTRL_DELAY (["A3W_specialMissionDelay", 17*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE specialMissionColor

#include "specialMissions\specialMissionDefines.sqf"
#include "missionController.sqf";
