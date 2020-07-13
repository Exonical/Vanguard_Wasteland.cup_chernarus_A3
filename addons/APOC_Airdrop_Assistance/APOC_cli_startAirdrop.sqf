//Client Function for Airdrop Assistance (not really a function, as it is called via ExecVM from command menu)
//This takes values from command menu, and some passed variables, and interacts with client and sends commands to server
//Author: Apoc
//Credits: Some methods taken from Cre4mpie's airdrop scripts, props for the idea!
#define APOC_coolDownTimer (["APOC_coolDownTimer", 300] call getPublicVar)

scriptName "APOC_cli_startAirdrop";
private _type 				= _this select 0;
private _selectionNumber 	= _this select 1;
private _player 			= _this select 2;

_selectionArray = [];
switch (_type) do {
	case "vehicle": {_selectionArray = APOC_AA_VehOptions};
	case "vehicle2": {_selectionArray = APOC_AA_Veh2Options};
	case "vehicle3": {_selectionArray = APOC_AA_Veh3Options};
	case "vehicle4": {_selectionArray = APOC_AA_Veh4Options};
	case "supply": 	{_selectionArray = APOC_AA_SupOptions};
	default 		{_selectionArray = APOC_AA_VehOptions};
};
_selectionName = (_selectionArray select _selectionNumber) select 0;
_price = (_selectionArray select _selectionNumber) select 2;

private _memberLevel = player getVariable ["memberLevel", 0];

if (_memberLevel isEqualTo 1) then {
	_price = _price * 0.9;
};

private _coolDownTimer = (_selectionArray select _selectionNumber)select 4;

/////////////  Cooldown Timer ////////////////////////
if (!isNil "APOC_AA_lastUsedTime") then {
	if (isNil {_coolDownTimer}) then {
		_coolDownTimer = APOC_coolDownTimer;
	};

	_timeRemainingReuse = _coolDownTimer - (diag_tickTime - APOC_AA_lastUsedTime); //time is still in s
	if ((_timeRemainingReuse) > 0) then  {
		hint format["Negative. Airdrop Offline. ETA: %1 Minutes", _timeRemainingReuse call fn_formatTimer];
		playSound "FD_CP_Not_Clear_F";
		player groupChat format ["Negative. Airdrop Offline. ETA: %1 Minutes",_timeRemainingReuse call fn_formatTimer];
		breakOut "APOC_cli_startAirdrop";
	};
};
////////////////////////////////////////////////////////

_playerMoney = _player getVariable ["bmoney", 0];
if (_price > _playerMoney) exitWith {
	hint format["You don't have enough money in the bank to request this airdrop!"];
	playSound "FD_CP_Not_Clear_F";
};
			
_confirmMsg = format ["This airdrop will deduct $%1 from your bank account upon delivery<br/>",_price call fn_numbersText];
_confirmMsg = _confirmMsg + format ["<br/><t font='EtelkaMonospaceProBold'>1</t> x %1",_selectionName];
		
// Display confirm message
if ([parseText _confirmMsg, "Confirm", "DROP!", true] call BIS_fnc_guiMessage) then {
	_heliDirection = random 360;
	[[_type, _selectionNumber, _player, _heliDirection],"APOC_srv_startAirdrop",false,false,false] call BIS_fnc_MP;
	APOC_AA_lastUsedTime = diag_tickTime;
	playSound3D ["a3\sounds_f\sfx\radio\ambient_radio17.wss",player,false,getPosASL player,1,1,25];
	sleep 1;
	player groupChat format ["Airdrop Inbound %2 Heading: %1 ETA: 40 seconds",ceil _heliDirection,_selectionName];
	sleep 20;
	player groupChat format ["Airdrop Inbound %2 Heading: %1 ETA: 20 seconds",ceil _heliDirection,_selectionName];
};