#include <macro.h>
/*
	File: fn_guidReceive.sqf
	Author: Receives the GUID from the server
	
	Description:
	Gets the GUID of the player.
*/
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_guid = [_this,1,"",[""]] call BIS_fnc_param;
if(_uid == "" || _guid == "") exitWith {};
if(_uid != getPlayerUID player) exitWith {};
__CONST__(life_guid,str(_guid));