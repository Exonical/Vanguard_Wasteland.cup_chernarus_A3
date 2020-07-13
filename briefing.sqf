// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

_trimName = { _this select [1, count _this - 2] };
_aKeyName = { _arr = actionKeysNamesArray _this; if (count _arr == 0) exitWith {"<UNDEFINED>"}; _arr select 0 };

#define NKEYNAME(DIK) (keyName DIK call _trimName)
#define AKEYNAME(ACT) (ACT call _aKeyName)

waitUntil {!isNull player};

player createDiarySubject ["infos", "Infos and Help"];
player createDiarySubject ["vangaurdrules", "Server Rules"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];
player createDiarySubject ["gearloadout", "Gear Loadout"];
player createDiarySubject ["voice", "Teamspeak/Discord"];
player createDiarySubject ["supportedmods", "Supported Mods"];

_WASD = AKEYNAME("MoveForward") + "," + AKEYNAME("MoveBack") + "," + AKEYNAME("TurnLeft") + "," + AKEYNAME("TurnRight");

player createDiaryRecord ["changelog",["1.4d #35","
<br/>====================================
<br/>Update v1.4d #35 - 13.07.2020:
<br/>******************************
<br/><font color='#c0c0c0'>[Changed]</font> Added RHS Weapons & Vehicles
<br/><font color='#c0c0c0'>[Changed]</font> Added CUP Weapons & Vehicles
<br/><font color='#c0c0c0'>[Changed]</font> Modified vehicles avaiable for air drops
<br/>some more small fixes were made.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #34","
<br/>====================================
<br/>Update v1.4d #34 - 27.06.2020:
<br/>******************************
<br/><font color='#808080'>[Fixed]</font> Missing Territories Markers
<br/><font color='#808080'>[Fixed]</font> Mission hotfix
<br/><font color='#808080'>[Fixed]</font> Gearloadout 8, vest issue
<br/><font color='#808080'>[Fixed]</font> Mission: Cobra
<br/><font color='#c0c0c0'>[Changed]</font> View Distance cap
<br/><font color='#c0c0c0'>[Changed]</font> Fuel empty counter lowered
<br/><font color='#c0c0c0'>[Changed]</font> Terrain grid
<br/><font color='#c0c0c0'>[Changed]</font> Turkey Translations
<br/><font color='#c0c0c0'>[Changed]</font> Map changed some
<br/>some more small fixes were made.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #33","
<br/>====================================
<br/>Update v1.4d #33a - 18.06.2020:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> Blackhawk Down Mission added
<br/><font color='#c0c0c0'>[Added]</font> Helicopter store function added to all Vehicle stores
<br/><font color='#c0c0c0'>[Added]</font> All missing vehicles added
<br/><font color='#00a2ff'>[Added]</font> Turkey translation by Nightelion
<br/><font color='#00a2ff'>[Added]</font> More Stores added to Chernarus
<br/><font color='#808080'>[Fixed]</font> Beacon limit for stores fixed
<br/><font color='#808080'>[Fixed]</font> Clothing for Stores fixed
<br/><font color='#808080'>[Fixed]</font> Mission: Spetnaz and Delta Force
<br/><font color='#808080'>[Fixed]</font> Mission: Armed Helicopter Fixed
<br/><font color='#808080'>[Fixed]</font> Mission: Crimes of War
<br/><font color='#808080'>[Fixed]</font> Mission: Fake Police and Bounty Hunter color fixed
<br/><font color='#808080'>[Fixed]</font> Mission Controller fixed
<br/><font color='#808080'>[Fixed]</font> Mission Error in server logs fixed
<br/><font color='#808080'>[Fixed]</font> Revive system for Blufor and Opfor
<br/><font color='#808080'>[Fixed]</font> Gearloadout 7 and 8
<br/><font color='#808080'>[Fixed]</font> Bounding Boxes Updated
<br/><font color='#808080'>[Fixed]</font> Paint Uniform Button hotfix
<br/><font color='#808080'>[Fixed]</font> Medikits for Medics added to backpack not anymore to Vests at Respawn
<br/><font color='#808080'>[Fixed]</font> UAV saving bug fixed
<br/><font color='#808080'>[Fixed]</font> Admin clear menu kept closing
<br/><font color='#c0c0c0'>[Changed]</font> Flight restriction for UAVs
<br/><font color='#c0c0c0'>[Changed]</font> Teambalance changed
<br/><font color='#c0c0c0'>[Changed]</font> Jet DLC loadouts disabled
<br/><font color='#c0c0c0'>[Changed]</font> Map Updated
<br/><font color='#09A5FF'>[Optimize]</font> Optimized Client and Server Performance
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #32","
<br/>====================================
<br/>Update v1.4d #32 - 14.04.2020:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> Red Beret in GS
<br/><font color='#00a2ff'>[Added]</font> .50 Static Weapon in Gunstore
<br/><font color='#808080'>[Fixed]</font> Static Weapons fixed
<br/><font color='#808080'>[Fixed]</font> Next try fixing Vehicle Loadout
<br/>
<br/>towing, crate, spawn and other vehicle issues will be solved in #32b
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #32a","
<br/>====================================
<br/>Update v1.4d #32a Hotfix - 04.04.2020:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> Added one time useable Rocketlaunchers for Horse Cat
<br/><font color='#808080'>[Fixed]</font> Typos in Vehicle and Gunstore fixed
<br/><font color='#808080'>[Fixed]</font> Vehicle Loadout fixed
<br/><font color='#808080'>[Fixed]</font> Some placed objects were floating
<br/>
<br/>towing, crate, spawn and other vehicle issues will be solved in #32b
<br/>static weapons wont show up at moment, it will be fixed in #32b
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #32","
<br/>====================================
<br/>Update v1.4d #32 - 15.03.2020:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> Stash Item to place a bush while sniping
<br/><font color='#00a2ff'>[Added]</font> Quad Item to build-up a Quad
<br/><font color='#00a2ff'>[Added]</font> Dutch Translation by Liberty Prime
<br/><font color='#00a2ff'>[Added]</font> Admin Menu new functions
<br/><font color='#00a2ff'>[Added]</font> Garage variant support by AgentRev
<br/><font color='#808080'>[Fixed]</font> SpecOps Mission spawns
<br/><font color='#00a2ff'>[Added]</font> Chernarus: Mod support for Store
<br/><font color='#808080'>[Fixed]</font> Teamswitch filter for Independent was missing
<br/><font color='#808080'>[Fixed]</font> Admin Menu Mines and other clear stuff
<br/><font color='#808080'>[Fixed]</font> Scoreboard title missing
<br/><font color='#c0c0c0'>[Changed]</font> Airdrop Vehicle
<br/><font color='#c0c0c0'>[Changed]</font> Gearloadout 7/8
<br/><font color='#c0c0c0'>[Changed]</font> Russian Translation by Pavlik_Mopo3ob
<br/><font color='#c0c0c0'>[Changed]</font> Lowered Flares from 240 to 60 for Jets DLC
<br/><font color='#09A5FF'>[Optimize]</font> Optimized Client Performance
<br/><font color='#09A5FF'>[Optimize]</font> Some Missions were optimised and fixed
<br/>some more small fixes were made.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #31","
<br/>====================================
<br/>Update v1.4d #31 - 03.02.2020:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> Chernarus Hive Bridge for Mods
<br/><font color='#00a2ff'>[Added]</font> Reserved Slots feature added
<br/><font color='#c0c0c0'>[Added]</font> UAV player Icon added
<br/><font color='#c0c0c0'>[Added]</font> Suicide Bomb sounds added and one for donators (will add more next version)
<br/><font color='#c0c0c0'>[Added]</font> Russian Translation added by Pavlik_Mopo3ob
<br/><font color='#c0c0c0'>[Added]</font> Viper Helmet Added
<br/><font color='#c0c0c0'>[Changed]</font> Mission: SpecOps renamed to SpecOps Paratroops
<br/><font color='#c0c0c0'>[Changed]</font> Mission: SpecOps spawns only in 4 Postions and are more diffcult then DeltaForce or Spetsnaz
<br/><font color='#c0c0c0'>[Changed]</font> Mission: SpecOps have random Black Gear and spawn Launcher crate when complete
<br/><font color='#c0c0c0'>[Changed]</font> Mission: Hostile Jet now Hostile Xian and fixed, with more Xian variants
<br/><font color='#c0c0c0'>[Changed]</font> Respawn positions a little moved and more random
<br/><font color='#c0c0c0'>[Changed]</font> Wasteland Admin Menu got now functions to remove mines and other fps eater
<br/><font color='#c0c0c0'>[Changed]</font> Player Menu redesign to v2
<br/><font color='#c0c0c0'>[Changed]</font> First Spawn Rules Menu redesign
<br/><font color='#c0c0c0'>[Changed]</font> Beacons deploy function changed, added filter for glitched beacons
<br/><font color='#c0c0c0'>[Changed]</font> ESC money disconnect block lowered to HVT cash count, 300k
<br/><font color='#c0c0c0'>[Changed]</font> French Translation updated by Scorp/Ticlic
<br/><font color='#808080'>[Fixed]</font> Mission: Vehicle Capture Variable definied new
<br/><font color='#808080'>[Fixed]</font> Bounty invite fix
<br/><font color='#808080'>[Fixed]</font> Some crates spawned in towns empty
<br/><font color='#09A5FF'>[Optimize]</font> Map: Chernarus optimised (fixed, VS added, Garage added)
<br/>some more small fixes were made.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #30","
<br/>====================================
<br/>Update v1.4d #30 - 06.01.2020:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> More Stores, storages and ATMs added
<br/><font color='#808080'>[Fixed]</font> Mission: Abandoned Jet Marker fix
<br/><font color='#808080'>[Fixed]</font> Mission: Armed Jet Xian Sell price fix
<br/><font color='#808080'>[Fixed]</font> Mission: Graveyard removing objects when mission complete
<br/><font color='#808080'>[Fixed]</font> Mission: Sniper removing objects when mission complete
<br/><font color='#808080'>[Fixed]</font> Mission: Roadblock removing objects when mission complete
<br/><font color='#808080'>[Fixed]</font> Mission: Vehicle Convoys Height and Spawn fix
<br/><font color='#808080'>[Fixed]</font> Some Mission Gear errors got fixed
<br/><font color='#c0c0c0'>[Changed]</font> Despawn of Weapons from 3 to 5 minutes
<br/><font color='#c0c0c0'>[Changed]</font> Suitcase removal timer
<br/><font color='#c0c0c0'>[Changed]</font> Mission Store locations
<br/><font color='#c0c0c0'>[Changed]</font> Camps changed and new added, needs testing
<br/><font color='#09A5FF'>[Remove]</font> Donator functions for being able to use all Mods
<br/>some more small fixes were made.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #29a","
<br/>====================================
<br/>Update v1.4d #29a Hotfix - 17.12.2019:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> New Markers for new missions
<br/><font color='#00a2ff'>[Added]</font> French translation by Scorplx
<br/><font color='#808080'>[Fixed]</font> Enemy Territory Marker
<br/><font color='#808080'>[Fixed]</font> Markers for Missions, ATMs added
<br/><font color='#808080'>[Fixed]</font> Hive Errors
<br/><font color='#c0c0c0'>[Changed]</font> Salvage prices
<br/><font color='#c0c0c0'>[Changed]</font> Some Settings
<br/>some more small fixes were made.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #29","
<br/>====================================
<br/>Update v1.4d #29 - 12.12.2019:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> New Extra-Mission: Graveyard
<br/><font color='#00a2ff'>[Added]</font> New Extra-Mission: Falcon
<br/><font color='#00a2ff'>[Added]</font> New Money-Mission: Crimes of War
<br/><font color='#00a2ff'>[Added]</font> Teambalancing System with VIP function
<br/><font color='#808080'>[Fixed]</font> Some Jets used wrong classes (HostilePlane, ArmedJet, Hostile Jet Formation)
<br/><font color='#808080'>[Fixed]</font> Missionlist loops changed
<br/><font color='#808080'>[Fixed]</font> Revive function optimised
<br/><font color='#808080'>[Fixed]</font> Mortars optimised
<br/><font color='#808080'>[Fixed]</font> Teamlock has been fixed
<br/><font color='#c0c0c0'>[Changed]</font> Max Distance changed from 3000 to 3500
<br/><font color='#c0c0c0'>[Changed]</font> Airdrop Vanguard Black Box to Night Box for Night events
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #28","
<br/>====================================
<br/>Update v1.4d #28 - 02.12.2019:
<br/>******************************
<br/><font color='#00a2ff'>[Added]</font> Added ATM in the north of Stratis
<br/><font color='#808080'>[Fixed]</font> Hostile Jet Formation mission fixed
<br/><font color='#808080'>[Fixed]</font> Hostile Heli and Jet missions fixed
<br/><font color='#808080'>[Fixed]</font> Thunder Mission fixed
<br/><font color='#808080'>[Fixed]</font> Selling Vehicle price is now correct
<br/><font color='#c0c0c0'>[Changed]</font> Patrol (Town) and Sniper markers added for new missions and some existing.
<br/><font color='#808080'>[Fixed]</font> Gear Loadout 5 was optimised for all Servers, 50. Ammo added to the type-115 weapon
<br/><font color='#c0c0c0'>[Changed]</font> Loottables were reworked.
<br/><font color='#c0c0c0'>[Changed]</font> Vehicle Loots were reworked.
<br/><font color='#09A5FF'>[Remove]</font> Removed Flying stuff near Camp Delta
<br/><font color='#808080'>[Fixed]</font> WBV Removed from Missions and GS Store Backpack
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #27","
<br/>====================================
<br/>Update v1.4d #27 - 15.11.2019:
<br/>******************************
<br/><font color='#808080'>[Fixed]</font> Some mission fixes
<br/><font color='#808080'>[Fixed]</font> Delta Camp ladder fix, glitches removed and added new entry
<br/><font color='#808080'>[Fixed]</font> Backpacks are cleaned before they are put into crates
<br/><font color='#808080'>[Fixed]</font> Complete Mission marker only shows up when mission been completed successfully
<br/><font color='#c0c0c0'>[Changed]</font> Compass Hints to disable it added
<br/><font color='#c0c0c0'>[Changed]</font> Killfeed standard position moved *press playermenu killfeed and change x and y offsets yourself.
<br/><font color='#c0c0c0'>[Changed]</font> Gear Level 6 Weapon changed nomore SPAR rather a CAR95-1
<br/><font color='#c0c0c0'>[Changed]</font> Price of Centurion Turret to 35k
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #26","
<br/>====================================
<br/>Update v1.4d #26 - 11.11.2019:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Random Roadblock Missions added
<br/><font color='#00a2ff'>[Added]</font> New Random Outpost Mission added
<br/><font color='#00a2ff'>[Added]</font> Mission complete marker
<br/><font color='#00a2ff'>[Added]</font> High Drugs Value script added, do not carry too much drugs
<br/><font color='#808080'>[Fixed]</font> Beacon glitching fixed
<br/><font color='#c0c0c0'>[Changed]</font> Resupply price changed, Weapon System resupply price lowered to 35000
<br/><font color='#c0c0c0'>[Changed]</font> Vehicle and Building Loot spawn, changed
<br/><font color='#c0c0c0'>[Changed]</font> Vehicle Damage System: HeliMisDmg: 1.5 (before 2.0), PlaneMisDmg: 1.25 (*1.5), IFVDmg: 1.25 (*1.5), Tank Dmg: 1.6 (*2.0)
<br/><font color='#c0c0c0'>[Changed]</font> AI Equipment was changed a little bit
<br/><font color='#c0c0c0'>[Changed]</font> MISSION: Abandoned Jet added more vehicles with custom loadouts
<br/><font color='#808080'>[Fixed]</font> MISSION: Armed Diver Squad error hotfix
<br/><font color='#808080'>[Fixed]</font> MISSION: Vehicle Capture hotfix
<br/><font color='#09A5FF'>[Optimize]</font> MISSION: Hostile Helicopter / Jet mission optimized
<br/><font color='#c0c0c0'>[Changed]</font> MISSION: Money Shipment added some vehicles and changed difficulty
<br/><font color='#c0c0c0'>[Changed]</font> MISSION: Geocache Parachute added
<br/><font color='#c0c0c0'>[Changed]</font> MISSION: Truck gets a small hotfix
<br/><font color='#c0c0c0'>[Changed]</font> MISSION: Towninvasion changed completely
<br/><font color='#808080'>[Fixed]</font> Random Outpost Missions edited the crates, to remove thermal optics
<br/><font color='#808080'>[Fixed]</font> MISSION: Drugrunners fixed and updated
<br/><font color='#c0c0c0'>[Changed]</font> MISSION: Hostile Helicopter changed difficulty
<br/><font color='#808080'>[Fixed]</font> MISSION: HostileJet more jet types added
<br/><font color='#808080'>[Fixed]</font> MISSION: Roadblock fixed and updated
<br/><font color='#09A5FF'>[Optimize]</font> Made a new Gearloadout system (you wont notice any difference, just optimized code)
<br/><font color='#ff0000'>[Remove]</font>Artillery Item from Stores, my mistake sorry.
<br/>All changes can be discussed on Discord.
<br/>Thanks to AgentRev for fixing some Bugs again.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #25","
<br/>====================================
<br/>Update v1.4d #25 - 21.10.2019:
<br/>*****************************
<br/><font color='#09A5FF'>[Official]</font>All recent changes and Updates from the Official Framework were added.
<br/><font color='#00a2ff'>[Added]</font> Member System Added - Membership is Free, just apply on our Forums as a Member.
<br/><font color='#00a2ff'>[Added]</font> Flashbang Added but hidden in one crate for testing
<br/><font color='#808080'>[Fixed]</font> Spawn at Camps for Team mates works against
<br/><font color='#808080'>[Fixed]</font> Weapon System Reload bug fixed
<br/><font color='#808080'>[Fixed]</font> Fishies and Hostile Jet Mission
<br/><font color='#09A5FF'>[Optimise]</font> Performance Optimised
<br/>All changes can be discussed on Discord.
<br/>Thanks to AgentRev for fixing alot of Bugs.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #24","
<br/>====================================
<br/>Update v1.4d #24 - 27.08.2019:
<br/>*****************************
<br/><font color='#808080'>[Fixed]</font> Map Mission: Airfield Garage Spawn
<br/><font color='#808080'>[Fixed]</font> Friend spawning should be functionable near Camp Delta
<br/><font color='#808080'>[Fixed]</font> Gearloadout: Medic Level 7 missing Medikit
<br/><font color='#808080'>[Fixed]</font> Side Mission: Bounty Hunter cash fix
<br/><font color='#808080'>[Fixed]</font> Gearloadout: Sniper spawn with Rangefinder
<br/><font color='#09A5FF'>[Optimise]</font> Performance Optimised
<br/>All changes can be discussed on Discord.
<br/>====================================
"]];

// <br/><font color='#808080'>[Added]</font> Added a Flashbang with own sound and effects.

player createDiaryRecord ["changelog",["1.4d #23","
<br/>====================================
<br/>Update v1.4d #23 - 25.07.2019:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Promet 6.5 mm with all 4 skins and types (Normal, MR, SG, GL)
<br/><font color='#00a2ff'>[Added]</font> Promet Modular Sight with all 4 skins
<br/><font color='#00a2ff'>[Added]</font> Kozlice 12G (regular / sawed-off) Shotgun
<br/><font color='#00a2ff'>[Added]</font> AKU-12 7.62 mm with all 3 skins
<br/><font color='#00a2ff'>[Added]</font> RPK-12 7.62 mm with all 3 skins
<br/><font color='#00a2ff'>[Added]</font> ARCO AK-zeroed with 3 skins
<br/><font color='#00a2ff'>[Added]</font> UAV Terminal [LDF]
<br/><font color='#00a2ff'>[Added]</font> Mk14 7.62 mm (classic) with 1 new skin
<br/><font color='#00a2ff'>[Added]</font> AK-12 with 2 new skins
<br/><font color='#00a2ff'>[Added]</font> Mk200 6.5 mm with 1 new skin
<br/><font color='#00a2ff'>[Added]</font> RPG-42 with 1 new skin
<br/><font color='#00a2ff'>[Added]</font> Titan MPRL with 2 new skins
<br/><font color='#00a2ff'>[Added]</font> Mk17 Holosight with 2 new skins
<br/><font color='#00a2ff'>[Added]</font> 4-five .45 ACP with 1 new skin
<br/><font color='#00a2ff'>[Added]</font> Sound Suppressor (7.62 mm) with 2 new skins
<br/><font color='#00a2ff'>[Added]</font> Bipod with 2 new skins
<br/><font color='#00a2ff'>[Added]</font> ARCO with 2 new skins
<br/><font color='#00a2ff'>[Added]</font> DMS with 2 new skins
<br/><font color='#00a2ff'>[Added]</font> Compact NVG with 1 new skin
<br/><font color='#00a2ff'>[Added]</font> New Vests, Uniforms, Headgear, Goggles, Backpacks
<br/><font color='#00a2ff'>[Added]</font> New Skins for Vests, Uniforms, Headgear, Goggles, Backpacks
<br/><font color='#00a2ff'>[Added]</font> New UAV Skins
<br/><font color='#00a2ff'>[Added]</font> Offroader Covered
<br/><font color='#00a2ff'>[Added]</font> Tractor
<br/><font color='#00a2ff'>[Added]</font> Rules Accept Button on Firstspawn
<br/><font color='#00a2ff'>[Added]</font> Gunstore Shotgun Menubar
<br/><font color='#00a2ff'>[Added]</font> Genstore Goggles and Anti Gas Menubar
<br/><font color='#808080'>[Fixed]</font> Fixed Gearloadout DLC Bug
<br/><font color='#808080'>[Fixed]</font> Fixed Weapon Boxes as reward for Missions
<br/><font color='#808080'>[Fixed]</font> Fixed Mission Errors in Server logs
<br/><font color='#00a2ff'>[Added]</font> New Weapon Boxes and more crate models
<br/><font color='#00a2ff'>[Added]</font> SpecOps and Spetsnaz Missions
<br/><font color='#c0c0c0'>[Changed]</font> Camp Delta uses new Contact DLC buildings
<br/><font color='#c0c0c0'>[Changed]</font> Gearloadouts reworked and support A3 Contact DLC Content
<br/><font color='#c0c0c0'>[Changed]</font> Gen- and Gunstore Menubar Buttons rec
<br/><font color='#c0c0c0'>[Changed]</font> NPC Skins and Equipment changed
<br/><font color='#c0c0c0'>[Changed]</font> Weapon Boxes Items changed and new added
<br/><font color='#c0c0c0'>[Changed]</font> Gas Masks are immune against Teargas and Toxicgas
<br/><font color='#09A5FF'>[Optimise]</font> Mission Script rewrite, less performance use
<br/><font color='#09A5FF'>[Remove]</font> Removed Armed Patrol Mission, needs fix
<br/><font color='#c0c0c0'>[Changed]</font> Y-32 Xian removed for (Stratis/Livonia)
<br/><font color='#808080'>[Fixed]</font> Extra Mission The Blackfish
<br/><font color='#808080'>[Fixed]</font> UGV Backpacks disappear at reconnect
<br/><font color='#808080'>[Fixed]</font> UGV support tow function
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #22","
<br/>====================================
<br/>Update v1.4d #22 - 10.07.2019:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Donator yellow colored VIP marker
<br/><font color='#00a2ff'>[Added]</font> Ladder into the Office building in the Delta Camp (bug when destroying building)
<br/><font color='#808080'>[Fixed]</font> Helicopter spawn in Camp Delta was set up incorrectly.
<br/><font color='#808080'>[Fixed]</font> Airfield random Object spawn function removed.
<br/><font color='#c0c0c0'>[Changed]</font> Gearloadouts changed and optimized
<br/>====================================
"]];

// <br/><font color='#00a2ff'>[Added]</font> Our Vanguard custom loadout system is back. (If any problems occur please contact us on our Discord / Forum)

player createDiaryRecord ["changelog",["1.4d #21","
<br/>====================================
<br/>Update v1.4d #21 - 31.05.2019:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Flight Height Limit at 1500m
<br/><font color='#00a2ff'>[Added]</font> Some more Stores and Garages Added
<br/><font color='#00a2ff'>[Added]</font> More Building and Bases
<br/><font color='#00a2ff'>[Added]</font> Camp Delta in the middle of the Map with all Stores
<br/><font color='#808080'>[Fixed]</font> ToxicGas AA Fix
<br/><font color='#c0c0c0'>[Changed]</font> Lock Function at different position
<br/><font color='#00a2ff'>[Added]</font> More Building Deco Added
<br/><font color='#c0c0c0'>[Changed]</font> GS Store replaced
<br/><font color='#c0c0c0'>[Changed]</font> Camp Delta placement removed
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #20","
<br/>====================================
<br/>Update v1.4d #20 - 15.05.2019:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Discord Link Added
<br/><font color='#09A5FF'>[Optimise]</font> Fixed about 25 Errors all over the Missions for Stratis, Malden, Altis and Tanoa
<br/><font color='#808080'>[Fixed]</font> Many Mission Errors fixed
<br/><font color='#808080'>[Fixed]</font> Teargas and Toxicgas function got a minifix
<br/><font color='#c0c0c0'>[Changed]</font> Mission Money prices fixed
<br/><font color='#c0c0c0'>[Changed]</font> Custom Loadout Menu removed because auf tons of errors, going to be fixed.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #19","
<br/>====================================
<br/>Update v1.4d #19 - 15.04.2019:
<br/>*****************************
<br/><font color='#808080'>[Fixed]</font> Briefing false Gear Loadout Informations
<br/><font color='#808080'>[Fixed]</font> More Mission vehicles with Set Vehicle prices
<br/><font color='#808080'>[Fixed]</font> Mission Errors
<br/><font color='#c0c0c0'>[Changed]</font> Mission Prices
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #18","
<br/>====================================
<br/>Update v1.4d #18 - 20.03.2019:
<br/>*****************************
<br/><font color='#808080'>[Fixed]</font> Cash Fix for Thunder and HostilePlane Mission
<br/><font color='#808080'>[Fixed]</font> Customloadout Error at Connections of some Players
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #17","
<br/>====================================
<br/>Update v1.4d #17 - 06.03.2019:
<br/>*****************************
<br/><font color='#808080'>[Fixed]</font> Ammo fill on Standard Loadout
<br/><font color='#808080'>[Fixed]</font> Fixed vehicle paint saving bug 
<br/><font color='#808080'>[Fixed]</font> Disabled slingloading of static resupply trucks
<br/><font color='#00a2ff'>[Added]</font> Custom Loadout in Respawn Menu
<br/><font color='#00a2ff'>[Added]</font> Flares to Caesar BTT
<br/><font color='#c0c0c0'>[Changed]</font> All Backpacks are Invisible
<br/><font color='#c0c0c0'>[Changed]</font> More Earplug Sound Options
<br/><font color='#808080'>[Fixed]</font> Buzzard sellable from Abandoned Jet mission
<br/><font color='#808080'>[Fixed]</font> Mission Errors
<br/><font color='#808080'>[Fixed]</font> Respawn Dialog Error
<br/><font color='#808080'>[Fixed]</font> AH-9 Crosshair paint bug
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #16","
<br/>====================================
<br/>Update v1.4d #16 - 30.01.2019:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Delta Mission Pawnee
<br/><font color='#00a2ff'>[Added]</font> Delta Mission Fishie
<br/><font color='#00a2ff'>[Added]</font> Delta Mission Thunder
<br/><font color='#808080'>[Removed]</font> Hacker Mission
<br/><font color='#808080'>[Fixed]</font> Infantry Group
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #15","
<br/>====================================
<br/>Update v1.4d #15 - 20.01.2019:
<br/>*****************************
<br/><font color='#808080'>[Fixed]</font> Gear Level System
<br/><font color='#808080'>[Fixed]</font> Blackscreen removed at respawn
<br/><font color='#808080'>[Fixed]</font> Hvt Fixed Error
<br/><font color='#808080'>[Fixed]</font> Bounty Invite Group workaround by Kohjin
<br/><font color='#808080'>[Fixed]</font> Infgroup moving
<br/><font color='#808080'>[Fixed]</font> Geocaching fixed
<br/><font color='#808080'>[Fixed]</font> Hackers Table not moveable
<br/><font color='#09A5FF'>[Optimise]</font> Performance Optimised
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4d #14","
<br/>====================================
<br/>Update v1.4d #14 - 14.01.2019:
<br/>*****************************
<br/><font color='#c0c0c0'>[Changed]</font> Official A3W Version v1.4c to v1.4d
<br/><font color='#00a2ff'>[Added]</font> 4 Donator Uniforms
<br/><font color='#00a2ff'>[Added]</font> ADR-97 SMG Vehicle Spawns
<br/><font color='#00a2ff'>[Added]</font> Paint vehicle option at stores
<br/><font color='#00a2ff'>[Added]</font> Weapon filter for gunstore accessories
<br/><font color='#00a2ff'>[Added]</font> Territory capture warning icons on map
<br/><font color='#00a2ff'>[Added]</font> Support for Malden, Altis, Tanoa
<br/><font color='#c0c0c0'>[Changed]</font> Gear Loadout
<br/><font color='#c0c0c0'>[Changed]</font> Vehicle Ammo Loadouts
<br/><font color='#808080'>[Fixed]</font> Scoreboard
<br/><font color='#808080'>[Fixed]</font> Invite to Group Bug since Bountyhunter was Added
<br/><font color='#808080'>[Fixed]</font> UAVs retrieved from parking are unconnectable
<br/><font color='#808080'>[Fixed]</font> Other minor changes and fixes
<br/><font color='#09A5FF'>[Optimise]</font> Performance for Weapon System and FPS
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4c #13","
<br/>====================================
<br/>Update v1.4c #13 - 29.12.2018:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Gear Custom Loadout at Gear Level 8
<br/><font color='#00a2ff'>[Added]</font> Random Halo Jump in Respawn Menu
<br/><font color='#00a2ff'>[Added]</font> Donationsystem (Uniform/Vehicle Skin Button)
<br/><font color='#00a2ff'>[Added]</font> Cannot disconnect when more then 500k Cash in pocket
<br/><font color='#00a2ff'>[Added]</font> Information Intro
<br/><font color='#00a2ff'>[Added]</font> Bounty Hunter
<br/><font color='#00a2ff'>[Added]</font> Killfeed
<br/><font color='#c0c0c0'>[Changed]</font> Blackwasp, Gryphon, Shikra, Xian, Rhino and Kajman Loadout
<br/><font color='#c0c0c0'>[Changed]</font> Delta Crates more Weapons
<br/><font color='#c0c0c0'>[Changed]</font> Airdrop Crate is now IDAP (orange)
<br/><font color='#808080'>[Fixed]</font> Weapons in Gearloadout
<br/><font color='#808080'>[Fixed]</font> Alot of known Bugs
<br/><font color='#808080'>[Fixed]</font> Side, Delta, Money and Main Missions
<br/><font color='#808080'>[Fixed]</font> Repair Kit Suitcases will be removed randomly
<br/><font color='#09A5FF'>[Optimise]</font> Performance Optimised
<br/><font color='#09A5FF'>[Optimise]</font> Side, Delta, Money and Main Missions
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4c #12 - Delta","
<br/>====================================
<br/>Update v1.4c #12 - 19.12.2018:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Gear Level System at Freshspawn
<br/><font color='#00a2ff'>[Added]</font> Support for more Client Mods open the Map for more Info
<br/><font color='#00a2ff'>[Added]</font> Delta Missions (9 Missionen)
<br/><font color='#00a2ff'>[Added]</font> 3 Other Missions
<br/><font color='#00a2ff'>[Added]</font> 1 General, 1 Vehicle and 1 Gunstore
<br/><font color='#00a2ff'>[Added]</font> Centurion and Praetorian Gun stations
<br/><font color='#00a2ff'>[Added]</font> 2 New Bundeswehr Camo Vehicle Skins
<br/><font color='#00a2ff'>[Added]</font> 1 Money, 1 Side and 1 Main Mission
<br/><font color='#00a2ff'>[Added]</font> Holster Key Command Added
<br/><font color='#00a2ff'>[Added]</font> Enter noDLC Vehicle Function
<br/><font color='#00a2ff'>[Added]</font> ADR-97 Added and Spawn Loadout
<br/><font color='#c0c0c0'>[Changed]</font> Player Menu Changed
<br/><font color='#c0c0c0'>[Changed]</font> Fog Disabled
<br/><font color='#c0c0c0'>[Changed]</font> Thermals Disabled
<br/><font color='#c0c0c0'>[Changed]</font> Sprint Speed Optimised
<br/><font color='#c0c0c0'>[Changed]</font> Some Mission AIs are Harder
<br/><font color='#c0c0c0'>[Changed]</font> Plane Prices Changed
<br/><font color='#c0c0c0'>[Changed]</font> Gunstore Item placing not possible anymore
<br/><font color='#c0c0c0'>[Changed]</font> Server Settings changed
<br/><font color='#808080'>[Fixed]</font> Fake Police and Hunter Mission
<br/><font color='#808080'>[Fixed]</font> Prevent enemies and friendlies from getting in vehicle simultaneously
<br/><font color='#808080'>[Fixed]</font> Roadblock Mission
<br/><font color='#09A5FF'>[Optimise]</font> Performance Optimised
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4.c #11","
<br/>====================================
<br/>Update v1.4c #11 - 29.08.2018:
<br/>*****************************
<br/>[Added] Destroyer Ship Zone + New Gunstore
<br/>[Added] Loot Added to CivHeli Mission
<br/>[Changed] Dynamic Loadouts with DLC Check-Support
<br/>[Fixed] Money and other Fixes
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4c #10","
<br/>====================================
<br/>Update v1.4c #10 - 12.04.2018:
<br/>*****************************
<br/><font color='#00a2ff'>[Added]</font> Added Tanoa Vehicle Skins
<br/><font color='#00a2ff'>[Added]</font> Tanks DLC in Store and Airdrop
<br/><font color='#00a2ff'>[Added]</font> 3rd column in vehicle store for parts
<br/><font color='#00a2ff'>[Added]</font> AA jet variants
<br/><font color='#00a2ff'>[Added]</font> HE cannons to gun-only jets
<br/><font color='#00a2ff'>[Added]</font> Smoke launchers to tank driver and gunner seats
<br/><font color='#00a2ff'>[Added]</font> Added Tanoa Vehicle Skins
<br/><font color='#c0c0c0'>[Changed]</font> All hidden vehicle paintjobs now available
<br/><font color='#c0c0c0'>[Changed]</font> Improved crate and supply truck loot
<br/><font color='#c0c0c0'>[Changed]</font> Some store prices
<br/><font color='#808080'>[Fixed]</font> Selling of laser designators
<br/><font color='#808080'>[Fixed]</font> More money exploits
<br/><font color='#808080'>[Fixed]</font> Other minor changes and fixes
<br/><font color='#808080'>[Fixed]</font> Killcount should work now.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4c #9","
<br/>====================================
<br/>Update v1.4c #9 - 10.02.2018:
<br/>*****************************
<br/><font color='#c0c0c0'>[Changed]</font> Version 1.3c to 1.4
<br/><font color='#00a2ff'>[Added]</font> TacOps DLC Skins
<br/><font color='#00a2ff'>[Added]</font> Player body marker
<br/><font color='#00a2ff'>[Added]</font> Diving gear to purchased RHIB, Speedboat, SDV
<br/><font color='#00a2ff'>[Added]</font> SDAR turret to SDV gunner and loading capacity
<br/><font color='#00a2ff'>[Added]</font> All Uniform Skins from all DLCs
<br/><font color='#00a2ff'>[Added]</font> All Backpacks, Headgears, items and Vests
<br/><font color='#00a2ff'>[Added]</font> All Vehicles and their Arma Skins
<br/><font color='#00a2ff'>[Added]</font> More Laws of War DLC Bus Skins
<br/><font color='#00a2ff'>[Added]</font> Killfeed HUD
<br/><font color='#c0c0c0'>[Changed]</font> Improved revive system
<br/><font color='#c0c0c0'>[Changed]</font> Improved UAV System
<br/><font color='#c0c0c0'>[Changed]</font> Improved kill attribution
<br/><font color='#c0c0c0'>[Changed]</font> Changed Airdrops
<br/><font color='#c0c0c0'>[Changed]</font> Improved antihack
<br/><font color='#c0c0c0'>[Changed]</font> Improved Storages
<br/><font color='#808080'>[Fixed]</font> Prone reload freeze
<br/><font color='#808080'>[Fixed]</font> Very many minor changes and fixes
<br/><font color='#808080'>[Fixed]</font> R3F Updated
<br/><font color='#09A5FF'>[Optimise]</font> Optimised for coming Tank DLC
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4b#8","
<br/>====================================
<br/>Update v1.4b #8 - 11.09.2017:
<br/>*************************
<br/><font color='#00a2ff'>[Added]</font> Xian with ClusterBombs
<br/><font color='#00a2ff'>[Added]</font> Laws of War DLC Support
<br/><font color='#00a2ff'>[Added]</font> MQ-12 DynamicLoadout Falcon UAV (MQ-12 with new Weapons)
<br/><font color='#808080'>[Fixed]</font> Buzzard with ClusterBombs
<br/><font color='#808080'>[Fixed]</font> VS Store NPC at Carrier not moveable anymore
<br/><font color='#808080'>[Fixed]</font> IDAP Mohawk-Clone Skin fixed
<br/><font color='#c0c0c0'>[Changed]</font> MQ-12 Falcon UAV Munition changed
<br/>====================================
"]];
player createDiaryRecord ["changelog",["1.4b#7","
<br/>====================================
<br/>Update v1.4b #7 - 12.07.2017:
<br/>*************************
<br/><font color='#00a2ff'>[Added]</font> 64 Bit Support
<br/><font color='#c0c0c0'>[Fixed]</font> Code Optimised and Bugs fixed
<br/><font color='#c0c0c0'>[Changed]</font> Bridge Redesigned
<br/><font color='#09A5FF'>[Remove]</font> Removed all APEX content! Tanoa DLC is no longer needed to connect.
<br/><font color='#c0c0c0'>[Changed]</font> Locked Supply Trucks for Players.
<br/><font color='#c0c0c0'>[Changed]</font> Builded New Stairs for the Air Carrier (without APEX structures)
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4b#6","
<br/>====================================
<br/>Update v1.4b #6 - 18.05.2017:
<br/>*************************
<br/><font color='#808080'>[Fixed]</font> Aircarrier Ramp Driveable now
<br/><font color='#808080'>[Fixed]</font> Fixed Moving NPCs
<br/><font color='#808080'>[Fixed]</font> Fixed Main Missions
<br/><font color='#808080'>[Fixed]</font> Fixed Vehicle Spawning
<br/><font color='#09A5FF'>[Remove]</font> Removed APEX DLC Stuff
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4b#5","
<br/>====================================
<br/>Update v1.4b #5 - 17.05.2017:
<br/>*************************
<br/><font color='#00a2ff'>[Added]</font> Jets DLC
<br/><font color='#00a2ff'>[Added]</font> Aircraft carrier on Stratis
<br/><font color='#00a2ff'>[Added]</font> Resupply trucks Stratis
<br/><font color='#00a2ff'>[Added]</font> Vanguard Black Box in Airdrop
<br/><font color='#808080'>[Fixed]</font> UAV Ownership Error
<br/><font color='#808080'>[Fixed]</font> Fixed NavySeals Mission
<br/><font color='#808080'>[Fixed]</font> Fixed AI
<br/><font color='#808080'>[Fixed]</font> Apex Airdrop Backpack Loot Fixed
<br/><font color='#808080'>[Fixed]</font> Deleting Mines, Objects, Vehicles Fixed
<br/><font color='#808080'>[Fixed]</font> Fast revive exploits
<br/><font color='#808080'>[Fixed]</font> Could perform your duty after being revived
<br/><font color='#808080'>[Fixed]</font> Other minor changes and fixes
<br/><font color='#c0c0c0'>[Changed]</font> Changed UAV weapons
<br/><font color='#c0c0c0'>[Changed]</font> Aircraft prices
<br/><font color='#c0c0c0'>[Changed]</font> Blocked explosives near parking and storage
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4b#4","
<br/>====================================
<br/>Update v1.4b #4 - 17.12.2016:
<br/>*************************
<br/><font color='#808080'>[Fixed]</font> Camera View while Jumping
<br/><font color='#c0c0c0'>[Changed]</font> Headshot Kills Disabled because of Exploit
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4#3","
<br/>====================================
<br/>Update v1.4b #3 - 04.10.2016:
<br/>*************************
<br/><font color='#808080'>[Fixed]</font> Boxes Inventory fix for some Missions
<br/><font color='#808080'>[Fixed]</font> Airdrop Price
<br/><font color='#808080'>[Fixed]</font> Pickup of Drugs
<br/><font color='#808080'>[Fixed]</font> Kicked after Dropping Drugs
<br/><font color='#c0c0c0'>[Changed]</font> Marijuana Effect Smokeshell
<br/><font color='#c0c0c0'>[Changed]</font> Global Markers deaktiviert
<br/><font color='#c0c0c0'>[Changed]</font> TWS and Nightstalkers Removed.
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4#2","
<br/>====================================
<br/>Update v1.4b #2 - 03.10.2016:
<br/>*************************
<br/><font color='#00a2ff'>[Added]</font> Jet Hostile Mission
<br/><font color='#00a2ff'>[Added]</font> Jet Hostile Formation Mission Added
<br/><font color='#00a2ff'>[Added]</font> Infantry Hostile Mission Added
<br/><font color='#c0c0c0'>[Changed]</font> Staminabar disabled
<br/><font color='#c0c0c0'>[Changed]</font> Stamina Function disabled
<br/>====================================
"]];

player createDiaryRecord ["changelog",["1.4#1","
<br/>====================================
<br/>Initial release - 02.10.2016:
<br/>*************************
<br/><font color='#808080'>[Fixed]</font> Earplugs works with End Button
<br/><font color='#808080'>[Fixed]</font> Airdrop Menu wont close anymore
<br/><font color='#808080'>[Fixed]</font> Wont be kicked when buying Thermalweapons
<br/><font color='#808080'>[Fixed]</font> Sniper Mission had log errors
<br/><font color='#c0c0c0'>[Changed]</font> VIP Status now shown at 30000 cash
<br/><font color='#c0c0c0'>[Changed]</font> Offroader is now worth 11000 not 110000
<br/><font color='#c0c0c0'>[Changed]</font> Weather Script Optimised
<br/><font color='#00a2ff'>[Added]</font> 9mm 10Rnd Mags
<br/>====================================
"]];

player createDiaryRecord ["credits",["Credits","
<br/><font size='16' color='#BBBBBB'>Developed by A3Wasteland.com:</font>
<br/>	* AgentRev
<br/>
<br/><font size='16' color='#BBBBBB'>Modified by Vanguard:</font>
<br/>	* Exonical / Bryce
<br/>	* AryX / zEro
<br/>	* Kohjin (some fixes)
<br/>	* French Translation by Scorpl/Ticlic
<br/>	* Russian Translation by Pavlik_Mopo3ob
<br/>	* Dutch Translation by Liberty Prime
<br/>	* Reaper (Testing)
<br/>
<br/><font size='16' color='#BBBBBB'>Other contributors:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* Austerror (GitHub)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* Champ-1 (CHVD)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* Farooq (GitHub)
<br/>	* gtoddc (A3W forums)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Killzone_Kid (KillzoneKid.com)
<br/>	* Krunch (GitHub)
<br/>	* LouDnl (GitHub)
<br/>	* madbull (R3F)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* micovery (GitHub)
<br/>	* Na_Palm (BIS forums)
<br/>	* Outlawled (Armaholic)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* Shockwave (A3W forums)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>	* wiking.at (A3W forums)
<br/>	* xx-LSD-xx (Armaholic)
<br/>	* Zenophon (BIS Forums)
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"]];

player createDiaryRecord ["infos",["Admin Spectate keys","
<br/>Admin menu Spectate camera controls:
<br/>
<br/>Shift + " + AKEYNAME("NextChannel") + " (next player)
<br/>Shift + " + AKEYNAME("PrevChannel") + " (previous player)
<br/>Ctrl + " + NKEYNAME(18) + " (exit camera)
<br/>Ctrl + " + AKEYNAME("Chat") + " (attach/detach camera from target)
<br/>Ctrl + " + NKEYNAME(35) + " (toggle target HUD)
<br/>" + AKEYNAME("NightVision") + " (nightvision, thermal)
<br/>" + _WASD + " (move camera around)
<br/>" + NKEYNAME(16) + " (move camera up)
<br/>" + NKEYNAME(44) + " (move camera down)
<br/>Mouse Move (rotate camera)
<br/>Mouse Wheel Up (increase camera speed)
<br/>Mouse Wheel Down (decrease camera speed)
<br/>Shift + " + _WASD + " (move camera around faster)
<br/>" + AKEYNAME("ShowMap") + " (open/close map - click on map to teleport camera)"]];

player createDiaryRecord ["infos",["Player hotkeys","
<br/>List of default player hotkeys:
<br/>
<br/>" + NKEYNAME(41) + " (open player menu)
<br/>" + NKEYNAME(207) + " (toggle earplugs / Kopfhoerer)
<br/>" + NKEYNAME(199) + ", " + NKEYNAME(219) + ", " + NKEYNAME(220) + " (toggle player names)
<br/>Ctrl + " + AKEYNAME("GetOut") + " (emergency eject)
<br/>" + AKEYNAME("GetOver") + " (open parachute)
<br/>Shift + " + NKEYNAME(201) + " / " + NKEYNAME(209) + " (adjust nightvision)
<br/>P = Score Menu
"]];

player createDiaryRecord ["infos",["Hints and Tips","
<br/><font size='18'>A3Wasteland</font>
<br/>
<br/>* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.
<br/>
<br/>* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.
<br/>
<br/>* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.
<br/>
<br/>* Always be on the lookout for nightvision. they are located in the ammo crates, and there are pairs scattered throughout vehicles. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.
<br/>
<br/>* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.
<br/>
<br/>* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.
"]];

player createDiaryRecord ["infos",["About Wasteland","
<br/>Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress, please direct your reports to http://forums.a3wasteland.com/
<br/>
<br/>FAQ:
<br/>
<br/>Q. What am I supposed to do here?
<br/>A. See the above description
<br/>
<br/>Q. Where can I get a gun?
<br/>A. Weapons are found in one of three places, first in ammo crates that come as rewards from missions, inside and outside buildings, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
<br/>
<br/>Q. What are the blue circles on the map?
<br/>A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/>
<br/>Q. Why is it so dark, I cant see.
<br/>A. The server has a day/night cycle just like in the real world, and as such, night time is a factor in your survival. It is recommended that you find sources of light or use your Nightvision Goggles as the darkness sets in.
<br/>
<br/>Q. Is it ok for me to shoot my team mates?
<br/>A. If you are member of BLUFOR or OPFOR teams, then you are NOT allowed to shoot or steal items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
<br/>
<br/>Q. Whats with the canisters, baskets and big bags?
<br/>A. This game has a food and water system that you must stay on top of if you hope to survive. You can collect food and water from food sacks and wells, or baskets and plastic canisters dropped by dead players. Food and water will also randomly spawn around the map.
<br/>
<br/>Q. I saw someone breaking a rule, what do I do?
<br/>A. Simply go into global chat and get the attention of one of the admins or visit our forums, and make a report if the offense is serious.
"]];

player createDiaryRecord ["vanguardrules",["Server Rules","
<br/><font size='16' color='#808080'>Vanguard Wasteland Rules</font>
<br/>===========================================
<br/>
<br/>- It is not allowed to use a racist playername or group tag.
<br/>
<br/>- It is not allowed to teamkill BLUFOR (Blue) or OPFOR (Red) teammates and/or steal their money.
<br/>
<br/>- When writing in global/side stick to English in order for players to be able to understand you. (for other languages try to use the group chats)
<br/>
<br/>- It is not allowed to Camp at Vehicle Stores (VS), General Stores (GS) or Gun Stores with Vehicles.
<br/>
<br/>- It is not allowed to pick up Air dropped Weapon Crates and sell them at a Gunstore.
<br/>
<br/>- It is not allowed to utilize bugs/exploits, hide inside objects rocks/containers or glitch through walls.
<br/>
<br/>- Watch your language in global/side or voice chat, we accept swearing. No racism or homophobic comments.
<br/>
<br/>- Advertisment for your Clan, Discord or Teamspeak is not allowed on this Server (However, sending TS3 ip to your group members is of course permitted VIA GROUP CHAT).
<br/><br/>
<br/><font size='16' color='#FF0000'>Anyone breaking these rules will receive punishments accordingly. (At our the discretion of our staff team)</font>
"]];

player createDiaryRecord ["gearloadout",["Level 8","
<br/>====================================
<br/>Gear Level #8 - 64.000.000
<br/>
<br/>Weapon:
<br/>*********
<br/>Mk18 ABR / Rahim / Mk-I EMR (DLC) / SPAR-17 (DLC)
<br/>DMS / AMS (DLC) Scope
<br/>Rook-40 9 mm (+ Silencer)
<br/>
<br/>3 Grenades
<br/>3 Smoke Grenades
<br/>Helmet (Armor Level V)
<br/>Vest (Explosive Resistant)
<br/>Beast Bandana
<br/>Carryall Backpack
<br/>3 FirstAid Kit
<br/>Rangefinder
<br/>MineDetector
<br/>Satchelcharge
<br/>Democharge
<br/>GPS
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Level 7","
<br/>====================================
<br/>Gear Level #7 - 48.000.000
<br/>
<br/>Weapon:
<br/>*********
<br/>Mk200 / Zafir
<br/>DMS / AMS (DLC) Scope
<br/>Rook-40 9 mm (+ Silencer)
<br/>
<br/>3 Grenades
<br/>3 Smoke Grenades
<br/>Helmet (Armor Level V)
<br/>Vest (Explosive Resistant)
<br/>Beast Bandana
<br/>Carryall Backpack
<br/>3 FirstAid Kit
<br/>Rangefinder
<br/>MineDetector
<br/>Satchelcharge
<br/>Democharge
<br/>GPS
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Level 6","
<br/>====================================
<br/>Gear Level #6 - 32.000.000
<br/>
<br/>Weapon:
<br/>*********
<br/>MXSW / CAR-95-1 (DLC)
<br/>DMS / AMS (DLC) Scope
<br/>Rook-40 9 mm (+ Silencer)
<br/>
<br/>3 Grenades
<br/>3 Smoke Grenades
<br/>Helmet (Armor Level IV)
<br/>Vest (Armor Level V)
<br/>Goggles (Combat)
<br/>Carryall Backpack
<br/>2 FirstAid Kit
<br/>Rangefinder
<br/>MineDetector
<br/>Democharge
<br/>GPS
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Level 5","
<br/>====================================
<br/>Gear Level #5 - 16.000.000
<br/>
<br/>Weapon:
<br/>*********
<br/>MXM / Type 115 (DLC)
<br/>DMS / DMS Camo Scope
<br/>Rook-40 9 mm (+ Silencer)
<br/>
<br/>2 Grenade
<br/>2 Smoke Grenades
<br/>Helmet (Armor Level IV)
<br/>Vest (Armor Level IV)
<br/>Goggles (Combat)
<br/>Kitbag
<br/>2 FirstAid Kit
<br/>Rangefinder
<br/>MineDetector
<br/>Democharge
<br/>GPS
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Level 4","
<br/>====================================
<br/>Gear Level #4 - 8.000.000
<br/>
<br/>Weapon:
<br/>*********
<br/>MX / MXC 6.5mm
<br/>Arco Scope
<br/>Rook-40 9 mm
<br/>
<br/>2 Grenade
<br/>2 Smoke Grenades
<br/>Helmet (Armor Level II)
<br/>Vest (Armor Level III)
<br/>Tactical Pack
<br/>2 FirstAid Kit
<br/>Rangefinder
<br/>GPS
<br/>MineDetector
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Level 3","
<br/>====================================
<br/>Gear Level #3 - 4.000.000
<br/>
<br/>Weapon:
<br/>*********
<br/>Katiba / Katiba C 6.5 mm 
<br/>Arco Scope
<br/>Rook-40 9 mm
<br/>
<br/>2 Grenade
<br/>2 Smoke Grenades
<br/>Helmet (Armor Level II)
<br/>Vest (Armor Level III)
<br/>Tactical Pack
<br/>2 FirstAid Kit
<br/>Rangefinder
<br/>GPS
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Level 2","
<br/>====================================
<br/>Gear Level #2 - 2.000.000
<br/>
<br/>Weapon:
<br/>*********
<br/>TRG-20 / TRG-21 / Mk20 / Mk20C (SPAR-16/CAR-95 DLC)
<br/>Holo Scope
<br/>Rook-40 9 mm
<br/>
<br/>1 Grenade
<br/>2 Smoke Grenades
<br/>Helmet (Armor Level I)
<br/>TacVest (Armor Level I)
<br/>Field Pack
<br/>2 FirstAid Kit
<br/>Binoculars
<br/>GPS
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Level 1","
<br/>====================================
<br/>Gear Level #1 - Free
<br/>
<br/>Weapon:
<br/>*********
<br/>Sting / Vermin SMG / PDW2000 / Protector (DLC)
<br/>Holo / Aco Scope
<br/>Rook-40 9 mm
<br/>
<br/>1 Grenade
<br/>2 Smoke Grenades
<br/>Booniehat
<br/>TacVest (Armor Level I)
<br/>Assault Pack
<br/>1 FirstAid Kit
<br/>Binoculars
<br/>====================================
"]];

player createDiaryRecord ["gearloadout",["Gear Loadout","
<br/>====================================
<br/>Gear Loadouts are based on the Money you got on your Bank
<br/>*****************************
<br/>The Higher your Bank Money is at, the better Loadout you will get.
<br/>Loadout 1-8 are fixed at the moment.
<br/>
<br/>Included DLC Filter, so no annoying bohemia adverts.
<br/>Opfor spawn with desert clothing.
<br/>====================================
"]];

player createDiaryRecord ["voice",["Teamspeak/Discord","
<br/>Our TeamSpeak is available at:
<br/>
<br/><font size='16' color='#FF0000'>SOON</font>
<br/>
<br/>Our Discord is available at:
<br/>
<br/><font size='16' color='#FF0000'>discord.gg/ARMY</font>
"]];

player createDiaryRecord ["supportedmods",["Supported Mods","
<br/>*CBA_A3
<br/>*Enhanced Movement
<br/>*JSRS SOUNDMOD
"]];
