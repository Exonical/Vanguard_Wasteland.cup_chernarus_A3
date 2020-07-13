// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: monitorTerritories.sqf
# @@Author: Nick 'Bewilderbeest' Ludlam <bewilder@recoil.org>, AgentRev
# @@Create Date: 2013-09-09 18:14:47
# @@Modify Date: 2013-09-15 22:40:31
# @@Function:
#*********************************************************/
// timings
#define BASE_SLEEP_INTERVAL 10
#define CAPTURE_PERIOD (3*60) // now A3W_territoryCaptureTime in server config, this is only the fallback value

if(!isServer) exitWith {};
currentTerritoryDetails = [];

{
	_markerName = _x select 0;
	currentTerritoryDetails pushBack [_markerName, [], sideUnknown, 0, 0];
} forEach (["config_territory_markers", []] call getPublicVar);

A3W_currentTerritoryOwners = [];
_realLoopTime = BASE_SLEEP_INTERVAL;
_capturePeriod = ["A3W_territoryCaptureTime", CAPTURE_PERIOD] call getPublicVar;
_oldPlayersWithTerritoryActivity = [];
_newPlayersWithTerritoryActivity = [];

//////////////////////////////////////////////////////////////////////////////////////////////////

_isInTeam =
{
	private ["_player", "_team", "_playerTeam"];
	_player = _this select 0;
	_team = _this select 1;
	_playerTeam = group _player;
	if (typeName _team == "SIDE") then { _playerTeam = side _playerTeam };

	(_playerTeam == _team)
};

// Trigger for when a capture of a territory has started
_onCaptureStarted =
{
	private ["_territoryDescriptiveName", "_ownerTeam", "_msg", "_sideObject", "_descriptiveTeamName"];

	_territoryDescriptiveName = _this select 0;
	_ownerTeam = _this select 1;
};

// Trigger for when a capture of a territory has ended.
_onCaptureFinished =
{
	private ["_oldTeam", "_captureTeam", "_captureValue", "_captureName", "_captureDescription", "_descriptiveTeamName", "_otherTeams", "_captureColor", "_groupCaptures", "_msgWinners", "_msgOthers"];
	_oldTeam = _this select 0;
	_captureTeam = _this select 1;
	_captureValue = _this select 2;
	_captureName = _this select 3;
	_captureDescription = _this select 4;
	_descriptiveTeamName = [_captureTeam] call _getTeamName;

	_otherTeams = [BLUFOR,OPFOR];

	{
		if (!((side _x) in [BLUFOR,OPFOR]) && {{isPlayer _x} count units _x > 0}) then
		{
			_otherTeams pushBack _x;
		};
	} forEach allGroups;

	_otherTeams = _otherTeams - [_captureTeam];

	_captureColor = [_captureTeam, true] call A3W_fnc_getTeamMarkerColor;

	if (typeName _oldTeam == "GROUP" && {!isNull _oldTeam}) then
	{
		_groupCaptures = (_oldTeam getVariable ["currentTerritories", []]) - [_captureName];
		_oldTeam setVariable ["currentTerritories", _groupCaptures, true];
	};

	if (typeName _captureTeam == "GROUP") then
	{
		_groupCaptures = (_captureTeam getVariable ["currentTerritories", []]) + [_captureName];
		_captureTeam setVariable ["currentTerritories", _groupCaptures, true];
	};

	["pvar_updateTerritoryMarkers", [_captureTeam, [[_captureName], false, _captureTeam, true]]] call fn_publicVariableAll;
	["pvar_updateTerritoryMarkers", [_otherTeams, [[_captureName], false, _captureTeam, false]]] call fn_publicVariableAll;

	_msgWinners = format ["Your team has successfully captured %1 and you've received $%2", _captureDescription, _captureValue];
	["pvar_territoryActivityHandler", [_captureTeam, [_msgWinners, _captureValue]]] call fn_publicVariableAll;

	_msgOthers = format ["%1 has captured %2", _descriptiveTeamName, _captureDescription];
	["pvar_territoryActivityHandler", [_otherTeams, [_msgOthers]]] call fn_publicVariableAll;
};

