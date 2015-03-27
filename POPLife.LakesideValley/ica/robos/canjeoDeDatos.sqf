/*
Canjeo de datos por Icaruk
["menu"] execVM "ica\robos\canjeoDeDatos.sqf";
*/
_param = _this select 0;

if (_param == "menu") exitWith {
	createDialog "hacker";
	_ui = uiNamespace getVariable "hacker";
	_lista = _ui displayCtrl 4085;
	_boton = _ui displayCtrl 4087;

	lbClear _lista;
	_lista lbAdd "Dinero";
	_lista lbSetData [0, "Dinero"];
	_lista lbAdd "Posición de policía (15 min)";
	_lista lbSetData [1, "Posición de policía"];
	_lista lbAdd "Posición de civiles (15min)";
	_lista lbSetData [2, "Posición de civiles"];
	_lista lbAdd "Posición de archivos secretos";
	_lista lbSetData [3, "Posición de archivos secretos"];
};

_revela = {
	_side = _this select 0; // WEST O CIVILIAN
	_tios = [];
	{ if ((isPlayer _x) AND (side _x == _side)) then {
			_tios pushBack _x;
		}; } forEach playableUnits;
	{ player reveal [_x, 1.5] } forEach _tios;
};

if (_param == "verifica") exitWith {
	_entrada = _this select 1;
	_elegido = _this select 2;
	
	
	["datos"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
	_numero = datos select 1;
	
	if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
	if (_elegido == "") exitWith {hint "No has elegido nada, no creo que quieras hacer un donativo"; };
	disableUserInput true;
	
	
	switch (_elegido) do {
		case "Dinero": {
			hint "Te mereces 80.000€ por este código, gracias majo.";
			closeDialog 0;
			life_cash = life_cash + 80000;
			sleep 1;
			disableUserInput false;
		};
		case "Posición de policía": {
			hint "Recibiendo la posición de la policía cada 5 minutos.";
			closeDialog 0;
			sleep 1;
			disableUserInput false;
			[] spawn {	
				_a = 0;
				while {true} do {
					if (_a >= 4) exitWith {hint "Has dejado de recibir la posición de la policía."};
					[WEST] call _revela;
					sleep (60 * 5);
					_a = _a + 1;
				};
			};
		};
		case "Posición de civiles": {
			hint "Recibiendo la posición de los civiles cada 5 minutos.";
			closeDialog 0;
			sleep 1;
			disableUserInput false;
			[_revela] spawn {	
				_revela = _this select 0;
				_a = 0;
				while {true} do {
					if (_a >= 4) exitWith {hint "Has dejado de recibir la posición de los civiles."};
					[CIVILIAN] call _revela;
					sleep (60 * 5);
					_a = _a + 1;
				};
			};
		};
		case "Posición de archivos secretos": {
			hint "Recibida la posición de los documentos secretos.";
			closeDialog 0;
			sleep 1;
			disableUserInput false;
			_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
			titleText [_str, "PLAIN", 2];
			sleep 20;
			_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
			titleText [_str, "PLAIN", 2];
		};
	};	
	datos = []; publicVariableServer "datos"; // borro variable
};
