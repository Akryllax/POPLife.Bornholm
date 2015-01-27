/*
	File: fn_raceCheckStatus.sqf
	Author: Akryllax
	Desc: Checks array status.
*/

private["_raceID"];

_raceID = [_this,0,"",[""]] call BIS_fnc_MP;

if(count _raceID == 0) exitWith {};

_size = count racing_current;
_found = false;

for "_i" from 0 to _size do {
	
	_temp = racing_current select _i;
	
	if(_raceID in _temp) then {
		_found = _temp select 1;
	};
};

_found