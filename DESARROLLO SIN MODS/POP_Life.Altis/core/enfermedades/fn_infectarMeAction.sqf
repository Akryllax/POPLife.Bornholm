/*
	File: fn_infectarMeAction.sqf
	Author: Akryllax
	Desc: Action wrapper for life_fnc_infectarMe.
*/
private["_enfermedad","_nivel"];

_args = _this select 3;

_enfermedad = [_args, 0, "",[""]] call BIS_fnc_param;
_nivel		= [_args, 1, -1,[-1]] call BIS_fnc_param;

if(_enfermedad == "" || _nivel < 0) exitWith {};

[_enfermedad,_nivel] call life_fnc_infectarMe;