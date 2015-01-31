/*
	File: fn_randomRadio.sqf
	
	Author: Akryllax
	Desc: Plays background police random radio.

*/

private["_vehicle, _delay"];

_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {}; //Dafuk... Null call.

_delay = random 5 * 60;
if(_delay < 30) then { _delay = _delay + 30;};

while{ alive _vehicle} do
{
	sleep _delay;
	
	if(isEngineOn _vehicle) then
	{
		_sound = format["policeradio%1", (floor (random 3) + 1)];
		[[_sound, _vehicle], "life_fnc_play3DSound", nil, false] call life_fnc_MP;
	};
};