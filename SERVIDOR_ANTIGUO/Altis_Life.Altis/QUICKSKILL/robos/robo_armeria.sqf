//config
_tiempoRobo = 240;
_tiempoRegenerarRobo = 60 * 15;
_dinero = 50000 + random(55000);
_metros_cancelar_robo = 35;
_policias = 2;
_nombreRobo = "Armería";

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
hint "Robando Armas";
_vendedor switchMove "AmovPercMstpSsurWnonDnon";
sleep 1;


//poner marcador de robo
_Pos = position _vendedor; 
 _marker = createMarker ["MarkerArmeriaKavala", _Pos]; 
"MarkerArmeriaKavala" setMarkerColor "ColorRed";
"MarkerArmeriaKavala" setMarkerText "!ATENCION! Estan robando aqui!";
"MarkerArmeriaKavala" setMarkerType "mil_warning";	

//iniciar timer robo
_script_handler = [_tiempoRobo,_vendedor,_ladron,_metros_cancelar_robo,_dinero] execVM "robos\timer_armeria.sqf";
waitUntil { scriptDone _script_handler };



//borrar marcador robo
deleteMarker "MarkerArmeriaKavala"; // by ehno delete maker

//crear marcador ultima posicion del ladron
_Pos = position _ladron; 
 _marker = createMarker ["MarkerArmeriaKavala", _Pos]; 
"MarkerArmeriaKavala" setMarkerColor "ColorRed";
"MarkerArmeriaKavala" setMarkerText "Ladrón visto aqui por última vez";
"MarkerArmeriaKavala" setMarkerType "mil_warning";

sleep 30;

deleteMarker "MarkerArmeriaKavala"; // by ehno delete maker

//regeneramos la accion de poder robar
sleep _tiempoRegenerarRobo;


//añadimos otra vez la opcion de robar
_action = _vendedor addAction["Robar Armeria","robos\robo_armeria.sqf"];	
_vendedor switchMove " ";