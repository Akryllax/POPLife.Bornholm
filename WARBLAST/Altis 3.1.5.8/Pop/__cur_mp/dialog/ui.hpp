#define COLOR_HALF_BLACK { 0, 0, 0, 0.5 }

class playerHUD
	{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
  	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[]={};
	
	class controlsBackground 
	{
		class foodHIcon : life_RscPicture 
		{
		
			idc = 23531;
			text = "icons\food.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.575;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
		
		class waterHIcon : life_RscPicture 
		{
		
			idc = 23532;
			text = "icons\water.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.510;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};
		
		class healthHIcon : life_RscPicture
		{
			
			idc = 23533;
			text = "icons\health.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.445;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};

		class bountyHIcon : life_RscPicture
		{
			
			idc = 23521;
			text = "icons\bounty.paa";
			x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.380;
			w = 0.05; h = 0.06;
			colorBackground[] = COLOR_HALF_BLACK;
		};

		class boneIcon: life_RscPicture
		{
			idc = 23522;
			text = "icons\bone.paa";
			x = 0.959297 * safezoneW + safezoneX;
			y = 0.92568 * safezoneH + safezoneY;
			w = 0.0393683 * safezoneW;
			h = 0.0700132 * safezoneH;
		};
		
		class painIcon: life_RscPicture
		{
			idc = 23523;
			text = "icons\muted.paa";
			x = 0.919937 * safezoneW + safezoneX;
			y = 0.92568 * safezoneH + safezoneY;
			w = 0.0393683 * safezoneW;
			h = 0.0700132 * safezoneH;
		};
		
		class drunkIcon: life_RscPicture
		{
			idc = 23524;
			text = "icons\drunk.paa";
			x = 0.879255 * safezoneW + safezoneX;
			y = 0.925679 * safezoneH + safezoneY;
			w = 0.0393683 * safezoneW;
			h = 0.0700132 * safezoneH;
		};
	};
	
	class controls
	{
		class foodtext
		{
			type=0;
			idc=23500;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		
		class watertext
		{
			type=0;
			idc=23510;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		
		class healthtext
		{
			type=0;
			idc=23515;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class bountytext
		{
			type=0;
			idc=23520;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = COLOR_HALF_BLACK;
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};

		class wantedList : Life_RscStructuredText {
			idc = 23525;
			x = safeZoneX+0.01;
			y = safeZoneY+0.5;
			w = 0.3;
			h = 0.7;
			colorBackground[] = {0.5, 0.5, 0.5, 0.5};
			text = "";
		};

		#define BaseTextID 3000
		#define BottomY 0.956 * safezoneH + safezoneY
		#define SeperationValue 0.04

		class BaseText : Life_RscStructuredText
		{
			idc = -1;
			type = 13;
			style = 0;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			font = "PuristaLight";
			text = "";
			size = 0.04;
			x = 0.667246 * safezoneW + safezoneX;
			y = 0.976 * safezoneH + safezoneY;
			w = 0.201542 * safezoneW;
			h = 0.024 * safezoneH;
		};

		
		class p1 : BaseText {idc = BaseTextID; y = BottomY};
		class p2 : BaseText {idc = BaseTextID + 1; y = BottomY - (SeperationValue * 1);};
		class p3 : BaseText {idc = BaseTextID + 2; y = BottomY - (SeperationValue * 2);};
		class p4 : BaseText {idc = BaseTextID + 3; y = BottomY - (SeperationValue * 3);};
		class p5 : BaseText {idc = BaseTextID + 4; y = BottomY - (SeperationValue * 4);};
		class p6 : BaseText {idc = BaseTextID + 5; y = BottomY - (SeperationValue * 5);};
		class p7 : BaseText {idc = BaseTextID + 6; y = BottomY - (SeperationValue * 6);};
		class p8 : BaseText {idc = BaseTextID + 7; y = BottomY - (SeperationValue * 7);};
		class p9 : BaseText {idc = BaseTextID + 8; y = BottomY - (SeperationValue * 8);};
		class p10 : BaseText {idc = BaseTextID + 9; y = BottomY - (SeperationValue * 9);};
	};   
};