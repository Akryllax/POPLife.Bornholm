
class masuno
{
	idd = -1;
	fadein=0.5;
	duration = 1.7;
	fadeout=0.5;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['masuno',_this select 0]";
	onUnload="uiNamespace setVariable ['masuno',nil]";

	class controls
	{
		class masuno: RscText
		{
			idc = 4065;
			text = "+1 food"; //--- ToDo: Localize;
			x = 0.484527 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.1542683 * safezoneW;
			h = 0.0726 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.045;
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