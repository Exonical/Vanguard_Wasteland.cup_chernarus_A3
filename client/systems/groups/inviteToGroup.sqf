// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: inviteToGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

if(player != leader group player) exitWith {player globalChat format["you are not the leader and can't invite people"];};

#define groupManagementDialog 55510
#define groupManagementPlayerList 55511

disableSerialization;

private "_target";
private "_hasInvite";

private _dialog = findDisplay groupManagementDialog;
private _playerListBox = _dialog displayCtrl groupManagementPlayerList;

private _index = lbCurSel _playerListBox;
private _playerData = _playerListBox lbData _index;
_hasInvite = false;

//Check selected data is valid
{ if (getPlayerUID _x isEqualTo _playerData) exitWith { _target = _x } } forEach allPlayers;

//Prevent bounty hunters and bounty victims from being in the same group
_bountyCheck = [player, _target] call bountyGroupCheck;
if (!isNil "_bountyCheck") exitWith { [format ["Can't add new member to group because '%1' has collected bounty on '%2'", name (_bountyCheck select 0), name (_bountyCheck select 1)]] spawn BIS_fnc_guiMessage };

//Checks
if(isNil "_target") exitWith {player globalChat "you must select someone to invite first"};
if(_target isEqualTo player) exitWith {player globalChat "you can't invite yourself"};
if((count units group _target) > 1) exitWith {player globalChat "This player is already in a group"};

{ if (_x select 1 isEqualTo getPlayerUID _target) then { _hasInvite = true } } forEach currentInvites;
if(_hasInvite) exitWith {player globalChat "This player already has a pending invite"};


pvar_processGroupInvite = ["send", player, _target];
publicVariableServer "pvar_processGroupInvite";

player globalChat format["You have invited %1 to join the group", name _target];
player setVariable ["currentGroupRestore", group player, true];
player setVariable ["currentGroupIsLeader", true, true];