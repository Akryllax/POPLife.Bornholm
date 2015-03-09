//gps espia [coded by quickskill para plataoplomo.es]
private "_marker";
_espia = _this select 0;
_espiado = _this select 1;
_tiempoGPS = 300;




//usar solo en jugadores
if(isNull _espiado) exitWith {hint "Tienes que apuntar a un jugador.",[true,"gpsEspia",1] call life_fnc_handleInv};
if(!(isPlayer _espiado)) exitWith {hint "Tienes que usarlo sobre un jugador.",[true,"gpsEspia",1] call life_fnc_handleInv};

hint "GPS espia activado, tiene 5 minutos de bateria";

//poner marcador espia
_marker1Nam = format["marker_%1",floor(random 1000)];
_marker = createMarker [ format["%1", _marker1Nam],position _espiado ];

_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTextLocal "GPS ESPIA";
_marker setMarkerTypeLocal "mil_triangle";	
	
sleep 3;
///borrar mensage de item utilizado
hint "";
//iniciar timer gps
_script_handler = [_espia,_espiado,_tiempoGPS,_marker] execVM "QUICKSKILL\items\timer_gps_espia.sqf";
waitUntil { scriptDone _script_handler };

sleep 1;

//borrar marcador robo
deleteMarker _marker ; // by ehno delete maker

