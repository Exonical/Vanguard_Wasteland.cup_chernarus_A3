/*
	Author: AryX
	Description: Button functions
*/

private _mode = param [0,0,[0]];
disableSerialization;

switch (_mode) do {
	case 0: { // DLC Filter
		//
	};
	
	case 1: {
		//
	};
	
	case 2: {
		0 = 0 spawn {
			disableSerialization;
			_html = findDisplay 46 createDisplay "RscCredits" ctrlCreate ["RscHTML", -1];
			_html ctrlSetBackgroundColor [0,0,0,0.8];
			_html ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
			_html ctrlCommit 0;
			// _html htmlLoad "http://www.inspires.de/vip/donate.html";
		};
	};
	
	case 3: {
		0 = 0 spawn {
			disableSerialization;
			_html = findDisplay 46 createDisplay "RscCredits" ctrlCreate ["RscHTML", -1];
			_html ctrlSetBackgroundColor [0,0,0,0.8];
			_html ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
			_html ctrlCommit 0;
			// _html htmlLoad "http://www.inspires.de/vip/changelog.html";
		};
	};
	
	case 4: {
	
	};	
};