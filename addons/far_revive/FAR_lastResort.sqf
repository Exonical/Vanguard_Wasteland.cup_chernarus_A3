// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: FAR_lastResort.sqf
//	@file Author: AgentRev
private _donatorLevel = player getVariable ["donatorLevel", 0];

private _soundN = [];
private _soundD = [];

if !(player getVariable ["performingDuty", false]) then
{
	// biggest to smallest
	_availableBombs = (magazines player) arrayIntersect ["SatchelCharge_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "DemoCharge_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag"];
	_soundN = ["bingbong.ogg", "lastresort.ogg", "rofl.ogg", "dodo.ogg"];
	_uid = (getPlayerUID player);

	if (_donatorLevel isEqualTo 1 || player call isAdmin) then {
		_soundD = ["dimdadu.ogg"];
	};
	
	_soundS = _soundN + _soundD;
	_sound = selectRandom _soundS;
	
	if !(_availableBombs isEqualTo []) then
	{
		_magType = _availableBombs select 0;
		_mineType = ((_magType splitString "_") select 0) + "_F";

		if (!isClass (configFile >> "CfgVehicles" >> _mineType)) exitWith
		{
			titleText [format ["ERROR: invalid class '%1'", _mineType], "PLAIN", 0.5];
		};

		if (["Perform your duty?", "", true, true] call BIS_fnc_guiMessage) then
		{
			player setVariable ["performingDuty", true];

			player removeMagazine _magType;
			//playSound3D [call currMissionDir + "client\sounds\lastresort.ogg", player, false, getPosASL player, 1, 1, 500];
			playSound3D [format ["%1client\sounds\%2", call currMissionDir, _sound], player, false, getPosASL player, 1, 1, 500];

			sleep 1.5;

			_oldMines = getAllOwnedMines player;
			removeAllOwnedMines player;

			_mine = createMine [_mineType, ASLToAGL ((getPosASL player) vectorAdd [0, 0, 0.5]), [], 0];
			player addOwnedMine _mine;

			if (alive player) then
			{
				player action ["TouchOff", player];
			}
			else
			{
				_mine setDamage 1;
			};

			{ player addOwnedMine _x } forEach _oldMines;

			if (damage player < 1) then // if check required to prevent "Killed" EH from getting triggered twice
			{
				player setVariable ["A3W_deathCause_local", ["suicide"]];
				player setDamage 1;
			};

			player setVariable ["performingDuty", nil];
		};
	}
	else
	{
		titleText ["Get an explosive charge next time, my child.", "PLAIN", 0.5];
	};
};
