/*
	File: fn_forceCure.sqf
	Author: Akryllax
	Desc: Cures the player of all illness. Admin stuff.
*/
private["_unit"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //Fucking arma...

_unit setVariable["enfermo", "", true];
_unit setVariable["enfermoLevel", -1, true];