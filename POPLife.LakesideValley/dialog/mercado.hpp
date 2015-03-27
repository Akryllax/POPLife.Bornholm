class mercado_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['mercado_dialog', _this select 0]; abierto = true; ";
	onUnLoad = "uiNamespace setVariable ['mercado_dialog', nil]; abierto = nil; ";
	
	class controls {
		class RscPicture_1200: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			text = "acj\paa\mercado.paa";
			idc = -1;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.484688 * safezoneW;
			h = 0.561 * safezoneH;
		};
		class listaTienda: RscListbox
		{
			idc = 4066;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.253 * safezoneH;
			sizeEx = 0.034;
			onLBSelChanged = "_nil = ['rellenaTie'] execVM ""ica\suministros\tienda.sqf""";
		};
		class listaInventario: RscListbox
		{
			idc = 4067;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.253 * safezoneH;
			sizeEx = 0.034;
			onLBSelChanged = "_nil = ['rellenaInv'] execVM ""ica\suministros\tienda.sqf""";
		};
		class BotonComprar: RscButton
		{
			idc = 4068;
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class BotonVender: RscButton
		{
			idc = 4069;
			text = "Vender"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class NombreTienda: RscText
		{
			idc = 4070;
			text = "Alimentos: 100/100"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0};
		};
		class PrecioDeCompra: RscText
		{
			idc = 4071;
			text = "Precio de Compra: 9999€"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0};
		};
		class PrecioDeVenta: RscText
		{
			idc = 4072;
			text = "Precio de Venta: 9999€"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0};
		};
	};
};