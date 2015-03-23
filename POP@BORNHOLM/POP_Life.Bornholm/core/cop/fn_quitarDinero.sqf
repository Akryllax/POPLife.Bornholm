/*
	File: fn_quitarDinero.sqf
	Author: Akryllax
	Desc: Removes the restrained guy's money.
*/

private["_curTarget"];

_curTarget = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _curTarget) exitWith{ hint "Null target";}; //Fucking arma.

[[player], "life_fnc_removeMoneyDo", _curTarget, false] call life_fnc_MP;