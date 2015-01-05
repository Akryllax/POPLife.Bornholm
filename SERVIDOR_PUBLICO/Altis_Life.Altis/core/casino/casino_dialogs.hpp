/*
	Author: Alexander Montero
	Desc: GUI for the SlotMachine
	Date: 16/10/2014
*/

class Casino_dialog
{
	idd=9985;
	movingenable=false;
	onLoad = "with uiNameSpace do { Casino_dialog = _this select 0 }";
	class controls 
	{
	
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by DevUser, v1.063, #Vetoso)
		////////////////////////////////////////////////////////

		class CasinoFrameMainBkg: CasinoBOX
		{
			idc = 0059;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.14 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.8 * safezoneH;
		};
		class CasinoFrameMain: RscCasinoFrame
		{
			idc = 1800;
			text = "Gran Casino de Altis"; //--- ToDo: Localize;
			colorText[] = {1,1,1,1};
			x = 0.210321 * safezoneW + safezoneX;
			y = 0.15448 * safezoneH + safezoneY;
			w = 0.583442 * safezoneW;
			h = 0.7 * safezoneH;
			SizeEx = 0.07;
			
		};
		class CasinoFrameLeftMain: RscCasinoFrame
		{
			idc = 1801;
			x = 0.222865 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.277135 * safezoneW;
			h = 0.532 * safezoneH;
		};
		class CasinoFrameRightMain: RscCasinoFrame
		{
			idc = 1802;
			x = 0.507293 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.277135 * safezoneW;
			h = 0.532 * safezoneH;
		};
		class CasinoFrameRightSubframe: RscCasinoFrame
		{
			idc = 1803;
			text = "Estado"; //--- ToDo: Localize;
			x = 0.514586 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.262549 * safezoneW;
			h = 0.275 * safezoneH;
			sizeEx = 1 * safezoneH;
		};
		class CasinoPictureLogo: RscCasinoPicture
		{
			idc = 1200;
			text = "icons\ruleta.jpg";
			x = 0.514586 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.262549 * safezoneW;
			h = 0.224 * safezoneH;
		};
		class CasinoTextWelcomeMessage: RscCasinoText
		{
			idc = 1000;
			text = "Bienvenido al casino de Altis."; //--- ToDo: Localize;
			x = 0.215572 * safezoneW + safezoneX;
			y = 0.23 * safezoneH + safezoneY;
			w = 0.568856 * safezoneW;
			h = 0.042 * safezoneH;
			sizeEx = 0.05;
		};
		class CasinoTextHistoryLabel: RscCasinoText
		{
			idc = 1001;
			text = "Intentos previos"; //--- ToDo: Localize;
			x = 0.230158 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.262549 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class CasinoTextWalletLabel: RscCasinoText
		{
			idc = 1002;
			text = "Monedero: "; //--- ToDo: Localize;
			x = 0.521879 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.0729302 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class CasinoTextMachineStatusLabel: RscCasinoText
		{
			idc = 1003;
			text = "Estado: "; //--- ToDo: Localize;
			x = 0.521879 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.0729302 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class CasinoTextStatusIndicator: RscCasinoText
		{
			idc = 9952;
			text = "Esperando..."; //--- ToDo: Localize;
			x = 0.616688 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.153153 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class CasinoTextWalletIndicator: RscCasinoText
		{
			idc = 1155;
			text = "0"; //--- ToDo: Localize;
			x = 0.616688 * safezoneW + safezoneX;
			y = 0.626 * safezoneH + safezoneY;
			w = 0.153153 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class CasinoTextAbout: RscCasinoText
		{
			idc = 1506;
			text = "By Akryllax. Version 0.1a para Plata o Plomo"; //--- ToDo: Localize;
			colorText[] = {0.4,0.4,0.4,1};
			x = 0.2 * safezoneW + safezoneX + 0.39 * safezoneW;
			y = 0.14 * safezoneH + safezoneY + 0.75 * safezoneH;
			w = 0.153153 * safezoneW;
			h = 0.028 * safezoneH;
			
		};
		class CasinoListboxMoneySelect: RscCasinoListbox
		{
			idc = 9451;
			rows = 20;
			itemSpacing = 0; // Height of empty space between items
			soundSelect[] = {"\A3\ui_f\data\sound\RscCasinoListbox\soundSelect",0.09,1};
			sizeEx = 0.035;
			x = 0.230158 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.262549 * safezoneW;
			h = 0.30 * safezoneH;
			rowHeight = 0.05	* safezoneW;
		};
		class CasinoButtonPlay: RscCasinoButton
		{
			idc = 1669;
			text = "JUGAR"; //--- ToDo: Localize;
			x = 0.237451 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.247963 * safezoneW;
			h = 0.056 * safezoneH;
			soundSelect[] = {"sound\slot_working.wav",0.09,1};
			action = "[] execVM ""core\casino\casinoPlay.sqf""";
		};
		class CasinoButtonExit: RscCasinoButton
		{
			idc = 1601;
			text = "Salir"; //--- ToDo: Localize;
			x = 0.521879 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.247963 * safezoneW;
			h = 0.056 * safezoneH;
			action = "closeDialog 0;";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

		class CasinoTextSelectQuatity: RscCasinoText
		{
			idc = 1019;
			text = "¿Cuanto desea apostar?"; //--- ToDo: Localize;
			sizeEx = 0.032;
			x = 0.237451 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.030 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};	
		class CasinoEditMoneyBkg : CasinoBOX
		{
			idc = 1021;
			x = 0.237451 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.030 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};	
		class CasinoEditMoneyInput : RscCasinoEdit
		{
			idc = 1390;
			text = "0"; //--- ToDo: Localize;
			sizeEx = 0.048;
			x = 0.237451 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.030 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
		
	};
};