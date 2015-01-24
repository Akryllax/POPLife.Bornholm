/*
camello con rutas random el script de ica tenia las rutas  fijas... 
by ica
edited by quickskill
init: 
camello = this;
_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello.sqf";
*/
[] spawn {
//esperar 10 min
sleep 5*60;

//coger ruta al azar
_RandomRuta = round random 5 ;

if(_RandomRuta == 1)then {

_ruta1 = (group camello) addWaypoint [(getMarkerPos "camello1"), 0];
_marcador1 = getMarkerPos "camello1";

//mover al camello
_ruta1 setWaypointType "MOVE";
_ruta1 setWaypointBehaviour "CARELESS";
_ruta1 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador1) < 30};

};

if(_RandomRuta == 2)then {

_ruta1 = (group camello) addWaypoint [(getMarkerPos "camello2"), 0];
_marcador1 = getMarkerPos "camello2";

//mover al camello
_ruta2 setWaypointType "MOVE";
_ruta2 setWaypointBehaviour "CARELESS";
_ruta2 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador2) < 30};

};

if(_RandomRuta == 3)then {

_ruta3 = (group camello) addWaypoint [(getMarkerPos "camello3"), 0];
_marcador3 = getMarkerPos "camello3";
//mover al camello
_ruta3 setWaypointType "MOVE";
_ruta3 setWaypointBehaviour "CARELESS";
_ruta3 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador3) < 30};

};
+
if(_RandomRuta == 4)then {

_ruta4 = (group camello) addWaypoint [(getMarkerPos "camello4"), 0];
_marcador4 = getMarkerPos "camello4";

//mover al camello
_ruta4 setWaypointType "MOVE";
_ruta4 setWaypointBehaviour "CARELESS";
_ruta4 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador4) < 30};

};

if(_RandomRuta == 5)then {

_ruta4 = (group camello) addWaypoint [(getMarkerPos "camello4"), 0];
_marcador4 = getMarkerPos "camello4";

//mover al camello
_ruta4 setWaypointType "MOVE";
_ruta4 setWaypointBehaviour "CARELESS";
_ruta4 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador4) < 30};

};

_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello.sqf";

};