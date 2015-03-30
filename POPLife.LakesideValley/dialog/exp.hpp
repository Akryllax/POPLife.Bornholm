class exp_dialog {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['exp_dialog', _this select 0]; abierto = true ";
	onUnLoad = "uiNamespace setVariable ['exp_dialog', nil]; abierto = nil";

	class controls {
		class IGUIBack_2200: IGUIBack
		{
			idc = -1;
			x = 0.329878 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.39286 * safezoneW;
			h = 0.5258 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class que: RscStructuredText
		{
			idc = 4060;
			text = "Agricultura (0/1000)"; //--- ToDo: Localize;
			x = 0.477313 * safezoneW + safezoneX;
			y = 0.2448 * safezoneH + safezoneY;
			w = 0.192821 * safezoneW;
			h = 0.0462 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class como: RscStructuredText
		{
			idc = 4061;
			text = "El maestro agricultor sabe cultivar alimentos, pero también droga sin causar olor."; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.192821 * safezoneW;
			h = 0.121 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class RscListbox_1501: RscListbox
		{
			idc = 4062;
			x = 0.476283 * safezoneW + safezoneX;
			y = 0.4714 * safezoneH + safezoneY;
			w = 0.24335 * safezoneW;
			h = 0.2376 * safezoneH;
			sizeEx = 0.034;
		};
		class desbloqueos: RscText
		{
			idc = -1;
			text = "Desbloqueos:"; //--- ToDo: Localize;
			x = 0.477313 * safezoneW + safezoneX;
			y = 0.4252 * safezoneH + safezoneY;
			w = 0.240269 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class lista: RscListbox
		{
			idc = 4063;
			x = 0.332937 * safezoneW + safezoneX;
			y = 0.2404 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.5148 * safezoneH;
			sizeEx = 0.034;
			onLBSelChanged = "_nil = ['rellena'] execVM ""ica\exp\exp.sqf""";
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


class universidad {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['universidad', _this select 0]; abierto = true ";
	onUnLoad = "uiNamespace setVariable ['universidad', nil]; abierto = nil";

	class controls {
		class IGUIBack_2200: IGUIBack
		{
			idc = -1;
			x = 0.329878 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.39286 * safezoneW;
			h = 0.5258 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class cabecera: RscStructuredText
		{
			idc = 5000;
			text = "1/1100 (Exp para subir: 1099)"; //--- ToDo: Localize;
			x = 0.477313 * safezoneW + safezoneX;
			y = 0.2448 * safezoneH + safezoneY;
			w = 0.240247 * safezoneW;
			h = 0.0462 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class ListaDsbl: RscListbox
		{
			idc = 5001;
			x = 0.476283 * safezoneW + safezoneX;
			y = 0.4714 * safezoneH + safezoneY;
			w = 0.24335 * safezoneW;
			h = 0.2376 * safezoneH;
			sizeEx = 0.034;
		};
		class desbloqueos: RscText
		{
			idc = -1;
			text = "Desbloqueos:"; //--- ToDo: Localize;
			x = 0.477313 * safezoneW + safezoneX;
			y = 0.4252 * safezoneH + safezoneY;
			w = 0.240269 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class lista: RscListbox
		{
			idc = 5002;
			x = 0.332937 * safezoneW + safezoneX;
			y = 0.2404 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.5148 * safezoneH;
			sizeEx = 0.034;
			onLBSelChanged = "_nil = ['rellena'] execVM ""ica\exp\universidad.sqf""";
		};
		class calculo: RscText
		{
			idc = 5005;
			text = "x 10 exp = 10 exp"; //--- ToDo: Localize;
			x = 0.502508 * safezoneW + safezoneX;
			y = 0.308444 * safezoneH + safezoneY;
			w = 0.215503 * safezoneW;
			h = 0.0462 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class entrada: RscEdit
		{
			idc = 5003;
			text = "1"; //--- ToDo: Localize;
			x = 0.478344 * safezoneW + safezoneX;
			y = 0.3174 * safezoneH + safezoneY;
			w = 0.0237186 * safezoneW;
			h = 0.0286 * safezoneH;
			onChar = "_nil = ['rellena'] execVM ""ica\exp\universidad.sqf""";
			sizeEx = 0.028;
		};
		class Precio: RscText
		{
			idc = 5004;
			text = "Cargando..."; //--- ToDo: Localize;
			x = 0.477312 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.241278 * safezoneW;
			h = 0.0462 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class RscPicture_1200: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.477313 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.242315 * safezoneW;
			h = 0.0033 * safezoneH;
		};
		class RscPicture_1201: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.477313 * safezoneW + safezoneX;
			y = 0.4252 * safezoneH + safezoneY;
			w = 0.242315 * safezoneW;
			h = 0.0033 * safezoneH;
		};	
		class boton: RscButton
		{
			idc = 5006;
			text = "Aprender"; //--- ToDo: Localize;
			x = 0.476282 * safezoneW + safezoneX;
			y = 0.7134 * safezoneH + safezoneY;
			w = 0.243362 * safezoneW;
			h = 0.044 * safezoneH;
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




