// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 A3Wasteland.com *
// ******************************************************************************************
//    @file Name: vehicleLoadouts.sqf
//    @file Author: AgentRev

/*
    HOW TO CREATE A PYLON LOADOUT:
     1. Create new scenario in Eden, add vehicle, adjust pylon loadout, and set Object Init to: copyToClipboard str getPylonMagazines this
     3. Play scenario, wait until loaded, then pause game and return to Eden.
     4. Your pylon array is now in the clipboard, which you can paste in this file, e.g. _pylons = ["PylonMissile_Missile_AA_R73_x1","","","","","","","","","","","","",""];

    Note: You can use any pylon type you want in the script, even if not shown in the editor, it should normally work! e.g. "PylonRack_12Rnd_missiles" for "B_Plane_Fighter_01_F"
*/

switch (true) do
{
    // AH-9 Pawnee
    case (_class isKindOf "B_Heli_Light_01_dynamicLoadout_F"):
    {
        switch (_variant) do
        {
            case "pawneeGun": { _pylons = ["",""] };
            case "pawneeDelta": { _pylons = ["PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_4Rnd_LG_scalpel","PylonRack_20Rnd_Rocket_03_HE_F"] };
            default           { _pylons = ["PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles"] };
        };
    };

    // PO-30 Orca
    case (_class isKindOf "O_Heli_Light_02_dynamicLoadout_F"):
    {
        switch (_variant) do
        {
            case "orcaDAGR": { _pylons = ["PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_PG_missiles"] };
            default          { _pylons = ["PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_missiles"] };
        };
    };

    // AH-99 Blackfoot
    case (_class isKindOf "Heli_Attack_01_dynamicLoadout_base_F"):
    {
        _pylons = ["PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_LG_scalpel","PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles","PylonMissile_1Rnd_LG_scalpel","PylonMissile_1Rnd_AAA_missiles"];
    };

    
    // Y-32 Xi'an
    case ({_class isKindOf _x} count ["VTOL_02_infantry_dynamicLoadout_base_F", "VTOL_02_vehicle_dynamicLoadout_base_F"] > 0):
    {
        _weapons =
        [
            ["CMFlareLauncher_Triples", [-1]],
            ["rockets_Skyfire", [-1]]
           // ["gatling_30mm_VTOL_02", [0]]
        ];
        _mags =
        [
            ["240Rnd_CMFlareMagazine", [-1]],
            ["38Rnd_80mm_rockets", [-1]]
           /* ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]]*/
        ];
        switch (_variant) do
        {
            case "xianAntiInf": { _pylons = ["",""] };
            case "xianAG": { _pylons = ["PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F"] };
            case "xianDelta": { _pylons = ["PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F"] };
            case "xianEX": { _pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_19Rnd_Rocket_Skyfire"] }; //by Aryx
            default           { _pylons = ["PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_1Rnd_Missile_AGM_01_F"] };
        };
    };

    // A-143 Buzzard
    case (_class isKindOf "Plane_Fighter_03_dynamicLoadout_base_F"):
    {
        _weapons =
        [
            ["Twin_Cannon_20mm", [-1]],
            ["CMFlareLauncher", [-1]]
        ];
        _mags =
        [
            ["Laserbatteries", [-1]],
            ["120Rnd_CMFlare_Chaff_Magazine", [-1]],
            ["1000Rnd_20mm_shells", [-1]]
        ];
        switch (_variant) do
        {
            case "buzzardEX": { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"] };
            case "buzzardCAS": { _pylons = ["PylonRack_1Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AA_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonWeapon_300Rnd_20mm_shells","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_LG_scalpel"] }; //by Aryx
            default           { _pylons = ["PylonRack_1Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AA_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonWeapon_300Rnd_20mm_shells","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_LG_scalpel"] };
        };
        /*_customCode =
        {
            _veh setAmmoOnPylon [4, 500]; // 20mm gun
        };*/
    };

    // A-149 Gryphon
    case (_class isKindOf "Plane_Fighter_04_Base_F"):
    {
        _mags =
        [
            ["Laserbatteries", [-1]],
            ["60Rnd_CMFlare_Chaff_Magazine", [-1]]
        ];
        
        switch (_variant) do
        {
            case "GryphonXL": { _pylons = [""] };
            case "GryphonAA": { _pylons = [""] }; //by Aryx
            case "GryphonCAS": { _pylons = [""] };
            default           { _pylons = [""] };
        };
    };

    // F/A-181 Black Wasp
    case (_class isKindOf "B_Plane_Fighter_01_F"):
    {
        _mags =
        [
            ["Laserbatteries", [-1]],
            ["60Rnd_CMFlare_Chaff_Magazine", [-1]]
        ];
        switch (_variant) do
        {
            case "blackwaspXL": { _pylons = [""] };
            case "blackwaspAA": { _pylons = [""] };
            case "blackwaspCAS": { _pylons = [""] };
        };
    };

    // F/A-181 Black Wasp (Stealth)
    case (_class isKindOf "B_Plane_Fighter_01_Stealth_F"):
    {
        _mags =
        [
            ["Laserbatteries", [-1]],
            ["60Rnd_CMFlare_Chaff_Magazine", [-1]]
        ];
        _pylons = [""];
    };

    // To-201 Shikra
    case (_class isKindOf "O_Plane_Fighter_02_F"):
    {
        _mags =
        [
            ["Laserbatteries", [-1]],
            ["60Rnd_CMFlare_Chaff_Magazine", [-1]]
        ];
        switch (_variant) do
        {
            case "shikraXL": { _pylons = [""] };
            case "shikraEX": { _pylons = [""] };
            case "shikraCAS": { _pylons = [""] };
            case "shikraDEF": { _pylons = [""] };
            default           { _pylons = [""] };
        };
    };

    // To-201 Shikra (Stealth)
    case (_class isKindOf "O_Plane_Fighter_02_Stealth_F"):
    {
        _mags =
        [
            ["Laserbatteries", [-1]],
            ["60Rnd_CMFlare_Chaff_Magazine", [-1]]
        ];
        _pylons = ["","","","","","","","","","","","",""];
    };

    // A-164 Wipeout CAS
    case (_class isKindOf "Plane_CAS_01_dynamicLoadout_base_F"):
    {
        _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_Bomb_04_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_BombCluster_01_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_1Rnd_Missile_AA_04_F"];
    };

    // To-199 Neophron CAS
    case (_class isKindOf "Plane_CAS_02_dynamicLoadout_base_F"):
    {
        _pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_BombCluster_01_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AA_03_F"];
    };

    // Greyhawk/Ababil UAVs
    case (_class isKindOf "UAV_02_dynamicLoadout_base_F"):
    {
        switch (_variant) do
        {
            case "greyhawkBomber": { _pylons = ["PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F"] };
            case "greyhawkCluster": { _pylons = ["PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F"] };
            case "greyhawkDAGR":    { _pylons = ["PylonRack_12Rnd_PG_missiles","PylonWeapon_2000Rnd_65x39_belt"] };
            default
            {
                _pylons = ["PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel"];
                _customCode =
                {
                    _veh setAmmoOnPylon [1, 2]; // right wing
                    _veh setAmmoOnPylon [2, 2]; // left wing
                };
            };
        };
    };

    // KH-3A Fenghuang UAV
    /*case (_class isKindOf "O_T_UAV_04_CAS_F"):
    {
        _customCode =
        {
            _veh setMagazineTurretAmmo ["4Rnd_LG_Jian", 2, [0]];
        };
    };*/

    // UCAV Sentinel
    case (_class isKindOf "B_UAV_05_F"):
    {
        _mags =
        [
            ["120Rnd_CMFlare_Chaff_Magazine", [-1]],
            ["magazine_Fighter04_Gun20mm_AA_x250", [-1]],
            ["Laserbatteries", [0]]
        ];
        _weapons =
        [
            ["CMFlareLauncher", [-1]],
            ["weapon_Fighter_Gun20mm_AA", [-1]],
            ["Laserdesignator_mounted", [0]]
        ];
        switch (_variant) do
        {
            case "sentinelBomber": { _pylons = ["PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"] };
            case "sentinelCluster": { _pylons = ["PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_BombCluster_01_F"] }; //Aryx
            default                { _pylons = ["PylonMissile_Missile_AGM_02_x2","PylonMissile_Missile_AGM_02_x2"] };
        };
    };
    


    // MQ-12 Falcon UAV (dynamicLoadout)
    case (_class isKindOf "B_T_UAV_03_F"):
    {
        _mags =
        [
            ["120Rnd_CMFlare_Chaff_Magazine", [-1]],
            ["24Rnd_missiles", [0]],
            ["2Rnd_LG_scalpel", [0]],
            ["2Rnd_AAA_missiles", [0]],
            ["Laserbatteries", [0]]
        ];
        _weapons =
        [
            ["CMFlareLauncher", [-1]],
            ["missiles_DAR", [0]],
            ["missiles_SCALPEL", [0]],
            ["missiles_ASRAAM", [0]],
            ["Laserdesignator_mounted", [0]]
        ];

    };
	
	// ED-1D Demining UGV
	case (_class isKindOf "UGV_02_Demining_Base_F"):
	{
		_mags =
		[
			["200Rnd_556x45_Box_F", [0]],
			["15Rnd_12Gauge_Pellets", [0]],
			["15Rnd_12Gauge_Slug", [0]],
			["Laserbatteries", [0]],
			["SmokeLauncherMag", [0]]
		];
		_weapons =
		[
			["LMG_03_Vehicle_F", [0]],
			["DeminingDisruptor_01_F", [0]],
			["Laserdesignator_mounted", [0]],
			["SmokeLauncher", [0]]
		];
	};
    
    // SDV SDAR turret
    case (_class isKindOf "SDV_01_base_F"):
    {
        _mags =
        [
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["20Rnd_556x45_UW_mag", [0]],
            ["30Rnd_556x45_Stanag", [0]],
            ["30Rnd_556x45_Stanag", [0]],
            ["30Rnd_556x45_Stanag", [0]],
            ["Laserbatteries", [0]]
        ];
        _weapons =
        [
            ["arifle_SDAR_F", [0]],
            ["Laserdesignator_mounted", [0]]
        ];
    };
    
    // MQ-12 Falcon UAV (non-dynamicLoadout)  by Aryx
    case (_class isKindOf "B_T_UAV_03_dynamicLoadout_F"):
    {
        _pylons = ["PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_12Rnd_PG_missiles"];
    };
	
	//Hellcat
	case (_class isKindOf "I_E_Heli_light_03_dynamicLoadout_F"):
    {
        _weapons =
        [
            ["CMFlareLauncher_Triples", [-1]],
            ["rockets_Skyfire", [-1]],
            ["gatling_30mm", [0]]
        ];
        _mags =
        [
            ["240Rnd_CMFlareMagazine", [-1]],
            ["38Rnd_80mm_rockets", [-1]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]]
        ];
        switch (_variant) do
        {
			case "CzalpaAG": { _pylons = ["PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel"] };
        };
    };
    
    //Kajman
	case (_class isKindOf "O_Heli_Attack_02_dynamicLoadout_F"):
    {
        _weapons =
        [
            ["CMFlareLauncher_Triples", [-1]],
            ["rockets_Skyfire", [-1]],
            ["gatling_30mm", [0]]
        ];
        _mags =
        [
            ["240Rnd_CMFlareMagazine", [-1]],
            ["38Rnd_80mm_rockets", [-1]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_HE_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]],
            ["250Rnd_30mm_APDS_shells", [0]]
        ];
        switch (_variant) do
        {
			case "KajmanAG": { _pylons = ["PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel"] };
            case "KajmanDelta": { _pylons = ["PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel"] };
        };
    };
	
	case (_class isKindOf "B_AFV_Wheeled_01_cannon_F"):
    {
        _mags =
        [
            ["12Rnd_120mm_APFSDS_shells_Tracer_Red", [0]],
            ["12Rnd_120mm_HEAT_MP_T_Red", [0]],
            ["8Rnd_120mm_HE_shells_Tracer_Red", [0]],
            ["130Rnd_338_Mag", [0]],
            ["130Rnd_338_Mag", [0]],
            ["130Rnd_338_Mag", [0]],
            ["500Rnd_127x99_mag_Tracer_Red", [0]],
            ["500Rnd_127x99_mag_Tracer_Red", [0]],
			["SmokeLauncherMag", [1]],
			["SmokeLauncherMag", [1]]
        ];
        _weapons =
        [
            ["cannon_120mm", [0]],
            ["SmokeLauncher", [0]],
            ["MMG_02_coax", [0]],
			["HMG_127_AFV", [1]]
        ];
    };
	
	case (_class isKindOf "B_AFV_Wheeled_01_up_cannon_F"):
    {
        _mags =
        [
            ["12Rnd_120mm_APFSDS_shells_Tracer_Red", [0]],
            ["12Rnd_120mm_HEAT_MP_T_Red", [0]],
            ["8Rnd_120mm_HE_shells_Tracer_Red", [0]],
			["4Rnd_120mm_cannon_missiles",[0]],
            ["130Rnd_338_Mag", [0]],
            ["130Rnd_338_Mag", [0]],
            ["130Rnd_338_Mag", [0]],
            ["500Rnd_127x99_mag_Tracer_Red", [0]],
            ["500Rnd_127x99_mag_Tracer_Red", [0]],
			["SmokeLauncherMag", [1]],
			["SmokeLauncherMag", [1]]
        ];
        _weapons =
        [
            ["cannon_120mm", [0]],
            ["SmokeLauncher", [0]],
            ["MMG_02_coax", [0]],
			["HMG_127_AFV", [1]]
        ];
    };
	
	case (_class isKindOf "I_E_APC_tracked_03_cannon_F"):
    {
        _mags =
        [
            ["12Rnd_120mm_APFSDS_shells_Tracer_Red", [0]],
            ["12Rnd_120mm_HEAT_MP_T_Red", [0]],
            ["8Rnd_120mm_HE_shells_Tracer_Red", [0]],
            ["130Rnd_338_Mag", [0]],
            ["130Rnd_338_Mag", [0]],
            ["130Rnd_338_Mag", [0]],
            ["500Rnd_127x99_mag_Tracer_Red", [0]],
            ["500Rnd_127x99_mag_Tracer_Red", [0]],
			["SmokeLauncherMag", [1]],
			["SmokeLauncherMag", [1]]
        ];
        _weapons =
        [
            ["cannon_120mm", [0]],
            ["SmokeLauncher", [0]],
            ["MMG_02_coax", [0]],
			["HMG_127_AFV", [1]]
        ];
    };

	// A10-A Thunderbolt II
    case (_class isKindOf "CUP_B_A10_DYN_USA"):
    {
		switch (_variant) do
		{
			case "A10aGun": { _pylons = ["CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","","","","","","","","","","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M"] };
			case "A10aWarthog": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","PylonMissile_1Rnd_BombCluster_03_F","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_2Rnd_Mk82_M","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","PylonMissile_1Rnd_BombCluster_03_F"] };
			default { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ANAAQ_28"] };
		};
    };
	
	// F-35B Lightning II
    case (_class isKindOf "CUP_B_F35B_BAF"):
	{
		switch (_variant) do
		{
			case "F35bCAS": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonWeapon_220Rnd_TE1_Red_Tracer_GAU22_M","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","PylonMissile_1Rnd_BombCluster_03_F","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"] };
			case "F35bAA": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonWeapon_220Rnd_TE1_Red_Tracer_GAU22_M","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"] };
		};
	};

    // Harrier GR.9
	case (_class isKindOf "CUP_B_GR9_DYN_GB"):
	{
		switch (_variant) do
		{
			case "GR9Extra" : { _pylons = ["CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_GBU12_M","PylonWeapon_300Rnd_20mm_shells","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"]; };
			default { _pylons = ["CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_GBU12_M","PylonWeapon_300Rnd_20mm_shells","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"]; };
		};
	};

    // SU-25 Frogfoot
    case (_class isKindOf "CUP_B_Su25_Dyn_CDF"):
	{
		switch (_variant) do
		{
			case "Su25AT": { _pylons = ["CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_R73_Vympel"] };
			default { _pylons = ["CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_20Rnd_S8_plane_M","CUP_PylonPod_1Rnd_R73_Vympel"] };
		};
    };

    // AV-8B Harrier II
	case (_class isKindOf "CUP_B_AV8B_DYN_USMC"):
	{
		switch (_variant) do
		{
			case "Av8bAA": { _pylons = ["CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_2Rnd_GBU12_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M"] };
			case "Av8bAT": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_Plane_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"] };
			case "Av8bMK82": { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_3Rnd_GBU12_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"] };
			default { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_ANAAQ_28","CUP_PylonPod_3Rnd_GBU12_M","CUP_PylonPod_3Rnd_GBU12_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"] };
		};
    };

    // UH-60L DAP (2 Stores)
    case (_class isKindOf "CUP_B_MH60L_DAP_2x_US"):
    {
		switch (_variant) do
		{
			case "UH60LAT2" : { _pylons = ["","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_1200Rnd_TE1_Red_Tracer_M621_20mm_HE_M",""] };
			default	{ _pylons = ["","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M",""] };
		};
    };

    // UH-60L DAP (4 Stores)
	case (_class isKindOf "CUP_B_MH60L_DAP_4x_US"):
	{
		switch (_variant) do
		{
			case "UH60LAT4" : { _pylons = ["CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M"] };
			case "UH60LDelta" : { _pylons = ["CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M","CUP_PylonPod_1200Rnd_TE1_Red_Tracer_30x113mm_M789_HEDP_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M"] };
			default	{ _pylons = ["CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M"] };
		};
    };

    // AH-64D
    case (_class isKindOf "CUP_B_AH64D_DL_USA"):
	{
		switch (_variant) do
		{
			case "AH64DDelta" : { _pylons = ["CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M"] };              
			default	{ _pylons = ["CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M"] };
		};
    };
};