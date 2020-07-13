// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: onKilled.sqf
//	@file Author: [404] Deadbeat, MercyfulFate, AgentRev
//	@file Created: 20/11/2012 05:19
private _ammoType = _this select 4; 
private _projectile = _this select 6;

if(_ammoType isEqualTo "GrenadeHand_stone") then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			sleep 0.1;
		};
		hint "1";
		// [_position] remoteExec ["aryx_fnc_flashbang",-2];
		_position = ASLtoATL (visiblePositionASL player);
		[_position] remoteExecCall ["A3W_fnc_flashBang", -2];
		// [_position] remoteExec ["A3W_fnc_flashBang", -2];
		//[_position] execVM "addons\noaim\flashbang.sqf";
	};
};