/*
	Description:
	el chivato! script de un aleman editado por quick!!para plata o plomo
	this addAction["Corromper agente de la CIA - Coste: 25000$",QUICK_fnc_darChivatazo];
*/
private["_display","_list","_uid"];

if(25000 > life_cash) exitWith {hint "Si no tienes dinero no tienes informacion!";};


disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];

if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

_uid = _data select 1;
_player = objNull;
{
	if(getPlayerUID _x == _uid) then {_player = _x;};
} forEach playableUnits;

if(isNull _player) exitWith {};

_closesttown = (nearestLocations [_player,["NameCityCapital","NameCity","NameVillage"],10000]) select 0;
_town_name = text _closesttown;
_town_pos = position _closesttown;


hint format["Un civil ha visto a %1 cerca de  %2. %2 esta a %3M de ti.Has pagado  25000$ al agente.",_player getVariable["realname",name _player], _town_name, round(player distance _town_pos)];

life_cash = life_cash- 25000;