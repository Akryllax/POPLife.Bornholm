/*
Minijuego para picar, hay que pulsar el botón cuando la barra que se llena y que se vacía rápidamente esté a tope
by: Icaruk

["menu", "nombreDeMineral"] execVM "ica\farmeo\picando.sqf";
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	if (vehicle player != player) exitWith {hint "¿Pretendes picar desde el vehículo? ¿Por la ventanilla? Venga va, no me seas vago..." };
	if ((life_inv_pickaxe == 0) AND (([expMineria] call ica_expToLevel) != 10)) exitWith {hint "No tienes pico o puños de titanio"};
	if (!isNil {picando}) exitWith {hint "Ya estás picando"};
	if (!isNil {ocupado}) exitWith {hint "Estás ocupado"};
	[] spawn {
		picando = true;
		sleep 3;
		picando = nil;
	};
	mineral = _this select 1;
	
	private ["_puedoCarbon", "_puedoArena", "_puedoHierro", "_puedoPolvora", "_fuera"];
	_miNivel = [expMineria] call ica_expToLevel;

	if (_miNivel >= 1) then {_puedoCarbon = true; 	};
	if (_miNivel >= 3) then {_puedoArena = true;	};
	if (_miNivel >= 5) then {_puedoHierro = true;	};
	if (_miNivel >= 8) then {_puedoPolvora = true;	};
	if ((mineral == "carbon") and (isNil {_puedoCarbon})) exitWith {hint "Necesitas minería nivel 1"; _fuera = true; };
	if ((mineral == "arena") and (isNil {_puedoArena})) exitWith {hint "Necesitas minería nivel 3"; _fuera = true; };
	if ((mineral == "hierro") and (isNil {_puedoHierro})) exitWith {hint "Necesitas minería nivel 5"; _fuera = true; };
	if ((mineral == "polvora") and (isNil {_puedoPolvora})) exitWith {hint "Necesitas minería nivel 7"; _fuera = true; };
	
	if (!isNil {_fuera}) exitWith {};
	
	createDialog "picando";
	_ui = uiNameSpace getVariable "picando";
	_barrita = (_ui displayCtrl 4050);
	_boton = (_ui displayCtrl 4051);

	_boton buttonSetAction '
		["pica", mineral] execVM "ica\farmeo\picando.sqf"
	';

	_n = 0;
	_sentido = 1;
	while {!isNil {abierto}} do {

		if ((progressPosition _barrita) == 0) then {
			_sentido = 1;
		};
		if ((progressPosition _barrita) == 1) then {
			_sentido = 0;
		};
		
		_rnd = (2 + round (random 8)) / 100;
		if (_sentido == 1) then {
			_n = _n + _rnd;
		} else {
			_n = _n - _rnd;
		};
		
		_barrita progressSetPosition _n;
		sleep 0.001;
	};
};

if (_param isEqualTo "pica") exitWith {
	if (!isNil {ocupado}) exitWith {hint "Estás ocupado, o has intentado hacer alguna movida."; closeDialog 0; };
	picando = true;
	
	_mineral = _this select 1;
	
	_ui = uiNameSpace getVariable "picando";
	_barrita = (_ui displayCtrl 4050);
	_pos = ((progressPosition _barrita) * 10);
	_pos = _pos + round (- 3 + (random 3));
	if (_pos > 10) then {_pos = 10};
	if (_pos < 0) then {_pos = 0};
	_tmin = 15;
	_n = 3;
	
	closeDialog 0;
	
	_miNivel = [expMineria] call ica_expToLevel;
	if (_miNivel == 0) exitWith {hint "No puedes picar nada"; };
	if (_miNivel >= 2) then {_tmin = 14; 	};	
	if (_miNivel >= 4) then {if ((floor (random 100)) <= 7) then {_n = 4;	};	};
	if (_miNivel >= 6) then {if ((floor (random 100)) <= 15) then {_n = 4;	};	};	
	if (_miNivel >= 7) then {_tmin = 13; 	};	
	if (_miNivel >= 9) then {if (_pos > 9) then {_n = _n + 2;	};	};
	
	_tiempo = _tmin - _pos;
	hint format ["Eficacia: %1\n\nTiempo para picar: %2s", _pos, _tiempo ];
	
	_tiempo = round _tiempo;
	while {true} do {
		if (_tiempo <= 0) exitWith {
			_str = format ["Has conseguido %1 minerales", _n];
			titleText [_str, "PLAIN DOWN", 0.6];
			ocupado = nil;
			picando = nil;
			
			if (_mineral != "arena") then  {
				[true, _mineral, _n] call life_fnc_handleInv;
			} else {
				[true,"sand", _n] call life_fnc_handleInv;
			};

			if ((floor (random 100)) < 8) then {
				["Fortaleza", 1] call ica_dameExp;
			};
			mineral = nil;
		};
		
		_str = format ["Picando... (%1s) ", _tiempo];
		titleText [_str, "PLAIN DOWN", 0.6];
		_tiempo = _tiempo - 1;
		sleep 1;
		ocupado = true;
	};	
};

