// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

#define debugMenu_option 50003
#define adminMenu_option 50001
#define cleanupMenu_option 50011
disableSerialization;

private ["_panelType","_displayAdmin","_displayDebug","_adminSelect","_debugSelect","_money"];

_uid = getPlayerUID player;

if (_uid call isAdmin) then
{
	_panelType = _this select 0;

	_displayAdmin = uiNamespace getVariable ["AdminMenu", displayNull];
	_displayCleanup = uiNamespace getVariable ["cleanUpMenu", displayNull];

	switch (true) do
	{
		case (!isNull _displayAdmin): //Admin panel
		{
			_adminSelect = _displayAdmin displayCtrl adminMenu_option;

			switch (lbCurSel _adminSelect) do
			{
				case 0: //Player Menu
				{
					closeDialog 0;
					execVM "client\systems\adminPanel\playerMenu.sqf";
				};
				case 1: //Full Vehicle Management
				{
					closeDialog 0;
					createDialog "MarkerLog";
				};
				case 2: //Unstuck player
				{
					closeDialog 0;

					execVM "client\systems\adminPanel\unstuck.sqf";
					if (!isNil "notifyAdminMenu") then { ["UnstuckPlayer", "Used"] call notifyAdminMenu };
				};
				case 3: //Object Search
				{
					closeDialog 0;
					execVM "client\systems\adminPanel\loadObjectSearch.sqf";
				};
				case 4: { //Clear Mines
					[ 
						player, "mines", []
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "mines"] call notifyAdminMenu };
					hint "Clearing Mines!";
				};
				case 5: //CleanUp Menu
				{
					closeDialog 0;
					execVM "client\systems\adminPanel\menuCleanup.sqf";
				};	
				case 6: //Server FPS
				{
					hint format["Server FPS: %1",serverFPS];
				};			
			};
		};
		case (!isNull _displayCleanup): //Cleanup Panel
		{
			_cleanupSelect = _displayCleanup displayCtrl cleanupMenu_option;
			switch (lbCurSel _cleanupSelect) do
			{
				case 0: {	// Dead Bodies
					[
						player, "bodies", []
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "bodies"] call notifyAdminMenu };
					hint "Clearing Dead Bodies!";
				};
				case 1: {	// Guns & Ammo
					[
						player,
						"gunsammo",
						[
							"WeaponHolder", 					//
							"GroundWeaponHolder", 		// static weapon holder, all weapons, weapon attachments, magazines, throwables, backpacks, vests, uniforms, helments, etc
							"WeaponHolderSimulated" 	// simulated weapon holder, all weapons, weapon attachments, magazines, throwables, backpacks, vests, uniforms, helments, etc
						]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "gunsammo"] call notifyAdminMenu };
					hint "Clearing Guns & Ammo!";
				};
				case 2: {	// Static Weapon
					[
						player, "static", [ "staticWeapon" ]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "static"] call notifyAdminMenu };
					hint "Clearing Static Weapons!";
				};
				case 3: {	// Decals
					[
						player, "decals", ["#dynamicsound","#destructioneffects","#track","#particlesource"]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "decals"] call notifyAdminMenu };
					hint "Clearing Decals!";
				};
				case 4: {	// Money < 20k
					[
						player, "money", [20000]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "money 20k"] call notifyAdminMenu };
					hint "Clearing Money < 20k!";
				};
				case 5: {	// Money all
					[
						player, "money", [10000000]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "all money"] call notifyAdminMenu };
					hint "Clearing all Money!";
				};
				case 6: {	// Store Objects
					[
						player,
						"store",
						[
							"Land_Sleeping_bag_folded_F", // Spawn Beacon
							"Land_CanisterFuel_F", // Jerrycan
							"Land_CanisterOil_F", // Syphon Hose
							"Land_Ground_sheet_folded_OPFOR_F", // Camo Net
							"Land_PaperBox_01_small_closed_brown_F", // Bushkit
							"Land_VitaminBottle_F", // Drugs
							"Land_PowderedMilk_F", // Drugs
							"Land_PainKillers_F", // Drugs
							"Land_Suitcase_F"
						]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "store"] call notifyAdminMenu };
					hint "Store Objects Cleared!";
				};
				case 7: {	// Mission Objects
					[
						player,
						"mission",
						[
							"B_CargoNet_01_ammo_F",
							"CamoNet_BLUFOR_open_F",
							"CargoNet_01_barrels_F",
							"I_HMG_01_high_F",
							"Land_BagBunker_Small_F",
							"Land_BagBunker_Tower_F",
							"Land_BagFence_Corner_F",
							"Land_BagFence_End_F",
							"Land_BagFence_Long_F",
							"Land_BagFence_Round_F",
							"Land_BagFence_Short_F",
							"Land_BarGate_F",
							"Land_BarrelSand_F",
							"Land_Cargo20_military_green_F",
							"Land_Cargo_House_V3_F",
							"Land_Cargo_HQ_V3_F",
							"Land_Cargo_Patrol_V1_F",
							"Land_Cargo_Patrol_V2_F",
							"Land_Cargo_Patrol_V3_F",
							"Land_Cargo_Tower_V1_F",
							"Land_CncBarrierMedium4_F",
							"Land_CncWall4_F",
							"Land_CratesWooden_F",
							"Land_HBarrierBig_F",
							"Land_HBarrier_1_F",
							"Land_HBarrier_3_F",
							"Land_HBarrier_5_F",
							"Land_HBarrier_Big_F",
							"Land_LampHalogen_F",
							"Land_LampHarbour_F",
							"Land_LampShabby_F",
							"Land_Mil_WallBig_4m_F",
							"Land_Mil_WallBig_Corner_F",
							"Land_Pillow_camouflage_F",
							"Land_PowerGenerator_F",
							"Land_Sleeping_bag_F",
							"Land_SolarPanel_1_F",
							"Land_TTowerSmall_1_F"
						]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "mission"] call notifyAdminMenu };
					hint "Clearing Mission!";
				};
				case 8: {	// Ruins
					[
						player, "ruins", ["Ruins"]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "ruins"] call notifyAdminMenu };
					hint "Clearing Ruins!";
				};
				case 9: {	// Mines
					[ 
						player, "mines", []
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "mines"] call notifyAdminMenu };
					hint "Clearing Mines!";
				};
				case 10: {	// Quads
					[
						player,
						"vehicles",
						[
							"I_G_Quadbike_01_F"
						]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "vehicles"] call notifyAdminMenu };
					hint "Clearing Vehicles!";
				};
				case 11: {	// Other
					[
						player,
						"other",
						[
							"emptyDetector"
						]
					] call A3W_fnc_cleanupObjects;
					if (!isNil "notifyAdminMenu") then { ["cleanup", "other"] call notifyAdminMenu };
					hint "Clearing Other!";
				};
			};
		};
	};
};
