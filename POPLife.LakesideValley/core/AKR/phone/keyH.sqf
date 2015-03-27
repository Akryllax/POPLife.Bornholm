#include <Keycodes.h>

/*
	File: fn_KeyHandler.sqf
	Author: Akryllax
	Desc: All-in-One keydown handler for civilians.
	Ment to be executed once.
*/

private["_display", "_key", "_shift", "_ctrl", "_alt", "_triggered"];

_display = 	[_this, 0, displayNull, [displayNull]] call BIS_fnc_param;
_key = 		[_this, 1, -1,[-1]] call BIS_fnc_param;
_shift = 	[_this, 2, false,[false]] call BIS_fnc_param;
_ctrl = 	[_this, 3, false,[false]] call BIS_fnc_param;
_alt = 		[_this, 4, false,[false]] call BIS_fnc_param;

_triggered = false;

switch (_key) do {
	case DIK_1: {
		[] call AKR_fnc_acceptCall;
		_triggered = true;
	};
	
	case DIK_2: {
		[] call AKR_fnc_hangCall;
		_triggered = true;
	};
};

_triggered