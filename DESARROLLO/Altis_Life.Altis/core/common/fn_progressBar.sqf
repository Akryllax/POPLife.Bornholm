/*
	File: fn_doingStuffAnimation.sqf
	Author: Akryllax, base on Bryan "Tonic" Boardwine.
	Desc: Progressbar functions
	
	Params:
		·DURATION - NUMBER:
			Time (in seconds) of the duration of the action.
		·(EXECUTE_WHILE - SCRIPT/STRING):
			Code to execute on each while loop.
		·(CONDITIONAL - SCRIPT):
			<...> while CONDITION do { <...>
		·(IS_INLINE_CALL - BOOLEAN):
			If true, this will return a value of status done.
		·RATE - NUMBER:
			Fraction to add each cycle.
		·CYCLE_RATE - NUMBER:
			Sleep time each loop.	
*/

private["_duration", "_executeWhile", "_conditional", "_isInlineCall", "_onSucess", "_onCanceled"];

_duration = [_this, 0, -1, [-1]] call BIS_fnc_param;
_executeWhile = [_this, 1, scriptNull , [scriptNull]] call BIS_fnc_param;
_conditional = [_this, 2, scriptNull, ["", scriptNull]] call BIS_fnc_param;
_isInlineCall = [_this, 3, false, [false]] call BIS_fnc_param;
_onSucess = [_this, 4, scriptNull, [scriptNull]] call BIS_fnc_param;
_onCanceled = [_this, 5, scriptNull, [scriptNull]] call BIS_fnc_param;

if(_duration < 0) exitWith {};
if( typeName _conditional == "STRING") then {
	_conditional = compile _conditional;
} else if(isNull _conditional) exitWith {
	
};

_flagCanceled = false;
while _conditional do {
	if(!isNull _executeWhile) then {
		[] call _executeWhile;
	};
};
