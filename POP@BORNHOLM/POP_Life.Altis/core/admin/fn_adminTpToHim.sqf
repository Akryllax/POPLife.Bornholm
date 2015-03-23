#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991

	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {hint localize "STR_ANOTF_Error";};

_moved = true;

if(vehicle _target != _target) then 
{
	_moved = player moveInAny vehicle _target;
} else {
	player setPos (getPos _target);
};

if(vehicle player == player) then {
	if(_moved) then {hint format["Te has teleportado a la posicion de %1.",_target getVariable["realname",name _target]];}
	else {hint format["%1 esta en un vehiculo y no hay sitio. TP cancelado.",_target getVariable["realname",name _target]];};
	
} else {
	hint format["Te has teleportado al vehiculo de %1.",_target getVariable["realname",name _target]];
};