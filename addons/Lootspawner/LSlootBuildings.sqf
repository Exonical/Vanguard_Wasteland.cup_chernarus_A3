// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner junction list for buildings to classes
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//"Buildingstoloot_list" array of [buildingname, class]
//                              buildingname:   building class name (in editor debug console use "typeof BIS_fnc_camera_target"
//                                              to monitor and then copy/paste or any other method you know...)
//                              class:          0-civil, 1-military, ... (add more as you wish)
//
//!!!EVERY building must have only ONE entry here AND been in ONE class!!!
// Version Chernarus by Aryx - v0.1
//-------------------------------------------------------------------------------------
Buildingstoloot_list =
[
	//["Land_Addon_01_V1_dam_F", 0],        //not viable
	//["Land_Airport_center_F", 0],         //no positions
	//["Land_cargo_addon01_V1_F", 0],       //no positions
	//["Land_cargo_addon01_V2_F", 0],       //no positions
	//["Land_cargo_addon02_V2_F", 0],       //no positions
	//["Land_Castle_01_tower_F", 0],        //no positions
	//["Land_Communication_anchor_F", 0],   //no positions
	//["Land_Communication_F", 0],          //no positions
	//["Land_dp_smallFactory_F", 0],        //no positions
	//["Land_dp_smallTank_F", 0],           //no positions
	//["Land_Factory_Hopper_F", 0],         //no positions
	//["Land_Garage_V1_dam_F", 0],          //not viable
	//["Land_ReservoirTank_Airport_F", 0],  //no positions
	//["Land_ReservoirTower_F", 2],         //no positions
	//["Land_Shed_Big_F", 0],               //no positions
	//["Land_Shed_Small_F", 0],             //no positions
	//["Land_TBox_F", 0],                   //no positions
	//["Land_TTowerBig_1_F", 2],            //no positions
	//["Land_TTowerBig_2_F", 2],            //no positions
	["Land_Airport_left_F", 0],
	["Land_Airport_right_F", 0],
	["Land_Airport_Tower_dam_F", 2],
	["Land_Airport_Tower_F", 2],
	["Land_cargo_house_slum_F", 0],
	["Land_Cargo_House_V1_F", 1],
	["Land_Cargo_House_V2_F", 1],
	["Land_Cargo_House_V3_F", 1],
	["Land_Cargo_HQ_V1_F", 1],
	["Land_Cargo_HQ_V2_F", 1],
	["Land_Cargo_HQ_V3_F", 1],
	["Land_Cargo_Patrol_V1_F", 1],
	["Land_Cargo_Patrol_V2_F", 1],
	["Land_Cargo_Patrol_V3_F", 1],
	["Land_Cargo_Tower_V1_F", 1],
	["Land_Cargo_Tower_V3_F", 1],
	["Land_CarService_F", 2],
	["Land_Chapel_Small_V1_F", 0],
	["Land_Chapel_Small_V2_F", 0],
	["Land_Chapel_V1_F", 0],
	["Land_Chapel_V2_F", 0],
	["Land_Crane_F", 0],
	["Land_dp_bigTank_F", 2],
	["Land_dp_mainFactory_F", 2],
	["Land_d_Stone_Shed_V1_F", 0],
	["Land_d_Windmill01_F", 0],
	["Land_FuelStation_Build_F", 0],
	["Land_FuelStation_Shed_F", 0],
	["Land_Hangar_F", 2],
	["Land_Hospital_main_F", 0],
	["Land_Hospital_side1_F", 0],
	["Land_Hospital_side2_F", 0],
	["Land_i_Addon_02_V1_F", 0],
	["Land_i_Addon_03mid_V1_F", 0],
	["Land_i_Addon_03_V1_F", 0],
	["Land_i_Addon_04_V1_F", 0],
	["Land_i_Barracks_V1_F", 2],
	["Land_i_Barracks_V2_F", 1],
	["Land_i_Garage_V1_F", 0],
	["Land_i_Garage_V2_F", 0],
	["Land_i_House_Big_01_V1_dam_F", 0],
	["Land_i_House_Big_01_V1_F", 0],
	["Land_i_House_Big_01_V2_F", 0],
	["Land_i_House_Big_01_V3_F", 0],
	["Land_i_House_Big_02_V1_dam_F", 0],
	["Land_i_House_Big_02_V1_F", 0],
	["Land_i_House_Big_02_V2_F", 0],
	["Land_i_House_Big_02_V3_F", 0],
	["Land_i_House_Small_01_V1_dam_F", 0],
	["Land_i_House_Small_01_V1_F", 0],
	["Land_i_House_Small_01_V2_dam_F", 0],
	["Land_i_House_Small_01_V2_F", 0],
	["Land_i_House_Small_01_V3_F", 0],
	["Land_i_House_Small_02_V1_dam_F", 0],
	["Land_i_House_Small_02_V1_F", 0],
	["Land_i_House_Small_02_V2_F", 0],
	["Land_i_House_Small_02_V3_F", 0],
	["Land_i_House_Small_03_V1_dam_F", 0],
	["Land_i_House_Small_03_V1_F", 0],
	["Land_i_Shed_Ind_F", 2],
	["Land_i_Shop_01_V1_dam_F", 0],
	["Land_i_Shop_01_V1_F", 0],
	["Land_i_Shop_01_V2_F", 0],
	["Land_i_Shop_01_V3_F", 0],
	["Land_i_Shop_02_V1_dam_F", 0],
	["Land_i_Shop_02_V1_F", 0],
	["Land_i_Shop_02_V2_F", 0],
	["Land_i_Shop_02_V3_F", 0],
	["Land_i_Stone_HouseBig_V1_dam_F", 0],
	["Land_i_Stone_HouseBig_V1_F", 0],
	["Land_i_Stone_HouseBig_V2_F", 0],
	["Land_i_Stone_HouseBig_V3_F", 0],
	["Land_i_Stone_HouseSmall_V1_dam_F", 0],
	["Land_i_Stone_HouseSmall_V1_F", 0],
	["Land_i_Stone_HouseSmall_V2_F", 0],
	["Land_i_Stone_HouseSmall_V3_F", 0],
	["Land_i_Stone_Shed_V1_dam_F", 0],
	["Land_i_Stone_Shed_V1_F", 0],
	["Land_i_Stone_Shed_V2_F", 0],
	["Land_i_Stone_Shed_V3_F", 0],
	["Land_i_Windmill01_F", 0],
	["Land_LightHouse_F", 0],
	["Land_Lighthouse_small_F", 0],
	["Land_Metal_Shed_F", 2],
	["Land_MilOffices_V1_F", 1],
	["Land_Offices_01_V1_F", 0],
	["Land_Radar_F", 2],
	["Land_Research_house_V1_F", 3],
	["Land_Research_HQ_F", 3],
	["Land_Slum_House01_F", 0],
	["Land_Slum_House02_F", 0],
	["Land_Slum_House03_F", 0],
	["Land_spp_Tower_F", 2],
	["Land_Unfinished_Building_01_F", 2],
	["Land_Unfinished_Building_02_F", 2],
	["Land_u_Addon_01_V1_F", 0],
	["Land_u_Addon_02_V1_F", 0],
	["Land_u_Barracks_V2_F", 1],
	["Land_u_House_Big_01_V1_F", 0],
	["Land_u_House_Big_02_V1_F", 0],
	["Land_u_House_Small_01_V1_dam_F", 0],
	["Land_u_House_Small_01_V1_F", 0],
	["Land_u_House_Small_02_V1_dam_F", 0],
	["Land_u_House_Small_02_V1_F", 0],
	["Land_u_Shed_Ind_F", 2],
	["Land_u_Shop_01_V1_F", 0],
	["Land_u_Shop_02_V1_F", 0],
	["Land_WIP_F", 2],
	//Chernarus Buildings 0 = ziv, 1 = mil, 2 = indus, 3 = res
	["Land_Farm_Cowshed_b", 0],
	["Land_Farm_Cowshed_a", 0],
	["Land_Mil_Guardhouse", 0],
	["Land_A_Hospital", 0],
	["Land_HouseV2_04", 0],
	["Land_HouseV2_04_interier", 0],
	["Land_Panelak3_Grey", 0],
	["Land_Panelak2", 0],
	["Land_Panelak", 0],
	["Land_HouseB_Tenement", 0],
	["Land_Panelak2_Grey", 0],
	["Land_Barn_W_01", 0],
	["Land_A_GeneralStore_01", 0],
	["Land_Ss_hangard", 1],
	["Land_Ss_hangar", 1],
	["Camp_EP1", 1],
	["Camp", 1],
	["CampEast", 1],
	["CampEast_EP1", 1],
	["CampEastC", 1],
	["Land_tent_east", 1],
	["CampEmpty", 1],
	["Land_Mil_hangar_EP1", 1],
	["Land_Mil_House", 1],
	["MASH", 1],
	["Land_Army_hut3_long_int", 1],
	["Land_Army_hut2", 1],
	["Land_Mil_ControlTower_no_interior_CUP", 1],
	["Land_Mil_ControlTower", 1],
	["Land_Mil_Barracks", 1],
	["Land_Mil_Barracks_i", 1],
	["Land_Ind_Vysypka", 2],
	["Land_Barn_Metal", 2],
	["Land_Tovarna1", 2],
	["Land_Tovarna2", 2],
	["Land_Shed_Ind02_dam", 2],
	["Land_Shed_Ind02", 2],
	["Land_Hangar_2", 2],
	["Land_Ind_Workshop01_04", 2],
	["Land_Ind_Workshop01_01", 2],
	["Land_Ind_Workshop01_L", 2],
	["Land_Ind_Garage01", 2],
	["Land_Ind_Workshop01_03", 2],
	["Land_A_Office01", 3],
	["Land_A_GeneralStore_01a", 3],
	["Land_a_stationhouse", 3],
	["Land_Stodola_old_open", 3],
	["Land_Nav_Boathouse", 3]
];
