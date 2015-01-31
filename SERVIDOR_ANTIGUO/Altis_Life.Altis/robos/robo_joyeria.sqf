//config
_tiempoRobo = 300;
_tiempoRegenerarRobo = 60 * 15;
_dinero = 45000 + random(55000);
_metros_cancelar_robo = 30;
_policias = 2;
_nombreRobo = "joyeria";

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
hint "Robando oro y dinero";
_vendedor switchMove "AmovPercMstpSsurWnonDnon";
sleep 1;


//poner marcador de robo
_Pos = position _vendedor; 
 _marker = createMarker ["MarkerJoyeria", _Pos]; 
"MarkerJoyeria" setMarkerColor "ColorRed";
"MarkerJoyeria" setMarkerText "!ATENCION! Estan robando aqui!";
"MarkerJoyeria" setMarkerType "mil_warning";	

//iniciar timer robo
_script_handler = [_tiempoRobo,_vendedor,_ladron,_metros_cancelar_robo,_dinero] execVM "robos\timer_joyeria.sqf";
waitUntil { scriptDone _script_handler };



//borrar marcador robo
deleteMarker "MarkerJoyeria"; // by ehno delete maker

//crear marcador ultima posicion del ladron
_Pos = position _ladron; 
 _marker = createMarker ["MarkerJoyeria", _Pos]; 
"MarkerJoyeria" setMarkerColor "ColorRed";
"MarkerJoyeria" setMarkerText "Ladrón visto aqui por última vez";
"MarkerJoyeria" setMarkerType "mil_warning";

sleep 30;

deleteMarker "MarkerJoyeria"; // by ehno delete maker

//regeneramos la accion de poder robar
sleep _tiempoRegenerarRobo;


//añadimos otra vez la opcion de robar
_action = _vendedor addAction["Robar joyeria","robos\robo_joyeria.sqf"];	
_vendedor switchMove " ";