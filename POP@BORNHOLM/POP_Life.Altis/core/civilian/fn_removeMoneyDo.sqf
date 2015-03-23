/*
	File: fn_quitarDineroDo.sqf
	Author: Akryllax
	Desc: Removes local player's money.
*/

private["_cop"];

_cop = [_this,0,objNull, [objNull]] call BIS_fnc_param;

if(isNull _cop) exitWith { hint "Null cop";};

[[player, pop_dinero], "life_fnc_recieveConfiscatedMoney", _cop, false] call life_fnc_MP;

hint format["%1 te ha consficado %2€", _cop getVariable["realname",name _cop], pop_dinero];

pop_dinero = 0;
[] call life_fnc_p_updateMenu;
[0] spawn SOCK_fnc_updatePartial;