// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: VehiclePainter_Check.sqf
//	@file Author: AgentRev
//	@file Description: Vehicle Paint check
// private _donatorLevel = player getVariable ["donatorLevel", 0];

// if (_donatorLevel isEqualTo 0) exitWith {
	// systemChat "Only for Donators";
// };

if (!isNull objectFromNetId (player getVariable ['lastVehicleRidden', ''])) then
{
	closeDialog 0;
	[] execVM 'addons\VehiclePainter\VehiclePainter_Menu.sqf'
}
else
{
	closeDialog 0;
	_text = format ["You have no last ridden vehicle!"];
	[_text, 10] call mf_notify_client;
};