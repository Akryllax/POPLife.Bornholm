/*
	Archivo: fn_protestar.sqf
	Autor Rosen
	
	Descripción: Saca un cartel de protesta
	
*/

private ["_sign","_time"];

[] spawn {
	if (life_protestando) exitWith {};
	life_protestando = true;
	player playAction "Salute";
	disableUserInput true;
	closeDialog 0;
	titleText["¡Revolucion!","PLAIN"];
	_sign = "Land_Poster_04_F" createVehicle [0,0,0];
	_sign allowDamage false;
	_sign enableSimulationGlobal false;
	_sign attachTo [player, [0,0,0.6], "righthand"];
	_sign setVectorUp [0,90,-1];
	//esperar 10 seg
	sleep 10;
	deleteVehicle _sign;
	disableUserInput false
	life_protestando = false;
};
