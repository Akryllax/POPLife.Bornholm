/*
camello con rutas random el script de ica tenia las rutas  fijas... 
by ica
edited by quickskill
init: 
camello2 = this;
_camelloMuevete = execVM "QUICKSKILL\camello\caminoCamello2.sqf";
*/
_fnc_muevete = {
    _sitios = ["Camello1","Camello4"] call BIS_fnc_selectRandom;

        _pos = position camello2;
       

    ruta2 = (group camello) addWaypoint [(getMarkerPos _sitios), 0];
    ruta2 setWaypointType "MOVE";
    ruta2 setWaypointBehaviour "CARELESS";
    ruta2 setWaypointSpeed "FULL";
    
    while {true} do {
        if ((camello2 distance (getMarkerPos _sitios)) < 30) exitWith {};
        sleep 2;
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

 //marcador
  _markerID = format["marker_%1",floor(random 1000)];
 markerCamello2 = createMarker [ _markerID, _pos];
markerCamello2 setMarkerColor "ColorGreen";
markerCamello2 setMarkerText "CAMELLO";
markerCamello2 setMarkerType "mil_warning";

[] call _fnc_muevete;