// Give the human readable name for a team
_getTeamName =
{
	private ["_team", "_teamName"];
	_team = _this select 0;

	_teamName = if (typeName _team == "GROUP") then
	{
		"An independent group";
	}
	else
	{
		switch (_team) do
		{
			case BLUFOR: { "BLUFOR" };
			case OPFOR:  { "OPFOR" };
			default      { "Independent" };
		};
	};

	_teamName
};

_getPlayerTeam =
{
	private ["_group", "_side"];
	_group = group _this;
	_side = side _group;

	if (_side in [BLUFOR,OPFOR]) then {	_side } else { _group }
};

_teamCountsForPlayerArray =
{
	private ["_players", "_teamCounts", "_contested", "_dominantTeam", "_added", "_playerTeam", "_team1", "_team1count", "_team2count"];
	_players = _this select 0;

	_teamCounts = [];

	_contested = false; // true if there are more than one team present
	_dominantTeam = sideUnknown;

	if (count _players > 0) then
	{
		{
			_playerTeam = _x call _getPlayerTeam;
			_added = false;

			{
				if ((_x select 0) isEqualTo _playerTeam) exitWith
				{
					_x set [1, (_x select 1) + 1];
					_added = true;
				};
			} forEach _teamCounts;

			if (!_added) then
			{
				[_teamCounts, [_playerTeam, 1]] call BIS_fnc_arrayPush;
			};
		} forEach _players;

		{
			_team1 = _x select 0;
			_team1count = _x select 1;

			if (_team1count > 0) exitWith
			{
				_dominantTeam = _team1;

				for "_i" from (_forEachIndex + 1) to (count _teamCounts - 1) do
				{
					_team2count = (_teamCounts select _i) select 1;

					if (_team2count > 0) exitWith
					{
						_contested = true;
						_dominantTeam = sideUnknown;
					};
				};
			};
		} forEach _teamCounts;
	};

	[_teamCounts, _contested, _dominantTeam]
};

_handleTeamCounts =
{
	private ["_currentCounts", "_newCounts", "_currentTeamCounts", "_currentAreaContested", "_currentDominantTeam", "_newTeamCounts", "_newAreaContested", "_newDominantTeam", "_action"];
	_currentCounts = _this select 0;
	_newCounts = _this select 1;

	_currentTeamCounts = _currentCounts select 0;
	_currentAreaContested = _currentCounts select 1;
	_currentDominantTeam = _currentCounts select 2;

	_newTeamCounts = _newCounts select 0;
	_newAreaContested = _newCounts select 1;
	_newDominantTeam = _newCounts select 2;

	_action = "";  // CAPTURE, BLOCK, RESET

	if (!_newAreaContested) then
	{
		// Territory is currently uncontested. Was the previous state uncontested and the same team?
		if (_currentAreaContested || (_currentDominantTeam isEqualTo _newDominantTeam && !(_currentDominantTeam isEqualTo sideUnknown))) then
		{
			// If it was last contested, or uncontested with the same team, reset our cap counter (or we could carry on?)
			_action = "CAPTURE";
		}
		else
		{
			// Previously uncontested and the team has changed
			_action = "RESET";
		};
	}
	else
	{
		// It's contested
		_action = "BLOCK";
	};

	_action
};

_updatePlayerTerritoryActivity =
{
	private ["_newTerritoryOccupiers", "_action", "_currentTerritoryOwner", "_newDominantTeam", "_player", "_playerUID", "_playerTeam", "_territoryActivity"];

	_currentTerritoryOwner = _this select 0;
	_newTerritoryOccupiers = _this select 1;
	_newDominantTeam = _this select 2;
	_action = _this select 3;

	{
		_player = _x;
		_playerUID = getPlayerUID _player;
		_playerTeam = _player call _getPlayerTeam;

		_territoryActivity = [];

		// Set a variable on them to indicate blocked capping
		if !(_currentTerritoryOwner isEqualTo _newDominantTeam) then
		{
			if (_action == "BLOCK") then
			{
				// We split a BLOCK state into defenders and attackers
				if (_currentTerritoryOwner isEqualTo _playerTeam) then
				{
					_territoryActivity set [0, "BLOCKEDDEFENDER"];
				}
				else
				{
					_territoryActivity set [0, "BLOCKEDATTACKER"];
				};
			}
			else
			{
				_territoryActivity set [0, _action];
			};

			_territoryActivity set [1, _capturePeriod - _newCapPointTimer];
			_newPlayersWithTerritoryActivity pushBack _playerUID;
		};
		_x setVariable ["TERRITORY_ACTIVITY", _territoryActivity, true];
	} forEach _newTerritoryOccupiers;
};


