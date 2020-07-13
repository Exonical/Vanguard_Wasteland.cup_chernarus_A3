// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setLocationObjects.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

params [
	["_locArray", [], [[]]],
	["_locName", "", [""]],
	["_locObjects", [], [[]]]
];

{
	if (_x select 0 == _locName) exitWith
	{
		_x set [3, _locObjects];
	};
} forEach _locArray;

/*private ["_locArray", "_locName", "_locObjects"];

_locArray = param [0, [], [[]]];
_locName = param [1, "", [""]];
_locObjects = param [2, [], [[]]];
*/
