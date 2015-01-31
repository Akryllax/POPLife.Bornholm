//config
_tiempoRobo = 10;
_tiempoRegenerarRobo = 10;
_dinero = 25000 + round(random 200000);
_metros_cancelar_robo = 30;

//
_vendedor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_action = [_this,2] call BIS_fnc_param;//Action name

//quitar opcion del robo
_vendedor removeAction _action;




//sino va armnado no peude robar
if (currentWeapon _ladron == "") exitWith { hint "¡No me amenaces! ¡Fuera de aquí pordiosero!";_action = _vendedor addAction["Robo Banco","robos\robo_banco_kavaka.sqf"];	 };

//vendedor poner manos arriba
hint "Robando banco";
_vendedor switchMove "AmovPercMstpSsurWnonDnon";
sleep 1;

//hay un robo!! avisar a la poli
//[{hint "Estan robando la tienda de coches de Kavala!!"}], "BIS_fnc_spawn", west, false] call BIS_fnc_MP;

//poner marcador de robo
_Pos = position _vendedor; // by ehno: get player pos
 _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
"Marker200" setMarkerColor "ColorRed";
"Marker200" setMarkerText "!ATENCION! Estan robando aqui!";
"Marker200" setMarkerType "mil_warning";	

//iniciar timer robo
_script_handler = [_tiempoRobo,_vendedor,_ladron,_metros_cancelar_robo,_dinero] execVM "robos\timer_banco_kavala.sqf";
waitUntil { scriptDone _script_handler };

//borrar marcador robo
deleteMarker "Marker200"; // by ehno delete maker

//crear marcador ultima posicion del ladron
_Pos = position _ladron; // by ehno: get player pos
 _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
"Marker200" setMarkerColor "ColorRed";
"Marker200" setMarkerText "Visto al ladrón por última vez";
"Marker200" setMarkerType "mil_warning";

sleep 30;

deleteMarker "Marker200"; // by ehno delete maker

//regeneramos la accion de poder robar
sleep _tiempoRegenerarRobo;


//añadimos otra vez la opcion de robar
_action = _vendedor addAction["Robo Banco","robos\robo_banco_kavala.sqf"];	
_vendedor switchMove " ";