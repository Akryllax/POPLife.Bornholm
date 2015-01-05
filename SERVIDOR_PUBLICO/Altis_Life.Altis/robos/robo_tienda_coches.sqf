//config
_tiempoRobo = 220;
_tiempoRegenerarRobo = 60 * 10;
_dinero = 25000 + random (125000);
_metros_cancelar_robo = 30;
_policias = 1;
_nombreRobo = "tienda de coches";

//to?who?what?
_vendedor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_action = [_this,2] call BIS_fnc_param;//Action name




//si no hay x policias no se puede robar
_cops = (west countSide playableUnits);
if(_cops < _policias) exitWith{[["",-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "No hay suficiente policía para robar!";};
disableSerialization;

//sino va armnado no peude robar
if (currentWeapon _ladron == "") exitWith { hint "¡No me amenaces! ¡Fuera de aquí pordiosero!";};


//avisar a la policia
[[1,format["Alarma activada! - Se esta produciendo un atraco en %1 !", _nombreRobo]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 

//añadir robo al ladron
[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

//quitar opcion del robo
_vendedor removeAction _action;

//vendedor poner manos arriba
hint "Robando coche";
_vendedor switchMove "AmovPercMstpSsurWnonDnon";
sleep 1;


//poner marcador de robo
_Pos = position _vendedor; 
 _marker = createMarker ["MarkerCoche", _Pos]; 
"MarkerCoche" setMarkerColor "ColorRed";
"MarkerCoche" setMarkerText "!ATENCION! Estan robando aqui!";
"MarkerCoche" setMarkerType "mil_warning";	

//iniciar timer robo
_script_handler = [_tiempoRobo,_vendedor,_ladron,_metros_cancelar_robo,_dinero] execVM "robos\timer_tienda_coches.sqf";
waitUntil { scriptDone _script_handler };



//borrar marcador robo
deleteMarker "MarkerCoche"; // by ehno delete maker

//crear marcador ultima posicion del ladron
_Pos = position _ladron; 
 _marker = createMarker ["MarkerCoche", _Pos]; 
"MarkerCoche" setMarkerColor "ColorRed";
"MarkerCoche" setMarkerText "Ladrón visto aqui por última vez";
"MarkerCoche" setMarkerType "mil_warning";

sleep 30;

deleteMarker "MarkerCoche"; // by ehno delete maker

//regeneramos la accion de poder robar
sleep _tiempoRegenerarRobo;


//añadimos otra vez la opcion de robar
_action = _vendedor addAction["Robar coche","robos\robo_tienda_coches.sqf"];	
_vendedor switchMove " ";