// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: deploy.sqf
//@file Author: MercyfulFate (script code), Nurdism (idea and some code), AryX
//@file Created: 05/01/2020
//@file Description: Deploy a Stash

#define DURATION 12
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"

#define ERR_CANCELLED "Creating stash has been cancelled!"
#define ERR_IN_VEHICLE "You can't do this while being inside a vehicle."
#define ERR_NO_STASH "You don't have a stash!"
#define ERR_EQUIPED "You already have a stash equiped!"
#define ITEM_COUNT(ITEMID) ITEMID call mf_inventory_count

_checks = {
	private ["_progress", "_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {};
		case (player getVariable ['stashOn', 0] == 1): {_text = ERR_EQUIPED; };
		case (ITEM_COUNT(MF_ITEMS_STASH) <= 0): { _text = ERR_NO_STASH; };
		case (vehicle player != player):{_text = ERR_IN_VEHICLE};
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		default {
			_text = format["Creating Stash %1%2 Complete", round(100 * _progress), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, []] call a3w_actions_start;

if (_success) then {
	player spawn mf_stash_equip;
};

_success;