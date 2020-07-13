//Client Menu Building for Airdrop Assistance 
//Builds client commanding menus dynamically based on config file arrays
//Author: Apoc
//Credits to Cre4mpie for the command menu approach and static structure of menus

AirdropMenu = 
[
	["Airdrop",true],
		["Disposable Vehicles", [2], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
		["Savable Vehicles", [3], "#USER:Vehicle2Menu", -5, [["expression", ""]], "1", "1"],
		["Civil Vehicles", [4], "#USER:Vehicle3Menu", -5, [["expression", ""]], "1", "1"],
		["Helicopters", [5], "#USER:Vehicle4Menu", -5, [["expression", ""]], "1", "1"],
		["Supplies", [6], "#USER:SupplyMenu", -5, [["expression", ""]], "1", "1"],
		["Cancel Airdrop", [7], "", -3, [["expression", ""]], "1", "1"]
];
//////////////////////////////////////////////////////
//Setting up the Vehicle Menu ///////////////////////
/////////////////////////////////////////////////////
VehicleMenu = [];
_startVehMenu = ["Disposable Vehicles",true];
VehicleMenu pushBack _startVehMenu;

_i = 0;
{
	_optionVehMenu = [];
	_lineElement1 = format ["%1 ($%2)",(APOC_AA_VehOptions select _i) select 0, [(APOC_AA_VehOptions select _i) select 2] call fn_numbersText];
	_type = (APOC_AA_VehOptions select _i) select 3;
	_optionVehMenu pushBack _lineElement1;
	_optionVehMenu append [[_i+2], "", -5];
	_optionVehMenu pushBack [["expression", format ['["%1",%2,player] execVM "addons\APOC_Airdrop_Assistance\APOC_cli_startAirdrop.sqf"',_type,_i]]];
	_optionVehMenu append ["1","1"];
	VehicleMenu pushBack _optionVehMenu;
	_i=_i+1;
}forEach APOC_AA_VehOptions;

_endVehMenu = ["Cancel Airdrop", [_i+2], "", -3, [["expression", ""]], "1", "1"];
VehicleMenu pushBack _endVehMenu;
///////////////////////////////////////////////////////

//////////////////////////////////////////////////////
//Setting up the Vehicle2 Menu ///////////////////////
/////////////////////////////////////////////////////
Vehicle2Menu = [];
_startVeh2Menu = ["Savable Vehicles",true];
Vehicle2Menu pushBack _startVeh2Menu;

_i=0;
{
	_optionVeh2Menu = [];
	_lineElement1 = format ["%1 ($%2)",(APOC_AA_Veh2Options select _i) select 0, [(APOC_AA_Veh2Options select _i) select 2] call fn_numbersText];
	_type = (APOC_AA_Veh2Options select _i) select 3;
	_optionVeh2Menu pushBack _lineElement1;
	_optionVeh2Menu append [[_i+2], "", -5];
	_optionVeh2Menu pushBack [["expression", format ['["%1",%2,player] execVM "addons\APOC_Airdrop_Assistance\APOC_cli_startAirdrop.sqf"',_type,_i]]];
	_optionVeh2Menu append ["1","1"];
	Vehicle2Menu pushBack _optionVeh2Menu;
	_i=_i+1;
}forEach APOC_AA_Veh2Options;

_endVeh2Menu = ["Cancel Airdrop", [_i+2], "", -3, [["expression", ""]], "1", "1"];
Vehicle2Menu pushBack _endVeh2Menu;
///////////////////////////////////////////////////////
Vehicle3Menu = [];
_startVeh3Menu = ["Civil Vehicles",true];
Vehicle3Menu pushBack _startVeh3Menu;

_i=0;
{
	_optionVeh3Menu = [];
	_lineElement1 = format ["%1 ($%2)",(APOC_AA_Veh3Options select _i) select 0, [(APOC_AA_Veh3Options select _i) select 2] call fn_numbersText];
	_type = (APOC_AA_Veh3Options select _i) select 3;
	_optionVeh3Menu pushBack _lineElement1;
	_optionVeh3Menu append [[_i+2], "", -5];
	_optionVeh3Menu pushBack [["expression", format ['["%1",%2,player] execVM "addons\APOC_Airdrop_Assistance\APOC_cli_startAirdrop.sqf"',_type,_i]]];
	_optionVeh3Menu append ["1","1"];
	Vehicle3Menu pushBack _optionVeh3Menu;
	_i=_i+1;
}forEach APOC_AA_Veh3Options;

_endVeh3Menu = ["Cancel Airdrop", [_i+2], "", -3, [["expression", ""]], "1", "1"];
Vehicle3Menu pushBack _endVeh3Menu;
///////////////////////////////////////////////////////
Vehicle4Menu = [];
_startVeh4Menu = ["Helicopters",true];
Vehicle4Menu pushBack _startVeh4Menu;

_i=0;
{
	_optionVeh4Menu = [];
	_lineElement1 = format ["%1 ($%2)",(APOC_AA_Veh4Options select _i) select 0, [(APOC_AA_Veh4Options select _i) select 2] call fn_numbersText];
	_type = (APOC_AA_Veh4Options select _i) select 3;
	_optionVeh4Menu pushBack _lineElement1;
	_optionVeh4Menu append [[_i+2], "", -5];
	_optionVeh4Menu pushBack [["expression", format ['["%1",%2,player] execVM "addons\APOC_Airdrop_Assistance\APOC_cli_startAirdrop.sqf"',_type,_i]]];
	_optionVeh4Menu append ["1","1"];
	Vehicle4Menu pushBack _optionVeh4Menu;
	_i=_i+1;
}forEach APOC_AA_Veh4Options;

_endVeh4Menu = ["Cancel Airdrop", [_i+2], "", -3, [["expression", ""]], "1", "1"];
Vehicle4Menu pushBack _endVeh4Menu;
///////////////////////////////////////////////////////



//////////////////////////////////////////////////////
//Setting up the Supply Menu ////////////////////////
/////////////////////////////////////////////////////
SupplyMenu = [];
_startSupMenu = ["Supplies",true];
SupplyMenu pushBack _startSupMenu;

_i=0;
{
	_optionSupMenu = [];
	_lineElement1 = format ["%1 ($%2)",(APOC_AA_SupOptions select _i) select 0, [(APOC_AA_SupOptions select _i) select 2] call fn_numbersText];
	_type = (APOC_AA_SupOptions select _i) select 3;
	_optionSupMenu pushBack _lineElement1;
	_optionSupMenu append [[_i+2], "", -5];
	_optionSupMenu pushBack [["expression", format ['["%1",%2,player] execVM "addons\APOC_Airdrop_Assistance\APOC_cli_startAirdrop.sqf"',_type,_i]]];
	_optionSupMenu append ["1","1"];
	SupplyMenu pushBack _optionSupMenu;
	_i=_i+1;
}forEach APOC_AA_SupOptions;

_endSupMenu = ["Cancel Airdrop", [_i+2], "", -3, [["expression", ""]], "1", "1"];
SupplyMenu pushBack _endSupMenu;
///////////////////////////////////////////////////////
showCommandingMenu "#USER:AirdropMenu";