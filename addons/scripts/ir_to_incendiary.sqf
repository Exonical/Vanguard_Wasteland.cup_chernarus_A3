/*
IR_TO_INCENDIARY script by SAKY(rkfnql322) rewritten by AgentRev
This script is MP Compatible. This script changes useless IR grenades into incendiary grenade.
3 factional IR Strobes and IR Grenade can be used.
Flame can damage most of helicopters. So can be used to destroy severely damaged helicopters without teamkill penalties.
Also, this has a great damage to un guarded infantry so can be used at CQB.
To use the script, just add the line below in the init.sqf

execVM "addons\scripts\IR_TO_INCENDIARY.sqf";

and add

class saky_fnc_irToIncendiary { jip = 1; };

in CfgRemoteExec Functions.
Have fun!
*/

// #define FIRE_AMMO_TYPES ["F_40mm_Cir","IRStrobeBase", "SmokeShellRed"] // case-sensitive
#define FIRE_AMMO_TYPES ["G_40mm_SmokeRed","SmokeShellRed"] // case-sensitive
#define SLEEP_REALTIME(SECS) _time = diag_tickTime; waitUntil {diag_tickTime - _time >= SECS}

saky_fnc_irToIncendiary =
{
	params [["_grenade",objNull,[objNull]], ["_state",0,[0]]];

	if ({_grenade isKindOf _x} count FIRE_AMMO_TYPES == 0) exitWith {};

	switch (_state) do
	{
		case 0:
		{
			SLEEP_REALTIME(2);
			[_grenade, 1] remoteExecCall ["saky_fnc_irToIncendiary", 0];
		};
		case 1:
		{
			_PS_spark1 = "#particlesource" createVehicleLocal getPosATL _grenade;
			_PS_spark1 setParticleClass "FireSparks";
			_PS_spark1 setParticleFire [1, 1, 0.5];
			_PS_spark1 setDropInterval 0.001;
			_PS_spark1 attachTo [_grenade, [0,0,0]];

			_SE_ignite = objNull;
			if (isServer) then
			{
				_SE_ignite = createSoundSource ["SoundFlareLoop_F", _grenade, [], 35];
				_SE_ignite attachTo [_grenade, [0,0,0]];
			};

			[_grenade, _PS_spark1, _SE_ignite] spawn
			{
				params ["_grenade", "_PS_spark1", "_SE_ignite"];

				//SLEEP_REALTIME(2);
				_PS_spark1 setDropInterval 0.01;

				if (isServer) then
				{
					[_grenade, 2] remoteExecCall ["saky_fnc_irToIncendiary", 0, _grenade];
					SLEEP_REALTIME(30);

					//if (_grenade isKindOf "IRStrobeBase") then { deleteVehicle nearestObject [_grenade, "NVG_TargetBase"] };

					_PS_spark1 setDropInterval 999;
					//deleteVehicle _PS_spark1;
					deleteVehicle _grenade;
					deleteVehicle _SE_ignite;
				}
				else
				{
					waitUntil {isNull _grenade};
					deleteVehicle _PS_spark1;
				};
			};
		};
		case 2:
		{
			_SE_burn = objNull;
			if (isServer) then
			{
				_SE_burn = createSoundSource ["Sound_Fire", _grenade, [], 20];
				_SE_burn attachTo [_grenade, [0,0,0]];
			};

			_PS_smoke = "#particlesource" createVehicleLocal getPosATL _grenade;
			_PS_smoke setParticleClass "MediumSmoke";
			//_PS_smoke setParticleFire [0.2, 3, 1];
			_PS_smoke setDropInterval 0.05;
			_PS_smoke attachTo [_grenade, [0,0,0]];

			_PS_floorFire = "#particlesource" createVehicleLocal getPosATL _grenade;
			_PS_floorFire setParticleClass "ExpSparksFire";
			_PS_floorFire setParticleFire [0.4, 4, 0.2];
			_PS_floorFire setDropInterval 0.001;
			_PS_floorFire setParticleRandom [1, [1, 1, 0.1], [3, 3, 1.5], 0.2, 2.5, [0, 0, 0, 0], 0, 0];
			_PS_floorFire attachTo [_grenade, [0,0,0]];

			_PS_spark0 = "#particlesource" createVehicleLocal getPosATL _grenade;
			_PS_spark0 setParticleClass "FireSparksSmall";
			_PS_spark0 setParticleFire [0.01, 1, 0.5];
			_PS_spark0 setDropInterval 0.0005;
			_PS_spark0 attachTo [_grenade, [0,0,0]];

			_PS_reflact = "#particlesource" createVehicleLocal getPosATL _grenade;
			_PS_reflact setParticleClass "ObjectDestructionRefract";
			_PS_reflact attachTo [_grenade, [0,0,0]];

			_al_flare_light = objNull;
			if (hasInterface) then
			{
				_al_color_flare = [1, 0.7, 0.7];
				_al_flare_light = "#lightpoint" createVehicleLocal getPosATL _grenade;
				_al_flare_light setLightAmbient _al_color_flare;
				_al_flare_light setLightColor _al_color_flare;
				_al_flare_light setLightIntensity 100;
				_al_flare_light setLightUseFlare true;
				_al_flare_light setLightFlareSize 1;
				_al_flare_light setLightFlareMaxDistance 2500;
				_al_flare_light setLightDayLight true;
				_al_flare_light attachTo [_grenade, [0,0,0]];
			};

			[_grenade, _SE_burn, _PS_floorFire, _PS_spark0, _PS_smoke, _PS_reflact, _al_flare_light] spawn
			{
				params ["_grenade", "_SE_burn", "_PS_floorFire", "_PS_spark0", "_PS_smoke", "_PS_reflact", "_al_flare_light"];
				waitUntil {isNull _grenade};

				deleteVehicle _PS_floorFire;
				deleteVehicle _PS_spark0;
				deleteVehicle _al_flare_light;
				deleteVehicle _SE_burn;
				_PS_reflact setDropInterval 0.5;

				SLEEP_REALTIME(10);

				deleteVehicle _PS_reflact;
				deleteVehicle _PS_smoke;
			};
		};
	};
};

if (hasInterface) then
{
	waitUntil {!isNull player};

	if (!isNil "saky_irToIncendiary_eventFired") then
	{
		player removeEventHandler ["Fired", saky_irToIncendiary_eventFired];
	};

	saky_irToIncendiary_eventFired = player addEventHandler ["Fired",
	{
		if ({(_this select 4) isKindOf _x} count FIRE_AMMO_TYPES > 0) then
		{
			[_this select 6] spawn saky_fnc_irToIncendiary;
		};
	}];
};