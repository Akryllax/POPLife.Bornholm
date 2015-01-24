/*
	File: fn_protest.sqf
	Author: John "Paratus" VanderZwet// Modificado por Rosen
	
	Description:
	Holds a random protest sign!
*/

private ["_sign"];

if (life_protestando) exitWith {deleteVehicle _sign;life_protestando = false;};
life_protestando = true;
player playAction "Salute";
closeDialog 0;
titleText["¡Revolucion!","PLAIN"];
_sign = "Land_Poster_04_F" createVehicle [0,0,0];
_sign attachTo [player, [0,0,0.6], "righthand"];
_sign setVectorUp [0,90,-1];
