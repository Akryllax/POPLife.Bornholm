/*
	Archivo: fn_protestar.sqf
	Autor Rosen
	
	Descripción: Saca un cartel de protesta
	
*/

private ["_sign","_time"];

[] spawn {
	if (life_protestando) exitWith {};
	_time = 20;
	life_protestando = true;
	player playAction "Salute";
	closeDialog 0;
	titleText["¡Revolucion!","PLAIN"];
	_sign = "Land_Poster_04_F" createVehicle [0,0,0];
	_sign allowDamage false;
	_sign enableSimulationGlobal false;
	_sign attachTo [player, [0,0,0.6], "righthand"];
	_sign setVectorUp [0,90,-1];
	while{_time > 0} do {		
		player setVelocity [0,0,0];
		sleep 0.1;
		_time = _time - 1;
	};
	deleteVehicle _sign;
	life_protestando = false;
};
