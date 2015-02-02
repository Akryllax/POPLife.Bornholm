//WoP?
_drg = getPos Drg;
_dst = ["Camello2", "Camello3"] call BIS_fnc_selectRandom;
_grp = group _drg

_marcador1 = "Camello1_mrk";
_pos1 = position _drg;
_marcador = createMarker [ _marcador1, _pos1];
_marcador setMarkerColor "ColorGreen";
_marcador setMarkerText "CAMELLO";
_marcador setMarkerType "mil_warning";

_mov = {
	_via = (group _drg) addWaypoint [(getMarkerPos _dst), 0];
    _ruta setWaypointType "MOVE";
    _ruta setWaypointBehaviour "CARELESS";
    _ruta setWaypointSpeed "FULL";

    while {true} do {
    	if ((_drg distance (getMarkerPos _dst)) < 30) exitWith {};
    		sleep 2;
    		_pos = position _drg;
    		_marcador setMarkerPos _drg;
    };
    sleep 360;
    call _mov;
};
{ _x allowDamage false;}forEach crew _drg;


[] call _mov;