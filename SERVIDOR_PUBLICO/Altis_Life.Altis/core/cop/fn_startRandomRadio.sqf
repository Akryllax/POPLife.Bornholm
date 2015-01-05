/*
	File: fn_startRandomRadio.sqf

	Author: Akryllax
	Desc: Just for server calls. It starts random radio.
*/

private["_vehicle"];
_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(side player != west) exitWith{};

[_vehicle] spawn life_fnc_randomRadio;