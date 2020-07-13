// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev, AryX

if (!isServer) exitWith {};

private ["_unitClasses", "_unitGroup", "_missionPosition", "_unit", "_unitAmount"];

_unitClasses = [
	"C_man_polo_1_F",
	"C_man_polo_2_F",
	"C_man_polo_3_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_6_F"
];

_unitGroup = _this select 0;
_missionPosition = _this select 1;
_unitAmount = param [2, 12, [0]];
_missionRadius = param [3, 100, [0]];
_missionPosition set [2,2000]; // update mission altitude to 2000m.

for "_i" from 1 to _unitAmount do
{
	_unitPosition = [0,0,0];
	_overland = false;
	while {!_overLand} do // force a land position, don't spawn over water.
	{
		_unitPosition = _missionPosition vectorAdd ([[(random _missionRadius) + 10, 0, 0], random 360] call BIS_fnc_rotateVector2D);
		if !(surfaceIsWater _unitPosition) then
		{
			_overLand = true;
		};
	};
	if !(_unitPosition isEqualTo [0,0,0]) then
	{
		// create the unit
		_unit = _unitGroup createUnit [(selectRandom _unitClasses),_unitPosition,[],0,"FORM"];
		waitUntil {alive _unit};
		_unit setPos _unitPosition;
		[_unit,_unitGroup,_missionPosition] spawn // units will spawn high, free fall to a random height, then pull chute (min 100m).
		{
			params ["_unit","_unitGroup","_missionPosition"];
			_missionSpawnHeight = _missionPosition select 2;
			_pullChuteAltitude = round(random 500) max 100 min 400; // 100m minimum height, 400 maximum height.
			_timer = time + 90; // max 1m30s free fall.
			waitUntil {sleep 0.1; (((getPos _unit select 2) <= _pullChuteAltitude) || (time > _timer))};
			_parachute = createVehicle ["Steerable_Parachute_F",(getPos _unit),[],0,"CAN_COLLIDE"];
			_parachute allowDamage false;
			_unit assignAsDriver _parachute;
			_unit moveInDriver _parachute;
			_timer = time + 180; // max 3m00s until on ground.
			waitUntil {sleep 0.1; ((isTouchingGround _unit) || (time > _timer))};
			_leader = leader _unitGroup;
			if (_unit isEqualTo _leader) then {
				_missionPosition set [2,0];
				_unit move _missionPosition;
				_unit doMove _missionPosition;
			} else {
				_unit doFollow leader _unitGroup;
			};
		};
		// update the solider
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		
		private _uniform = selectRandom ["U_O_R_Gorka_01_black_F"];
		_unit addUniform _uniform;
		
		private _facewear = selectRandom ["G_Balaclava_TI_blk_F", "G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_02_black_F"];
		_unit addGoggles _facewear;
		
		private _headgear = selectRandom ["H_Tank_black_F", "H_Watchcap_blk", "H_PASGT_basic_black_F", "H_HelmetSpecO_blk", "H_Bandanna_gry"];
		_unit addHeadgear _headgear;
		
		private _vests = selectRandom ["V_PlateCarrierSpec_blk", "V_PlateCarrier2_blk", "V_PlateCarrier1_blk"];
		_unit addVest _vests;
		
		private _backpack = selectRandom ["B_ViperHarness_blk_F", "B_ViperLightHarness_blk_F"];
		_unit addBackpack _backpack;
		
		private _weapon = selectRandom ["arifle_SPAR_02_blk_F", "arifle_SPAR_01_blk_F", "arifle_MXM_Black_F", "arifle_MXC_Black_F", "arifle_CTAR_blk_F", "LMG_Mk200_black_F", "srifle_DMR_07_blk_F", "arifle_MSBS65_Mark_black_F", "arifle_Katiba_C_F", "arifle_Katiba_F", "arifle_CTARS_blk_F"];

		private _ammo = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

		_unit addMagazine (_ammo select 0);
		_unit addWeapon _weapon;
		_unit addItemToBackpack (_ammo select 0);
		_unit addItemToBackpack (_ammo select 0);
		_unit addItemToBackpack (_ammo select 0);
		_unit addItemToVest (_ammo select 0);
		
		private _scope = selectRandom ["optic_SOS", "optic_DMS", "optic_LRPS", "optic_AMS", "optic_KHS_blk", "optic_Arco_blk_F", "optic_Holosight_blk_F"];
		_unit addPrimaryWeaponItem _scope;
		
		_unit selectWeapon _weapon;
		
		private _dice = selectRandom [1,2,3];
		if (_dice isEqualTo 1) then {
			_unit addWeapon "launch_O_Vorona_green_F";
			_unit addMagazine "Vorona_HE";
			_unit addMagazine "Vorona_HE";
			_unit selectWeapon "launch_O_Vorona_green_F";
		};
		
		_unit addItem "NVGoggles_OPFOR";
		_unit assignItem "NVGoggles_OPFOR";

		_unit addRating 1e11;
		_unit spawn refillPrimaryAmmo;
		_unit call setMissionSkill;
		_unit addEventHandler ["Killed", server_playerDied];
	};
	sleep 0.5;
};

_soldiers = units _unitGroup;
_soldiers