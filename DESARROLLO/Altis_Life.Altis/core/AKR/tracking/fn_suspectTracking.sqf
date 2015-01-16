/*
	File: fn_supectTracking.sqf
	Author : Akryllax
	Desc: Keeps track of the robber. Optimally, executed on server.
*/

private ["_player", "_time", "_mkrArray", "_mrkPrefix"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_time 	= [_this, 1, -1, [-1]] call BIS_fnc_param;

_colorArray = ["ColorRed", "ColorGreen", "ColorYellow", "ColorBlue", "ColorOrange", "ColorPink", "Color4_FD_F"];
_color = _colorArray select (floor (random(count _colorArray)));

if(isNull _player) exitWith {};
if(_time < 0) exitWith {};

_AKR_clearDead = {
	_prefix = [_this, 0, "", [""]] call BIS_fnc_param;

};

_mrkPrefix = format["tracker_%1_", _player getVariable["realname", "ERROR"]];
_timestamp = time;

_i = 1;
_markerID = format["%1%2",_mrkPrefix, _i];
while{!((getMarkerPos _markerID) isEqualTo [0,0,0])} do {
	_i = _i + 1;
	_markerID = format["%1%2",_mrkPrefix, _i];
};

while {time < _timestamp + _time} do {
	
	if!(alive _player) exitWith {};

	_tempMrkr = createMarker[_markerID, getPos _player];
	_tempMrkr setMarkerType "hd_dot";
	_tempMrkr setMarkerColor _color;
	
	_i = _i + 1;
	_markerID = format["%1%2",_mrkPrefix, _i];
sleep 0.5;
};

_timestamp = time;
_i = 1;
_markerID = format["%1%2",_mrkPrefix, _i];

while {(time < _timestamp + _time) && (!((getMarkerPos _markerID) isEqualTo [0,0,0]))} do {
	
	if!(alive _player) exitWith {};

	deleteMarker _markerID;
	
	_i = _i + 1;
	_markerID = format["%1%2",_mrkPrefix, _i];
	sleep 0.5;
};