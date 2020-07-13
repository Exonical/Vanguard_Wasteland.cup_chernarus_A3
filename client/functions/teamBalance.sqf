// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: teamBalance.sqf
//	@file Author: Unknown
//	@file Description: Team Balance
private _donatorLevel = player getVariable ["donatorLevel", 0];
 
// Teambalancer
_uid = getPlayerUID player;
_teamBal = ["A3W_teamBalance", 1] call getPublicVar;


if ((_donatorLevel isEqualTo 1) || ((getPlayerUID player) call isAdmin)) exitWith {
	// _text = "Team balancing doesn't apply to donators.";
	// [_text, 10] call mf_notify_client;
	[localize "STR_WNOTF_TeamBalance", 10] call mf_notify_client;
};

if (playerSide in [BLUFOR,OPFOR] && _teamBal > 0) then {
	private _justPlayers = allPlayers - entities "HeadlessClient_F";
	private  _serverCount = count _justPlayers;
	private _sideCount = playerSide countSide _justPlayers;
    _opposingSide = [BLUFOR, OPFOR] select (playerSide==BLUFOR);
    _opposingCount = _opposingSide countSide _justPlayers;
    if (_serverCount >= 5 && (_sideCount > (_teamBal/100) * _serverCount) && ((_sideCount-_opposingCount)) > 3 ) then {
		_kick = true;
		_prevSide = [pvar_teamSwitchList, _uid] call fn_getFromPairs;
		if(!isNil "_prevSide")then{
			if(_prevSide isEqualTo playerSide)then{
				//If player is locked to the side that is unbalanced, move their lock to indie
				_kick = false;
			};
		};
		if(_kick) then {
			["TeamBalance",false,1] call BIS_fnc_endMission;
		};
    };
};