/*
fn_roboGasolinera.sqf
WarBlast
*/

private ["_vendedor", "_ladron", "_accion", "_polis", "_random", "_caja", "_robando", "_tiempo", "_max", "_robando"];

// Cositas
_vendedor =     [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_ladron	  =     [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
_accion	  =     [_this, 2] call BIS_fnc_param;	// Action name
_polis	  =     (west countSide playableUnits);
_random	  =     random(100);
_caja	  =     random(1000);

// Anti bugs etc....
if (life_robando) exitWith { hint "ya lo estas robando!"};
if (side _ladron != civilian) exitWith { hint "No puedes robar!"};
if (_ladron distance _vendedor > 5) exitWith { hint "No te alejes tanto!"};
if (vehicle player != _ladron) exitWith { hint "Sal del Vehiculo!"};
if !(alive _ladron) exitWith {};
if (currentWeapon _ladron == "") exitWith { hint "Sal de aqui pordiosero!"};
if (_caja == 0) exitWith { hint "La caja esta vacia vuelve mas tarde"};
// if ((count nearestObjects [player, ["civilian"], 20]) <= 1) exitWith { hint "No me das miedo tu solo..."};
// if (_polis < _policias) exitWith { hint "Poca policia"};

// Empezamos el robo!
life_robando = true;
_caja	     = _caja * (count nearestObjects [player, ["civilian"], 20]);
_vendedor removeAction _accion;

if (_random >= 25) then { hint "El dependiente a activado la alarma! Ahora la poli viene de camino!";
			  [ [1, format ["ALARMA! La gasolinera %1 esta siendo robada!", _vendedor]], "life_fnc_broadcast", west, false] spawn life_fnc_MP;
	};

// Añadimos delito!
[ [getPlayerUID _ladron, name _ladron, "5"], "life_fnc_wantedAdd", false, false] spawn life_fnc_MP;

_tiempo	   = 0;
_max	   = 300;
_distancia = 25;
_metros	   = _vendedor distance _ladron;

_pos	 = position _ladron;
_marcaID = format ["marca_%1", floor (random 1000)];
_marca	 = createMarker [_marcaID, _pos];
_marca setMarkerColor "ColorRed";
_marca setMarkerText "!ATENCION! Alarma activada!";
_marca setMarkerType "mil_warning";

while {life_robando} do {
	if (_tiempo < _max) then {
			_tiempo = _tiempo + 1;
			hintSilent format ["Tiempo para robar: %1 \n Distancia: %2m (max %3m)", [((_max) / 60) + .01, "HH:MM"] call BIS_fnc_timetostring, round (_metros), _distancia];
			if (_tiempo >= _max) exitWith { life_robando = false; };
			if !(alive _ladron) exitWith { life_robando = false; };
			if (_metros > _distancia) exitWith {
					deleteMarker _marca;
					hint "Te alejastes demasiado!";
					life_robando = false;
				};
			sleep 1;
		};
		if !(alive _ladron) exitWith { _robando = false; };
};
sleep 300;
titleText [format ["Robastest $%1, ahora largate antes de que llegue la poli!", [_caja] call life_fnc_numberText], "PLAIN"];
deleteMarker _marca;
life_cash = life_cash + _caja;
_accion	  = _vendedor addAction ["RobarGasolinera", War_fnc_roboGasolinera];