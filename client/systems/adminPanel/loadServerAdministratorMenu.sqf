// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: loadServerAdministratorMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define adminMenu_option 50001
disableSerialization;

_uid = getPlayerUID player;
if ([_uid, 3] call isAdmin) then {
	private _start = createDialog "AdminMenu";

	private _displayAdmin = uiNamespace getVariable "AdminMenu";
	private _adminSelect = _displayAdmin displayCtrl adminMenu_option;

	private _panelOptions = [
		"Player Management",
		"Map Markers Log",
		"Unstuck Player",
		"Object Search",
		"Clear Mines",
		"Cleanup Menu",
		"Show Server FPS"
	];

	{
		_adminSelect lbAdd _x;
	} forEach _panelOptions;
};
