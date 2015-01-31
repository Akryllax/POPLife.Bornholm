/*
Author: WarBlast

Apañando cosas....
Mandando a la BD el color nuevo ;D
*/
private["_uid","_type","_classname","_color","_plate","_vInfo"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_color = [_this,1,-1,[0]] call BIS_fnc_param;
//Error checks
if(isNull _vehicle) exitWith {diag_log "Intentando repintar un coche invalido. Cancelado!";};
if(!alive _vehicle) exitWith {diag_log "Intentando pintar un coche destruido. Cancelado!";};
_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo == 0) exitWith
{
diag_log "Pintando un coche alquilado?. Cancelado!";
};
_plate = _vInfo select 1;
_uid = _vInfo select 0;
diag_log "Vheiculo repintado";
[_uid,_plate,_color] call DB_fnc_updateVehicleColor;