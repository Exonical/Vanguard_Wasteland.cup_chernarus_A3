// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: UniformPainter_ownerMenu.sqf
//	@file Author: LouD / Cael817 for original script
//	@file Description: Paint script

#define Paint_Menu_option 17001
disableSerialization;

private ["_start","_panelOptions","_Paint_select","_displayPaint"];
_uid = getPlayerUID player;
if (!isNil "_uid") then {
	_start = createDialog "Paint_Menu";

	_displayPaint = uiNamespace getVariable "Paint_Menu";
	_Paint_select = _displayPaint displayCtrl Paint_Menu_option;

	_panelOptions = 
	[
		"Red Camo ($1500)",
		"Bundeswehr ($1500)",
		"WeissRot ($1500)",
		"Rostig ($1500)",
		"Desertcamo ($1500)",
		"Grasscamo ($1500)",
		"Flower Power ($1500)",
		"Red Camo 2 ($1500)",
		"Blue Camo ($1500)",
		"Hex Camo ($1500)",
		"Woodland Camo ($1500)",
		"BW Veh Desert ($1500)",
		"BW Veh Tropic ($1500)",
		"Swamp Camo ($1500)"
	];

	{
		_Paint_select lbAdd _x;
	} forEach _panelOptions;
};