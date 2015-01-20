/*
	File: fn_loadTrack.sqf
	Author: Akryllax
	Desc: Whatever
*/

private["_trackID"];

_trackID = [_this, 0, "", [""]] call BIS_fnc_param;

if(count _trackID == 0) exitWith {};

_i = 1;
_mrkrName = format["%1_%2%3%4", _trackID, if(_i > 99) then [{""}, {"0"}], if(_i > 9) then [{""}, {"0"}], _i];

currentTrack = [];
currentTrackOrbs = [];

while { !(getMarkerPos _mrkrName isEqualTo [0,0,0]) } do {
	_locName = _mrkrName + "_cur";
	currentTrack pushBack _locName;
	_locName = createMarker [_locName, getMarkerPos _mrkrName];
	_locName setMarkerType "hd_dot";
	_locName setMarkerText (format["Waiypoint %1", _i]);
	
	diag_log format["Added waypoint ""%1"" (%2): %3", _locName, _i, getMarkerPos _locName];
	
	_veh = "Sign_Sphere100cm_F" createVehicleLocal (getMarkerPos _locName);
	_veh enableSimulation false;
	_veh setPos ((getPos _veh) vectorAdd [0,0,4]);
	currentTrackOrbs pushBack _veh;
	
	_i = _i + 1;
	_mrkrName = format["%1_%2%3%4", _trackID, if(_i > 99) then [{""}, {"0"}], if(_i > 9) then [{""}, {"0"}], _i];
};

currentOrb = currentTrackOrbs select 0;