_handleCapPointTick = {
	private ["_currentTerritoryData", "_newTerritoryData", "_count", "_currentTerritoryDetails", "_i", "_currentTerritoryName", "_currentTerritoryOccupiers", "_currentTerritoryChrono", "_currentTerritoryTimer", "_newTerritoryDetails", "_newTerritoryDetails", "_newTerritoryName", "_newTerritoryOccupiers", "_currentTeamCounts", "_newTeamCounts", "_newDominantTeam", "_currentDominantTeam", "_action", "_curCapPointTimer", "_newMarkerColor", "_playerUIDs", "_msg", "_configEntry", "_capturePointHumanName", "_value"];

	_newTerritoryData = _this select 0;
	_currentTerritoryData = _this select 1;

	// Known to be the same as _currentTerritoryData
	_count = count _currentTerritoryData;

	for "_i" from 0 to (_count - 1) do
	{
		_loopStart = diag_tickTime;

		_currentTerritoryDetails = _currentTerritoryData select _i;

		_currentTerritoryName = _currentTerritoryDetails select 0;
		_currentTerritoryOccupiers = _currentTerritoryDetails select 1;
		_currentTerritoryOwner = _currentTerritoryDetails select 2;
		_currentTerritoryChrono = _currentTerritoryDetails select 3;
		_currentTerritoryTimer = _currentTerritoryDetails select 4;

		_newTerritoryDetails = [_newTerritoryData, { _x select 0 == _currentTerritoryName }] call BIS_fnc_conditionalSelect;

		// If territory is is held by anyone, update chrono
		if !(_currentTerritoryOwner isEqualTo sideUnknown) then
		{
			_currentTerritoryChrono = _currentTerritoryChrono + _realLoopTime;
		};

		if (count _newTerritoryData > 0 && {count _newTerritoryDetails > 0}) then
		{
			_newTerritoryDetails = _newTerritoryDetails select 0;

			_newTerritoryName = _newTerritoryDetails select 0;
			_newTerritoryOccupiers = _newTerritoryDetails select 1;

			// Ok players have hanged. Contested or not?
			_currentTeamCounts = [_currentTerritoryOccupiers] call _teamCountsForPlayerArray;
			_newTeamCounts = [_newTerritoryOccupiers] call _teamCountsForPlayerArray;

			_currentDominantTeam = _currentTeamCounts select 2;
			_newDominantTeam = _newTeamCounts select 2;
			_newContestedStatus = _newTeamCounts select 1;

			_action = [_currentTeamCounts, _newTeamCounts] call _handleTeamCounts;

			_newCapPointTimer = _currentTerritoryTimer;

			if (_newContestedStatus || !(_currentTerritoryOwner isEqualTo _newDominantTeam)) then
			{
				if (_action == "CAPTURE") then
				{
					if (_currentTerritoryTimer == 0 && !(_currentTerritoryOwner isEqualTo sideUnknown)) then
					{
						// Just started capping. Let the current owners know!
						_currentDominantTeamName = [_currentDominantTeam] call _getTeamName;

						_configEntry = [["config_territory_markers", []] call getPublicVar, { _x select 0 == _currentTerritoryName }] call BIS_fnc_conditionalSelect;
						_territoryDescriptiveName = (_configEntry select 0) select 1;

						[_territoryDescriptiveName, _currentTerritoryOwner] call _onCaptureStarted;
					};

					_newCapPointTimer = _newCapPointTimer + _realLoopTime
				};

				if (_action == "RESET") then
				{
					_newCapPointTimer = 0;
				};


				if (_newCapPointTimer >= _capturePeriod && !(_newDominantTeam isEqualTo _currentTerritoryOwner)) then
				{
					_newMarkerColor = [_newDominantTeam] call A3W_fnc_getTeamMarkerColor;

					// If the timer is above what we consider a successful capture and its not already theirs...
					_currentTerritoryName setMarkerColor _newMarkerColor;

					_configEntry = [["config_territory_markers", []] call getPublicVar, { _x select 0 == _currentTerritoryName }] call BIS_fnc_conditionalSelect;
					_territoryDescriptiveName = (_configEntry select 0) select 1;
					_value = (_configEntry select 0) select 2;

					// Reset to zero
					_newCapPointTimer = 0;
					_currentTerritoryChrono = 0;

					[_currentTerritoryOwner, _newDominantTeam, _value, _currentTerritoryName, _territoryDescriptiveName] call _onCaptureFinished;
					_currentTerritoryOwner = _newDominantTeam;

					// Increase capture score
					{
						if ([_x, _newDominantTeam] call _isInTeam) then
						{
							[_x, "captureCount", 1] call fn_addScore;
						};
					} forEach _currentTerritoryOccupiers;
				};

				[_currentTerritoryOwner, _newTerritoryOccupiers, _newDominantTeam, _action] call _updatePlayerTerritoryActivity;
			};

			// Now ensure we're creating a mirror of _currentTerritoryDetails with all the new info so we can assign it
			// at the end of this iteration
			_currentTerritoryData set [_i, [_currentTerritoryName, _newTerritoryOccupiers, _currentTerritoryOwner, _currentTerritoryChrono, _newCapPointTimer]];
		}
		else
		{
			// Nobody there
			_currentTerritoryData set [_i, [_currentTerritoryName, [], _currentTerritoryOwner, _currentTerritoryChrono, 0]];
		};
	};

	_currentTerritoryData
};

