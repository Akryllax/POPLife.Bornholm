
class demandaDroga {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['demandaDroga', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['demandaDroga', nil]; cosa = nil; can = nil; menuAbierto = nil; ";

	class controls {
		class fondo1: IGUIBack
		{
			idc = -1;
			x = 0.292719 * safezoneW + safezoneX;
			y = 0.2228 * safezoneH + safezoneY;
			w = 0.414563 * safezoneW;
			h = 0.5544 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class fondo2: IGUIBack
		{
			idc = -1;
			x = 0.452551 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.122723 * safezoneW;
			h = 0.1474 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class separador: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.293751 * safezoneW + safezoneX;
			y = 0.7772 * safezoneH + safezoneY;
			w = 0.41353 * safezoneW;
			h = 0.0077 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class titulo: RscText
		{
			idc = 5017;
			text = "Demanda"; //--- ToDo: Localize;
			x = 0.474205 * safezoneW + safezoneX;
			y = 0.1942 * safezoneH + safezoneY;
			w = 0.0990001 * safezoneW;
			h = 0.0374 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class txt1: RscStructuredText
		{
			idc = 5018;
			text = "Cannabis     999"; //--- ToDo: Localize;
			x = 0.295812 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.0608439 * safezoneW;
			h = 0.0462 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt2: RscStructuredText
		{
			idc = 5019;
			text = "Marihuana     999"; //--- ToDo: Localize;
			x = 0.356517 * safezoneW + safezoneX;
			y = 0.728119 * safezoneH + safezoneY;
			w = 0.0608439 * safezoneW;
			h = 0.0462 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt3: RscStructuredText
		{
			idc = 5020;
			text = "Coca     999"; //--- ToDo: Localize;
			x = 0.459782 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.052594 * safezoneW;
			h = 0.0462 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt4: RscStructuredText
		{
			idc = 5021;
			text = "Cocaína     999"; //--- ToDo: Localize;
			x = 0.507222 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.0608439 * safezoneW;
			h = 0.0462 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt5: RscStructuredText
		{
			idc = 5022;
			text = "Opio     999"; //--- ToDo: Localize;
			x = 0.595904 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.0608439 * safezoneW;
			h = 0.0462 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt6: RscStructuredText
		{
			idc = 5023;
			text = "Heroína     999"; //--- ToDo: Localize;
			x = 0.643344 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.0608439 * safezoneW;
			h = 0.0462 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class barra1: RscProgressV
		{
			idc = 5024;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.321593 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.0103126 * safezoneW;
			h = 0.429 * safezoneH;
			colorBar[] = {0,0.8,0.3,0.7};
		};
		class barra2: RscProgressV
		{
			idc = 5025;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.379343 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.0103126 * safezoneW;
			h = 0.429 * safezoneH;
			colorBar[] = {0.8,0.3,0,0.7};
		};
		class barra3: RscProgressV
		{
			idc = 5026;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.481437 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.0103126 * safezoneW;
			h = 0.429 * safezoneH;
			colorBar[] = {0,0.8,0.3,0.7};
		};
		class barra4: RscProgressV
		{
			idc = 5027;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.532999 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.0103126 * safezoneW;
			h = 0.429 * safezoneH;
			colorBar[] = {0.8,0.3,0,0.7};
		};
		class barra5: RscProgressV
		{
			idc = 5028;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.622719 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.0103126 * safezoneW;
			h = 0.429 * safezoneH;
			colorBar[] = {0,0.8,0.3,0.7};
		};
		class barra6: RscProgressV
		{
			idc = 5029;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.0103126 * safezoneW;
			h = 0.429 * safezoneH;
			colorBar[] = {0.8,0.3,0,0.7};
		};

		class boton: RscButton
		{
			idc = 5030;
			text = "Vender"; //--- ToDo: Localize;
			x = 0.512381 * safezoneW + safezoneX;
			y = 0.8894 * safezoneH + safezoneY;
			w = 0.0587812 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class entrada: RscEdit
		{
			idc = 5031;
			text = ""; //--- ToDo: Localize;
			x = 0.519563 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0433125 * safezoneW;
			h = 0.0594 * safezoneH;
			sizeEx = 0.08;
			onChar = "if (menuAbierto == 'droga') then { _nil = ['actualiza'] execVM ""ica\mafia\demandaDroga.sqf""}; if (menuAbierto == 'mineria') then { _nil = ['actualiza'] execVM ""ica\farmeo\demandaMineria.sqf"" }; if (menuAbierto == 'suministros') then { _nil = ['actualiza'] execVM ""ica\farmeo\demandaSuministros.sqf"" }; ";
		};
		class lista: RscListbox
		{
			idc = 5032;
			x = 0.456684 * safezoneW + safezoneX;
			y = 0.7904 * safezoneH + safezoneY;
			w = 0.0525937 * safezoneW;
			h = 0.1364 * safezoneH;
			sizeEx = 0.028;
			onLBSelChanged = "if (menuAbierto == 'droga') then { _nil = ['actualiza'] execVM ""ica\mafia\demandaDroga.sqf""}; if (menuAbierto == 'mineria') then { _nil = ['actualiza'] execVM ""ica\farmeo\demandaMineria.sqf"" }; if (menuAbierto == 'suministros') then { _nil = ['actualiza'] execVM ""ica\farmeo\demandaSuministros.sqf"" }; ";
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

