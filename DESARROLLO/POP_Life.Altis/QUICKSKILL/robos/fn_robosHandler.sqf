/*
        File: fn_robosHandler.sqf
        Author: Quickskill
        Example: this addAction["Robar Camello del bar",QUICK_fnc_robosHandler,["Camello del bar",15,50000 + round random 130000,50,["marijuana","marijuana","cocainep","cocainep"],0,"no","no",0]];

        Example:

                this addAction["Robar X", QUICK_fnc_robosHandler, ["Camellito camello", TIMEPO, DINERO, METROS DE ROBO, ITEMS RECOMPENSA, POLICIA, DAR ARMAs , DAR VEHICULOS, HORA ]];
*/

// Variables privadas generales
private ["_vendedor", "_ladron", "_action", "_nombreRobo", "_tiempoRobo", "_dinero", "_metros_cancelar_robo", "_policias", "_robosActivados", "_cops", "_Pos", "_marker", "_markerIDrandom", "_darArmas", "_darVehiculo"];
// maximo de robos activos para el server
_maximoRobosActivos  = 2;
_vendedor	     =       [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_ladron		     =       [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
_action		     =       [_this, 2] call BIS_fnc_param;	// Action name
_tiempoRegenerarRobo =   60 * 15;
_cops		     =       (west countSide playableUnits);
// array de parametros
_params = [_this, 3, [], [ []]] call BIS_fnc_param;
// variables a utilizar
_nombreRobo	      =          _params select 0;
_tiempoRobo	      =          _params select 1;
_dinero		      =          _params select 2;
_metros_cancelar_robo =      _params select 3;
_itemsRecompensa      =      _params select 4;
_policias	      =          _params select 5;
_darArmas	      =          _params select 6;
_darVehiculo	      =      _params select 7;
_robo_hora	      =          _params select 8;

// Si no hay x policias no se puede robar
if (_cops < _policias) exitWith {
		hint "No hay suficiente policía para robar.";
	};
// Si no va armado no puede robar
if (currentWeapon _ladron == "") exitWith {
		hint "No me amenaces! Fuera de aquí pordiosero!";
	};
// Noche OFF
if ((_robo_hora == 1)and (((date select 3) >= 20)OR ((date select 3) <= 7))) exitWith {
		hint "Es de noche! Este establecimiento esta cerrado!";
	};
// DIA OFF
if ((_robo_hora == 2)and !(((date select 3) >= 20)OR ((date select 3) <= 7))) exitWith {
		hint "Es de dia! Este establecimiento esta cerrado!";
	};

if (!((_nombreRobo) in (robosActivosGLOBAL select [0, 2])) or (_nombreRobo) in (robosActivosGLOBAL select [0, 2]) and (count robosActivosGLOBAL) >= _maximoRobosActivos) then {
		if !((_nombreRobo) in (robosActivosGLOBAL select [0, 2])) then {
				robosActivosGLOBAL pushBack [_nombreRobo];
				publicVariable "robosActivosGLOBAL";
				[ [1, format ["Alarma activada! - Se esta produciendo un atraco en %1 !", _nombreRobo]], "life_fnc_broadcast", west, false] spawn life_fnc_MP;

				// Añadir robo al ladron
				[ [getPlayerUID _ladron, name _ladron, "5"], "life_fnc_wantedAdd", false, false] spawn life_fnc_MP;

				// Quitar opcion del robo
				_vendedor removeAction _action;

				// Poner marcador de robo
				_pos	  = position _vendedor;
				_markerID = format ["marker_%1", floor(random 1000)];
				_marker	  = createMarker [_markerID, _pos];
				_marker setMarkerColor "ColorRed";
				_marker setMarkerText "!ATENCION! Estan robando aqui!";
				_marker setMarkerType "mil_warning";

				_parametrosTimer = [];
				_parametrosTimer pushBack _nombreRobo;
				_parametrosTimer pushBack _tiempoRobo;
				_parametrosTimer pushBack _dinero;
				_parametrosTimer pushBack _metros_cancelar_robo;
				_parametrosTimer pushBack _itemsRecompensa;
				_parametrosTimer pushBack _vendedor;
				_parametrosTimer pushBack _ladron;
				_parametrosTimer pushBack _darArmas;
				_parametrosTimer pushBack _darVehiculo;

				// Iniciar timer robo
				_script_handler = _parametrosTimer spawn QUICK_fnc_timerRobo;
				waitUntil { scriptDone _script_handler };

				// Borrar marcador robo
				deleteMarker _marker;

				// crear marcador ultima posicion del ladron
				_pos	  = position _ladron;
				_markerID = format ["marker_%1", floor(random 1000)];
				_marker	  = createMarker [_markerID, _pos];
				_marker setMarkerColor "ColorRed";
				_marker setMarkerText "Ladrón visto aqui por última vez";
				_marker setMarkerType "mil_warning";

				sleep 15;

				deleteMarker _marker;

				// Regeneramos la accion de poder robar
				sleep _tiempoRegenerarRobo;	// Wait

				// Añadimos otra vez la opcion de robar
				_vendedor addAction [format ["Robar %1", _nombreRobo], QUICK_fnc_robosHandler, _params];
			} else {
				// Avisar a la policia
				[ [1, format ["Alarma activada! - Se esta produciendo un atraco en %1 !", _nombreRobo]], "life_fnc_broadcast", west, false] spawn life_fnc_MP;

				// Añadir robo al ladron
				[ [getPlayerUID _ladron, name _ladron, "5"], "life_fnc_wantedAdd", false, false] spawn life_fnc_MP;

				// Quitar opcion del robo
				_vendedor removeAction _action;

				// Poner marcador de robo
				_pos	  = position _vendedor;
				_markerID = format ["marker_%1", floor(random 1000)];
				_marker	  = createMarker [_markerID, _pos];
				_marker setMarkerColor "ColorRed";
				_marker setMarkerText "!ATENCION! Estan robando aqui!";
				_marker setMarkerType "mil_warning";

				_parametrosTimer = [];
				_parametrosTimer pushBack _nombreRobo;
				_parametrosTimer pushBack _tiempoRobo;
				_parametrosTimer pushBack _dinero;
				_parametrosTimer pushBack _metros_cancelar_robo;
				_parametrosTimer pushBack _itemsRecompensa;
				_parametrosTimer pushBack _vendedor;
				_parametrosTimer pushBack _ladron;
				_parametrosTimer pushBack _darArmas;
				_parametrosTimer pushBack _darVehiculo;

				// Iniciar timer robo
				_script_handler = _parametrosTimer spawn QUICK_fnc_timerRobo;
				waitUntil { scriptDone _script_handler };

				// Borrar marcador robo
				deleteMarker _marker;

				// crear marcador ultima posicion del ladron
				_pos	  = position _ladron;
				_markerID = format ["marker_%1", floor(random 1000)];
				_marker	  = createMarker [_markerID, _pos];
				_marker setMarkerColor "ColorRed";
				_marker setMarkerText "Ladrón visto aqui por última vez";
				_marker setMarkerType "mil_warning";

				sleep 15;

				deleteMarker _marker;

				// Regeneramos la accion de poder robar
				sleep _tiempoRegenerarRobo;	// Wait

				// Añadimos otra vez la opcion de robar
				_vendedor addAction [format ["Robar %1", _nombreRobo], QUICK_fnc_robosHandler, _params];
			};
	} else {
		hint "Hay muchos robos activos, espera a que terminen para poder robar!";
	};