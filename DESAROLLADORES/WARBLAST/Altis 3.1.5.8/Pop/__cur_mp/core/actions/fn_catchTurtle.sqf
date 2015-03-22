/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];
_obj = cursorTarget;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	[10] call life_fnc_addXP;
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
};