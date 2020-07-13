// ====================================================================== //
// Aryx v0.1 : Macros List

//Var Abfragen
#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if (var isEqualType "") then {var} else {str(var)})
#define GETCVAR(var) (call var)
#define GETSUB(var1,var2) var1 = var1 - var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitWith { _res = true };} forEach _types;_res}

//Control Abfragen
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

// DLC Variablen
#define DLC_APEX 395180
#define DLC_LAWSOFWAR 571710 
#define DLC_JETS 601670
#define DLC_MARKSMEN 332350
#define DLC_HELICOPTERS 304380
#define DLC_KARTS 288520
#define DLC_TEST 1337
#define DLC_TANKS 798390
#define DLC_TACOPS 744950
//Bundle1: Heli, Karts, Marksmen - Bundle2: LoW, Tanks, Jets
#define DLC_BUNDLE1 304400
#define DLC_BUNDLE2 612480

// Zusatz
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])