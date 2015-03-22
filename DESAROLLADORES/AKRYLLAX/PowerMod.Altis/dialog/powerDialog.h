class power_menu {
	idd = 6350;
	movingEnable=0;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name="power_menu";
	onLoad="uiNamespace setVariable ['power_menu',_this select 0];";
	objects[]={};
	
	class controlsBackground {
		class bkgBoxMain: RscText
		{
			idc = -1;
			x = -28.5 * GUI_GRID_W + GUI_GRID_X;
			y = -9 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.45};
		};
		class bkgTimer: RscText
		{
			idc = -1;
			x = -17 * GUI_GRID_W + GUI_GRID_X;
			y = -9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.4 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
	};
	
	class controls {
		
		class imgPrimary: RscPicture
		{
			idc = 1201;
			text = "img\bla.jpg";
			x = -27.5 * GUI_GRID_W + GUI_GRID_X;
			y = -9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorBackground[] = {1,0,0,1};
		};
		class imgSecondary: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = -23 * GUI_GRID_W + GUI_GRID_X;
			y = -9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorBackground[] = {1,0,0,1};
		};
		class loadBar: RscText
		{
			idc = 1002;
			x = -17 * GUI_GRID_W + GUI_GRID_X;
			y = -9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.4 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorBackground[] = {1,1,1,1};
		};
		class imgSmall: RscPicture
		{
			idc = 1200;
			text = "img\icon_sniper.paa";
			x = -18.5 * GUI_GRID_W + GUI_GRID_X;
			y = -8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};
};
