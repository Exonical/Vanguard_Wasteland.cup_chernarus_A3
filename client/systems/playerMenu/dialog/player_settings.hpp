// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'client\systems\playerMenu\item_list.sqf'";

	class controlsBackground {

		class MainBG : IGUIBack {
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0.6};

			moving = true;
			x = 0.0;
			y = 0.15;
			w = 0.860; //w 0.745
			h = 0.65; //h 0.65
		};

		class TopBar: IGUIBack {
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0.329, 0.451, 0.8};
			x = 0;
			y = 0.05;
			w = 0.860; //w 0.745
			h = 0.05; //h 0.05;
		};
		
		class TopBar2: IGUIBack {
			idc = -1;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 0.4};
			x = 0;
			y = 0.1;
			w = 0.860; //w 0.745
			h = 0.05; //h 0.05;
		};

		class MainTitle : w_RscText {
			idc = -1;
			// text = "Player Menu";
			text = "$STR_PMenu_Main";
			sizeEx = 0.04;
			shadow = 2;
			x = 0.37;
			y = 0.05;
			w = 0.3;
			h = 0.05;
		};
	};

	class controls {
	
		class SubTitle : RscText {
			idc = title_value;
			type = CT_STRUCTURED_TEXT;
			size = 0.035;
			text = "Forums: SOON Discord: discord.gg/ARMY TeamSpeak: SOON";
			x = 0.16;
			y = 0.108;
			w = 30;
			h = 0.05;
			// colorBackground[] = {0,0,0,0.4};
			colorText[] = {1,1,1,1};
			colorLink[] = {0,0.34,0.59,1};
			colorLinkActive[] = {0,0.34,0.59,0.1};
		};
		
		// Left Menu
		class nAInfoButton : w_RscButton2 {
			idc = -1;
			text = "Infos";
			colorBackground[] = {0,0,0,0.7};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[] execVM 'addons\TOParmaInfo\loadTOParmaInfo.sqf'";
			x = 0.02; y = 0.25;
			w = 0.175; h = 0.033 * safezoneH;
		};
		
		class CompassButton : w_RscButton2 {
			idc = -1;
			// text = "Compass";
			text = "$STR_PMenu_Compass";
			colorBackground[] = {0,0,0,0.7};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "(findDisplay 49) closeDisplay 1; [] call fnc_showSettings;";
			x = 0.02; y = 0.32;
			w = 0.175; h = 0.033 * safezoneH;
		};
		
		class btnDistanceCustom : w_RscButton2 {
			idc = -1;
			// text = "Messages";
			text = "$STR_PMenu_Messages";
			colorBackground[] = {0,0,0,0.7};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[] execVM 'addons\JTS_PM\JTS_PM.sqf'";
			x = 0.02; y = 0.39;
			w = 0.175; h = 0.033 * safezoneH;
		};
		
		class btnDistanceFar : w_RscButton2 {
			idc = -1;
			// text = "View Distance";
			text = "$STR_PMenu_ViewDist";
			colorBackground[] = {0,0,0,0.7};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[] call CHVD_fnc_openDialog;";
			x = 0.02; y = 0.55;
			w = 0.3; h = 0.033 * safezoneH;
		};
		
		class btnEffectsFar : w_RscButton2 {
			idc = -1;
			// text = "Environmental Effects";
			text = "$STR_PMenu_Effects";
			colorBackground[] = {0,0,0,0.7};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[] execVM 'addons\disableEnvironment\disableEnvironment.sqf'";
			x = 0.02; y = 0.63;
			w = 0.3; h = 0.033 * safezoneH;
		};
		
		class GroupsButton : w_RscButton2 {
			idc = groupButton;
			// text = "Group Management";
			text = "$STR_PMenu_Groups";
			colorBackground[] = {0,0,0,0.7};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[] execVM 'client\systems\groups\loadGroupManagement.sqf'";
			x = 0.02; y = 0.71;
			w = 0.3; h = 0.033 * safezoneH;
		};
		
		// Middle Menu
		class AirDropButton : w_RscButton2 {
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			colorFocused[] = {0, 0.329, 0.451, 0.8}; // pulse
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			text = "$STR_PMenu_Airdrop";
            onButtonClick = "[] execVM 'addons\APOC_Airdrop_Assistance\APOC_cli_menu.sqf';[] execVM 'client\systems\playerMenu\closePlayerMenu.sqf';";
			x = 0.35; y = 0.18;
			w = 0.225; h = 0.033 * safezoneH;
		};
		
		class PainterButton : w_RscButton2 {
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			colorFocused[] = {0, 0.329, 0.451, 0.8}; // pulse
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			text = "$STR_PMenu_Puniform";
			tooltip = "$STR_PMenu_Donators";
			action = "closeDialog 0;[] execVM 'addons\Painter\UniformPainter_Player.sqf'";
			x = 0.35; y = 0.25;
			w = 0.225; h = 0.033 * safezoneH;
		};
		
		class VehPaintButton : w_RscButton2 {
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			colorFocused[] = {0, 0.329, 0.451, 0.8}; // pulse
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			text = "$STR_PMenu_Pvehicle";
			tooltip = "$STR_PMenu_Donators";
			action = "closeDialog 0;[] execVM 'addons\VehiclePainter\VehiclePainter_Check.sqf'";
			x = 0.35; y = 0.32;
			w = 0.225; h = 0.033 * safezoneH;
		};
		
		class btnKillfeed : w_RscButton2 {
			idc = -1;
			text = "$STR_PMenu_Killfeed";
			colorBackground[] = {0,0,0,0.7};
			colorFocused[] = {0, 0.329, 0.451, 0.8}; // pulse
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "with missionNamespace do { [] call A3W_fnc_killFeedMenu }";
			x = 0.35; y = 0.39;
			w = 0.225; h = 0.033 * safezoneH;
		};
			
		class btnMarkObjects : w_RscButton2 {
			idc = -1;
			// text = "Mark obj.";
			text = "$STR_PMenu_MarkObj";
			colorBackground[] = {0,0,0,0.7};
			colorFocused[] = {0, 0.329, 0.451, 0.8}; // pulse
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[] execVM 'addons\scripts\markOwned.sqf'";
			x = 0.35; y = 0.46;
			w = 0.225; h = 0.033 * safezoneH;
		};
		
		// Inventory Menu on Right
		class itemList : w_Rsclist {
			idc = item_list;
			x = 0.6; y = 0.182;
			w = 0.247; h = 0.325;
		};
		
		class DropButton : w_RscButton2 {
			idc = -1;
			text = "Drop";
			colorBackground[] = {1, 1, 1, 0.1};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[1] execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.725; y = 0.525;
			w = 0.116; h = 0.033 * safezoneH;
		};

		class UseButton : w_RscButton2 {
			idc = -1;
			text = "Use";
			colorBackground[] = {1, 1, 1, 0.1};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[0] execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.6; y = 0.525;
			w = 0.116; h = 0.033 * safezoneH;
		};
		
		class DropcButton : w_RscButton2 {
			idc = -1;
			text = "Drop";
			colorBackground[] = {1, 1, 1, 0.1};
			colorBackgroundActive[] = {0, 0.729, 1, 1};
			onButtonClick = "[] execVM 'client\systems\playerMenu\dropMoney.sqf'";
			x = 0.6; y = 0.60;
			w = 0.116; h = 0.033 * safezoneH;
		};

		class moneyInput: w_RscCombo {
			idc = money_value;
			x = 0.735; y = 0.618;
			w = 0.105; h = 0.04;
		};
		
		// Close
		class CloseButton : w_RscButton {
			idc = close_button;
			// text = "Close";
			text = "$STR_PMenu_Close";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] execVM 'client\systems\playerMenu\closePlayerMenu.sqf'";
			x = 0.6; y = 0.71;
			w = 0.24; h = 0.033 * safezoneH;
		};
		
		class CloseButton2 : w_RscButton2 {
			idc = -1;
			// text = "Mark obj.";
			text = "X";
			sizeEx = 0.06;
			colorBackground[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0.694, 0.098, 0.098, 0.9};
			onButtonClick = "[] execVM 'client\systems\playerMenu\closePlayerMenu.sqf'";
			x = 0.865; y = 0.05;
			w = 0.06; h = 0.08;
		};
	};
};
