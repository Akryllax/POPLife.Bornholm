/**
* Archivo: fn_presidente.sqf
* Autor: Rosen
* Descripcion: Inicializa el presidente
*
**/

if(__GETC__(life_presidente) == 0) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};
