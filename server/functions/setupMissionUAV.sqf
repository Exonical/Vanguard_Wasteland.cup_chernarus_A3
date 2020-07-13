/*
	Author: AryX (noaim)
	Description: Weapon System
	Version: 0.1
*/

private _veh = _this select 0;

if ((_veh isKindOf "B_SAM_System_02_F") || (_veh isKindOf "B_AAA_System_01_F")) then {
	_veh isUAVConnectable [_veh,false];
	_veh disableUAVConnectability [_veh,true];
	_veh enableUAVConnectability [_veh,false];
	_veh enableSimulation false; 
	// _veh allowDamage false;
	_veh disableTIEquipment true;
	_veh disableNVGEquipment true;
	_veh connectTerminalToUAV objNull;
	// _veh enableUAVWaypoints false;
	clearMagazineCargoGlobal _veh;
};

if (_veh isKindOf "B_SAM_System_02_F") then {
	_veh removeMagazineGlobal "magazine_Missile_rim162_x8";
	// _veh addMagazineGlobal "magazine_Missile_rim162_x8";
};

if (_veh isKindOf "B_AAA_System_01_F") then {
	_veh removeMagazineGlobal "magazine_Cannon_Phalanx_x1550";
	// _veh addMagazineGlobal "magazine_Cannon_Phalanx_x1550";
};