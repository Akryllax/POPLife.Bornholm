class suministros {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['suministros', _this select 0]; abierto = true;";
	onUnLoad = "uiNamespace setVariable ['suministros', nil]; abierto = nil";

	class controls {
		
		// Fondos
		class fondo1: IGUIBack
		{
			idc = -1;
			x = 0.293751 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.388783 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class fondo2: IGUIBack
		{
			idc = -1;
			x = 0.358719 * safezoneW + safezoneX;
			y = 0.5484 * safezoneH + safezoneY;
			w = 0.259908 * safezoneW;
			h = 0.1122 * safezoneH;
			colorBackground[] = {0,0,0.3,0.3};
		};
		class fondo3: IGUIBack
		{
			idc = -1;
			x = 0.359749 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.258877 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0.3,0.3};
		};
		class cabecera: RscText
		{
			idc = -1;
			text = "         Existencias                                  Demanda";
			x = 0.293757 * safezoneW + safezoneX;
			y = 0.2558 * safezoneH + safezoneY;
			w = 0.388711 * safezoneW;
			h = 0.0374 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class linea2: RscText
		{
			idc = -1;
			text = "                          Transportes Icaruk"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.388711 * safezoneW;
			h = 0.0374 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class linea3: RscText
		{
			idc = -1;
			x = 0.358607 * safezoneW + safezoneX;
			y = 0.660156 * safezoneH + safezoneY;
			w = 0.259836 * safezoneW;
			h = 0.0066 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		// Textos
		class txt: RscText
		{
			idc = -1;
			text = "1    2    3    4                                Lakeside";
			x = 0.322623 * safezoneW + safezoneX;
			y = 0.4802 * safezoneH + safezoneY;
			w = 0.347477 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class precio: RscText
		{
			idc = -1;
			text = "Valor:"; //--- ToDo: Localize;
			x = 0.429884 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.0352 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1.1,1};
		};
		class impuestos: RscText
		{
			idc = -1;
			text = "Impuestos:"; //--- ToDo: Localize;
			x = 0.429872 * safezoneW + safezoneX;
			y = 0.7024 * safezoneH + safezoneY;
			w = 0.0680621 * safezoneW;
			h = 0.0352 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1.1,1};
		};
		class textoquiero: RscText
		{
			idc = -1;
			text = "Quiero     T   de"; //--- ToDo: Localize;
			x = 0.382565 * safezoneW + safezoneX;
			y = 0.584837 * safezoneH + safezoneY;
			w = 0.106217 * safezoneW;
			h = 0.0352 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1.1,1};
		};



		// Editables
		class boton: RscButton
		{
			
			idc = 4010;
			text = "Cargar"; //--- ToDo: Localize;
			x = 0.35977 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.258844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1.1,1};
		};
		class lista: RscListbox
		{
			idc = 4015;
			x = 0.493775 * safezoneW + safezoneX;
			y = 0.5572 * safezoneH + safezoneY;
			w = 0.101062 * safezoneW;
			h = 0.0924 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
			colorText[] = {1,1,1.1,1};
			sizeEx = 0.03;
		};
		class entrada: RscEdit
		{
			idc = 4016;
			text = "1"; //--- ToDo: Localize;
			x = 0.418617 * safezoneW + safezoneX;
			y = 0.586704 * safezoneH + safezoneY;
			w = 0.0226567 * safezoneW;
			h = 0.0308 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1.1,1};
		};




		// Datos
		class b1: RscProgressV
		{
			idc = 4020;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.318107 * safezoneW + safezoneX;
			y = 0.300437 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {0,1,0,0.7};
		};
		class b2: RscProgressV
		{
			idc = 4021;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.347373 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {0.2,0.2,1,0.7};
		};
		class b3: RscProgressV
		{
			idc = 4022;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.376246 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {1,1,0.4,0.7};
		};
		class b4: RscProgressV
		{
			idc = 4023;
			x = 0.404088 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {1,0,0,0.7};
		};

		class lk1: RscProgressV
		{
			idc = 4024;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.579407 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {0,1,0,0.7};
		};
		class lk2: RscProgressV
		{
			idc = 4025;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.601063 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {0.2,0.2,1,0.7};
		};
		class lk3: RscProgressV
		{
			idc = 4026;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.622719 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {1,1,0.4,0.7};
		};
		class lk4: RscProgressV
		{
			idc = 4027;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.644098 * safezoneW + safezoneX;
			y = 0.299881 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.1694 * safezoneH;
			colorBar[] = {1,0,0,0.7};
		};

		class n1: RscText
		{
			idc = 4028;
			text = "err"; //--- ToDo: Localize;
			x = 0.31539 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0154 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class n2: RscText
		{
			idc = 4029;
			text = "err"; //--- ToDo: Localize;
			x = 0.344281 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0154 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class n3: RscText
		{
			idc = 4030;
			text = "err"; //--- ToDo: Localize;
			x = 0.374188 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0154 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class n4: RscText
		{
			idc = 4031;
			text = "err"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.019594 * safezoneW;
			h = 0.0154 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};		

		class impuestosNUM: RscText
		{
			idc = 4040;
			text = "err €/T"; //--- ToDo: Localize;
			x = 0.491747 * safezoneW + safezoneX;
			y = 0.7024 * safezoneH + safezoneY;
			w = 0.0680621 * safezoneW;
			h = 0.0352 * safezoneH;
			colorText[] = {1,0,0,1};
			colorBackground[] = {0,0,0,0};
		};
		class precioNUM: RscText
		{
			idc = 4041;
			text = "err €/T"; //--- ToDo: Localize;
			x = 0.491137 * safezoneW + safezoneX;
			y = 0.671874 * safezoneH + safezoneY;
			w = 0.0680621 * safezoneW;
			h = 0.0352 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0};
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
