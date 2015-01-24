/*
	Archivo: fn_protest.sqf
	Autor Rosen
	
	Descripción: Saca un cartel de protesta
	
*/

private ["_sign"];

if (life_protestando) exitWith {};
life_protestando = true;
player playAction "Salute";
closeDialog 0;
titleText["¡Revolucion!","PLAIN"];
_sign = "Land_Poster_04_F" createVehicle [0,0,0];
_sign allowDamage false;
_sign enableSimulation false;
_sign attachTo [player, [0,0,0.6], "righthand"];
_sign setVectorUp [0,90,-1];
//espera 20 segundos;
sleep 20;
deleteVehicle _sign;
life_protestando = false;