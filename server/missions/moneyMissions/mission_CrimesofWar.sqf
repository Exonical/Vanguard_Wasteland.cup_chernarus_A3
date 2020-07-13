// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2019 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Terrorism.sqf
//	@file Author: AryX
//	@file Version: 0.1
//	@file Description: Terrorism Main-Mission

if (!isServer) exitWith {};
#include "moneyMissionDefines.sqf";

private ["_vehicle", "_createVehicle", "_nbUnits", "_townName", "_missionPos", "_buildingRadius", "_putOnRoof", "_fillEvenly"];

_setupVars = {
    //Originally this mission called "ISIS incursion", but to avoid political problems #Staynex changed to "TERROR incursion"
	_missionType = "Crimes of War";
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };

	// settings for this mission
	_locArray = ((call cityList) call BIS_fnc_selectRandom);
	_missionPos = markerPos (_locArray select 0);
	_buildingRadius = _locArray select 1;
	_townName = _locArray select 2;

	//randomize amount of units
	_nbUnits = _nbUnits + round(random (_nbUnits*0.5));
	// reduce radius for larger towns.
	_buildingRadius = if (_buildingRadius > 190) then {(_buildingRadius*0.5)} else {_buildingRadius};
	// 25% change on AI not going on rooftops
	if (random 1 < 0.75) then { _putOnRoof = true } else { _putOnRoof = false };
	// 25% chance on AI trying to fit into a single building instead of spreading out
	if (random 1 < 0.75) then { _fillEvenly = true } else { _fillEvenly = false };
};

_setupObjects = {	
	private _veh1 = "B_G_Offroad_01_armed_F";

	_createVehicle = {
		private _type = _this select 0;
		private _position = _this select 1;
		private _direction = _this select 2;
		private _vehicle = [_type, _position] call createMissionVehicle;
		//[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;

		switch (true) do
		{
			case (_type isKindOf "B_G_Offroad_01_armed_F"):
			{
				[_vehicle, "client\images\vehicleTextures\zero_mixcamo.paa", [0]] call applyVehicleTexture; 
			};
		};

		_vehicle
	};

	_vehiclePos = _missionPos;
	
	_vehicle = [_veh1, _vehiclePos, 0] call _createVehicle;

	// spawn some rebels/enemies :)
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroupAirSpecOps;

	// move them into buildings
	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;
	
	_aiGroup setCombatMode "Red";
	
	_missionHintText = format ["A Team of SpecOps have taken over <br/><t size='1.25' color='%1'>%2</t><br/><br/>Indications are that <t color='%1'>%3 enemies</t> are lurking in that area. Eliminate them and claim their cash.", moneyMissionColor, _townName, _nbUnits];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec = {
	// Mission failed
	//{ deleteVehicle _x } forEach [_vehicle,_box1, _box2];	
	deleteVehicle _vehicle;
};

_successExec = {
	private "_cash";
	for "_x" from 1 to 5 do {
		_cash = "Land_Money_F" createVehicle markerPos _marker;
		_cash setPos ((markerPos _marker) vectorAdd ([[2 + random 2,0,0], random 360] call BIS_fnc_rotateVector2D));
		_cash setDir random 360;
		_cash setVariable["cmoney",20000,true];
		_cash setVariable["owner","world",true];
	};

	_successHintMessage = format ["The SpecOps were killed.<br/><br/>The Town: <t color='%1'>%2</t><br/> is cleared!<br/> now collect the cash and loot!", moneyMissionColor, _townName];
};

_this call moneyMissionProcessor;