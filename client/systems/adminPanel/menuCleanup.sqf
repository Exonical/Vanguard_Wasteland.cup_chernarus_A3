// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: menuCleanup.sqf
//	@file Author: ArYx

#define cleanupMenu_option 50011
disableSerialization;

private ["_start", "_displayCleanup", "_cleanupSelect", "_panelOptions"];

_uid = getPlayerUID player;

if (_uid call isAdmin) then {
	_start = createDialog "CleanUpMenu";
	_displayCleanup = uiNamespace getVariable "cleanUpMenu";
	_cleanupSelect = _displayCleanup displayCtrl cleanupMenu_option;

	_panelOptions = [
		"Dead Bodies",
		"Guns & Ammo",
		"Static Weapon",
		"Decals",
		"Money < 20k",
		"All Money",
		"Store Objects",
		"Mission Objects",
		"Ruins",
		"Mines",
		"Quads",
		"Other"
	];

	{
	_cleanupSelect lbAdd _x;
	} forEach _panelOptions;
};
