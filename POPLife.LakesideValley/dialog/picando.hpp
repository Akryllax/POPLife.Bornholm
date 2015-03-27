
class picando {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['picando', _this select 0]; abierto = true; ";
	onUnLoad = "uiNamespace setVariable ['picando', nil]; abierto = nil; ";

	class controls {
		
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.378312 * safezoneW + safezoneX;
			y = 0.3834 * safezoneH + safezoneY;
			w = 0.234094 * safezoneW;
			h = 0.1694 * safezoneH;
		};
		class barrita: RscProgress
		{
			idc = 4050;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.066 * safezoneH;
			colorBar[] = {0.7,0,0,1};
		};
		class boton: RscButton
		{
			idc = 4051;
			text = "¡PICA!"; //--- ToDo: Localize;
			x = 0.441198 * safezoneW + safezoneX;
			y = 0.4934 * safezoneH + safezoneY;
			w = 0.108279 * safezoneW;
			h = 0.0374 * safezoneH;
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