// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createMissionCompleteMarker.sqf
//	@file Author: AgentRev

private _text = _this select 0;
private _pos = _this select 1;
private _marker = format ["mission_%1_%2", [_text] call fn_filterString, call A3W_fnc_generateKey];

_marker = createMarker [_marker, _pos];
_marker setMarkerType "hd_end";
_marker setMarkerSize [1, 1];
_marker setMarkerColor "ColorGreen";
_marker setMarkerText _text;

_marker
