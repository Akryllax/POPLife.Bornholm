/*
camello con rutas random el script de ica tenia las rutas  fijas... 
by ica
edited by quickskill
init: 
camello = this;
_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello.sqf";
*/
[] spawn {
sleep 5*60;
_ruta[0] = (group camello) addWaypoint [(getMarkerPos "camello1"), 0];
_marcador[0] = getMarkerPos "camello1";
_ruta[1] = (group camello) addWaypoint [(getMarkerPos "camello2"), 0];
_marcador[1] = getMarkerPos "camello2";
_ruta[2] = (group camello) addWaypoint [(getMarkerPos "camello3"), 0];
_marcador[2] = getMarkerPos "camello3";
_ruta[3] = (group camello) addWaypoint [(getMarkerPos "camello4"), 0];
_marcador[3] = getMarkerPos "camello4";
_RandomRuta = round random 4 ;
_ruta[_RandomRuta] setWaypointType "MOVE";
_ruta[_RandomRuta] setWaypointBehaviour "CARELESS";
_ruta[_RandomRuta] setWaypointSpeed "FULL";
waitUntil {(camello distance (_marcador[_RandomRuta])) < 30};
sleep (60 * 30);

_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello.sqf";

};