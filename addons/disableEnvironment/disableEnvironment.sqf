//	@file Name: disableEnvinronment.sqf
//	@file Author: AryX

waitUntil {time > 0};

if(environmentEnabled select 1) then {
	enableEnvironment false;
	["Environment effects Disabled.", 5] call mf_notify_client;
} else {
	enableEnvironment true;
	["Environment effects Enabled.", 5] call mf_notify_client;
};