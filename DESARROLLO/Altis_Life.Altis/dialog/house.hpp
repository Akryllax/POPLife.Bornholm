class HouseMenu
{
	idd = 12500;
	name = "HouseMenu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.25;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class RscBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.25;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.25;
		};
		
		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 12501;
			text = "House";
			x = 0.25;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
				
		class RscHouseStatus : Life_RscText
		{
			idc = 12504;
			colorBackground[] = {0, 0, 0, 0};
			text = "Getting status.  Please wait...";
			sizeEx = 0.04;
			
			x = 0.275;
			y = 0.28;
			w = 0.4375;
			h = 0.04;
		};
		
		class RscHouseValue : Life_RscText
		{
			idc = 12508;
			colorBackground[] = {0, 0, 0, 0};
			text = "Loading...";
			sizeEx = 0.04;
			
			x = 0.275;
			y = 0.32;
			w = 0.4375;
			h = 0.04;
		};	
	};
	
	class Controls
	{
		class BuyHouse : Life_RscButtonMenu
		{
			idc = 12512;
			text = "Buy";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[_house] call life_fnc_buyHouse;";
			x = 0.4;
			y = 0.4;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SellHouse : Life_RscButtonMenu
		{
			idc = 12516;
			text = "Sell";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[_house] call life_fnc_sellHouse;";
			x = 0.4;
			y = 0.4;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CreateGang : Life_RscButtonMenu
		{
			idc = 12518;
			text = "New Gang";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[_house] call life_fnc_createGang;";
			x = 0.2375;
			y = 0.4;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Close : Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.5625;
			y = 0.4;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};