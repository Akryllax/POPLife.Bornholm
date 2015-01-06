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

hint format["Has teleportado %1 a tu posicion",_target getVariable["realname",name _target]];

if(vehicle _target != _target) then
{
	_veh = vehicle _target;
	_veh allowDamage false;
	_target allowDamage false;

	_veh setPos (getPos player);	
	moveOut _target;
	waitUntil {isTouchingGround _target};
	_veh allowDamage true;
	sleep 0.5;
	_target allowDamage true;
		
} else {
	
	_target allowDamage false;
	
	_target setPos (getPos player);
	
	waitUntil {isTouchingGround _target};
	_target allowDamage true;
};