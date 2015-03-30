class loteriamenu
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['loteriamenu', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['loteriamenu', nil];";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Acj, v1.063, #Xatoko)
////////////////////////////////////////////////////////

class fondo: IGUIBack
{
	idc = 2200;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.165 * safezoneH;
};

class NumerGana: RscText
{
	idc = -1;
	text = "Numero Ganador: 99999"; //--- ToDo: Localize;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorActive[] = {1,1,1,1};
};
class BtonComprar: RscButton
{
	idc = -1;
	text = "Comprar"; //--- ToDo: Localize;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
};
class BotonCobrar: RscButton
{
	idc = -1;
	text = "Cobrar"; //--- ToDo: Localize;
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
};
class tunumero: RscText
{
	idc = -1;
	text = "Tu Numero: 99999"; //--- ToDo: Localize;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
};
class tiempo: RscText
{
	idc = -1;
	text = "Tiempo Restante: 99999"; //--- ToDo: Localize;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};