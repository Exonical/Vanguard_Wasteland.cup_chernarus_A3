/*
	Author: AryX (noaim)
	Description: Logging System
	Version: 1.1
	Updated: 02.11.2019
*/

private _exit = false;
private _tolog = param[0,"",[""]];
private _name = name player;
private _find = ["MONEYLOG", "CASHGURU", "KILLED", "HEADSHOT", "INCAPACITATED", "PARKING", "HACK", "ERROR", "TRANSFEREDMONEY", "ATMDEPOSIT", "CRATEDEPOSIT", "WARCHESTDEPOSIT", "PICKEDMONEY", "DROPMONEY", "BUYVEHICLE", "SELLVEST", "SELLVEHITEM", "SELLVEHICLE", "SELLBACKPACK", "SELLUNIFORM", "SELLCRATE"];
if ((_tolog find _name) isEqualTo -1) then {_tolog = format ["LOGIT %1 - %2 ",_name,_tolog];};
{if ((_tolog find _x) != -1) exitWith {_exit = true;};}foreach _find;
if !(_exit) then {_tolog = format ["LOGIT %1 - %2 ",_name,_tolog];};
aryx_log = _tolog;
publicVariableServer "aryx_log";
aryx_log = nil;