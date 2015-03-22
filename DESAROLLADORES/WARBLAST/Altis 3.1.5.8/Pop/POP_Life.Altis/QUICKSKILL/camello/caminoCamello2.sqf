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
    ruta2 setWaypointBehaviour "SAFE";
    ruta2 setWaypointSpeed "NORMAL";
    
    while {true} do {
        if ((camello2 distance (getMarkerPos _sitios2)) < 50) exitWith {};
        sleep 1;
        _pos = position camello2;
         markerCamello2 setMarkerPos _pos;

                  //si tiene gente cerca parate macho, keres un asesino
         
         { //start for de cada jugador

            if (isPlayer _x) then {
                _dist = _x distance camello2;
                    if(_dist<40)then{

                         camello2 setfuel 0;


                         if(true)exitWith{};

                     }else{

                        camello2 setfuel 1;

                     };
            };  

      } forEach playableUnits;
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
 { _x allowDamage false;_x setBehaviour "SAFE";}forEach crew camello2;

camello2 setBehaviour "SAFE";

[] call _fnc_muevete;

