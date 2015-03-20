/*
        Script: fn_roboGasolinera.sqf
        Author: WarBlast
        Example:

        this addAction["Robo Gasolinera kavala",War_fnc_roboGasolinera,[10000,1,3,300,40,true,25,25,["Gasolinera kavala"],["goldbar","sand"],1]];

        Example:
        this addAction["Robar X",War_fnc_roboGasolinera,[DINERO,GENTE CERCA,POLICIAS MIN,TIEMPO en SEGUNDOS,METROS MAX,MUTLIPLICADOR x Jugadores,Metros multiplicador,porcentaje Inverso de la alarma ejem 10% = 90,["Nombre del robo"],["objeto","objeto","todos los que quieras"],CANTIDAD DE OBJETOS];
*/

private ["_vendedor", "_ladron", "_accion", "_polis", "_random", "_caja", "_robando", "_tiempo", "_max", "_robando", "_actual", "_policias", "_lista", "_gente", "_fail"];

// Cositas de War
_vendedor  =     [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_ladron	   =     [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
_accion	   =     [_this, 2] call BIS_fnc_param;
_lista	   =     [_this, 3, [], [ []]] call BIS_fnc_param;
_polis	   =     (west countSide playableUnits);
_random	   =     random(100);
_caja	   =     _lista select 0;
_gente	   =     _lista select 1;
_policias  =     _lista select 2;
_max	   =     _lista select 3;
_distancia =     _lista select 4;
_multi	   =     _lista select 5;
_numero	   =     _lista select 6;
_alarma	   =     _lista select 7;
_nombre	   =     _lista select 8;
_objetos   =     _lista select 9;

// Anti bugs etc....
if (life_robandoGas) exitWith { hint "ya lo estas robando!"};
if (side _ladron != civilian) exitWith { hint "No puedes robar!"};
if (_ladron distance _vendedor > 5) exitWith { hint "No te alejes tanto!"};
if (vehicle player != _ladron) exitWith { hint "Sal del Vehiculo!"};
if !(alive _ladron) exitWith {};
if (currentWeapon _ladron == "") exitWith { hint "Sal de aqui pordiosero!"};
if (_caja == 0) exitWith { hint "La caja esta vacia vuelve mas tarde"};
if ((count nearestObjects [player, ["civilian"], _numero]) <= _gente) exitWith { hint "No me das miedo tu solo..."};
if (_polis < _policias) exitWith { hint "Poca policia"};
if (life_istazed) exitwith { hint "Ahora no puedes hacer esto" };
_fail = false;

// Empezamos el robo!
life_robandoGas = true;

// Multiplicador FELIZ!!!!!!
if (_multi) then {
		_caja = _caja * (count nearestObjects [player, ["civilian"], _numero]);
	};

// Adios accion
_vendedor removeAction _accion;

// ALARMAAAAA
if (_random >= _alarma) then { hint "El dependiente a activado la alarma! Ahora la poli viene de camino!";
			       [ [1, format ["ALARMA! Estan Robando %1", _vendedor]], "life_fnc_broadcast", west, false] spawn life_fnc_MP;
	};

// Añadimos delito!
[ [getPlayerUID _ladron, name _ladron, "5"], "life_fnc_wantedAdd", false, false] spawn life_fnc_MP;

// Calculamos tiempo
_tiempo = 0;

// El marcador de aviso!
_pos	 = position _ladron;
_marcaID = format ["marca_%1", floor (random 100)];
_marca	 = createMarker [_marcaID, _pos];
_marca setMarkerColor "ColorRed";
_marca setMarkerText "!ATENCION! Alarma activada!";
_marca setMarkerType "mil_warning";

// Mientras roban
while {life_robandoGas} do {

	// Si se pasa de tiempo Exito!
	if (_tiempo >= _max) exitWith {
		life_robandoGas = false;
		deleteMarker _marca;
		};

	// Si muere adios // tasean // se aleja
	if !(alive _ladron) OR (life_istazed) exitWith {
		life_robandoGas = false;
		deleteMarker _marca;
		_fail = true;
	};
	if((_vendedor distance _ladron) > _distancia)  exitWith {
		life_robandoGas = false;
		deleteMarker _marca;

	// Miramos los metros ;D
	_metros = _vendedor distance _ladron;

	// Le ponemos el cartel
	hintSilent format ["Tiempo para robar: %1 \n Distancia: %2m (max %3m)", [((_max) / 60) + .01, "HH:MM"] call BIS_fnc_timetostring, round (_metros), _distancia];

	// COntamos con barrio sesamo
	_max = _max - 1;
	sleep 1;
};

// Si hicistes fail te jodes
if (_fail) exitWith {};

// Ya no esta robando
life_robandoGas = false;
deleteMarker _marca;
sleep 2;

// Pagamos y dejamos el rastro
titleText [format ["Robastest $%1, ahora largate antes de que llegue la poli!", [_caja] call life_fnc_numberText], "PLAIN"];

life_cash = life_cash + _caja;

if ((str _objetos) != "[]") then {
		{
			[true, _x, _cantidad] call life_fnc_handleInv;
		} forEach _objetos;
	};

_pos	  = position _ladron;
_markerID = format ["marker_%1", floor(random 100)];
_marker	  = createMarker [_markerID, _pos];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Ladrón visto aqui por última vez";
_marker setMarkerType "mil_warning";

sleep 30;
deleteMarker _marker;

// Añadimos accion!
sleep 270;
_accion = _vendedor addAction [format ["Robar  %1", _nombre], War_fnc_roboGasolinera, _lista];