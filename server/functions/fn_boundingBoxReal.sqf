// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_boundingBoxReal.sqf
//	@file Author: AgentRev

// Since BIS are unable to make a command that returns the actual, genuine bounding box of an object (boundingBoxReal is shit and boundingBox is ever shittier),
// I decided to extract the bounding boxes using an intersect scanner I made, which is at the bottom of this file

private ["_vehicle", "_vehClass", "_realBoundingBoxes", "_boundingBoxReal"];
_vehicle = _this;
_vehClass = typeOf _vehicle;

_realBoundingBoxes =
[
	// Vehicle variants are ordered according to their class inheritance, disrupting those orders can cause unexpected results
	[
		"ReammoBox_F",
		[
			["Box_NATO_Wps_F", [[-0.5,-0.4,-0.2],[0.6,0.4,0.2]]], //Graungrün (Basis Waffen)
			["Box_NATO_WpsSpecial_F", [[-0.8,-0.4,-0.2],[0.8,0.3,0.2]]], //Graungrün (Spezial Waffen) groß
			["Box_NATO_Ammo_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Graugrün (Munition)
			["Box_NATO_AmmoOrd_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Graugrün (Explosives)
			["Box_NATO_Grenades_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Graugrün (Grenades)
			["Box_NATO_Support_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Graugrün (Unterstützung)
			["Box_NATO_WpsLaunch_F", [[-0.8,-0.2,-0.2],[0.8,0.2,0.2]]], //Nato Graugrün (Racketenwerfer)
			["Box_NATO_AmmoVeh_F", [[-0.8,-0.8,-0.8],[0.8,0.8,0.7]]], //Graugrün (Fahrzeug Munition)
			["Box_East_Wps_F", [[-0.5,-0.4,-0.2],[0.6,0.4,0.2]]], //Hellgrün (Basis Waffen) groß
			["Box_East_WpsSpecial_F", [[-0.8,-0.4,-0.2],[0.8,0.3,0.2]]], //Hellgrün (Spezial Waffen) groß
			["Box_East_Ammo_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Hellgrün (Munition)
			["Box_East_AmmoOrd_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Hellgrün (Explosives)
			["Box_East_Grenades_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Hellgrün (Grenades)
			["Box_East_Support_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Hellgrün (Unterstützung)
			["Box_East_WpsLaunch_F", [[-0.8,-0.2,-0.2],[0.8,0.2,0.2]]], //Sehr helles grün (Racketenwerfer)
			["Box_East_AmmoVeh_F", [[-0.8,-0.8,-0.8],[0.8,0.8,0.7]]], //Hellgrün (Fahrzeug Munition)
			["Box_IND_Wps_F", [[-0.5,-0.4,-0.2],[0.6,0.4,0.2]]], //Weiß (Basis Waffen)
			["Box_IND_WpsSpecial_F", [[-0.8,-0.4,-0.2],[0.8,0.3,0.2]]], //Weiß (Spezial Waffen) groß
			["Box_IND_Ammo_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß (Munition)
			["Box_IND_AmmoOrd_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß (Explosives)
			["Box_IND_Grenades_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß (Grenades)
			["Box_IND_Support_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß (Unterstützung)
			["Box_IND_WpsLaunch_F", [[-0.8,-0.2,-0.2],[0.8,0.2,0.2]]], //Weiß (Racketenwerfer)
			["Box_IND_AmmoVeh_F", [[-0.8,-0.8,-0.8],[0.8,0.8,0.7]]], //Weiß (Fahrzeug Munition)
			["Box_FIA_Support_F", [[-0.6,-0.3,-1.2],[0.5,0.8,-0.1]]],
			["Box_IDAP_AmmoOrd_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß IDAP (Explosives) LAWS-DLC
			["Box_T_East_Wps_F", [[-0.5,-0.4,-0.2],[0.6,0.4,0.2]]], //Hellbraun (Basis Waffen)
			["Box_T_East_Ammo_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Hellbraun (Munition) APEX-DLC Ammo Box
			["Box_T_East_WpsSpecial_F", [[-0.8,-0.4,-0.2],[0.8,0.3,0.2]]], //Hellbraun (Spezial Waffen) groß APEX-DLC
			["Box_T_NATO_Wps_F", [[-0.5,-0.4,-0.2],[0.6,0.4,0.2]]], //Dunkelgrün (Basis Waffen) APEX-DLC Weapons small
			["Box_T_NATO_WpsSpecial_F", [[-0.8,-0.4,-0.2],[0.8,0.3,0.2]]], //Dunkelgrün (Spezial Waffen) groß APEX-DLC
			["Box_EAF_Wps_F", [[-0.5,-0.4,-0.2],[0.6,0.4,0.2]]], //Dunkel Braungrün (Basis Waffen) CONTACT-DLC Weapons small
			["Box_EAF_WpsSpecial_F", [[-0.8,-0.4,-0.2],[0.8,0.3,0.2]]], //Dunkel Braungrün (Spezial Waffen) groß CONTACT-DLC
			["Box_EAF_Support_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Dunkelgrün (Unterstützung) CONTACT-DLC
			["Box_EAF_AmmoVeh_F", [[-0.8,-0.8,-0.8],[0.8,0.8,0.7]]], //Dunkelgrün (Fahrzeug Munition) CONTACT-DLC
			["Box_EAF_WpsLaunch_F", [[-0.8,-0.2,-0.2],[0.8,0.2,0.2]]], //Dunkel Braungrün (Racketenwerfer) CONTACT-DLC
			["Box_EAF_Ammo_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Dunkel Braungrün (Munition) CONTACT-DLC Ammo Box
			["Box_EAF_AmmoOrd_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Dunkel Braungrün (Munition) CONTACT-DLC Ammo Box
			["Box_EAF_Grenades_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Dunkel Braungrün (Grenades) CONTACT-DLC Nade Box
			["Box_NATO_Equip_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Graungrün (Equipment Kiste)
			["Box_GEN_Equip_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Polizei/Gendamerie (Equipment Kiste)
			["Box_EAF_Equip_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Dunkel Braungrün (Equipment Kiste) CONTACT-DLC
			["Box_CSAT_Equip_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Hellgrün (Equipment Kiste)
			["Box_AAF_Equip_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß (Equipment Kiste)
			["Box_IDAP_Equip_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß IDAP (Equipment Kiste) LAWS-DLC
			["Box_NATO_Uniforms_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Graungrün (Uniform Kiste)
			["Box_EAF_Uniforms_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Dunkel Braungrün (Uniform Kiste) CONTACT-DLC
			["Box_CSAT_Uniforms_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Hellgrün (Uniform Kiste)
			["Box_AAF_Uniforms_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß (Uniform Kiste)
			["Box_IDAP_Uniforms_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Weiß IDAP (Uniform Kiste) LAWS-DLC
			["Box_Syndicate_WpsLaunch_F", [[-0.8,-0.2,-0.2],[0.8,0.2,0.2]]], //Syndicat (Racketenwerfer)
			["Box_Syndicate_Wps_F", [[-0.5,-0.4,-0.2],[0.6,0.4,0.2]]], //Syndicat (Basis Waffen)
			["Box_Syndicate_Ammo_F", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Syndicat (Munition)
			["Box_IED_Exp_FF", [[-0.2,-0.3,-0.3],[0.3,0.4,0.3]]], //Syndicat (Explosives)
			["B_supplyCrate_F", [[-0.8,-0.6,-0.9],[0.8,0.6,0.5]]], //Grün
			["C_IDAP_supplyCrate_F", [[-0.8,-0.6,-0.9],[0.8,0.6,0.5]]] //Orange
		]
	],
	[
		"Truck_F",
		[
			["Van_01_box_base_F", [[-1.2,-3.6,-2],[1.2,2,1.5]]],
			["Van_01_fuel_base_F", [[-1.2,-3.6,-1.9],[1.2,2,1]]],
			["Van_01_base_F", [[-1.2,-3.5,-1.9],[1.2,2.2,0.8]]],
			["Van_02_base_F", [[-1.2,-3.5,-1.7],[1.2,4.2,1.1]]],
			["B_Truck_01_ammo_F", [[-1.2,-4.9,-1.9],[1.3,5,1.6]]],
			["B_Truck_01_box_F", [[-1.3,-5.8,-2.3],[1.3,5.2,2.2]]],
			["B_Truck_01_fuel_F", [[-1.2,-5.2,-2],[1.3,4.9,1.6]]],
			["B_Truck_01_medical_F", [[-1.4,-5,-2.2],[1.2,5.1,1.3]]],
			["B_Truck_01_Repair_F", [[-1.3,-5.8,-2.3],[1.3,5.2,2.2]]],
			["B_Truck_01_mover_F", [[-1.2,-4.7,-1.9],[1.3,4.3,1.1]]],
			["Truck_01_base_F", [[-1.3,-5,-2.3],[1.4,5.1,1.3]]],
			["O_Truck_02_ammo_F", [[-1.4,-4,-2.4],[1.3,4.1,1]]],
			["O_Truck_02_medical_F", [[-1.4,-4,-2.4],[1.3,4,1]]],
			["O_Truck_02_box_F", [[-1.4,-4,-2.4],[1.3,4.1,1]]],
			["O_Truck_02_fuel_F", [[-1.3,-4,-2.4],[1.3,4,0.9]]],
			["I_Truck_02_ammo_F", [[-1.4,-4,-2.4],[1.3,4.1,1]]],
			["I_Truck_02_medical_F", [[-1.4,-4,-2.4],[1.3,4,1]]],
			["I_Truck_02_box_F", [[-1.4,-4,-2.4],[1.3,4.1,1]]],
			["I_Truck_02_fuel_F", [[-1.3,-4,-2.4],[1.3,4,0.9]]],
			["Truck_02_MRL_base_F", [[-1.5,-4,-2.6],[1.4,4,1]]],
			["Truck_02_base_F", [[-1.3,-4,-2.4],[1.3,4,1]]],
			["O_Truck_03_ammo_F", [[-1.7,-5.3,-2.1],[1.7,3.5,1.4]]],
			["O_Truck_03_device_F", [[-1.7,-5.3,-2.1],[1.7,3.5,1.2]]],
			["O_Truck_03_fuel_F", [[-1.7,-5.2,-2.2],[1.7,3.5,1.2]]],
			["O_Truck_03_medical_F", [[-1.6,-5.1,-2.4],[1.7,3.7,1.3]]],
			["O_Truck_03_repair_F", [[-1.7,-5.3,-2.1],[1.7,3.5,1.3]]],
			["Truck_03_base_F", [[-1.6,-5.1,-2.4],[1.7,3.7,1.3]]],
			["CUP_Kamaz_5350_Base",[[-1.4,-4,-2.3],[1.5,4,1]]],
			["CUP_Ural_BaseTurret",[[-1.2,-3.3,-2.9],[1.5,4.4,0.2]]],
			["CUP_C_Ural_Open_Civ_03",[[-1.3,-3.1,-2],[1.3,4.2,1]]],
			["CUP_Ural_Support_Base",[[-1.3,-3.4,-2],[1.3,4.2,1.3]]],
			["CUP_Ural_Repair_Base",[[-1.3,-3.4,-2],[1.3,4.2,1]]],
			["CUP_B_Ural_CDF",[[-1.3,-3.4,-2.1],[1.3,4.2,1]]]
		]
	],
	[
		"Tank_F",
		[
			["UGV_02_Base_F", [[-0.3,-0.5,-0.3],[0.3,0.4,0.3]]],
			["LT_01_AT_base_F", [[-1.6,-2.7,-2],[1.2,2.9,0.9]]],
			["LT_01_AA_base_F", [[-1.6,-2.7,-2],[1.2,2.9,0.9]]],
			["LT_01_cannon_base_F", [[-1.6,-2.6,-1.9],[1.2,2.7,0.6]]],
			["LT_01_base_F", [[-1.6,-2.6,-1.9],[1.2,2.7,0.8]]],
			["B_APC_Tracked_01_AA_F", [[-2,-4.8,-2.8],[2,2.7,0.7]]],
			["B_APC_Tracked_01_CRV_F", [[-2.1,-4.8,-2.4],[2,3.9,0.8]]],
			["APC_Tracked_01_base_F", [[-2,-4.8,-2.4],[2,2.6,0.6]]],
			["O_APC_Tracked_02_AA_F", [[-2.2,-5.4,-2.7],[2.2,2.9,0.5]]],
			["APC_Tracked_02_base_F", [[-2.2,-5.4,-2.3],[2.2,2.9,1.1]]],
			["APC_Tracked_03_base_F", [[-1.9,-4.2,-2.4],[2,3.1,0.7]]],
			["MBT_01_arty_base_F", [[-2,-5.6,-2.8],[2.1,5.6,1.1]]],
			["MBT_01_mlrs_base_F", [[-1.3,-4.6,-1.9],[2.6,2.9,2.2]]],
			["B_MBT_01_TUSK_F", [[-1.9,-4.6,-2.7],[2,4.2,0.4]]],
			["MBT_01_base_F", [[-1.9,-4.6,-2.6],[2,4.2,0.4]]],
			["MBT_02_arty_base_F", [[-2,-5.5,-2.7],[2.1,5.7,0.9]]],
			["MBT_02_base_F", [[-1.8,-5,-2.2],[1.8,5.1,0.8]]],
			["MBT_03_base_F", [[-2.2,-5.7,-2.6],[2.2,5.3,0.8]]],
			["MBT_04_command_base_F", [[-2.1,-5.7,-2.6],[1.9,5.2,0.9]]],
			["MBT_04_base_F", [[-2.2,-5.7,-2.3],[2.1,5.2,1.4]]],
			["CUP_2S6_Base",[[-1.8,-4.4,-3.9],[1.5,3.4,0.1]]],
			["CUP_M113_Base",[[-0.9,-2.6,-2.7],[1.8,2.6,0.1]]],
			["CUP_M60A3_Base",[[-1.9,-4.4,-2.7],[1.9,5.1,0.4]]],
			["CUP_BMP1_base",[[-1.5,-3.2,-2.1],[1.5,3.7,0.3]]],
			["CUP_BMP2_base",[[-1.6,-3,-2.1],[1.6,3.7,0.5]]],
			["CUP_FV432_Bulldog_Base",[[-1.3,-2.6,-1],[1.3,2.7,1.2]]],
			["CUP_T72_Base",[[-1.7,-4.6,-2],[1.8,5.1,0.7]]],
			["CUP_ZSU23_Base",[[-1.5,-3.1,-0.2],[1.6,3.7,3.9]]],
			["CUP_MTLB_Base",[[-1.5,-2.9,-1.9],[1.4,3.6,-0.2]]],
			["CUP_BMP2_HQ_Base",[[-1.6,-3.5,-5.7],[1.6,3.2,-3.6]]],
			["UP_M1_Abrams_base",[[-1.9,-4.6,-2.5],[1.8,4.8,0.2]]],
			["CUP_M2Bradley_Base",[[-1.6,-2.2,-1.6],[1.6,4.4,1.4]]],
			["CUP_MCV80_Base",[[-1.6,-3.5,-2.8],[1.6,3.4,0.3]]],
			["CUP_FV510_Base",[[-1.6,-3.5,-2.4],[1.6,3.4,0.8]]],
			["CUP_BMP3_Base",[[-1.8,-3.3,-2.4],[1.5,3.9,0.3]]],
			["CUP_AAV_Base",[[-1.9,-4,-2.1],[1.8,4.2,1]]],
			["CUP_B_M6LineBacker_USA_W",[[-1.6,-2.1,-1.6],[1.6,4.4,1.7]]],
			["CUP_T90_Base",[[-1.8,-5.3,0],[1.8,4.8,2.9]]],
			["BWA3_Puma_base",[[-2,-3.9,0],[2,3.5,3.7]]],
			["CUP_BMP1P_base",[[-1.5,-3.2,-2],[1.5,3.7,0.4]]],
			["CUP_T55_Base",[[-1.9,-5.2,-2.6],[1.9,4.8,0.4]]],
			["CUP_Leopard2_Base",[[-1.9,-5.4,-1.1],[1.8,5.3,1.9]]],
			["BWA3_Leopard_base",[[-1.9,-5.4,0],[1.9,5.6,3.2]]],
			["CUP_M163_Base",[[-0.8,-2.2,-2],[1.9,2.7,0.8]]],
			["CUP_T34_Base",[[-1.5,-3.6,-2.2],[1.6,4.8,0.5]]],
			["CUP_Challenger2_base",[[-1.9,-4.3,-0.9],[1.9,7.3,1.6]]]
		]
	],
	[
		"Car_F",
		[
			["Kart_01_Base_F", [[-0.6,-0.9,-1.1],[0.7,1.2,-0.4]]],
			["Quadbike_01_base_F", [[-0.6,-1.2,-1.7],[0.6,1.1,-0.4]]],
			["Hatchback_01_base_F", [[-1,-2.6,-1.5],[0.9,2.3,0.3]]],
			["Offroad_01_armed_base_F", [[-1.3,-2.9,-2.3],[1.2,2.9,0.3]]],
			["Offroad_01_repair_base_F", [[-1.1,-3,-1.7],[1.1,2.8,0.6]]],
			["Offroad_01_base_F", [[-1.3,-3,-1.7],[1.2,2.8,0.6]]],
			["Offroad_02_AT_base_F", [[-1.1,-1.8,-1.6],[1,2.4,1]]],
			["Offroad_02_LMG_base_F", [[-1.1,-1.8,-2.2],[1,2.4,0.3]]],
			["Offroad_02_base_F", [[-1.1,-1.8,-1.6],[1,2.4,0.5]]],
			["SUV_01_base_F", [[-1.1,-3,-1.7],[1.1,2.4,0.4]]],
			["UGV_01_rcws_base_F", [[-0.8,-2.1,-2.2],[1.7,2.1,0.1]]],
			["UGV_01_base_F", [[-0.8,-2.1,-2.2],[1.7,2.1,-0.3]]],
			["LSV_01_AT_base_F", [[-1.1,-2.5,-1.9],[1.1,2.3,0.7]]],
			["LSV_01_armed_base_F", [[-1.1,-2.5,-2.2],[1.1,2.3,-0.2]]],
			["LSV_01_base_F", [[-1.1,-2.1,-2.2],[1.1,2.3,-0.2]]],
			["LSV_02_AT_base_F", [[-1.2,-2.5,-1.7],[0.9,2.4,0.8]]],
			["LSV_02_armed_base_F", [[-1.2,-2.5,-1.7],[0.9,2.4,0.8]]],
			["LSV_02_base_F", [[-1.2,-2.5,-1.7],[0.9,2.4,0.4]]],
			["MRAP_01_gmg_base_F", [[-1.3,-4.7,-2.9],[1.3,1.7,0.9]]],
			["MRAP_01_base_F", [[-1.3,-4.8,-2.2],[1.3,1.7,0.7]]],
			["MRAP_02_hmg_base_F", [[-1.6,-4.9,-2.9],[1.6,1.7,0.8]]],
			["MRAP_02_base_F", [[-1.6,-4.9,-2.4],[1.6,1.7,0.8]]],
			["MRAP_03_hmg_base_F", [[-1.4,-3.3,-2.4],[1.4,2.6,0.5]]],
			["MRAP_03_base_F", [[-1.4,-3.3,-1.8],[1.4,2.6,1]]],
			["APC_Wheeled_01_base_F", [[-1.9,-5,-2.5],[1.9,3.4,0.9]]],
			["APC_Wheeled_02_base_F", [[-1.7,-4.8,-2.6],[2.1,2.1,0.7]]],
			["APC_Wheeled_03_base_F", [[-1.4,-5.1,-2.7],[2.3,3.4,1.2]]],
			["AFV_Wheeled_01_up_base_F", [[-1.9,-4.7,-2.4],[1.9,3.9,1.1]]],
			["AFV_Wheeled_01_base_F", [[-1.9,-4.7,-2.1],[1.9,3.9,0.5]]],
			["CUP_T810_Base",[[-1.3,-3.4,-2.9],[1.4,4.1,1.5]]],
			["CUP_T810_Unarmed_Base",[[-1.6,-3.5,-2.2],[1.7,4.1,1.3]]],
			["CUP_Lada_Base",[[-0.9,-1.8,-1.5],[0.9,2.3,0.1]]],
			["CUP_S1203_Base",[[-0.7,-2.1,-1.7],[1.2,2.2,0.4]]],
			["CUP_Hilux_unarmed_Base",[[-1,-2.8,-1.6],[1,2.5,-0.1]]],
			["CUP_Hilux_DSHKM_Base",[[-1,-2.8,-1.6],[1,2.5,0.7]]],
			["CUP_Hilux_SPG9_Base",[[-1,-2.5,-1.6],[1,2.5,-0.3]]],
			["CUP_Hilux_igla_Base",[[-1,-2.8,-1.6],[1,2.5,1.4]]],
			["CUP_Hilux_metis_Base",[[-1,-2.8,-1.6],[1,2.5,0.4]]],
			["CUP_Hilux_MLRS_Base",[[-1,-2.8,-1.6],[1,2.5,1]]],
			["CUP_Hilux_zu23_Base",[[-1,-2.8,-1.6],[1,2.5,0.9]]],
			["CUP_Hilux_btr60_base",[[-1.1,-2.4,-2.2],[0.9,2.6,0.4]]],
			["CUP_Hilux_BMP1_base",[[-1,-2.4,-2.3],[1,2.6,0.1]]],
			["CUP_Hilux_AGS30_Base",[[-1,-2.8,-1.6],[1,2.5,0.6]]],
			["CUP_Hilux_M2_Base",[[-1,-2.8,-1.6],[1,2.5,0.6]]],
			["CUP_Hilux_UB32_Base",[[-1,-2.8,-1.6],[1,2.5,1.1]]],
			["CUP_Hilux_armored_metis_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.3]]],
			["CUP_Hilux_armored_UB32_Base",[[-1.2,-2.6,-1.6],[1.3,3,1.1]]],
			["CUP_Hilux_armored_BMP1_Base",[[-1.3,-2.5,-2.3],[1.3,3,-0.4]]],
			["CUP_Hilux_armored_BTR60_Base",[[-1.3,-2.5,-2.2],[1.2,2.9,0.3]]],
			["CUP_Hilux_armored_MLRS_Base",[[-1.2,-2.6,-1.6],[1.3,3,1]]],
			["CUP_Hilux_armored_M2_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.6]]],
			["CUP_Hilux_armored_DSHKM_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.7]]],
			["CUP_Hilux_armored_igla_Base",[[-1.2,-2.5,-1.6],[1.2,2.2,1.1]]],
			["CUP_Hilux_armored_zu23_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.9]]],
			["CUP_Hilux_armored_AGS30_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.6]]],
			["CUP_Hilux_armored_unarmed_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.3]]],
			["CUP_Hilux_podnos_Base",[[-1,-2.8,-1.6],[1,2.5,-0.1]]],
			["CUP_Hilux_armored_podnos_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.3]]],
			["CUP_Hilux_armored_SPG9_Base",[[-1.2,-2.6,-1.6],[1.3,3,0.6]]],
			["CUP_C_Golf4_Civ_Base",[[-0.9,-2.3,-1.4],[0.9,1.8,0.1]]],
			["CUP_B_BRDM2_ATGM_CDF",[[-1.2,-2.7,-2.4],[1.2,3.1,0.3]]],
			["CUP_BTR40_MG_Base",[[-1.1,-2.2,-1.7],[1,2.4,0.3]]],
			["CUP_BTR90_Base",[[-1.6,-3.8,-2.5],[1.7,3.9,0.7]]],
			["CUP_HMMWV_Base",[[-1.2,-2.5,-2.6],[1.1,2.2,-0.6]]],
			["CUP_B_HMMWV_Terminal_USA",[[-1.2,-2.5,-2.3],[1.2,2.9,0.5]]],
			["CUP_HMMWV_M2_Base",[[-1.2,-2.5,-2.6],[1.1,2.2,0.2]]],
			["CUP_HMMWV_M2_GPK_Base",[[-1.2,-2.6,-2.4],[1.2,2.3,0.2]]],
			["CUP_B_HMMWV_Crows_MK19_USA",[[-1.2,-2.5,-2.6],[1.1,2.2,0.2]]],
			["CUP_B_HMMWV_SOV_USA",[[-1.2,-2.4,-2],[1.2,2.3,0.7]]],
			["CUP_LR_Base",[[-1.2,-2.6,-1.9],[1.2,2.8,0.7]]],
			["CUP_LR_Special_Base",[[-1.4,-3.2,-0.2],[1.2,2.7,2.8]]],
			["CUP_LR_SPG9_Base",[[-1.1,-2.6,-1.9],[1.1,2.8,0.5]]],
			["CUP_MTVR_Base",[[-1.3,-3.6,-2.2],[1.3,4.2,1.6]]],
			["CUP_M1151_M2_BASE",[[-1.2,-2.7,-2.5],[1.2,2.2,0.2]]],
			["CUP_GAZ_Vodnik_Base",[[-1.3,-3.1,-2.3],[1.3,2.7,0.2]]],
			["BWA3_Eagle_base",[[-1.3,-3.1,-0.1],[1.3,1.8,2.9]]],
			["CUP_Datsun_Base",[[-1,-2.3,-2.1],[1,2.4,0]]],
			["CUP_SUV_Base",[[-1.1,-2.8,-1.1],[1.1,2.8,1]]],
			["CUP_Tractor_Base",[[-1,-2,-1.7],[1,1.7,0.9]]],
			["CUP_UAZ_Base",[[-0.9,-2.1,-0.1],[1,1.9,2]]],
			["CUP_UAZ_Unarmed_Base",[[-0.9,-2.1,-0.1],[1,1.9,2]]],
			["CUP_UAZ_Armed_Base",[[-0.9,-2,-0.1],[1,2,2.8]]],
			["CUP_V3S_Open_Base",[[-1.1,-3,-1.9],[1.2,3.8,0.6]]],
			["CUP_I_V3S_Covered_TKG",[[-1.2,-3,-1.9],[1.2,3.8,1.1]]],
			["CUP_I_V3S_Rearm_TKG",[[-1.2,-3.5,-2],[1.2,3.3,0.7]]],
			["CUP_B_RG31E_M2_USA",[[-1.3,-2.8,-2.7],[1.3,2.9,0.9]]],
			["CUP_Mastiff_Base",[[-1.5,-4.6,-0.1],[1.5,3.5,2.7]]],
			["CUP_Ridgback_Base",[[-1.5,-4.9,-0.1],[1.5,3.5,2.7]]],
			["CUP_Ridgback_Base",[[-1.5,-3.3,0],[1.5,3.5,2.7]]],
			["CUP_Dingo_Base",[[-1.2,-3.2,-2.7],[1.2,3.2,0.8]]],
			["CUP_BAF_Coyote_BASE_D",[[-1.2,-4.3,-0.2],[1.2,2.9,3]]],
			["CUP_B_M1128_MGS_Desert",[[-1.3,-3.6,-0.2],[1.3,4,3.1]]],
			["CUP_M1126_ICV_BASE",[[-1.3,-3.8,-0.2],[1.3,3.5,3.2]]],
			["CUP_B_M1135_ATGMV_Desert",[[-1.3,-3.8,-0.2],[1.3,3.5,3.3]]],
			["CUP_BTR80A_Base",[[-1.5,-4,-2.5],[1.5,3.4,0.6]]],
			["CUP_LAV25_Base",[[-1,-3,-3.3],[1.7,3.6,-0.6]]],
			["CUP_BTR60_Base",[[-1.4,-4,-2.2],[1.5,3.3,0.4]]],
			["CUP_Volha_Base",[[-0.9,-2.4,-1.5],[0.9,2.4,0.1]]],
			["CUP_Skoda_Base",[[-0.8,-2,-1.4],[0.8,2,0.2]]],
			["CUP_Ikarus_Base",[[-1.5,-5.8,-1.9],[1.2,5.1,1.3]]],
			["CUP_M1152_BASE",[[-1.2,-2.7,-2.5],[1.2,2.2,0.2]]],
			["CUP_M1167_BASE",[[-1.2,-2.6,-2.6],[1.2,2.3,0.2]]],
			["CUP_M1165_GMV_BASE",[[-1.2,-2.7,-2.5],[1.2,2.2,0.2]]],
			["CUP_HMMWV_Avenger_Base",[[-1.5,-2.7,-3.2],[1,2.2,-0.2]]]
		]
	],
	[
		"Ship_F",
		[
			["SDV_01_base_F", [[-1,-4.1,-1.9],[1,2,1]]],
			["Scooter_Transport_01_base_F", [[-0.6,-1.4,-1.5],[0.6,1.9,-0.2]]],
			["Rubber_duck_base_F", [[-1.1,-2.5,-1.5],[1.1,2.4,-0.1]]],
			["Boat_Civil_01_base_F", [[-1,-3.4,-1.6],[1,3.6,0.3]]],
			["Boat_Transport_02_base_F", [[-1.5,-3.3,-1.9],[1.5,3.8,0.7]]],
			["Boat_Armed_01_base_F", [[-1.8,-5.5,-3.5],[2,6.4,1.2]]],
			["CUP_RHIB_Base",[[-1.7,-4,-3.5],[1.7,4.9,0.5]]],
			["CUP_LCU1600_Base",[[-4.3,-21.3,-4.3],[4.3,19.7,3.4]]],
			["CUP_LCVP_Base",[[-1.5,-6.5,-3.2],[2.2,4.8,-0.1]]],
			["CUP_Seafox_Base",[[-1.6,-4.1,-3.7],[1.6,4.8,-1.7]]],
			["CUP_Fishing_Boat_Base",[[-2.5,-6.9,-5.1],[2.2,6.9,4.7]]],
			["CUP_Frigate_Base",[[-7.4,-36,-16.7],[7.5,52.3,17.2]]]
		]
	],
	[
		"Air",
		[
			["Heli_Light_01_civil_base_F", [[-3.7,-4.1,-0.7],[3.8,4.9,2.3]]],
			["Heli_Light_01_base_F", [[-3.7,-5,-1.8],[3.8,4.1,1.1]]],
			["Heli_Light_02_base_F", [[-6.8,-7.9,-2.4],[6.7,8,2.4]]],
			["Heli_light_03_base_F", [[-4.5,-7.6,-1.5],[4.6,5.8,2.5]]],
			["Heli_Transport_01_base_F", [[-7.2,-8.5,-2.3],[7.1,8.1,1.8]]],
			["Heli_Transport_02_base_F", [[-9.3,-11.3,-3.6],[9.3,11.2,3.6]]],
			["Heli_Transport_03_base_F", [[-8.3,-13.8,-3.6],[8.4,13.7,3]]],
			["Heli_Transport_04_base_F", [[-7.2,-8.9,-3],[7.3,9,3.7]]],
			["Heli_Attack_01_base_F", [[-5.7,-7.1,-2],[5.8,7.3,2]]],
			["Heli_Attack_02_base_F", [[-6.7,-8.5,-3.2],[6.6,8.5,3.2]]],
			["Plane_Civil_01_base_F", [[-5.5,-4,-1.6],[5.5,4.1,1.4]]],
			["Plane_Fighter_01_Base_F", [[-6.6,-8.9,-2.6],[6.6,9.5,2.6]]],
			["Plane_Fighter_02_Base_F", [[-7.6,-10.7,-2.4],[7.7,11.1,2.4]]],
			["Plane_Fighter_03_base_F", [[-5,-6.4,-2.5],[5.1,6.5,2.4]]],
			["Plane_Fighter_04_Base_F", [[-4.2,-6.9,-2.4],[4.2,7.8,2.3]]],
			["Plane_CAS_01_base_F", [[-8.8,-7.8,-2.3],[8.8,7.7,2.8]]],
			["Plane_CAS_02_base_F", [[-6.5,-8.1,-3.1],[6.5,7,3]]],
			["VTOL_01_base_F", [[-18.1,-13.5,-6.8],[18.1,13.4,4.1]]],
			["VTOL_02_base_F", [[-8.2,-8.3,-3.4],[8.2,8.4,3.5]]],
			["UAV_01_base_F", [[-0.5,-0.3,-0.1],[0.5,0.5,0.2]]],
			["UAV_02_base_F", [[-5.1,-3.4,-1.6],[5.1,3.3,0.8]]],
			["UAV_03_base_F", [[-5.6,-6,-1.7],[4.8,5.7,1.7]]],
			["UAV_04_base_F", [[-4.5,-2.8,-1.7],[4.5,2.6,0.7]]],
			["UAV_05_Base_F", [[-10.2,-6.3,-1.9],[10.2,6.4,1.9]]],
			["UAV_06_antimine_base_F", [[-0.3,-0.3,-0.3],[0.3,0.4,0.2]]],
			["UAV_06_base_F", [[-0.2,-0.4,-0.2],[0.2,0.4,0.2]]],
			["BWA3_Tiger_base",[[-6.5,-7.8,-1.9],[6.5,8,3.7]]],
			["BWA3_Tiger_RMK_base",[[-6.5,-7.8,-1.9],[6.5,8,3.7]]],
			["CUP_AH1Z_Base",[[-7.3,-7.3,-1.6],[7.3,8.7,1.8]]],
			["CUP_AH64_base",[[-6.8,-8.5,-0.1],[6.8,8.6,3.8]]],
			["CUP_AH64D_dynamic_base",[[-6.8,-8.5,-0.1],[6.8,8.6,3.8]]],
			["CUP_AH6_BASE",[[-1.3,-5.2,-1.1],[1.3,2.1,2.2]]],
			["CUP_AH6_ARMED_BASE",[[-1.3,-5.2,-1.1],[1.3,2.1,2.2]]],
			["CUP_C130J_Base",[[-20,-16.3,-5.7],[20,12.9,5.9]]],
			["CUP_C130J_VIV_Base",[[-20,-16.3,-5.7],[20,12.9,5.9]]],
			["CUP_CH47F_base",[[-9.3,-14.2,-3.7],[9.3,14.3,2.1]]],
			["CUP_CH47F_VIV_Base",[[-9.3,-14.2,-3.7],[9.3,14.3,2.1]]],
			["CUP_CH53E_Base",[[-3.8,-15.2,-4.8],[3.8,15.1,4.7]]],
			["CUP_CH53E_VIV_Base",[[-3.8,-15.2,-4.8],[3.8,15.1,4.7]]],
			["CUP_KA50_Base",[[-7,-7.9,-0.1],[7,7.7,4.7]]],
			["CUP_Ka52_Base",[[-7,-7.7,-2.7],[7,7.8,2.6]]],
			["CUP_MH60S_Base",[[-8,-9.6,-2.1],[7.9,9.7,3.4]]],
			["CUP_MH60S_FFV_Base",[[-8,-9.6,-2.1],[7.9,9.7,3.4]]],
			["CUP_UH60S_Dap_2x_Dynamic_Base",[[-8,-9.7,-1.9],[8,9.7,3.4]]],
			["CUP_UH60S_Dap_4x_Dynamic_Base",[[-8,-9.7,-1.9],[8,9.7,3.4]]],
			["CUP_B_MV22_USMC",[[-11.9,-10.6,-3.8],[11.9,7.8,4.5]]],
			["CUP_Su25_base",[[-7.2,-7.7,-2.3],[7.2,7,3.3]]],
			["CUP_SU34_BASE",[[-7.2,-11.4,-2.4],[7.2,11.3,4]]],
			["CUP_UH1H_base",[[-1.9,-8.1,-2.4],[1.9,8.3,2.3]]],
			["CUP_UH1H_armed_base",[[-1.9,-8.1,-2.4],[1.9,8.3,2.3]]],
			["CUP_UH1H_gunship_base",[[-1.9,-8.1,-2.4],[1.9,8.3,2.3]]],
			["CUP_UH1H_slick_base",[[-1.9,-8.1,-2.4],[1.9,8.3,2.3]]],
			["CUP_Uh60_FFV_Base",[[-8,-9.7,-1.9],[8,9.7,3.4]]],
			["CUP_Uh60_Unarmed_FFV_Base",[[-8,-9.7,-1.9],[8,9.7,3.4]]],
			["CUP_L39_base",[[-5.1,-6.3,-2.3],[5.1,6.6,2.5]]],
			["CUP_Mi24_Base",[[-7.7,-10.2,-3.2],[7.8,10,3.3]]],
			["CUP_Mi24_Dynamic_Base",[[-7.7,-9.9,-2.7],[7.8,9.9,3.7]]],
			["CUP_Mi24_D_MEV_Dynamic_Base",[[-7.7,-9.9,-2.7],[7.8,9.9,3.7]]],
			["CUP_Mi35_Dynamic_Base",[[-7.7,-9.9,-2.7],[7.8,9.9,3.7]]],
			["CUP_MI6A_Base",[[-17.7,-25.4,-3.2],[17.4,18,8.2]]],
			["CUP_Mi8_base",[[-10.4,-12.6,-3.4],[10.4,12.6,2.7]]],
			["CUP_Mi8_medevac_base",[[-10.4,-13.2,-1.9],[10.4,12,4]]],
			["CUP_Mi171Sh_Base",[[-10.4,-12.6,-3.3],[10.4,12.6,2.6]]],
			["CUP_SA330_Base",[[-6.7,-8.7,-2.9],[6.7,8.7,2.1]]],
			["CUP_Ka60_GL_BASE",[[-6.8,-7.8,-2.4],[6.8,8,2.4]]],
			["CUP_Ka60_Base",[[-6.8,-7.8,-2.4],[6.8,8,2.4]]],
			["CUP_B_AH1_DL_BAF",[[-6.8,-8.5,-0.1],[6.8,8.6,3.8]]],
			["CUP_B_UH1Y_Base",[[-7.2,-8.7,-1.7],[7.2,8.7,2.3]]],
			["CUP_AW159_Dynamic_Base",[[-5.1,-8.6,0],[5,5.2,4.1]]],
			["CUP_AW159_Unarmed_Base",[[-5.1,-8.6,0],[5,5.2,4.1]]],
			["CUP_Merlin_HM2_Base",[[-9.2,-12.5,-0.2],[8.8,8.6,7.2]]],
			["CUP_Merlin_HC3A_Armed_Base",[[-9.2,-12.5,-0.2],[8.8,8.6,7.2]]],
			["CUP_Merlin_HC3A_Base",[[-9.2,-12.5,-0.2],[8.8,8.6,7.2]]],
			["CUP_Merlin_HC3_VIV_Base",[[-9.2,-12.5,-0.2],[8.8,8.6,7.2]]],
			["CUP_Merlin_HC3_Armed_Base",[[-9.2,-12.5,-0.2],[8.8,8.6,7.2]]],
			["CUP_Merlin_HC3_Base",[[-9.2,-12.5,-0.2],[8.8,8.6,7.2]]],
			["CUP_Ambient_B737_Base",[[-17.5,-26.8,-7.4],[17.5,16.1,7]]],
			["CUP_AC47_Spooky_Base",[[-14.4,-10,-3.7],[14.4,10,3.7]]],
			["CUP_DC3_Base",[[-14.4,-10,-3.7],[14.4,10,3.7]]],
			["CUP_C47_Base",[[-14.4,-10,-3.7],[14.4,10,3.7]]],
			["CUP_AN2_Base",[[-9.2,-6.6,-3.1],[9.2,6.1,3.1]]],
			["CUP_A10_Base",[[-8.5,-8.1,-1],[8.6,7.7,3.8]]]
		]
	],
	[
		"All",
		[
			["CUP_TT650_Base",[[-0.5,-0.7,-1.5],[0.4,1.5,0]]],
			["CUP_M1030_Base",[[-0.3,-1.1,-1.5],[0.2,1,-0.2]]]
		]
	]
];

{
	if (_vehClass isKindOf (_x select 0)) exitWith
	{
		{
			if (_vehClass isKindOf (_x select 0)) exitWith
			{
				_boundingBoxReal = _x select 1;
			};
		} forEach (_x select 1);
	};
} forEach _realBoundingBoxes;

if (isNil "_boundingBoxReal") then { boundingBoxReal _vehicle } else { _boundingBoxReal }


// Here is the intersect scanner, which is used in the editor. The resulting array is copied into the clipboard.

/*
0 spawn
{
	_precision = 0.1; comment "change this for higher/lower precision";
	_lineColor1 = [0,1,0,1];
	_lineColor2 = [1,0,0,1];
	_parentClasses =
	[
		"ReammoBox_F",
		"Truck_F",
		"Tank_F",
		"Car_F",
		"Ship_F",
		"Air",
		"All"
	];
	_vehClasses =
	[
		["Box_NATO_Wps_F", "Box_NATO_Wps_F"],
		["Box_NATO_WpsSpecial_F", "Box_NATO_WpsSpecial_F"],
		["Box_NATO_Ammo_F", "Box_NATO_Ammo_F"],
		["Box_NATO_AmmoOrd_F", "Box_NATO_AmmoOrd_F"],
		["Box_NATO_Grenades_F", "Box_NATO_Grenades_F"],
		["Box_NATO_Support_F", "Box_NATO_Support_F"],
		["Box_NATO_WpsLaunch_F", "Box_NATO_WpsLaunch_F"],
		["Box_NATO_AmmoVeh_F", "Box_NATO_AmmoVeh_F"],
		["Box_East_Wps_F", "Box_East_Wps_F"],
		["Box_East_WpsSpecial_F", "Box_East_WpsSpecial_F"],
		["Box_East_Ammo_F", "Box_East_Ammo_F"],
		["Box_East_AmmoOrd_F", "Box_East_AmmoOrd_F"],
		["Box_East_Grenades_F", "Box_East_Grenades_F"],
		["Box_East_Support_F", "Box_East_Support_F"],
		["Box_East_WpsLaunch_F", "Box_East_WpsLaunch_F"],
		["Box_East_AmmoVeh_F", "Box_East_AmmoVeh_F"],
		["Box_IND_Wps_F", "Box_IND_Wps_F"],
		["Box_IND_WpsSpecial_F", "Box_IND_WpsSpecial_F"],
		["Box_IND_Ammo_F", "Box_IND_Ammo_F"],
		["Box_IND_AmmoOrd_F", "Box_IND_AmmoOrd_F"],
		["Box_IND_Grenades_F", "Box_IND_Grenades_F"],
		["Box_IND_Support_F", "Box_IND_Support_F"],
		["Box_IND_WpsLaunch_F", "Box_IND_WpsLaunch_F"],
		["Box_IND_AmmoVeh_F", "Box_IND_AmmoVeh_F"],
		["Box_FIA_Support_F", "Box_FIA_Support_F"],
		["B_supplyCrate_F", "B_supplyCrate_F"],
		["C_supplyCrate_F", "C_supplyCrate_F"],
		["C_Van_01_box_F", "Van_01_box_base_F"],
		["C_Van_01_fuel_F", "Van_01_fuel_base_F"],
		["C_Van_01_transport_F", "Van_01_base_F"],
		["C_Van_02_vehicle_F", "Van_02_base_F"],
		["B_Truck_01_ammo_F", "B_Truck_01_ammo_F"],
		["B_Truck_01_box_F", "B_Truck_01_box_F"],
		["B_Truck_01_fuel_F", "B_Truck_01_fuel_F"],
		["B_Truck_01_medical_F", "B_Truck_01_medical_F"],
		["B_Truck_01_Repair_F", "B_Truck_01_Repair_F"],
		["B_Truck_01_mover_F", "B_Truck_01_mover_F"],
		["B_Truck_01_covered_F", "Truck_01_base_F"],
		["O_Truck_02_ammo_F", "O_Truck_02_ammo_F"],
		["O_Truck_02_medical_F", "O_Truck_02_medical_F"],
		["O_Truck_02_box_F", "O_Truck_02_box_F"],
		["O_Truck_02_fuel_F", "O_Truck_02_fuel_F"],
		["I_Truck_02_ammo_F", "I_Truck_02_ammo_F"],
		["I_Truck_02_medical_F", "I_Truck_02_medical_F"],
		["I_Truck_02_box_F", "I_Truck_02_box_F"],
		["I_Truck_02_fuel_F", "I_Truck_02_fuel_F"],
		["I_Truck_02_MRL_F", "Truck_02_MRL_base_F"],
		["I_Truck_02_covered_F", "Truck_02_base_F"],
		["O_Truck_03_ammo_F", "O_Truck_03_ammo_F"],
		["O_Truck_03_device_F", "O_Truck_03_device_F"],
		["O_Truck_03_fuel_F", "O_Truck_03_fuel_F"],
		["O_Truck_03_medical_F", "O_Truck_03_medical_F"],
		["O_Truck_03_repair_F", "O_Truck_03_repair_F"],
		["O_Truck_03_covered_F", "Truck_03_base_F"],
		["I_LT_01_AT_F", "LT_01_AT_base_F"],
		["I_LT_01_AA_F", "LT_01_AA_base_F"],
		["I_LT_01_cannon_F", "LT_01_cannon_base_F"],
		["I_LT_01_scout_F", "LT_01_base_F"],
		["B_APC_Tracked_01_AA_F", "B_APC_Tracked_01_AA_F"],
		["B_APC_Tracked_01_CRV_F", "B_APC_Tracked_01_CRV_F"],
		["B_APC_Tracked_01_rcws_F", "APC_Tracked_01_base_F"],
		["O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_AA_F"],
		["O_APC_Tracked_02_cannon_F", "APC_Tracked_02_base_F"],
		["I_APC_tracked_03_cannon_F", "APC_Tracked_03_base_F"],
		["B_MBT_01_arty_F", "MBT_01_arty_base_F"],
		["B_MBT_01_mlrs_F", "MBT_01_mlrs_base_F"],
		["B_MBT_01_TUSK_F", "B_MBT_01_TUSK_F"],
		["B_MBT_01_cannon_F", "MBT_01_base_F"],
		["O_MBT_02_arty_F", "MBT_02_arty_base_F"],
		["O_MBT_02_cannon_F", "MBT_02_base_F"],
		["I_MBT_03_cannon_F", "MBT_03_base_F"],
		["O_MBT_04_command_F", "MBT_04_command_base_F"],
		["O_MBT_04_cannon_F", "MBT_04_base_F"],
		["C_Kart_01_F", "Kart_01_Base_F"],
		["C_Quadbike_01_F", "Quadbike_01_base_F"],
		["C_Hatchback_01_F", "Hatchback_01_base_F"],
		["B_G_Offroad_01_armed_F", "Offroad_01_armed_base_F"],
		["C_Offroad_01_repair_F", "Offroad_01_repair_base_F"],
		["C_Offroad_01_F", "Offroad_01_base_F"],
		["I_C_Offroad_02_AT_F", "Offroad_02_AT_base_F"],
		["I_C_Offroad_02_LMG_F", "Offroad_02_LMG_base_F"],
		["C_Offroad_02_unarmed_F", "Offroad_02_base_F"],
		["C_SUV_01_F", "SUV_01_base_F"],
		["B_UGV_01_rcws_F", "UGV_01_rcws_base_F"],
		["B_UGV_01_F", "UGV_01_base_F"],
		["B_T_LSV_01_AT_F", "LSV_01_AT_base_F"],
		["B_T_LSV_01_armed_F", "LSV_01_armed_base_F"],
		["B_T_LSV_01_unarmed_F", "LSV_01_base_F"],
		["O_T_LSV_02_AT_F", "LSV_02_AT_base_F"],
		["O_T_LSV_02_armed_F", "LSV_02_armed_base_F"],
		["O_T_LSV_02_unarmed_F", "LSV_02_base_F"],
		["B_MRAP_01_gmg_F", "MRAP_01_gmg_base_F"],
		["B_MRAP_01_F", "MRAP_01_base_F"],
		["O_MRAP_02_hmg_F", "MRAP_02_hmg_base_F"],
		["O_MRAP_02_F", "MRAP_02_base_F"],
		["I_MRAP_03_hmg_F", "MRAP_03_hmg_base_F"],
		["I_MRAP_03_F", "MRAP_03_base_F"],
		["B_APC_Wheeled_01_cannon_F", "APC_Wheeled_01_base_F"],
		["O_APC_Wheeled_02_rcws_v2_F", "APC_Wheeled_02_base_F"],
		["I_APC_Wheeled_03_cannon_F", "APC_Wheeled_03_base_F"],
		["B_AFV_Wheeled_01_up_cannon_F", "AFV_Wheeled_01_up_base_F"],
		["B_AFV_Wheeled_01_cannon_F", "AFV_Wheeled_01_base_F"],
		["B_SDV_01_F", "SDV_01_base_F"],
		["C_Scooter_Transport_01_F", "Scooter_Transport_01_base_F"],
		["C_Rubberboat", "Rubber_duck_base_F"],
		["C_Boat_Civil_01_F", "Boat_Civil_01_base_F"],
		["C_Boat_Transport_02_F", "Boat_Transport_02_base_F"],
		["B_Boat_Armed_01_minigun_F", "Boat_Armed_01_base_F"],
		["C_Heli_Light_01_civil_F", "Heli_Light_01_civil_base_F"],
		["B_Heli_Light_01_armed_F", "Heli_Light_01_base_F"],
		["O_Heli_Light_02_F", "Heli_Light_02_base_F"],
		["I_Heli_light_03_F", "Heli_light_03_base_F"],
		["B_Heli_Transport_01_F", "Heli_Transport_01_base_F"],
		["I_Heli_Transport_02_F", "Heli_Transport_02_base_F"],
		["B_Heli_Transport_03_F", "Heli_Transport_03_base_F"],
		["O_Heli_Transport_04_box_F", "Heli_Transport_04_base_F"],
		["B_Heli_Attack_01_F", "Heli_Attack_01_base_F"],
		["O_Heli_Attack_02_F", "Heli_Attack_02_base_F"],
		["C_Plane_Civil_01_F", "Plane_Civil_01_base_F"],
		["B_Plane_Fighter_01_F", "Plane_Fighter_01_Base_F"],
		["O_Plane_Fighter_02_F", "Plane_Fighter_02_Base_F"],
		["I_Plane_Fighter_03_CAS_F", "Plane_Fighter_03_base_F"],
		["I_Plane_Fighter_04_F","Plane_Fighter_04_Base_F"],
		["B_Plane_CAS_01_F", "Plane_CAS_01_base_F"],
		["O_Plane_CAS_02_F", "Plane_CAS_02_base_F"],
		["B_T_VTOL_01_armed_F", "VTOL_01_base_F"],
		["O_T_VTOL_02_infantry_F", "VTOL_02_base_F"],
		["B_UAV_01_F", "UAV_01_base_F"],
		["B_UAV_02_CAS_F", "UAV_02_base_F"],
		["B_T_UAV_03_F", "UAV_03_base_F"],
		["O_T_UAV_04_CAS_F", "UAV_04_base_F"],
		["B_UAV_05_F", "UAV_05_Base_F"],
		["C_IDAP_UAV_06_antimine_F", "UAV_06_antimine_base_F"],
		["B_UAV_06_F", "UAV_06_base_F"],
		["CUP_B_T810_Armed_CZ_DES", "CUP_T810_Base"],
		["CUP_B_T810_Unarmed_CZ_WDL", "CUP_T810_Unarmed_Base", "CUP_B_T810_Repair_CZ_DES", "CUP_B_T810_Refuel_CZ_DES", "CUP_B_T810_Reammo_CZ_WDL"],
		["CUP_C_Lada_White_CIV", "CUP_Lada_Base", "CUP_C_Lada_GreenTK_CIV", "CUP_LADA_LM_CIV"],
		["CUP_C_S1203_CIV", "CUP_S1203_Base", "CUP_C_S1203_Militia_CIV", "CUP_B_S1203_Ambulance_CDF"],
		["CUP_I_Hilux_unarmed_TK", "CUP_Hilux_unarmed_Base", "CUP_Hilux_Unarmed"],
		["CUP_I_Hilux_DSHKM_TK", "CUP_Hilux_DSHKM_Base"],
		["CUP_I_Hilux_SPG9_TK", "CUP_Hilux_SPG9_Base"],
		["CUP_I_Hilux_igla_TK", "CUP_Hilux_igla_Base"],
		["CUP_I_Hilux_metis_TK", "CUP_Hilux_metis_Base"],
		["CUP_I_Hilux_MLRS_TK", "CUP_Hilux_MLRS_Base"],
		["CUP_I_Hilux_zu23_TK", "CUP_Hilux_zu23_Base"],
		["CUP_I_Hilux_btr60_TK", "CUP_Hilux_btr60_base"],
		["CUP_I_Hilux_BMP1_TK", "CUP_Hilux_BMP1_base"],
		["CUP_I_Hilux_AGS30_TK", "CUP_Hilux_AGS30_Base"],
		["CUP_I_Hilux_M2_TK", "CUP_Hilux_M2_Base"],
		["CUP_I_Hilux_UB32_TK", "CUP_Hilux_UB32_Base"],
		["CUP_I_Hilux_armored_metis_TK", "CUP_Hilux_armored_metis_Base"],
		["CUP_I_Hilux_armored_UB32_TK", "CUP_Hilux_armored_UB32_Base"],
		["CUP_I_Hilux_armored_BMP1_TK", "CUP_Hilux_armored_BMP1_Base"],
		["CUP_I_Hilux_armored_BTR60_TK", "CUP_Hilux_armored_BTR60_Base"],
		["CUP_I_Hilux_armored_MLRS_TK", "CUP_Hilux_armored_MLRS_Base"],
		["CUP_I_Hilux_armored_M2_TK", "CUP_Hilux_armored_M2_Base"],
		["CUP_I_Hilux_armored_DSHKM_TK", "CUP_Hilux_armored_DSHKM_Base"],
		["CUP_I_Hilux_armored_igla_TK", "CUP_Hilux_armored_igla_Base"],
		["CUP_I_Hilux_armored_zu23_TK", "CUP_Hilux_armored_zu23_Base"],
		["CUP_I_Hilux_armored_AGS30_TK", "CUP_Hilux_armored_AGS30_Base"],
		["CUP_I_Hilux_armored_unarmed_TK", "CUP_Hilux_armored_unarmed_Base"],
		["CUP_I_Hilux_podnos_TK", "CUP_Hilux_podnos_Base"],
		["CUP_I_Hilux_armored_podnos_TK", "CUP_Hilux_armored_podnos_Base"],
		["CUP_I_Hilux_armored_SPG9_TK", "CUP_Hilux_armored_SPG9_Base"],
		["CUP_C_Golf4_red_Civ", "CUP_C_Golf4_Civ_Base", "CUP_C_Golf4_Base"],
		["CUP_O_2S6_RU", "CUP_2S6_Base", "CUP_O_2S6M_RU"],
		["CUP_B_M113_USA", "CUP_M113_Base", "CUP_B_M113_Med_USA", "CUP_I_M113_RACS_URB", "CUP_I_M113_Med_RACS"],
		["CUP_B_M60A3_USMC", "CUP_M60A3_Base", "CUP_B_M60A3_TTS_USMC"],
		["CUP_I_RHIB_RACS", "CUP_RHIB_Base", "CUP_I_RHIB2Turret_RACS"],
		["CUP_B_BRDM2_CDF", "CUP_B_BRDM2_ATGM_CDF", "CUP_B_BRDM2_HQ_CDF", "CUP_BRDM2_Base"],
		["CUP_O_BTR40_TKA", "CUP_BTR40_MG_Base", "CUP_O_BTR40_MG_TKA"],
		["CUP_O_BTR90_RU", "CUP_BTR90_Base", "CUP_O_BTR90_HQ_RU"],
		["CUP_B_HMMWV_Unarmed_USA", "CUP_HMMWV_Base", "CUP_B_HMMWV_Transport_USA"],
		["CUP_B_HMMWV_Ambulance_ACR", "CUP_B_HMMWV_Terminal_USA"],
		["CUP_B_HMMWV_M2_USA", "CUP_HMMWV_M2_Base", "CUP_B_HMMWV_SOV_M2_USA", "CUP_B_HMMWV_Crows_M2_USA"],
		["CUP_B_HMMWV_M2_GPK_ACR", "CUP_HMMWV_M2_GPK_Base", "CUP_B_HMMWV_AGS_GPK_ACR", "CUP_B_HMMWV_DSHKM_GPK_ACR"],
		["CUP_B_HMMWV_MK19_USA", "CUP_B_HMMWV_Crows_MK19_USA"],
		["CUP_B_HMMWV_SOV_USA", "CUP_B_HMMWV_SOV_USA"],
		["CUP_B_Kamaz_CDF", "CUP_Kamaz_5350_Base", "CUP_B_Kamaz_Open_CDF", "CUP_B_Kamaz_Refuel_CDF", "CUP_B_Kamaz_Reammo_CDF", "CUP_B_Kamaz_Repair_CDF"],
		["CUP_C_LR_Transport_CTK", "CUP_LR_Base", "CUP_B_LR_Ambulance_GB_D", "CUP_O_LR_AA_TKA", "CUP_B_LR_MG_CZ_W"],
		["CUP_B_LR_Special_Des_CZ_D", "CUP_LR_Special_Base", "CUP_B_LR_Special_M2_GB_D", "CUP_B_LR_Special_GMG_GB_D"],
		["CUP_O_LR_SPG9_TKA", "CUP_LR_SPG9_Base"],		
		["CUP_B_MTVR_USA", "CUP_MTVR_Base", "CUP_B_MTVR_Repair_USA", "CUP_B_MTVR_Refuel_USA", "CUP_B_MTVR_Ammo_USA"],
		["CUP_B_M1151_USA", "CUP_M1151_M2_BASE", "CUP_B_M1151_M2_USA", "CUP_B_M1151_Deploy_USA", "CUP_B_M1151_Mk19_USA"],
		["CUP_O_GAZ_Vodnik_PK_RU", "CUP_GAZ_Vodnik_Base", "CUP_O_GAZ_Vodnik_BPPU_RU", "CUP_O_GAZ_Vodnik_MedEvac_RU", "CUP_O_GAZ_Vodnik_AGS_RU"],
		["BWA3_Eagle_Fleck", "BWA3_Eagle_base", "BWA3_Eagle_FLW100_Fleck"],
		["BWA3_Tiger_Gunpod_Heavy", "BWA3_Tiger_base", "BWA3_Tiger_Gunpod_PARS", "BWA3_Tiger_Gunpod_FZ"],
		["BWA3_Tiger_RMK_Heavy", "BWA3_Tiger_RMK_base", "BWA3_Tiger_RMK_Heavy", "BWA3_Tiger_RMK_PARS", "BWA3_Tiger_RMK_FZ", "BWA3_Tiger_RMK_Universal"],		
		["CUP_B_AH1Z_Dynamic_USMC", "CUP_AH1Z_Base"],
		["CUP_B_AH64_DL_USA", "CUP_AH64_base"],
		["CUP_B_AH64D_DL_USA", "CUP_AH64D_dynamic_base"],
		["CUP_B_MH6J_USA", "CUP_AH6_BASE", "CUP_B_MH6J_OBS_USA"],
		["CUP_B_MH6M_USA", "CUP_AH6_ARMED_BASE", "CUP_B_MH6M_OBS_USA"],
		["CUP_B_C130J_GB", "CUP_C130J_Base"],
		["CUP_B_C130J_Cargo_GB", "CUP_C130J_VIV_Base"],
		["CUP_B_CH47F_GB", "CUP_CH47F_base"],
		["CUP_B_CH47F_VIV_GB", "CUP_CH47F_VIV_Base"],
		["CUP_B_CH53E_GER", "CUP_CH53E_Base"],
		["CUP_B_CH53E_VIV_GER", "CUP_CH53E_VIV_Base"],
		["CUP_O_Ka50_DL_SLA", "CUP_KA50_Base", "CUP_KA50_Dynamic_Base"],
		["CUP_O_Ka52_RU", "CUP_Ka52_Base"],
		["CUP_B_MH60S_USMC", "CUP_MH60S_Base"],
		["CUP_B_MH60S_FFV_USMC", "CUP_MH60S_FFV_Base"],
		["CUP_B_MH60L_DAP_2x_US", "CUP_UH60S_Dap_2x_Dynamic_Base", "CUP_MH60L_Dap_2x_Base"],
		["CUP_B_MH60L_DAP_4x_US", "CUP_UH60S_Dap_4x_Dynamic_Base", "CUP_MH60L_Dap_4x_Base"],
		["CUP_B_MV22_VIV_USMC", "CUP_B_MV22_USMC", "CUP_B_MV22_USMC_RAMPGUN"],
		["CUP_B_Su25_Dyn_CDF", "CUP_Su25_base"],
		["CUP_B_SU34_CDF", "CUP_SU34_BASE"],
		["CUP_O_UH1H_SLA", "CUP_UH1H_base", "CUP_B_UH1D_GER_KSK"],
		["CUP_O_UH1H_armed_SLA", "CUP_UH1H_armed_base", "CUP_B_UH1D_armed_GER_KSK_Des"],
		["CUP_O_UH1H_gunship_SLA", "CUP_UH1H_gunship_base", "CUP_B_UH1D_gunship_GER_KSK_Des"],
		["CUP_O_UH1H_slick_SLA", "CUP_UH1H_slick_base", "CUP_B_UH1D_slick_GER_KSK_Des"],
		["CUP_B_UH60M_FFV_US", "CUP_Uh60_FFV_Base", "CUP_Uh60_Base"],
		["CUP_B_UH60M_Unarmed_FFV_US", "CUP_Uh60_Unarmed_FFV_Base", "CUP_UH60_Unarmed_Base"],
		["CUP_I_BMP1_TK_GUE", "CUP_BMP1_base"],
		["CUP_B_BMP2_CZ_Des", "CUP_BMP2_base", "CUP_B_BMP2_AMB_CZ_Des"],
		["CUP_B_FV432_Mortar", "CUP_FV432_Bulldog_Base", "CUP_B_FV432_GB_GPMG", "CUP_B_FV432_Bulldog_GB_D", "CUP_B_FV432_Bulldog_GB_D_RWS", "CUP_B_FV432_GB_Ambulance"],
		["CUP_B_T72_CDF", "CUP_T72_Base"],
		["CUP_B_ZSU23_CDF", "CUP_ZSU23_Base"],
		["CUP_C_Datsun_Covered", "CUP_Datsun_Base", "CUP_I_Datsun_PK_Random", "CUP_I_Datsun_AA_Random", "CUP_I_Datsun_4seat"],
		["CUP_I_SUV_ION", "CUP_SUV_Base", "CUP_I_SUV_Armored_ION"],
		["CUP_B_Tractor_CDF", "CUP_Tractor_Base", "CUP_O_Tractor_Old_TKA"],
		["CUP_B_UAZ_Open_CDF", "CUP_UAZ_Base"],
		["CUP_B_UAZ_Unarmed_CDF", "CUP_UAZ_Unarmed_Base"],
		["CUP_B_UAZ_AA_CDF", "CUP_UAZ_Armed_Base", "CUP_B_UAZ_MG_CDF", "CUP_B_UAZ_AGS30_CDF", "CUP_B_UAZ_METIS_CDF", "CUP_B_UAZ_SPG9_CDF", "CUP_O_UAZ_Militia_SLA", "CUP_O_UAZ_AMB_RU"],
		["CUP_B_Ural_ZU23_CDF", "CUP_Ural_BaseTurret"],
		["CUP_B_Ural_Empty_CDF", "CUP_C_Ural_Open_Civ_03", "CUP_Ural_Base", "CUP_B_Ural_Open_CDF"],
		["CUP_B_Ural_Reammo_CDF", "CUP_Ural_Support_Base", "CUP_B_Ural_Refuel_CDF"],
		["CUP_B_Ural_Repair_CDF", "CUP_Ural_Repair_Base"],
		["CUP_C_Ural_Civ_03", "CUP_B_Ural_CDF"],
		["CUP_C_V3S_Open_TKC", "CUP_V3S_Open_Base"],
		["CUP_C_V3S_Covered_TKC", "CUP_I_V3S_Covered_TKG"],
		["CUP_I_V3S_Refuel_TKG", "CUP_I_V3S_Rearm_TKG", "CUP_I_V3S_Repair_TKG"],
		["CUP_B_L39_CZ", "CUP_L39_base"],
		["CUP_I_Mi24_Mk3_ION", "CUP_Mi24_Base", "CUP_I_Mi24_Mk4_ION"],
		["CUP_O_Mi24_V_Dynamic_RU", "CUP_Mi24_Dynamic_Base", "CUP_O_Mi24_D_Dynamic_SLA", "CUP_O_Mi24_P_Dynamic_RU"],
		["CUP_B_Mi24_D_MEV_Dynamic_CDF", "CUP_Mi24_D_MEV_Dynamic_Base"],
		["CUP_B_Mi35_Dynamic_CZ", "CUP_Mi35_Dynamic_Base"],
		["CUP_B_MI6A_CDF", "CUP_MI6A_Base", "CUP_B_MI6T_CDF"],
		["CUP_B_Mi17_CDF", "CUP_Mi8_base"],
		["CUP_B_Mi17_VIV_CDF", "CUP_Mi8_medevac_base", "CUP_B_Mi17_medevac_CDF"],
		["CUP_B_Mi171Sh_ACR", "CUP_Mi171Sh_Base", "CUP_B_Mi171Sh_Unarmed_ACR"],
		["CUP_B_RG31_Mk19_USA", "CUP_B_RG31E_M2_USA", "CUP_B_RG31_M2_USA"],
		["CUP_B_Mastiff_HMG_GB_D", "CUP_Mastiff_Base", "CUP_B_Mastiff_GMG_GB_D", "CUP_B_Mastiff_LMG_GB_D"],
		["CUP_B_Wolfhound_LMG_GB_W", "CUP_Ridgback_Base", "CUP_B_Wolfhound_HMG_GB_W", "CUP_B_Wolfhound_GMG_GB_W"],
		["CUP_B_Ridgback_LMG_GB_W", "CUP_Ridgback_Base", "CUP_B_Ridgback_HMG_GB_W", "CUP_B_Ridgback_GMG_GB_W"],
		["CUP_B_Dingo_GER_Des", "CUP_Dingo_Base", "CUP_B_Dingo_GL_GER_Des"],
		["CUP_B_BAF_Coyote_GMG_D", "CUP_BAF_Coyote_BASE_D", "CUP_B_BAF_Coyote_L2A1_D", "CUP_B_Jackal2_GMG_GB_W", "CUP_B_Jackal2_GMG_GB_W"],
		["CUP_B_M1128_MGS_Desert", "CUP_B_M1128_MGS_Desert"],
		["CUP_B_M1126_ICV_M2_Woodland", "CUP_M1126_ICV_BASE", "CUP_B_M1126_ICV_MK19_Desert", "CUP_B_M1133_MEV_Desert", "CUP_B_M1130_CV_M2_Desert"],
		["CUP_B_M1135_ATGMV_Desert", "CUP_B_M1135_ATGMV_Desert"],
		["CUP_O_BTR80A_TK", "CUP_BTR80A_Base", "CUP_O_BTR80_TK"],
		["CUP_B_MTLB_pk_CDF", "CUP_MTLB_Base", "CUP_B_MTLB_pk_Winter_CDF"],
		["CUP_B_BMP_HQ_CDF", "CUP_BMP2_HQ_Base"],		
		["CUP_B_LAV25_HQ_USMC", "CUP_LAV25_Base", "CUP_B_LAV25M240_USMC", "CUP_B_LAV25_USMC"],
		["CUP_B_M1A1_DES_US_Army", "UP_M1_Abrams_base", "CUP_B_M1A2_TUSK_MG_DES_US_Army"],
		["CUP_B_M2A3Bradley_USA_D", "CUP_M2Bradley_Base", "CUP_B_M2Bradley_USA_D", "CUP_B_M7Bradley_USA_D"],
		["CUP_B_MCV80_GB_D", "CUP_MCV80_Base"],
		["CUP_B_FV510_GB_D", "CUP_FV510_Base"],
		["CUP_O_BTR60_TK", "CUP_BTR60_Base"],
		["CUP_O_BMP3_RU", "CUP_BMP3_Base"],
		["CUP_B_AAV_USMC", "CUP_AAV_Base", "CUP_B_AAV_Unarmed_USMC"],
		["CUP_B_M6LineBacker_USA_W", "CUP_B_M6LineBacker_USA_W"],
		["CUP_O_T90_RU", "CUP_T90_Base"],
		["BWA3_Puma_Fleck", "BWA3_Puma_base"],
		["CUP_O_Volha_SLA", "CUP_Volha_Base", "CUP_C_Volha_Limo_TKCIV"],
		["CUP_C_Skoda_Blue_CIV", "CUP_Skoda_Base"],
		["CUP_C_Ikarus_TKC", "CUP_Ikarus_Base"],
		["CUP_B_LCU1600_USMC", "CUP_LCU1600_Base"],
		["CUP_O_BMP1P_TKA", "CUP_BMP1P_base"],
		["CUP_B_M1152_USA", "CUP_M1152_BASE"],
		["CUP_B_M1167_USA", "CUP_M1167_BASE"],
		["CUP_B_M1165_GMV_USA", "CUP_M1165_GMV_BASE"],
		["CUP_B_HMMWV_Avenger_USMC", "CUP_HMMWV_Avenger_Base"],
		["CUP_C_TT650_CIV", "CUP_TT650_Base", "CUP_O_TT650_TKA", "CUP_I_TT650_NAPA"],
		["CUP_B_M1030_USMC", "CUP_M1030_Base"],
		["CUP_O_T55_CHDKZ", "CUP_T55_Base"],
		["CUP_B_Leopard2A6_GER", "CUP_Leopard2_Base"],
		["BWA3_Leopard2_Fleck", "BWA3_Leopard_base"],
		["CUP_B_M163_USA", "CUP_M163_Base"],
		["CUP_I_T34_TK_GUE", "CUP_T34_Base"],
		["CUP_B_Challenger2_2CD_BAF", "CUP_Challenger2_base"],
		["CUP_O_LCVP_SLA", "CUP_LCVP_Base"],
		["CUP_B_Seafox_USMC", "CUP_Seafox_Base"],
		["CUP_C_Fishing_Boat_Chernarus", "CUP_Fishing_Boat_Base"],
		["CUP_B_Frigate_ANZAC", "CUP_Frigate_Base", "CUP_I_Frigate_RACS"],
		["CUP_B_SA330_Puma_HC1_BAF", "CUP_SA330_Base", "CUP_B_SA330_Puma_HC2_BAF"],
		["CUP_I_Ka60_GL_Blk_ION", "CUP_Ka60_GL_BASE"],
		["CUP_I_Ka60_Blk_ION", "CUP_Ka60_Base"],
		["CUP_B_AH1_DL_BAF", "CUP_B_AH1_DL_BAF"],
		["CUP_B_UH1Y_UNA_USMC", "CUP_B_UH1Y_Base", "CUP_B_UH1Y_MEV_USMC", "CUP_B_UH1Y_Gunship_Dynamic_USMC"],
		["CUP_B_AW159_RN_Blackcat", "CUP_AW159_Dynamic_Base"],
		["CUP_B_AW159_Unarmed_RN_Blackcat", "CUP_AW159_Unarmed_Base"],
		["CUP_B_Merlin_HC4_GB", "CUP_Merlin_HM2_Base"],
		["CUP_B_Merlin_HC3A_Armed_GB", "CUP_Merlin_HC3A_Armed_Base"],
		["CUP_B_Merlin_HC3A_GB", "CUP_Merlin_HC3A_Base"],
		["CUP_B_Merlin_HC3_VIV_GB", "CUP_Merlin_HC3_VIV_Base"],
		["CUP_B_Merlin_HC3_Armed_GB", "CUP_Merlin_HC3_Armed_Base"],
		["CUP_B_Merlin_HC3_GB", "CUP_Merlin_HC3_Base"],
		["CUP_B_P8Poseidon_RAAF", "CUP_Ambient_B737_Base"],
		["CUP_B_AC47_Spooky_USA", "CUP_AC47_Spooky_Base"],
		["CUP_C_DC3_ChernAvia_CIV", "CUP_DC3_Base"],
		["CUP_B_C47_USA", "CUP_C47_Base", "CUP_O_C47_SLA"],
		["CUP_C_AN2_CIV", "CUP_AN2_Base", "CUP_O_AN2_TK"],
		["CUP_B_A10_DYN_USA", "CUP_A10_Base", "CUP_B_A10_CAS_USA"]
	];
	comment "this is to take into account heli rotors";
	_extraOffsets =
	[
		["Heli_Light_01_base_F", [[0,0,0],[0,0.4,0]]],
		["Heli_Transport_03_base_F", [[0,0,0],[0,2.2,0]]]
	];
	_classesBBox = [];
	{ _classesBBox pushBack [_x, []] } forEach _parentClasses;
	_pos = getPosATL player;
	_pos set [1, (_pos select 1) + 15];
	_pos set [2, (_pos select 2) + 5];
	_dir = getDir player;
	_dir = _dir + 270;
	{
		_class = _x select 0;
		_kind = _x select 1;
		_vehicle = createVehicle [_class, _pos, [], 0, "None"];
		{
			_vehicle animate [configName _x, 0, true];
		} forEach configProperties [configFile >> "CfgVehicles" >> _class >> "AnimationSources", "(configName _x) select [0,4] == 'hide'"];
		{
			_vehicle animate [configName _x, 1, true];
		} forEach configProperties [configFile >> "CfgVehicles" >> _class >> "AnimationSources", "(configName _x) select [0,4] == 'show'"];
		_vehicle setDir _dir;
		_vehicle enableSimulation false;
		_minBBox = (boundingBox _vehicle) select 0;
		_maxBBox = (boundingBox _vehicle) select 1;
		_minX = floor (_minBBox select 0);
		_minY = floor (_minBBox select 1);
		_minZ = floor (_minBBox select 2);
		_maxX = ceil (_maxBBox select 0);
		_maxY = ceil (_maxBBox select 1);
		_maxZ = ceil (_maxBBox select 2);
		_minXreal = _maxX;
		_minYreal = _maxY;
		_minZreal = _maxZ;
		_maxXreal = _minX;
		_maxYreal = _minY;
		_maxZreal = _minZ;
		comment "intersect is used as a backup because lineIntersects doesn't detect some heli blades, 'GEOM' option is the most accurate for those";
		_found = { lineIntersects [ATLtoASL _pos1, ATLtoASL _pos2] || {count ([_vehicle, "GEOM"] intersect [_pos1, _pos2]) > 0} };
		for "_X" from _minX to _maxX step _precision do
		{
			for "_Y" from _minY to _maxY step _precision do
			{
				_pos1 = _vehicle modelToWorld [_X, _Y, _minZ];
				_pos2 = _vehicle modelToWorld [_X, _Y, _maxZ];
				if (call _found) then
				{
					if (_X < _minXreal) then { _minXreal = _X - _precision };
					if (_X >= _maxXreal) then { _maxXreal = _X + _precision };
					if (_Y < _minYreal) then { _minYreal = _Y - _precision };
					if (_Y >= _maxYreal) then { _maxYreal = _Y + _precision };
					drawLine3D [_pos1, _pos2, _lineColor2];
				}
				else
				{
					drawLine3D [_pos1, _pos2, _lineColor1];
				};
			};
		};
		for "_Y" from _minY to _maxY step _precision do
		{
			for "_Z" from _minZ to _maxZ step _precision do
			{
				_pos1 = _vehicle modelToWorld [_minX, _Y, _Z];
				_pos2 = _vehicle modelToWorld [_maxX, _Y, _Z];
				if (call _found) then
				{
					if (_Y < _minYreal) then { _minYreal = _Y - _precision };
					if (_Y >= _maxYreal) then { _maxYreal = _Y + _precision };
					if (_Z < _minZreal) then { _minZreal = _Z - _precision };
					if (_Z >= _maxZreal) then { _maxZreal = _Z + _precision };
					drawLine3D [_pos1, _pos2, _lineColor2];
				}
				else
				{
					drawLine3D [_pos1, _pos2, _lineColor1];
				};
			};
		};
		for "_Z" from _minZ to _maxZ step _precision do
		{
			for "_X" from _minX to _maxX step _precision do
			{
				_pos1 = _vehicle modelToWorld [_X, _minY, _Z];
				_pos2 = _vehicle modelToWorld [_X, _maxY, _Z];
				if (call _found) then
				{
					if (_X < _minXreal) then { _minXreal = _X - _precision };
					if (_X >= _maxXreal) then { _maxXreal = _X + _precision };
					if (_Z < _minZreal) then { _minZreal = _Z - _precision };
					if (_Z >= _maxZreal) then { _maxZreal = _Z + _precision };
					drawLine3D [_pos1, _pos2, _lineColor2];
				}
				else
				{
					drawLine3D [_pos1, _pos2, _lineColor1];
				};
			};
		};
		_minXreal = (round (_minXreal / _precision)) * _precision;
		_minYreal = (round (_minYreal / _precision)) * _precision;
		_minZreal = (round (_minZreal / _precision)) * _precision;
		_maxXreal = (round (_maxXreal / _precision)) * _precision;
		_maxYreal = (round (_maxYreal / _precision)) * _precision;
		_maxZreal = (round (_maxZreal / _precision)) * _precision;
		_minReal = [_minXreal, _minYreal, _minZreal];
		_maxReal = [_maxXreal, _maxYreal, _maxZreal];
		{
			if (_vehicle isKindOf (_x select 0)) exitWith
			{
				_minReal = _minReal vectorAdd (_x select 1 select 0);
				_maxReal = _maxReal vectorAdd (_x select 1 select 1);
			};
		} forEach _extraOffsets;
		{
			if (_vehicle isKindOf (_x select 0)) exitWith
			{
				(_x select 1) pushBack [_kind, [_minReal,_maxReal]];
			};
		} forEach _classesBBox;
		deleteVehicle _vehicle;
		sleep 0.1;
	} forEach _vehClasses;
	_validBBoxes = [];
	{
		if (count (_x select 1) > 0) then
		{
			_validBBoxes pushBack _x;
		};
	} forEach _classesBBox;
	copyToClipboard str _validBBoxes;
};

*/
