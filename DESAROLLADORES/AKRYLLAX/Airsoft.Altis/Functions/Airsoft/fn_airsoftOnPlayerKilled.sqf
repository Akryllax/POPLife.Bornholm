/*

*/
private["_unit","_killer"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_killer = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if(_unit == _killer) exitWith {hint "You have commited suicide.";};
if(group _unit == group _killer) exitWith {hint "Fucking teamkillers..."};
if(group _unit != group _killer) then {
	
	//TODO: Add some point to the _killer for killing you ;)
	//TODO: Remove some money... :(
	
	//Respawn:
	[_unit] spawn {sleep 30; try{ deleteVehicle _this select 0;} catch {};};
	
	
};