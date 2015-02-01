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

        _pos = position camello;
        _markerID = format["marker_%1",floor(random 1000)];
        _marker = createMarker [ _markerID, _pos];
        _marker setMarkerColor "ColorGreen";
        _marker setMarkerText "CAMELLO";
        _marker setMarkerType "mil_warning";
    
    while {true} do {
        if ((camello distance (getMarkerPos _sitios)) < 30) exitWith {};
        sleep 2;
           _pos = position camello;
         markerCamello1 setMarkerPos _pos;
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

  //marcador
  _markerID = format["marker_%1",floor(random 1000)];
 markerCamello1 = createMarker [ _markerID, _pos];
markerCamello1 setMarkerColor "ColorGreen";
markerCamello1 setMarkerText "CAMELLO";
markerCamello1 setMarkerType "mil_warning";

[] call _fnc_muevete;

