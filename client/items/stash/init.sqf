// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: MercyfulFate (script code), Nurdism (idea and some code), AryX
//@file Created: 04/01/2020
//@file Description: Initialisation of Stash


MF_ITEMS_STASH = "stash";

mf_stash_use = [_this, "can_deploy.sqf"] call mf_compile;
mf_stash_equip = [_this, "deploy.sqf"] call mf_compile;

[MF_ITEMS_STASH, "Stash", mf_stash_use, "Land_FoodSack_01_full_white_idap_F", "client\icons\stash.paa", 1, true] call mf_inventory_create;

[
  "stash-remove", 
  [ "Remove Stash", { player setVariable ["stashOn", 0, true]; }, nil, 1, true, false, "", "player getVariable ['stashOn', 0] == 1" ]
] call mf_player_actions_set;

