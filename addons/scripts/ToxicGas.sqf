/*
	Author: AryX (noaim)
	Description: Toxic Gas (Green Smoke + GL Green Smoke)
	Version: 0.5
	Updated: 02.11.2019
*/

_gasMask = ["H_CrewHelmetHeli_B", "H_CrewHelmetHeli_O", "H_CrewHelmetHeli_I", "H_CrewHelmetHeli_I_E"];
_gasMaskGog = ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F", "G_RegulatorMask_F"];
_exemptVehicles = ["B_MRAP_01_hmg_F", "B_MRAP_01_F", "B_MRAP_01_gmg_F", "O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_T_MRAP_02_ghex_F", "O_T_MRAP_02_gmg_ghex_F", "O_MRAP_02_hmg_F", "I_MRAP_03_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F", "B_MBT_01_cannon_F", "O_MBT_02_cannon_F", "I_MBT_03_cannon_F", "B_APC_Wheeled_01_cannon_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Wheeled_02_rcws_v2_F", "I_APC_Wheeled_03_cannon_F", "B_APC_Tracked_01_AA_F", "B_APC_Tracked_01_CRV_F", "B_APC_Tracked_01_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "I_APC_tracked_03_cannon_F"];
_AAPositions = ["B_SAM_System_02_F","B_AAA_System_01_F"];

while {true} do {
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
	"dynamicBlur" ppEffectCommit 15; // time it takes to normal
	resetCamShake; // resets the shake
	20 fadeSound 1; //fades the sound back to normal
	
	waitUntil{
		((nearestObject [getPosATL player, "SmokeShellGreen"]) distance player < 10) and (getPosATL (nearestObject [getPosATL player, "SmokeShellGreen"]) select 2 < 0.5)
		or
		((nearestObject [getPosATL player, "G_40mm_SmokeGreen"]) distance player < 10) and (getPosATL (nearestObject [getPosATL player, "G_40mm_SmokeGreen"]) select 2 < 0.5) 
	};

	if (((((headgear player) in _gasMask) || (goggles player in _gasMaskGog)) && !((typeOf (vehicle player)) in _AAPositions)) || ((typeOf vehicle player) in _exemptVehicles)) then {
		"dynamicBlur" ppEffectEnable true; // enables ppeffect
		"dynamicBlur" ppEffectAdjust [0]; // intensity of blur
		"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
		enableCamShake false; // enables camera shake
		5 fadeSound 0.1; // fades the sound to 10% in 5 seconds
	} else {
		"dynamicBlur" ppEffectEnable true; // enables ppeffect
		"dynamicBlur" ppEffectAdjust [6]; // enables normal vision
		"dynamicBlur" ppEffectCommit 15; // time it takes to normal
		enableCamShake true;                             	// enables camera shake
		addCamShake [10, 45, 10];     
		resetCamShake; // resets the shake
		20 fadeSound 1; //fades the sound back to normal
		player setDamage (damage player + 0.15);     		//damage per tick
		sleep 3;
		_Choke_Sounds = [
	    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_02.wss",
	    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_03.wss",
	    "A3\Sounds_f\characters\human-sfx\Person0\P0_choke_04.wss",
	    "A3\Sounds_f\characters\human-sfx\Person1\P1_choke_04.wss",
	    "A3\Sounds_f\characters\human-sfx\Person2\P2_choke_04.wss",
	    "A3\Sounds_f\characters\human-sfx\Person2\P2_choke_05.wss",
	    "A3\Sounds_f\characters\human-sfx\Person3\P3_choke_02.wss"] call BIS_fnc_selectRandom; 
		playSound3D [_Choke_Sounds, player, false, getPosASL player, 1, 1, 0];
	};
	uiSleep 0.5;
};
