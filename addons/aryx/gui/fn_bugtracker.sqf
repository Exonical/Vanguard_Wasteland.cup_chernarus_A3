#include "macros.hpp"
private "_badbgChar";
disableSerialization;

private _bugs = ctrlText (getControl(73025,73027));
private _length = count (toArray(_bugs));
private _chrByte = toArray (_bugs);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 350) exitWith {};
if(_length < 10) exitWith {};
_badbgChar = false;
{if(!(_x in _allowed)) exitWith {_badbgChar = true;};} foreach _chrByte;
if(_badbgChar) exitWith {};

// [format ["BUGTRACKER: %1 (%2) - Meldung: %3", name player, getPlayerUID player,_bugs],"aryx_log",false,false] call Aryx_Logit;
closeDialog 0;