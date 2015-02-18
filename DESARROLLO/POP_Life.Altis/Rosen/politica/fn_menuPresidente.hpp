class life_presidente_menu 
{
	idd = 1900;
	name= "life_presidente_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Presi_RscTitleBackground : life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.45 - (22 / 250);
		};
		
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "Ventas:";
			
			x = 0.32; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class GasTaxLabel : life_RscText
		{
			idc = -1;
			text = "Fuel:";
			
			x = 0.32; y = 0.305;
			w = 0.275; h = 0.04;
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "Territorio:";
			
			x = 0.32; y = 0.355;
			w = 0.275; h = 0.04;
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "Banda:";
			
			x = 0.32; y = 0.405;
			w = 0.275; h = 0.04;
		};

	};
	
	class controls 
	{
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Impuestos";
			x = 0.3;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 1901;
			text = "";
			onSliderPosChanged = "[3,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Impuestos en porcentaje";
			x = 0.42;
			y = 0.30 - (1 / 25);
			
			w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 1902;
			text = "";
			
			x = 0.70; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class fuel_slider : life_RscXSliderH 
		{
			idc = 1904;
			text = "";
			onSliderPosChanged = "[6,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Impuesto del combustible en porcentaje";
			x = 0.42;
			y = 0.35 - (1 / 25);
			
			w = "9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class gas_value : life_RscText
		{
			idc = 1905;
			text = "";
			
			x = 0.70; y = 0.31;
			w = 0.275; h = 0.04;
		};
		
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 1911;
			text = "";
			onSliderPosChanged = "[4,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Daily tax for home ownership";
			x = 0.42;
			y = 0.40 - (1 / 25);
			
			w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_car_value : life_RscText
		{
			idc = 1912;
			text = "";
			
			x = 0.70; y = 0.36;
			w = 0.275; h = 0.04;
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 1921;
			text = "";
			onSliderPosChanged = "[5,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Impuestos de banda";
			x = 0.42;
			y = 0.45 - (1 / 25);
			
			w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_air_value : life_RscText
		{
			idc = 1922;
			text = "";
			
			x = 0.70; y = 0.41;
			w = 0.275; h = 0.04;
		};
		
		class SideChannelSettings : life_RscText
		{
			idc = -1;
			text = "Cambiar leyes";
			shadow = 0;
			colorBackground[] = {0.4, 0, 0, 0.7};

			x = 0.30;
			y = 0.5;
			w = 0.5;
			h = (1 / 25);
		};
		
		class SideChatONOFF : Life_RscActiveText
		{
			idc = 1926;
			text = "Marihuana...";
			color[] = {1, 0, 0, 1};
			action = "[] call life_fnc_toggleLaw";
			sizeEx = 0.04;
			
			x = 0.45; y = 0.55;
			w = 0.275; h = 0.04;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "Cerrar";
			onButtonClick = "closeDialog 0;";
			x = 0.48;
			y = 0.65 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};