// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: staticHeliSpawning.sqf
//	@file Author: [404] Costlyy, AgentRev
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args:

if (!isServer) exitWith {};

private ["_count", "_position", "_markerName", "_marker", "_newPos", "_i", "_doSpawnWreck"];
_count = 0;

{
	_marker = _x;

	if (["heliSpawn_", _marker] call fn_startsWith) then
	{
		if (!(_marker in currentStaticHelis) && {random 1 < 0.75}) then // 75% chance spawning
		{
			_position = markerPos _marker;
			[0, _position] call staticHeliCreation;

			currentStaticHelis pushBack _marker;

			_count = _count + 1;
		};
	};
} forEach allMapMarkers;

//no_log format["WASTELAND SERVER - %1 Static helis Spawned",_count];