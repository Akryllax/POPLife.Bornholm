/*
camello con rutas random el script de ica tenia las rutas  fijas... 
by ica
edited by quickskill
init: 
camello = this;
_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello.sqf";
*/
_fnc_muevete = {
    _sitios = ["Camello2", "Camello3"] call BIS_fnc_selectRandom;

    ruta = (group camello) addWaypoint [(getMarkerPos _sitios), 0];
    ruta setWaypointType "MOVE";
    ruta setWaypointBehaviour "CARELESS";
    ruta setWaypointSpeed "FULL";


    
    while {true} do {
        if ((camello distance (getMarkerPos _sitios)) < 30) exitWith {};
        sleep 1;
           _pos = position camello;
         markerCamello1 setMarkerPosLocal _pos;
    };

    camello spawn {
    _this lock 2;
    _this setFuel 1;   
    };
  
    sleep (60 * 15);

    call _fnc_muevete;
};

camello spawn {
    _this lock 2;
    _this setFuel 1;   
};


//poner el camello persona inmortal, puta gente k haze bugs se merezen una patada en los huevos, hijosd e puta
 { _x allowDamage false;}forEach crew camello;



[] call _fnc_muevete;

