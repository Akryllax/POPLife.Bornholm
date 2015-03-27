class animaBaile_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['animaBaile_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['animaBaile_dialog', nil];";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Acj, v1.063, #Vojyjo)
////////////////////////////////////////////////////////

class RscPicture_1200: RscPicture
{
	type = CT_STATIC;
	style = ST_PICTURE;
	text = "acj\paa\baile.paa";
	idc = -1;
	x = 0.21125 * safezoneW + safezoneX;
	y = 0.137 * safezoneH + safezoneY;
	w = 0.592969 * safezoneW;
	h = 0.671 * safezoneH;
};
class Boton1: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\Bailerussian.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Ruso"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton2: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\bailedrock.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Rock"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton3: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\bailedance.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Dance"; //--- ToDo: Localize;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton4: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\BaileDoulvan.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Duolvan"; //--- ToDo: Localize;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton5: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\BaileStephan.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Stephan"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class boton6: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\Bailehihop.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Hip Hop"; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton7: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\baileloco.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Loco"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton8: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\bailelocoRoboto.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile L Robot"; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton9: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\bailelpop.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Pop"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton10: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\Bailerobot.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Robot"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton11: RscShortcutButton
{
	action = "closeDialog 0; execVM ""acj\animaciones\BaileDoustephan.sqf""";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Stephan"; //--- ToDo: Localize;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class Boton12: RscShortcutButton
{
	action = "closeDialog 0; player switchMove ''";
	colorBackgroundDisabled[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Baile Parar"; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};