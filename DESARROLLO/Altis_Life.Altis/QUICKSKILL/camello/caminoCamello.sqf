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


//rutas camello
_ruta1 = (group camello) addWaypoint [(getMarkerPos "Camello1"), 0];
_marcador1 = getMarkerPos "Camello1";

_ruta2 = (group camello) addWaypoint [(getMarkerPos "Camello2"), 0];
_marcador2 = getMarkerPos "Camello2";

_ruta3 = (group camello) addWaypoint [(getMarkerPos "Camello3"), 0];
_marcador3 = getMarkerPos "Camello3";

_ruta4 = (group camello) addWaypoint [(getMarkerPos "Camello4"), 0];
_marcador4 = getMarkerPos "Camello4";

//coger ruta al azar
_RandomRuta = round random 5 ;

if(_RandomRuta == 1)then {


//mover al camello
_ruta1 setWaypointType "MOVE";
_ruta1 setWaypointBehaviour "CARELESS";
_ruta1 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador1) < 30};

};

if(_RandomRuta == 2)then {


//mover al camello
_ruta2 setWaypointType "MOVE";
_ruta2 setWaypointBehaviour "CARELESS";
_ruta2 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador2) < 30};

};

if(_RandomRuta == 3)then {

//mover al camello
_ruta3 setWaypointType "MOVE";
_ruta3 setWaypointBehaviour "CARELESS";
_ruta3 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador3) < 30};

};

if(_RandomRuta == 4 || _RandomRuta== 5)then {

//mover al camello
_ruta4 setWaypointType "MOVE";
_ruta4 setWaypointBehaviour "CARELESS";
_ruta4 setWaypointSpeed "FULL";
waitUntil {(camello distance _marcador4) < 30};

};


_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello.sqf";

};