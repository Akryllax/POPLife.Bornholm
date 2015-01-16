/*
	File: fn_infectarTo.sqf
	Author: Akryllax
	Desc: Infects the player...
*/	

private ["_target", "_enfermedad"];

_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_enfermedad = [_this, 1, "", [""]] call BIS_fnc_param;

if(isNull _target) exitWith {hint "Tienes que usarlo sobre un jugador."};
if(!(isPlayer _target)) exitWith {hint "Tienes que usarlo sobre un jugador."};
if(_enfermedad == "") exitWith {hint "Enfermedad no encontrada"};

_timestamp = time;
_delay = 5;
_badDistance = false;

if(_target getVariable["enfermo",""] != "") exitWith { hint format["%1 ya esta enfermo.", _target getVariable["realname", name _target]]; false};

while {time < _timestamp + _delay} do { 
	hintSilent format["Infectando... (%1 s)", (_timestamp + 5) - time];
	if((position player) distance (position _target) > 2) exitWith {
		_badDistance = true;
	};
};

if(_badDistance) exitWith {};

hintSilent "";
player say3D "HStimpack";
[[_enfermedad], "AKR_fnc_infectarMe", _target, false] call BIS_fnc_MP;
true