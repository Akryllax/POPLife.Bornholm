/*
	File: fn_protest.sqf
	Author: John "Paratus" VanderZwet// Modificado por Rosen
	
	Description:
	Holds a random protest sign!
*/

private ["_started", "_sign"];

if (life_protestando) exitWith {};

_started = time;
life_protestando = true;
player playAction "Salute";
closeDialog 0;
titleText["Revolucion!","PLAIN"];
_sign = "Land_Poster_04_F" createVehicle [0,0,0];
_sign attachTo [player, [0,0,0.6], "righthand"];
_sign setVectorUp [0,90,-1];
sleep 60*2;
deleteVehicle _sign;
life_protestando = false;