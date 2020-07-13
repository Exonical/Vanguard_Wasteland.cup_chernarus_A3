//Configuration for Airdrop Assistance
//Author: Apoc

// APOC_AA_coolDownTime = 180; //Expressed in sec

APOC_AA_VehOptions = [
	["SDV Submarine (CSAT)", "O_SDV_01_F", 5000, "vehicle"],
	["MB 4WD LMG", "I_C_Offroad_02_LMG_F", 20000, "vehicle"],
	["MB 4WD AT", "I_C_Offroad_02_AT_F", 25000, "vehicle"],
	["Prowler HMG", "B_T_LSV_01_armed_F", 12000, "vehicle"],
	["Qilin HMG", "O_T_LSV_02_armed_F", 16000, "vehicle"],
	["Ifrit", "O_MRAP_02_F", 10000, "vehicle"],
	["Ifrit HMG", "O_MRAP_02_hmg_F", 25000, "vehicle"],
	["MRAP (M2)", "rhsusf_m1240a1_m2_usarmy_wd", 25000, "vehicle"],
	["MRAP", "rhsusf_m1240a1_usarmy_wd", 18000, "vehicle"],
	["Assault Boat", "I_C_Boat_Transport_01_F", 12000, "vehicle"],
	["RHIB", "I_C_Boat_Transport_02_F", 18000, "vehicle"]
];

APOC_AA_Veh2Options = [
	["Stryker M1127 (M2/LRAS3)", "rhsusf_stryker_m1127_m2_wd", 65000, "vehicle2"],
	["Stryker M1127 (M2)", "rhsusf_stryker_m1126_m2_wd", 60000, "vehicle2"],
	["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 60000, "vehicle2"],
	["ZSU-39 Tigris AA", "O_APC_Tracked_02_AA_F",150000, "vehicle2"],
	["T-100 Varsuk", "O_MBT_02_cannon_F",170000, "vehicle2"],
	["AWC 301 Nyx AT", "I_LT_01_AT_F", 45000, "vehicle2"],
	["AWC 301 Nyx AA", "I_LT_01_AA_F", 45000, "vehicle2"],
	["Abrams M1A2SEPv1", "rhsusf_m1a2sep1tuskiiwd_usarmy", 300000, "vehicle2"]
	// ["Rhino MGS UP", "B_AFV_Wheeled_01_up_cannon_F", 95000, "vehicle2"]
	// ["MBT-52 Kuma", "I_MBT_03_cannon_F", 170000, "vehicle2"]
];

APOC_AA_Veh3Options = [
	["M1043A2 (M2)", "rhsusf_m1043_w_m2", 28000, "vehicle3"],
	["M1043A2 (Unarmed)", "rhsusf_m1043_w", 14000, "vehicle3"],
	["M1097A2 (4D/Open)", "rhsusf_m998_w_4dr", 12000, "vehicle3"],
	["M1097A2 (4D)", "rhsusf_m998_w_4dr_fulltop", 14000, "vehicle3"],
	["Offroad", "C_Offroad_01_F", 15000, "vehicle3"],
	["Offroad HMG", "B_G_Offroad_01_armed_F", 28000, "vehicle3"]
];

APOC_AA_Veh4Options = [
	["MH-6J Littlebird", "CUP_B_MH6M_USA", 10000, "vehicle4"],
	["CH-47F Chinook", "RHS_CH-47F", 15000, "vehicle4"],
	["UH-60 (MG)", "RHS_UH60M", 30000, "vehicle4"],
	["UH-60 (Unarmed)", "RHS_UH60M2", 20000, "vehicle4"],
	["UH-1Y (MG)", "RHS_UH1Y", 30000, "vehicle4"],
	["UH-1Y (Unarmed)", "RHS_UH1Y", 15000, "vehicle4"]
	["AH-64D Apache", "RHS_AH64D_wd", 65000, "vehicle4"],
	["AH-1Z Viper", "RHS_AH1Z_wd", 60000, "vehicle4"],
];


APOC_AA_SupOptions = [
	["Launchers", "mission_Launchers1", 100000, "supply"],
	["Assault Rifles", "mission_Assault1", 80000, "supply"],
	["Sniper Rifles", "mission_Snipers2", 90000, "supply"],
	["Sniper Rifles #2", "mission_Snipers3", 97500, "supply"],
	["Machine Guns", "mission_LMGs1", 75000, "supply"],
	["Marksmen DLC Box", "mission_DLC_marks", 85000, "supply"],
	["Apex DLC Box", "mission_DLC_apex", 85000, "supply"],
	["Contact DLC Box", "mission_DLC_contact", 90000, "supply"],
	["Dive Gear", "mission_Gear_Diving", 20000, "supply"],
	["Night Event Box","mission_Gear_Night", 10000, "supply"]
];

/*
	["Launchers #1","mission_Launchers1",1,"supply"], 
	["Launchers #2","mission_Launchers2",1,"supply"],
	["Launchers #3","mission_Launchers3",1,"supply"],
	["LMGs Box","mission_LMGs1",1,"supply"],
	["Weapons Box #1","mission_Weapon1",1,"supply"],
	["Weapons Box #2","mission_Weapon2",1,"supply"],
	["Weapons Box #3","mission_Weapon3",1,"supply"],
	["Weapon_camo *New Box","mission_Weapon_camo",1,"supply"],
	["Weapon_green *New Box","mission_Weapon_green",1,"supply"],
	["Weapon_tropic *New Box","mission_Weapon_tropic",1,"supply"],
	["Weapon_sand *New Box","mission_Weapon_sand",1,"supply"],
	["Sniper Box #1","mission_Snipers1",1,"supply"],
	["Sniper Box #2","mission_Snipers2",1,"supply"],
	["Sniper Box #3","mission_Snipers3",1,"supply"],
	["Sniper Box #4","mission_Snipers4",1,"supply"],
	["DLC Marksmen Box","mission_DLC_marks",1,"supply"],
	["DLC Apex Box","mission_DLC_apex",1,"supply"],
	["DLC Contact Box","mission_DLC_contact",1,"supply"],
	["Cop Box","mission_Gear_Cop",1,"supply"],
	["Ammo Box","mission_Gear_Ammo",1,"supply"],
	["Diving Box","mission_Gear_Diving",1,"supply"],
	["Black Box","mission_Gear_BlackBox",1,"supply"],
	["Hunter *New Box","mission_Gear_Hunter",1,"supply"],
	["Biohazard *New Box","mission_Gear_Biohazard",1,"supply"],
	["Night *New Box","mission_Gear_Night",1,"supply"]
	["Random XL *New Box","mission_Gear_RandomXL",1,"supply"],
	["Random XS *New Box","mission_Gear_RandomXS",1,"supply"]
*/