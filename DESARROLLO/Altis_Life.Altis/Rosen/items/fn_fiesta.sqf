/*
	Archivo: fn_fiesta.sqf
	Autor Rosen
	
	Descripción: Dance dance revolution!
*/

private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren"}) exitWith {};

while {true} do
{
	if(!(_vehicle getVariable "siren")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "bailar";
	player playMove "ActsPercMstpSnonWnonDnon_DancingStefan";
	sleep 60;
	if(!(_vehicle getVariable "siren")) exitWith {};
};