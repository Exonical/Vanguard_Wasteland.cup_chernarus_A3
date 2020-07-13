class AryX_Dialog {
	idd = 77310;
	name = "AryX_Dialog";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		// class aryxImage : aryx_RscPicture {
			// idc = -1;
			// // text = "addons\aryx\gui\image.paa";
			// x = -0.444999;
			// y = -0.05;
			// w = 1.80;
			// h = 1.20;
		// };
	};

	class controls {
		class Points : aryx_RscText {
			idc = 77312;
			text = "";
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.055;
			x = -0.033;
			y = -0.135;
			w = 0.6;
			h = 0.6;
		};
		class Zeit : aryx_RscText {
			idc = 77313;
			text = "";
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.055;
			x = -0.066;
			y = -0.075;
			w = 0.6;
			h = 0.6;
		};
		class Punkte : aryx_RscText {
			idc = 77314;
			text = "";
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.045;
			x = -0.066;
			y = 0.00;
			w = 0.6;
			h = 0.6;
		};
		class Level : aryx_RscText {
			idc = 77315;
			text = "";
			font = "EtelkaNarrowMediumPro";
			x = -0.066;
			y = 0.04;
			w = 0.6;
			h = 0.6;
		};
		
		class Custom3 : aryx_RscText {
			idc = 77316;
			text = "";
			font = "EtelkaNarrowMediumPro";
			x = -0.066;
			y = 0.08;
			w = 0.6;
			h = 0.6;
		};
		
		class VersionVip : aryx_RscText {
			idc = 77317;
			text = "";
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.045;
			x = 0.82;
			y = -0.140;
			w = 0.6;
			h = 0.6;
		};
		
		class DLCFilterVip : aryx_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_VIP_dlcFilter";
			text = "$STR_VIP_dlcFilter";
			onButtonClick = "[0] call aryx_fnc_guiButton;";
			x = 0.41;
			y = 0.40;
			w = 0.25;
			h = 0.05;
		};
		
		class Changelog : aryx_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_VIP_Changelog";
			text = "$STR_VIP_Changelog";
			onButtonClick = "[3] call aryx_fnc_guiButton;";
			x = 0.71;
			y = 0.22;
			w = 0.25;
			h = 0.05;
		};
		
		class Bugtracker : aryx_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_VIP_Bugtracker";
			text = "$STR_VIP_Bugtracker";
			onButtonClick = "createDialog ""aryx_bugtracker_diag"";";
			x = 0.71;
			y = 0.28; 
			w = 0.25;
			h = 0.05;
		};
		
		class Vip : aryx_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_VIP_Store";
			text = "$STR_VIP_Store";
			onButtonClick = "[2] call aryx_fnc_guiButton;";
			x = 0.71;
			y = 0.34;
			w = 0.25;
			h = 0.05;
		};
		
		class Earplugs : aryx_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_VIP_Earplugs";
			text = "$STR_VIP_Earplugs";
			onButtonClick = "[1] call aryx_fnc_guiButton;";
			x = 0.71;
			y = 0.40;
			w = 0.25;
			h = 0.05;
		};
		
		class CloseBTN: aryx_RscButtonInvisible {
			idc = -1;
			tooltip = "$STR_VIP_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.92;
			y = 0.115;
			w = (2.1 / 40);
			h = (2.6 / 40);
		};
	};
};

class aryx_bugtracker_diag {
	idd = 73025;
	name = "aryx_bugtracker";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
        class HintergrundBT: aryx_RscText {
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground: aryx_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.6 - (22 / 250);
        };
	};
	
	class controls {
		class Title: aryx_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_VIP_Bugtracker";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
		};

		class CloseLoadMenu : aryx_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_VIP_Close";
			text = "$STR_VIP_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.493;
			y = 0.668;
			w = (7.1 / 40);
			h = (1.6 / 25);
		};
		
		class vBugField : aryx_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_VIP_sendBug";
			text = "$STR_VIP_sendBug";
			colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call aryx_fnc_bugtracker";
			x = 0.109;
			y = 0.668;
			w = (11.3 / 40);
			h = (1.6 / 25);
		};
		
		class vBugTextS : aryx_RscEdit {
			idc = 73027;
			text = "$STR_VIP_BugTText";
			sizeEx = 0.030;
			x = 0.12;
            y = 0.26;
            w = 0.56;
			h = 0.370;
		};
	};
};