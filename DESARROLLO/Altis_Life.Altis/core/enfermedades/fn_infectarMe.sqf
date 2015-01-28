/*
	File: fn_infectarMe.sqf
	Author: Akryllax
	Desc: Infects the players.
	Args: Illnesss.
*/

private["_enfermedad", "_nivel"];
_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;

if(_enfermedad == "") exitWith {[]};
if!([_enfermedad] call AKR_isIllness) exitWith {hint "Error: Enfermedad no encontrada"};
if(_nivel < 1) then {_nivel = 1};
if(_nivel > [_enfermedad] call AKR_enf_getLevelCount) then { _nivel = 1};

if(player getVariable["enfermo", ""] != "") exitWith {};

player setVariable["enfermo", _enfermedad, true];
player setVariable["enfermoLevel", _nivel, true];

life_fnc_enfermar = {

	_updateInterval = 15;

	_timestamp = time;
	_enf = player getVariable["enfermo", ""];
	_lvl = player getVariable["enfermoLevel", -1];
	
	if(_enf == "") exitWith {};
	if(_lvl < 0) exitWith {};
	
	_debug = 1;
	
	[_enf, _lvl] call AKR_enf_spawnEffectosPerma;
	
	while {(player getVariable["enfermo", ""] == _enf || player getVariable["enfermoLevel", -1] == _lvl) && alive player} do {
		if((_timestamp + 60 * (([_enf] call AKR_enf_getEnfermedad) select 1)) < time) exitWith {
			if(_lvl < [_enf] call AKR_enf_getLevelCount) then {
				player setVariable["enfermoLevel", _lvl + 1, true];
				hint format["Tu enfermedad ha empeorado... Ahora estas en el estadio %1.", _lvl + 1];
			} else {
				hint "Estas en el ultimo estadio de tu enfermedad. Visita a un medico urgentemente.";
			};
		};
		_debug = _debug + 1;
		
		[_enf, _lvl] call AKR_enf_spawnEffectos;
		
		sleep _updateInterval;
	};
	
	if(!alive player) then {
		player setVariable["enfermo", "", true];
		player setVariable["enfermoLevel", -1, true];
	} else {
		if(player getVariable["enfermoLevel", -1] > 0 && player getVariable["enfermo", ""] != "") then {
			[] spawn life_fnc_enfermar;
		};
	};
};

[] spawn life_fnc_enfermar;
hint format["Te has contagiado de %1", player getVariable["enfermo", "Error"]];