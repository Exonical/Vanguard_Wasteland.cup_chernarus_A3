// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: updateMarkers.sqf
# @@Author: Nick 'Bewilderbeest' Ludlam <bewilder@recoil.org>
# @@Create Date: 2013-09-15 16:26:30
# @@Modify Date: 2013-09-21 23:45:39
# @@Function:
#*********************************************************/
_markerColorForSide = {
	private['_side', '_markerColor'];
	_side = _this select 0;
	_markerColor = "";
	switch (_side) do {
		case "WEST": { _markerColor = "colorblue"; };
		case "EAST": { _markerColor = "colorred"; };
		case "GUER": { _markerColor = "colorgreen"; };
		default { _markerColor = "coloryellow"; };
	};
	_markerColor
};

{
	private ['_markerName', '_markerOwnerSide', '_color'];
	_markerName = _x select 0;
	_markerOwnerSide = _x select 3;
	if (_markerOwnerSide != "") then {
	    _color = [_markerOwnerSide] call _markerColorForSide;
		_markerName setMarkerColor _color;
	};
} forEach lastCapturePointDetails;
