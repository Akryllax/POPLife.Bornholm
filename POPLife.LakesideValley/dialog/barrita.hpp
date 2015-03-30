
class barrita
{
	name = "barrita";
	idd = -1;
	fadein=0;
	duration = 99999999999;
	fadeout=2;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['barrita', _this select 0]";
	onUnLoad="uiNamespace setVariable ['barrita', nil]";
	objects[]={};

	class controlsBackground 
	{
		class background : RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.406133 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.217648 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class ProgressBar : RscProgress
		{
			idc = 5010;
			x = 0.406133 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.217648 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBar[] = {0.72,0.54,0,1};
		};
		class progreso_text: RscText
		{
			idc = 5011;
			text = ""; //--- ToDo: Localize;
			x = 0.406133 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.217648 * safezoneW;
			h = 0.0286 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.030;
		};
		class icaruk: RscText
		{
			idc = -1;
			text = "Icaruk"; //--- ToDo: Localize;
			x = 0.964445 * safezoneW + safezoneX;
			y = -0.0166667 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};