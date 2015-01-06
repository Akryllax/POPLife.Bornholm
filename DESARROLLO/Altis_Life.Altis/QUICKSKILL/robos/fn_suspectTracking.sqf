/*
	File: fn_supectTracking.sqf
	Author : Akryllax
	Desc: Keeps track of the robber. Optimally, executed on server.
*/

private ["_player", "_time", "_mkrArray", "_mrkPrefix"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_time 	= [_this, 1, -1, [-1]] call BIS_fnc_param;
_mkrArray = [];

if(isNull _player) exitWith {};
if(_time < 0) exitWith {};

_mrkPrefix = format["tracker_%1_", _player getVariable["realname", "ERROR"]];

_timestamp = time;

_AKR_clearDead = {
	_name = [_this, 0, "", [""]] call BIS_fnc_param;

	_i = 1;
	_markerID = getMarkerPos format["%1%2",_mrkPrefix, _i];
	while{!((getMarkerPos _markerID) isEqualTo [0,0,0])} do {
		_markerID = format["marker_%1",_i];
	};
};

while {time < _timestamp + _time} do {
	
};

_timestamp = time;

while {time < _timestamp + _time} do {
	
};