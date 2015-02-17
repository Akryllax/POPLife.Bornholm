#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan

	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type"];

disableSerialization;
createDialog "Market";
waitUntil {!isNull findDisplay 39000};
_display = findDisplay 39000;
_venteliste = _display displayCtrl 39002;
_achatliste = _display displayCtrl 39003;

lbClear _venteliste;
lbClear _achatliste;


if (!isNil {tiempo_mercado}) exitWith {hint "Deja de spamear a la base de datos"; };

if (tiempo_mercado) exitWith
{
	[[0,player,"economy"],"TON_fnc_getprices",false,false] spawn life_fnc_MP;
};

[] spawn
{
	tiempo_mercado = true;
	sleep (5 * 60);
	tiempo_mercado = nil;
};