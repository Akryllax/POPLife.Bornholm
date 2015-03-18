#include <macro.h>
/*
	File: fn_adminKillPlayer.sqf
	Author: Akryllax

	Description: Freezes selected player
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

if(alive _unit) then {
	_unit setDamage 1;
	hint format[localize "STR_ANOTF_KillSucces", _unit getVariable["realname","Error"]];
} else {
	hint format["%1 ya esta muerto.", _unit getVariable["realname", "Error"]];
};