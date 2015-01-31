/*
	File: fn_curarEnfermedades.sqf
	Author: Akryllax
	Desc: Heals all the units illness.
*/

private["_unit","_medicamento"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_medicamento = [_this, 1, "", [""]] call BIS_fnc_param;

if(isNull _unit) exitWith {hint "Tienes que apuntar a un jugador."};
if(_medicamento == "") exitWith {hint "Medicamento isNil"};

_enf = _unit getVariable["enfermo", ""];
_lvl = _unit getVariable["enfermoLevel", -1];

if(_enf == "") exitWith {hint format["%1 no esta enfermo.", _unit]};
if(_lvl < 0) exitWith {hint "_lvl is null"};

_timestamp = time;
_delay = 5;

while {time < _timestamp + _delay} do { 
	hintSilent format["Curando... (%1 s)", (_timestamp + 5) - time];
};

if(_medicamento == [_enf, _lvl] call AKR_enf_getCura) then {

	hintSilent format["Has curado a %1 de %2.", _unit getVariable["realname", "error"], _unit getVariable["enfermo", "error enf"]];

	_unit setVariable["enfermo", "", true];
	_unit setVariable["enfermoLevel", -1, true];
	
	player say3D "HStimpack";

} else {
	hint "No parece hacer efecto, debes haber usado la cura incorrecta."
};