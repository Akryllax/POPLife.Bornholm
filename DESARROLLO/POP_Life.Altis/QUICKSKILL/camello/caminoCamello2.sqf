/*
camello con rutas random el script de ica tenia las rutas  fijas... 
by ica
edited by quickskill
init: 
camello2 = this;
_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello2.sqf";
*/
_fnc_muevete = {
    _sitios2 = ["Camello1","Camello4"] call BIS_fnc_selectRandom;

        _pos = position camello2;
       

    ruta2 = (group camello2) addWaypoint [(getMarkerPos _sitios2), 0];
    ruta2 setWaypointType "MOVE";
    ruta2 setWaypointBehaviour "CARELESS";
    ruta2 setWaypointSpeed "FULL";
    
    while {true} do {
        if ((camello2 distance (getMarkerPos _sitios2)) < 30) exitWith {};
        sleep 1;
        _pos = position camello2;
         markerCamello2 setMarkerPos _pos;
    };

    camello2 spawn {
    _this lock 2;
    _this setFuel 1;   
    };
  
    sleep (60 * 15);

    call _fnc_muevete;
};

camello2 spawn {
    _this lock 2;
    _this setFuel 1;   
};


//poner el camello persona inmortal, puta gente k haze bugs se merezen una patada en los huevos, hijosd e puta
 { _x allowDamage false;}forEach crew camello2;

_handlerHitCamello2 = camello2 addMPEventHandler ["MPHit",{

// hint format ["%1 was hit by %2",name (_this select 0),name (_this select 1)];
 _troller = _this select 1;
 _troller setDamage +=0.6;

}];

[] call _fnc_muevete;

