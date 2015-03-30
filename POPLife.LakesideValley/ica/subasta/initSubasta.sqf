
_param = _this select 0;

_tiempoSubasta = (60 * 15);
_tiempoReset = (60 * 60);

// _tiempoEspera = 10;
// _tiempoSubasta = 10;
// _tiempoReset = 10;

if (_param isEqualTo "init") exitWith {
	
	subastaActual = "";
	campo = ["", 0, _tiempoSubasta];
	purificadora = ["", 0, _tiempoSubasta];
	refineria = ["", 0, _tiempoSubasta];
	farmacia = ["", 0, _tiempoSubasta];
	mina = ["", 0, _tiempoSubasta];

	benCampo = 0;
	benPurificadora = 0;
	benRefineria = 0;
	benFarmacia = 0;
	benMina = 0;
};

if (_param isEqualTo "campo") exitWith {
	paq = [player, "anuncio", 
		[8, "Aviso subasta", [1,0,0], 2, "La subasta del campo empezará en 5 minutos", [1,1,1], 1.6]
	]; publicVariableServer "paq"; paq = nil;
	
	while {true} do {
		campo = [campo select 0, campo select 1, (campo select 2) - 1]; // [subasta, tiempo]
		
		if ((campo select 2) <= 0) exitWith {			// tiempo llega a 0 y acabo el loop
			_gente = [];
			{_gente = _gente + [name _x]} forEach PlayableUnits;
			
			if ((campo select 0) in _gente) then {
				[[campo select 0, campo select 1], 'ica_ganoSubasta', true, true] call BIS_fnc_MP; // [quien, cuanto]
				subastaActual = "";
				publicVariableServer "subastaActual";
				sleep _tiempoReset;
				campo = ["", 0, _tiempoSubasta];
			} else {
				subastaActual = "";
				publicVariableServer "subastaActual";
				campo = ["", 0, _tiempoSubasta];
				["La subasta del campo se tiene que reiniciar porque el ganador ha dejado de existir (no es broma).","systemChat",nil,false] call BIS_fnc_MP;
			};
		};
		sleep 1;
	};	
};


if (_param isEqualTo "purificadora") exitWith {
	paq = [player, "anuncio", 
		[8, "Aviso subasta", [1,0,0], 2, "La subasta de la purificadora empezará en 5 minutos", [1,1,1], 1.6]
	]; publicVariableServer "paq"; paq = nil;
	
	while {true} do {
		purificadora = [purificadora select 0, purificadora select 1, (purificadora select 2) - 1];
		
		if ((purificadora select 2) <= 0) exitWith {			// tiempo llega a 0 y acabo el loop
			_gente = [];
			{_gente = _gente + [name _x]} forEach PlayableUnits;
			
			if ((purificadora select 0) in _gente) then {
				[[purificadora select 0, purificadora select 1], 'ica_ganoSubasta', true, true] call BIS_fnc_MP; // [quien, cuanto]
				subastaActual = "";
				publicVariableServer "subastaActual";
				sleep _tiempoReset;
				purificadora = ["", 0, _tiempoSubasta];
			} else {
				subastaActual = "";
				publicVariableServer "subastaActual";
				purificadora = ["", 0, _tiempoSubasta];
				["La subasta de la purificadora se tiene que reiniciar porque el ganador ha dejado de existir (no es broma).","systemChat",nil,false] call BIS_fnc_MP;
			};
		};
		sleep 1;
	};	
};

if (_param isEqualTo "refineria") exitWith {
	paq = [player, "anuncio", 
		[8, "Aviso subasta", [1,0,0], 2, "La subasta de la refineria empezará en 5 minutos", [1,1,1], 1.6]
	]; publicVariableServer "paq"; paq = nil;
	
	while {true} do {
		refineria = [refineria select 0, refineria select 1, (refineria select 2) - 1];
		
		if ((refineria select 2) <= 0) exitWith {			// tiempo llega a 0 y acabo el loop
			_gente = [];
			{_gente = _gente + [name _x]} forEach PlayableUnits;
			
			if ((refineria select 0) in _gente) then {
				[[refineria select 0, refineria select 1], 'ica_ganoSubasta', true, true] call BIS_fnc_MP; // [quien, cuanto]
				subastaActual = "";
				publicVariableServer "subastaActual";
				sleep _tiempoReset;
				refineria = ["", 0, _tiempoSubasta];
			} else {
				subastaActual = "";
				publicVariableServer "subastaActual";
				refineria = ["", 0, _tiempoSubasta];
				["La subasta de la refineria se tiene que reiniciar porque el ganador ha dejado de existir (no es broma).","systemChat",nil,false] call BIS_fnc_MP;
			};
		};
		sleep 1;
	};	
};


if (_param isEqualTo "farmacia") exitWith {
	paq = [player, "anuncio", 
		[8, "Aviso subasta", [1,0,0], 2, "La subasta de la farmacia empezará en 5 minutos", [1,1,1], 1.6]
	]; publicVariableServer "paq"; paq = nil;
	
	while {true} do {
		farmacia = [farmacia select 0, farmacia select 1, (farmacia select 2) - 1];
		
		if ((farmacia select 2) <= 0) exitWith {			// tiempo llega a 0 y acabo el loop
			_gente = [];
			{_gente = _gente + [name _x]} forEach PlayableUnits;
			
			if ((farmacia select 0) in _gente) then {
				[[farmacia select 0, farmacia select 1], 'ica_ganoSubasta', true, true] call BIS_fnc_MP; // [quien, cuanto]
				subastaActual = "";
				publicVariableServer "subastaActual";
				sleep _tiempoReset;
				farmacia = ["", 0, _tiempoSubasta];
			} else {
				subastaActual = "";
				publicVariableServer "subastaActual";
				farmacia = ["", 0, _tiempoSubasta];
				["La subasta de la farmacia se tiene que reiniciar porque el ganador ha dejado de existir (no es broma).","systemChat",nil,false] call BIS_fnc_MP;
			};
		};
		sleep 1;
	};	
};

if (_param isEqualTo "mina") exitWith {
	paq = [player, "anuncio", 
		[8, "Aviso subasta", [1,0,0], 2, "La subasta de la mina empezará en 5 minutos", [1,1,1], 1.6]
	]; publicVariableServer "paq"; paq = nil;
	
	while {true} do {
		mina = [mina select 0, mina select 1, (mina select 2) - 1];
		
		if ((mina select 2) <= 0) exitWith {			// tiempo llega a 0 y acabo el loop
			_gente = [];
			{_gente = _gente + [name _x]} forEach PlayableUnits;
			
			if ((mina select 0) in _gente) then {
				[[mina select 0, mina select 1], 'ica_ganoSubasta', true, true] call BIS_fnc_MP; // [quien, cuanto]
				subastaActual = "";
				publicVariableServer "subastaActual";
				sleep _tiempoReset;
				mina = ["", 0, _tiempoSubasta];
			} else {
				subastaActual = "";
				publicVariableServer "subastaActual";
				mina = ["", 0, _tiempoSubasta];
				["La subasta de la mina se tiene que reiniciar porque el ganador ha dejado de existir (no es broma).","systemChat",nil,false] call BIS_fnc_MP;
			};
		};
		sleep 1;
	};	
};

while {true} do {
	if (!isNil {iniciaSubasta}) then {
		switch (iniciaSubasta) do {
			case "campo": { call _iniciaCampo	};
			case "purificadora": { call _iniciaPurificadora	};
			case "refineria": { call _iniciaRefineria	};
			case "farmacia": { call _iniciaFarmacia	};
			case "mina": { call _iniciaMina	};
		};
	};	
	sleep 10;
};
