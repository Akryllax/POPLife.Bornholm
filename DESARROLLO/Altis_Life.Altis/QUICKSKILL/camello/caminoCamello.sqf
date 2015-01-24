/*
camello con rutas random el script de ica tenia las rutas  fijas... 
by ica
edited by quickskill
init: 
camello = this;
_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello.sqf";
*/
_fnc_muevete = {
    _sitios = ["Camello1", "Camello2", "Camello3", "Camello4"] call BIS_fnc_selectRandom;

    ruta = (group camello) addWaypoint [(getMarkerPos _sitios), 0];
    ruta setWaypointType "MOVE";
    ruta setWaypointBehaviour "CARELESS";
    ruta setWaypointSpeed "FULL";
    
    while {true} do {
        if ((camello distance (getMarkerPos _sitios)) < 30) exitWith {};
        sleep 2;
    };
  
    sleep (60 * 15);

    call _fnc_muevete;
};

[] call _fnc_muevete;