if (["A3W_territoryPayroll"] call isConfigOn) then
{
	execVM "territory\server\territoryPayroll.sqf";
};

//////////////////////////////////////////////////////////////////////////////
// MAIN TERRITORY MONITOR LOOP                                              //
//////////////////////////////////////////////////////////////////////////////

while {true} do
{
	private ["_territoryOccupiersMapSingle", "_territoryOccupiersMapConsolidated", "_newCapturePointDetails"];

	_initTime = diag_tickTime;

	// Iterate through each player, and because the client-side trigger has added the var
	// 'TERRITORY_CAPTURE_POINT' onto the player object and set it global, we the server should know
	// where each player is, in terms of capture areas
	_territoryOccupiersMapSingle = [];

	{
		private ["_curCapPoint", "_uid"];

		if (alive _x) then
		{
			// We don't see dead people. Hahaha...ha!
			_curCapPoint = _x getVariable ["TERRITORY_OCCUPATION", ""];

			if (_curCapPoint != "") then
			{
				_territoryOccupiersMapSingle pushBack [_curCapPoint, _x];
			};
		};

		// Mark / sweep old players who no longer need activity entries
		_uid = getPlayerUID _x;

		if (_uid in _oldPlayersWithTerritoryActivity) then
		{
			_x setVariable ["TERRITORY_ACTIVITY", [], true];
		};

	} forEach playableUnits;

	// Reset who's contested and who's not!
	_oldPlayersWithTerritoryActivity = _newPlayersWithTerritoryActivity;
	_newPlayersWithTerritoryActivity = [];

	_territoryOccupiersMapConsolidated = [];

	if (count _territoryOccupiersMapSingle > 0) then
	{
		{
			_territoryName = _x select 0;
			_player = _x select 1;
			[_territoryOccupiersMapConsolidated, _territoryName, [_player]] call fn_addToPairs;
		} forEach _territoryOccupiersMapSingle;
	};


	_newCapturePointDetails = [_territoryOccupiersMapConsolidated, currentTerritoryDetails] call _handleCapPointTick;
	currentTerritoryDetails = _newCapturePointDetails;

	_newTerritoryOwners = [];
	{ _newTerritoryOwners pushBack [_x select 0, _x select 2] } forEach _newCapturePointDetails;

	if !(A3W_currentTerritoryOwners isEqualTo _newTerritoryOwners) then
	{
		A3W_currentTerritoryOwners = _newTerritoryOwners;
		publicVariable "A3W_currentTerritoryOwners";
	};

	if (count _newPlayersWithTerritoryActivity > 0) then
	{
		_oldPlayersWithTerritoryActivity = [_oldPlayersWithTerritoryActivity, { !(_x in _newPlayersWithTerritoryActivity) }] call BIS_fnc_conditionalSelect;
	};

	sleep BASE_SLEEP_INTERVAL;
	_realLoopTime = diag_tickTime - _initTime;
};
