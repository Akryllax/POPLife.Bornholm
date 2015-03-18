/*
	File: fn_curarEnfermedadesAction.sqf
	Author: Akryllax
	Desc: Action wrapper for life_fnc_curarEnfermedades.
*/
private["_enfermedad","_nivel"];

_args = _this select 3;

_target = [_args, 0, objNull,[objNull]] call BIS_fnc_param;
_medicamento = [_args, 1, "",[""]] call BIS_fnc_param;

if(isNull _target || _medicamento == "") exitWith {};

[_target,_medicamento] call life_fnc_curarEnfermedades;