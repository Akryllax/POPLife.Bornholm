#include <macro.h>
/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991

	Description: Freezes selected player
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

[[{disableUserInput false;}],"BIS_fnc_spawn",_unit,false] call life_fnc_MP;
hint format[localize "STR_ANOTF_Unfrozen",_unit getVariable["realname",_unit]];
_unit setVariable["admin_freeze", false,true];