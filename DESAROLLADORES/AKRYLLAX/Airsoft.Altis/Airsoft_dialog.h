class Airsoft_dialog {

	idd = 3500;
	name= "AKR_airsoft_dialog";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class ControlsBackground
	{
		class FrameMain: Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 1800;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.7 * safezoneH;
		};
	};
	
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by [CT]Akryllax, v1.063, #Mytosi)
		////////////////////////////////////////////////////////

		class FrameMain: RscFrame
		{
			idc = 1800;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class FrameStats: RscFrame
		{
			idc = 1801;
			text = "Estadisticas"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.321562 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class FrameTeamselection: RscFrame
		{
			idc = 1802;
			x = 0.250629 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.49875 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class PictureAirsoftBanner: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.266 * safezoneH;
		};
		class LBTeamSelection: Life_RscListBox
		{
			idc = 1500;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class ButtonSpawn: RscButton
		{
			idc = 1600;
			text = "SPAWN"; //--- ToDo: Localize;
			x = 0.650937 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class TextStats: RscStructuredText
		{
			idc = 1100;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class TextSelectTeam: Life_RscText
		{
			idc = 1000;
			text = "Elige equipo"; //--- ToDo: Localize;
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class TextLoadout: Life_RscText
		{
			idc = 1001;
			text = "Elige loadout"; //--- ToDo: Localize;
			x = 0.460625 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class LBLoadout: Life_RscListBox
		{
			idc = 1501;
			x = 0.460625 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.282187 * safezoneW;
			h = 0.168 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};