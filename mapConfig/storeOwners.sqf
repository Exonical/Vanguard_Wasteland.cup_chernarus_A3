// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position, Desk Direction (or [Desk Direction, Front Offset]), Excluded Buttons
storeOwnerConfig = compileFinal str
[
	["GenStore1", -1, [], []],
	["GenStore2", -1, [], []],
	["GenStore3", -1, [], []],
	["GenStore4", -1, [], []],
	["GenStore5", -1, [], []],
	["GenStore6", -1, [], []],
	["GenStore7", -1, [], []],
	["GenStore8", -1, [], []],

	["GunStore1", -1, [], []],
	["GunStore2", -1, [], []],
	["GunStore3", -1, [], []],
	["GunStore4", -1, [], []],
	["GunStore5", -1, [], []],
	["GunStore6", -1, [], []],
	["GunStore7", -1, [], []],

	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	["VehStore1", -1, [], ["Boats"]],
	["VehStore2", -1, [], ["Boats"]],
	["VehStore3", -1, [], ["Boats"]],
	["VehStore4", -1, [], ["Planes"]],
	["VehStore5", -1, [], ["Planes"]],
	["VehStore6", -1, [], ["Planes"]],
	["VehStore7", -1, [], ["Planes"]],
	["VehStore8", -1, [], ["Planes", "Boats"]],
	["VehStore9", -1, [], ["Planes", "Boats"]]
	// ["VehStore7", -1, [], ["Planes","Boats","Helicopters"]]
];
// Auf neue Skins warten
// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[
	["GenStore1", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore2", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore3", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore4", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore5", [["weapon", ""], ["uniform", "U_I_E_CBRN_Suit_01_EAF_F"]]],
	["GenStore6", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore7", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore8", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],

	["GunStore1", [["weapon", ""], ["uniform", "U_I_E_CBRN_Suit_01_EAF_F"]]],
	["GunStore2", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore3", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore4", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_officer_F"]]],
	["GunStore5", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore6", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore7", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_officer_F"]]],

	["VehStore1", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore2", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore3", [["weapon", ""], ["uniform", "U_C_CBRN_Suit_01_Blue_F"]]],
	["VehStore4", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore5", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore6", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore7", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore8", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore9", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]]
];
