// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: objectsSpawning.sqf
//	@file Author: [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

private ["_pos", "_angleIncr", "_langle", "_lpos"];
private _tradius = 0;
private _townname = "debug";
private _counter = 1;
private _objammount = 0;
private _minrad = 0;
private _maxrad = 0;
private _lcounter = 0;

private _spawnedObjects = [];

private _baseBuilding = ["A3W_baseBuilding"] call isConfigOn;
private _essentials = ["A3W_essentialsSpawning"] call isConfigOn;
private _objList = [];

if (_baseBuilding) then { _objList append objectList };
if (_essentials) then { _objList append essentialsList };

private _sradius = if (!_baseBuilding && _essentials) then { 75 } else { 15 };

private _createRandomObject =
{
	_pos = _this select 0;
	_minrad = _this select 1;
	_maxrad = _this select 2;
	_counter = _this select 3;
	_objList = _this select 4;

	_pos = [_pos, _minrad, _maxrad, 2, 0, 60*(pi/180), 0] call findSafePos;
	[_pos, _objList] call objectCreation;
};

{
	_pos = getMarkerPos (_x select 0);
	_tradius = _x select 1;
	_townname = _x select 2;
	_objammount = 1 max ceil (_tradius / _sradius);  // spawns an object for every "_sradius" meters the townmarker has, this might need tweaking!
	_angleIncr = 360 / _objammount;
	_langle = random _angleIncr;
	//_minrad = 15;
	//_maxrad = 30;
	_minrad = 0;
	_maxrad = _tradius / 2;

	while {_lcounter < _objammount} do
	{
		_lpos = _pos vectorAdd ([[_maxrad, 0, 0], _langle] call BIS_fnc_rotateVector2D);
		_spawnedObjects pushBack ([_lpos, _minrad, _maxrad, _counter, _objList] spawn _createRandomObject);
		//_minrad = _minrad + 15;
		//_maxrad = _maxrad + 15;
		_langle = _langle + _angleIncr;
		_counter = _counter + 1;
		_lcounter = _lcounter + 1;
	};
	_lcounter = 0;
} forEach (call citylistNoRanObj);

{
	waitUntil {scriptDone _x};
} forEach _spawnedObjects;

diag_log format ["WASTELAND - Object spawning completed - %1 objects spawned", _counter];
