// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04
#define DLC_APEX 395180
private _unit = _this select 0;
private _item = _this select 1;

private ["_side", "_game", "_arma", "_dlc", "_uniEAST", "_defaultUniEAST", "_uniINDP", "_defaultUniINDP", "_uniWEST", "_defaultUniWEST"];

if (typeName _unit == "OBJECT") then {
	_side = if (_unit isEqualTo player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
} else {
	_side = _this select 2;
};

private _isSniper = (["_sniper_", _unit] call fn_findString != -1);
private _isDiver = (["_diver_", _unit] call fn_findString != -1);

if(DLC_APEX in (getDLCs 1)) then {
	_uniWEST = selectRandom [1,2,3,4,5];
} else {
	_uniWEST = selectRandom [1,2,3,4,5];
};
switch(true) do {
	case (_uniWEST isEqualTo 1) : {
		_defaultUniWEST = "U_B_CombatUniform_mcam";
	};
	case (_uniWEST isEqualTo 2) : {
		_defaultUniWEST = "U_B_CombatUniform_mcam_tshirt";
	};
	case (_uniWEST isEqualTo 3) : {
		_defaultUniWEST = "U_B_CTRG_Soldier_urb_1_F";
	};
	case (_uniWEST isEqualTo 4) : {
		_defaultUniWEST = "U_B_CTRG_Soldier_urb_2_F";
	};
	case (_uniWEST isEqualTo 5) : {
		_defaultUniWEST = "U_B_CTRG_Soldier_F";
	};
};

if(DLC_APEX in (getDLCs 1)) then {
	_uniEAST = selectRandom [1,2];
} else {
	_uniEAST = selectRandom [1];
};
switch(true) do {
	case (_uniEAST isEqualTo 1) : {
		_defaultUniEAST = "U_O_OfficerUniform_ocamo";
	};
	case (_uniEAST isEqualTo 2) : {
		_defaultUniEAST = "U_O_T_Officer_F";
	};
};

if(DLC_APEX in (getDLCs 1)) then {
	_uniINDP = selectRandom [1,2,3,4,5];
} else {
	_uniINDP = selectRandom [1];
};
switch(true) do {
	case (_uniINDP isEqualTo 1) : {
		_defaultUniINDP = "U_I_CombatUniform";
	};
	case (_uniINDP isEqualTo 2) : {
		_defaultUniINDP = "U_I_C_Soldier_Para_1_F";
	};
	case (_uniINDP isEqualTo 3) : {
		_defaultUniINDP = "U_I_C_Soldier_Para_2_F";
	};
	case (_uniINDP isEqualTo 4) : {
		_defaultUniINDP = "U_I_C_Soldier_Para_4_F";
	};
	case (_uniINDP isEqualTo 5) : {
		_defaultUniINDP = "U_I_C_Soldier_Camo_F";
	};
};

private _result = "";

switch (_side) do {
	case west: {
		switch (true) do {
			case (_isSniper): {
				if (_item isEqualTo "uniform") then { _result = "U_B_Ghilliesuit" };
				if (_item isEqualTo "goggles") then { _result = "G_Bandanna_oli" };
			};
			case (_isDiver): {
				if (_item isEqualTo "uniform") then { _result = "U_B_Wetsuit" };
				if (_item isEqualTo "vest") then { _result = "V_RebreatherB" };
				if (_item isEqualTo "goggles") then { _result = "G_Diving" };
			};
			default {
				if (_item isEqualTo "uniform") then { _result = _defaultUniWEST };
				if (_item isEqualTo "goggles") then { _result = "G_Bandanna_oli" };
			};
		};
	};
	case east: {
		switch (true) do {
			case (_isSniper): {
				if (_item isEqualTo "uniform") then { _result = "U_O_Ghilliesuit" };
				if (_item isEqualTo "goggles") then { _result = "G_Bandanna_tan" };
			};
			case (_isDiver): {
				if (_item isEqualTo "uniform") then { _result = "U_O_Wetsuit" };
				if (_item isEqualTo "vest") then { _result = "V_RebreatherIR" };
				if (_item isEqualTo "goggles") then { _result = "G_Diving" };
			};
			default {
				if (_item isEqualTo "uniform") then { _result = _defaultUniEAST };
				if (_item isEqualTo "goggles") then { _result = "G_Bandanna_tan" };
			};
		};
	};
	default {
		switch (true) do {
			case (_isSniper): {
				if (_item isEqualTo "uniform") then { _result = "U_I_Ghilliesuit" };
				if (_item isEqualTo "goggles") then { _result = "G_Bandanna_beast" };
			};
			case (_isDiver): {
				if (_item isEqualTo "uniform") then { _result = "U_I_Wetsuit" };
				if (_item isEqualTo "vest") then { _result = "V_RebreatherIA" };
				if (_item isEqualTo "goggles") then { _result = "G_Diving" };
			};
			default {
				if (_item isEqualTo "uniform") then { _result = _defaultUniINDP };
				if (_item isEqualTo "goggles") then { _result = "G_Bandanna_beast" };
			};
		};
	};
};

_result
