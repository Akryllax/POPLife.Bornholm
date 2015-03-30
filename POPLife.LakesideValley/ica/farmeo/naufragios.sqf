/*
// La "caja" es Land_PlasticCase_01_small_F en la pestaña "Objects (Containers)"
// Los naufragios está en la Pestaña "Wreck (submerged)"
	// Land_Wreck_Traw_F
	caja attachTo [a, [4,-9,-4.1]]; 		// en cabina parte de atrás
	caja attachTo [a, [5.7,-9,-3.6]]; 		// cabina derecha parte de atrás
	caja attachTo [a, [1.4,2.7,4.7]];      //agujero superior
	caja attachTo [a, [-4,-0.5,2.9]];     // Antena 
	caja attachTo [a, [-1,-4,-3]]  		// parte de abajo pasillo
	// Land_Wreck_Traw2_F
	caja attachTo [b, [1.2,-5,-3.9]];  // Parte de Atras Abajo
	caja attachTo [b, [3,-5,2]]; 	// parte de atras arriba
	caja attachTo [b, [-4,-1.5,-2.6]]; // Escalera Abajo
	caja attachTo [b, [0.3,5,-4.2]]; // Atras izquierda 
	caja attachTo [b, [6,6.5,-4.2]]; // atras 

	// Land_UWreck_MV22_F
	caja attachTo [c, [1.2,0.7,-2.9]]; // Puerta trasera
	caja attachTo [c, [2.5,-6.5,-3.3]]; // Puerta laterar
	caja attachTo [c, [2.9,-7.7,-2.2]]; // Cabina
	caja attachTo [c, [4,-1.7,-4.1]]; //Rueda trasera derecha
	caja attachTo [c, [-8,-6,-4.1]]; // hélice izquierda
*/

/*
Naufragios por Icaruk
	["init"] execVM "ica\farmeo\naufragios.sqf";
	["abre"] execVM "ica\farmeo\naufragios.sqf";
*/

_param = _this select 0;

_esconder = {
	private ["_escondite", "_barco"];
	_barco = typeOf _this;

	if (_barco isEqualTo "Land_Wreck_Traw_F") then {
		_escondite = [[4,-9,-4.1], [5.7,-9,-3.6], [1.4,2.7,4.7], [-4,-0.5,2.9], [-1,-4,-3]] call BIS_fnc_selectRandom;
	};
	if (_barco isEqualTo "Land_Wreck_Traw2_F") then {
		_escondite = [[1.2,-5,-3.9], [3,-5,2], [-4,-1.5,-2.6], [0.3,5,-4.2], [6,6.5,-4.2]] call BIS_fnc_selectRandom;
	};	
	if (_barco isEqualTo "Land_UWreck_MV22_F") then {
		_escondite = [[1.2,0.7,-2.9], [2.5,-6.5,-3.3], [2.9,-7.7,-2.2], [4,-1.7,-4.1], [-8,-6,-4.1]] call BIS_fnc_selectRandom;
	};
	_escondite
};

private "_sleep";
if (isNil {_this select 1}) then {
	_sleep = (60 * (15 + (floor random 10)));
} else {
	_sleep = (60 * 50);
};

if (_param isEqualTo "1") exitWith {
	sleep _sleep;
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre1 attachTo [_barco, _barco call _esconder];
};
if (_param isEqualTo "2") exitWith {
	sleep _sleep;
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre2 attachTo [_barco, _barco call _esconder];
};

if (_param isEqualTo "3") exitWith {
	sleep _sleep;
	_barco = [barco1, barco2, barco3, barco4, barco5, barco6] call BIS_fnc_selectRandom;
	cofre3 attachTo [_barco, _barco call _esconder];
};

if (_param isEqualTo "init0") exitWith {
	["1", ""] execVM "ica\farmeo\naufragios.sqf";
	["2", ""] execVM "ica\farmeo\naufragios.sqf";
	["3", ""] execVM "ica\farmeo\naufragios.sqf";
};	

if (_param isEqualTo "init") exitWith {
	["1"] execVM "ica\farmeo\naufragios.sqf";
	["2"] execVM "ica\farmeo\naufragios.sqf";
	["3"] execVM "ica\farmeo\naufragios.sqf";
};	

if (_param isEqualTo "abre") exitWith {
	if (([expMarinero] call ica_expToLevel) < 9) exitWith {hint "Necesitas ser marinero nivel 9"; };
	_cofre = _this select 1;	
	
	_n = 10 + floor(random 10);
	_n = 1;
	[_n, "Buscando..."] call ica_barrita;
	sleep _n;
	
	if ((player distance _cofre) > 20) exitWith {
		if (isNil {exploitOro}) then {exploitOro = []};
		exploitOro pushback [name player];
		publicVariable "exploitOro";
	};
	
	if ([true, "goldbar", 30] call life_fnc_handleinv) then {
		hint format ["Has encontrado %1 lingotes de oro", 30];
		detach _cofre;
		_cofre setPos (getMarkerPos "lejos");	
		
		private "_n";
		switch (_cofre) do {
			case cofre1: {_n = 1; };
			case cofre2: {_n = 2; };
			case cofre3: {_n = 3; };	
		};
		paq = [player, "naufragio", _n]; publicVariableServer "paq"; paq = nil;
	} else {
		hint "No tienes espacio suficiente";
	};	
};


	