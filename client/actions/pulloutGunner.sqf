private _crew = crew cursorTarget;
if((player distance cursorTarget) > 10) exitWith {};

private _toPull = 0;
{
	[player] remoteExecCall ["A3W_fnc_pulloutVeh", _x];
	_toPull = _toPull + 1;
	diag_log "PulloutVeh 5";
	false;
} forEach _crew;

diag_log "PulloutVeh 4";

if (_toPull isEqualTo 0) then { hint "There is nobody inside the Weapon System" };