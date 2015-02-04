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
    ruta setWaypointBehaviour "SAFE";
    ruta setWaypointSpeed "NORMAL";


    
    while {true} do {
        if ((camello distance (getMarkerPos _sitios)) < 30) exitWith {};
        sleep 1;
           _pos = position camello;
         markerCamello1 setMarkerPos _pos;

         //si tiene gente cerca parate macho, keres un asesino
         
         { //start for de cada jugador

            if (isPlayer _x) then {
                _dist = _x distance camello;
                    if(_dist<20)then{

                         camello setfuel 0;

                         if(true)exitWith{};

                     }else{

                        camello setfuel 1;

                     };
            };  

      } forEach playableUnits;
    };//end while

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
 { _x allowDamage false;_x setBehaviour "SAFE";}forEach crew camello;

camello setBehaviour "SAFE";


[] call _fnc_muevete;

