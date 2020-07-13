// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: towns.sqf
//	@file Author: AgentRev, JoSchaap

private _towns =
[
	["Town_Chernogorsk", -1, "Chernogorsk"],
	["Town_Elektrozavodsk", -1, "Elektrozavodsk"],
	["Town_Berezino", -1, "Berezino"],
	["Town_Solnichniy", -1, "Solnichniy"],
	["Town_Prigorodki", -1, "Prigorodki"],
	["Town_Zelenogorsk", -1, "Zelenogorsk"],
	["Town_Sosnovka", -1, "Sosnovka"],
	["Town_Myshkino", -1, "Myshkino"],
	["Town_Pustoschka", -1, "Pustoschka"],
	["Town_Vybor", -1, "Vybor"],
	["Town_Lopatino", -1, "Lopatino"],
	["Town_Grishino", -1, "Grishino"],
	["Town_Krasnostav", -1, "Krasnostav"],
	["Town_Gorka", -1, "Gorka"],
	["Town_Nizhnoye", -1, "Nizhnoye"],
	["Town_Khelm", -1, "Khelm"],
	["Town_Olsha", -1, "Olsha"],
	["Town_Polana", -1, "Polana"],
	["Town_Dolina", -1, "Dolina"],
	["Town_Shakhovka", -1, "Shakhovka"],
	["Town_Staroye", -1, "Staroye"],
	["Town_Msta", -1, "Msta"],
	["Town_Orlovets", -1, "Orlovets"],
	["Town_Mogilevka", -1, "Mogilevka"],
	["Town_Vyshnoye", -1, "Vyshnoye"],
	["Town_NovySobor", -1, "NovySobor"],
	["Town_StarySobor", -1, "StarySobor"],
	["Town_Kabanino", -1, "Kabanino"],
	["Town_Kozlovka", -1, "Kozlovka"],
	["Town_Balota", -1, "Balota"],
	["Town_Komarovo", -1, "Komarovo"],
	["Town_Kamenka", -1, "Kamenka"],
	["Town_Pavlovo", -1, "Pavlovo"]
];

//copyToClipboard str ((allMapMarkers select {_x select [0,5] == "Town_"}) apply {[_x, -1, markerText _x]})

private "_size";
 
{
	_x params ["_marker"];

	if (markerShape _marker == "ELLIPSE") then
	{
		_size = markerSize _marker;
		_x set [1, (_size select 0) min (_size select 1)];
	};
} forEach _towns;

_towns