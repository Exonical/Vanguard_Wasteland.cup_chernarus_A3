/*
	AUTHOR: aeroson
	NAME: repetitive_cleanup.sqf
	VERSION: 1.7

	DESCRIPTION:
	Can delete everything that is not really needed
	dead bodies, dropped items, smokes, chemlights, explosives, empty groups
	Works even on Altis, it eats only items which are 100m from all units

	USAGE:
	in server's init
	[
		12*60, // seconds to delete dead bodies (0 means don't delete)
		0, // seconds to delete dead vehicles (0 means don't delete)
		2*60, // seconds to delete dropped weapons (0 means don't delete)
		0, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'repetitive_cleanup.sqf';

	will delete dead bodies after 60 seconds (1 minute)
	will delete dead vehicles after 5*60 seconds (5 minutes)
	will delete weapons after 2*60 seconds (2 minutes)
	will delete planted explosives after 10*60 seconds (10 minutes)
	will not delete any smokes/chemlights since its disabled (set to 0)
*/
if (!isServer) exitWith {};
private _ttdSuitcase = param[0,0,[0]];

if (_ttdSuitcase <= 0) exitWith {};

private _objectsToDelete = [];
private _timeToDelete=[];

private _delete = {
	private _object = _this select 0;
	private _time = _this select 1;
	if(_objectsToDelete find _object isEqualTo -1) then {
		_objectsToDelete pushBack _object;
		_timeToDelete pushBack (_time+time);
	};
};

for "_i" from 0 to 1 step 0 do { //ARYX
	sleep 10;

	{
	    private _unit = _x;
		
		if (_ttdSuitcase > 0) then {
			{
				{
					[_x, _ttdSuitcase] call _delete;
				} forEach (getPos _unit nearObjects [_x, 100]);
			} forEach ["Land_Suitcase_F"];
		};

	} forEach allUnits;

	{
		if ((count (units _x)) isEqualTo 0) then {
			deleteGroup _x;
		};
	} forEach allGroups;

	{
		if(isNull(_x)) then {
			_objectsToDelete set[_forEachIndex, 0];
			_timeToDelete set[_forEachIndex, 0];
		} else {
			if(_timeToDelete select _forEachIndex < time) then {
				deleteVehicle _x;
				_objectsToDelete set[_forEachIndex, 0];
				_timeToDelete set[_forEachIndex, 0];
			};
		};
	} forEach _objectsToDelete;

	_objectsToDelete = _objectsToDelete - [0];
	_timeToDelete = _timeToDelete - [0];
};