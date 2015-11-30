/*
	Archivo: fn_silla.sqf
	Autor Rosen
	
	Descripción: Saca una silla para sentarse
	
*/
/*
private ["_silla","_direc","_tiempo"];
[] spawn {
	if (life_sentarse) exitWith {};
	life_sentarse = true;
	_tiempo = 300;
	player switchMove "Crew";
	closeDialog 0;
	titleText["A sentarse","PLAIN"];
	_silla = "Land_CampingChair_V2_F" createVehicle [0,0,0];
	_silla allowDamage false;
	_silla enableSimulationGlobal false;
	_silla attachTo [player, [0,0,0.5], "culo"];
	_silla setVectorUp [0,180,0];
	while {_tiempo > 0} do {		
		_direc = getDir player;
		_silla setDir _direc;
		_tiempo = _tiempo - 1;
	};		
	sleep 1;
	deleteVehicle _silla;
	player switchMove "";
	life_sentarse = false;
};*/