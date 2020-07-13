/*
	@file Version: 0.2
	@file Name: statusBar.sqf
	@file  EpochMod StatusBar Port for Wasteland by CRE4MPIE modified by AryX
*/
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

ZGO_StatusEnabled = true;

[] spawn {
	uiSleep 5;
	_uid = getPlayerUID player;

for "_i" from 0 to 1 step 0 do {
		uiSleep 5;
		if !(ZGO_StatusEnabled) then {
			_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutText ["","PLAIN",1,false];
		} else {
			_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscWastelandStatusBar","PLAIN",1,false];

			if(isNull ((uiNamespace getVariable "RscWastelandStatusBar")displayCtrl 55554)) then {
				disableSerialization;
				_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
				_rscLayer cutRsc ["RscWastelandStatusBar","PLAIN",1,false];
			};
			//initialize variables and set values
			_unit = _this select 0;
			_damage = round ((1 - (damage player)) * 100);
			_wallet = player getVariable ["cmoney",0] call fn_numbersText;
			_respect = player getVariable ["bmoney",0] call fn_numbersText;
			_serverFPS = round diag_fps;
			_pos = getPosATL player;
			_dir = round (getDir (vehicle player));
			_grid = mapGridPosition  player; _xx = (format[_grid]) select  [0,3];
			_yy = (format[_grid]) select  [3,3];
			_time = (round(240-(serverTime)/60));
			_hours = (floor(_time/60));
			_minutes = (_time - (_hours * 60));

			switch(_minutes) do {
				case 9: {_minutes = "09"};
				case 8: {_minutes = "08"};
				case 7: {_minutes = "07"};
				case 6: {_minutes = "06"};
				case 5: {_minutes = "05"};
				case 4: {_minutes = "04"};
				case 3: {_minutes = "03"};
				case 2: {_minutes = "02"};
				case 1: {_minutes = "01"};
				case 0: {_minutes = "00"};
			};

			//Color Gradient
			_colourDefault 	= parseText "#FBFCFE"; //Wasteland White - Defualt Color
			_colour90 		= parseText "#F5E6EC"; //
			_colour80 		= parseText "#F0D1DB"; //
			_colour70 		= parseText "#EBBBC9"; //
			_colour60 		= parseText "#E6A6B8"; //
			_colour50 		= parseText "#E191A7"; //
			_colour40 		= parseText "#DB7B95"; //
			_colour30 		= parseText "#D66684"; //
			_colour20 		= parseText "#D15072"; //
			_colour10 		= parseText "#CC3B61"; //
			_colour0 		= parseText "#C72650"; //Wasteland Red
			_colourDead 	= parseText "#000000";

			//Colour coding
			//Damage
			_colourDamage = _colourDefault;
			if(_damage >= 100) then{_colourDamage = _colourDefault;};
			if((_damage >= 90) && (_damage < 100)) then {_colourDamage = _colour90;};
			if((_damage >= 80) && (_damage < 90)) then {_colourDamage = _colour80;};
			if((_damage >= 70) && (_damage < 80)) then {_colourDamage = _colour70;};
			if((_damage >= 60) && (_damage < 70)) then {_colourDamage = _colour60;};
			if((_damage >= 50) && (_damage < 60)) then {_colourDamage = _colour50;};
			if((_damage >= 40) && (_damage < 50)) then {_colourDamage = _colour40;};
			if((_damage >= 30) && (_damage < 40)) then {_colourDamage = _colour30;};
			if((_damage >= 20) && (_damage < 30)) then {_colourDamage = _colour20;};
			if((_damage >= 10) && (_damage < 20)) then {_colourDamage = _colour10;};
			if((_damage >= 1) && (_damage < 10)) then {_colourDamage = _colour0;};
			if(_damage < 1) then{_colourDamage = _colourDead;};

			//display the information
			((uiNamespace getVariable "RscWastelandStatusBar")displayCtrl 55554) ctrlSetStructuredText
			parseText
			format
			["
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.6'  shadowColor='#000000' image='addons\statusbar\icons\players.paa' color='%7'/> %2</t>
				<t shadow='1' shadowColor='#000000' color='%12'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\health.paa' color='%7'/> %3%1</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\money.paa' color='%7'/> %4</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\atm.paa' color='%7'/> %6</t>
				<t shadow='1' shadowColor='#000000' color='%7'>FPS: %5</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\compass.paa' color='%7'/> %9</t>
				<t shadow='1' shadowColor='#000000' color='%7'><img size='1.6'  shadowColor='#000000' image='addons\statusbar\icons\restart.paa' color='%7'/>%10:%11</t>", 
				"%",count playableUnits, _damage, _wallet, _serverFPS, _respect, _colourDefault, format["%1/%2",_xx,_yy], _dir, _hours, _minutes, _colourDamage
			];
		};
	};
};
