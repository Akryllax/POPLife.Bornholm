/*
fn_roboGasolinera.sqf
WarBlast
*/

private["_vendedor","_ladron","_accion","_polis","_random","_caja","_robando","_tiempo","_max"];

//Cositas
_vendedor =     [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron   = 	[_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_accion   = 	[_this,2] call BIS_fnc_param;//Action name
_polis    =     (west countSide playableUnits);
_random   =     random(100);
_caja     =     random(1000);

//Anti bugs etc....
if (_robando) exitWith { hint "ya lo estas robando!"};
if (side _ladron != civilian) exitWith { hint "No puedes robar!"};
if (_ladron distance _vendedor > 5) exitWith { hint "No te alejes tanto!"};
if (vehicle player != _ladron) exitWith { hint "Sal del Vehiculo!"};
if !(alive _ladron) exitWith {};
if (currentWeapon _ladron == "") exitWith { hint "Sal de aqui pordiosero!"};
if (_caja == 0) exitWith { hint "La caja esta vacia vuelve mas tarde"};
if ((count nearestObjects [player, ["civilian"], 20]) <= 1) exitWith { hint "No me das miedo tu solo..."};

//Empezamos el robo!
_robo     = true;
_caja     = _caja * (count nearestObjects [player, ["civilian"], 20]);
_vendedor removeAction _accion;

if(_random >= 25) then { hint "El dependiente a activado la alarma! Ahora la poli viene de camino!"; [[1,format["ALARMA! La gasolinera %1 esta siendo robada!", _vendedor]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };

//Añadimos delito!
[[getPlayerUID _ladron,name _ladron,"5"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

_tiempo = 0;
_max = 300;
_distancia = 25;
_metros = _vendedor distance _ladron;

if (_robando) then {
	while (true) do
		{
		hintSilent format["Tiempo para robar: %1 \n Distancia: %2m (max %3m)", [((_max)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_distancia];
		sleep 1;
		_tiempo = _tiempo + 1;
		_pos = position _vendedor;
		_marcaID = format ["marca_%1",floor (random 1000)];
		_marca = createMarker [ _marcaID, _pos];
		_marca setMarkerColor "ColorRed";
		_marca setMarkerText "!ATENCION! Alarma activada!";
		_marker setMarkerType "mil_warning";

		//Miramos
       if (_tiempo >= _max) exitWith {};
       if (_ladron distance _vendedor > _distancia) exitWith {};
       if !(alive _ladron) exitWith {};
	};
	if !(alive _ladron) exitWith { _robando = false;};
	if(_ladron distance _vendedor > _distancia) exitWith { deleteMarker _marca; hint "Te alejastes demasiado!"; _robando = false; };
}


