/*
Robo de portátil
by: Icaruk

Función: Contiene todo el proceso de robo del portátil

estadoPortatil = [0, "123", "456"]; publicVariableServer "estadoPortatil"; 
["menu"] execVM "ica\robos\roboDePortatil.sqf";
estadoPortatil = [3, "123", "456"]; publicVariableServer "estadoPortatl"; player setposATL (getposATL cajafuerte);
*/

_param = _this select 0;

if (_param == "menu") exitWith {
	if ({side _x == WEST} count playableUnits < 5) exitWith {hint "Tienen que estar al menos 5 policias conectados, si no, no es divertido."};
	
	["estadoPortatil"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	createDialog "portatil";
	_ui = uiNamespace getVariable "portatil";
	_txt = (_ui displayCtrl 4090);
	_txtC = (_ui displayCtrl 4091);
	_boton = (_ui displayCtrl 4093);
	
	if ((estadoPortatil select 0) == 3) exitWith {hint "Ya no hace falta mirar aquí"; }; // fase 3, ya han robado
	if ((estadoPortatil select 0) == 0) then { // fase 0
		_boton buttonSetAction '
			["DSC", ctrlText 4092] execVM "ica\robos\roboDePortatil.sqf";
		';
		_txt ctrlSetText "Introduce código DSC";		
	};
	if ((estadoPortatil select 0) == 1) then { // fase 1 (desencriptando)
		_boton ctrlEnable false;
		(_ui displayCtrl 4092) ctrlEnable false; // entrada
		waitUntil {!isNil {desencriptando}};
		[_txt, _txtC] spawn {	// numeritos random
			_txt = _this select 0;
			_txtC = _this select 1;
			while {!isNil {abierto}} do { // entra cada vez que miras
				if (desencriptando == 100) exitWith {
					_txt ctrlSetText format ["Desencriptado 100%1", "%"];
					_txtC ctrlSetText format ["%1", estadoPortatil select 2];
				};
				_txt ctrlSetText format ["Desencriptando %1%2", desencriptando, "%"];
				_txtC ctrlSetText ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
				sleep 0.1;
			};
		};
	};
};

if (_param == "DSC") exitWith {
	_ui = uiNamespace getVariable "portatil";
	_txt = (_ui displayCtrl 4090);
	_txtC = (_ui displayCtrl 4091);
	_entrada = (_this select 1);

	["estadoPortatil"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	if ((estadoPortatil select 0) == 0) then { // fase 0
		if (_entrada != (estadoPortatil select 1)) exitWith {hint "Acceso denegado"; };
		// acierto el código y avanzo a la fase 1
		estadoPortatil = [1, estadoPortatil select 1, estadoPortatil select 2]; publicVariableServer "estadoPortatil";
		closeDialog 0;
		paq = [player, "portatil", "loop"]; publicVariableServer "paq"; paq = nil;
		hint format ["Acceso permitido. \nDesencriptando..."];
		
		paq = [player, "anuncioPolicia", 
			[10, "Aviso", [1,0,0], 1.5, "Están intentando acceder al sistema informático del alcalde", [1,1,1], 1]
		]; publicVariableServer "paq"; paq = nil;
		
		sleep 30;
		
		paq = [player, "anuncioPolicia", 
			[10, "Aviso", [1,0,0], 1.5, "Están intentando acceder al sistema informático del alcalde", [1,1,1], 1]
		]; publicVariableServer "paq"; paq = nil;
	};
};

if (_param == "cajafuerteMenu") exitWith {
	["estadoPortatil"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	if ((estadoPortatil select 0) == 3) exitWith {}; // fase 3, ya han robado
	if ((estadoPortatil select 0) == 2) exitWith { hint "Parece que la cerradura tiene una apertura retardada de 5 minutos."; };
	createDialog "cajafuerte";
	_ui = uiNamespace getVariable "cajafuerte";
	_boton = (_ui displayCtrl 4096);
	_boton buttonSetAction '
		["cajafuerte", ctrlText 4097] execVM "ica\robos\roboDePortatil.sqf";
	';
};

if (_param == "cajafuerte") exitWith {
	_entrada = _this select 1;
	
	["estadoPortatil"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;

	if (_entrada != (estadoPortatil select 2)) exitWith {hint "Acceso denegado"; };
	closeDialog 0;
	hint "Las cajas fuertes Kuraci de máxima seguridad disponen de una apertura retardada de 5 minutos, por su seguridad.";
	// acierto el segundo código y paso a la fase 2
	estadoPortatil = [2, estadoPortatil select 1, estadoPortatil select 2]; publicVariableServer "estadoPortatil";	
	
	paq = [player, "portatil", "cajaloop"]; publicVariableServer "paq"; paq = nil;
};

if (_param == "loop") exitWith {
	
	
	desencriptando = 0;
	while {true} do {
		if (desencriptando >= 100) exitWith {};
		if (isNil {desencriptando}) exitWith {};
		desencriptando = desencriptando + 1;
		publicVariable "desencriptando";
		sleep 3;
	};
};

if (_param == "cajaloop") exitWith {
	sleep (60 * 5);
	estadoPortatil = [3, estadoPortatil select 1, estadoPortatil select 2];	// paso a fase 3
};

if (_param == "roboDinero") exitWith {
	if (!isNil {ocupado}) exitWith {hint "No puedes abrir algo que ya estás abriendo, se abriría una brecha espaciotemporal y... ya sabes."};
	ocupado = true;
	
	["fondosPublicos"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	["estadoPortatil"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	_t = 4 + round (random 4);
	[_t, "Abriendo..."] call ica_barrita;
	sleep _t;
	
	if ((estadoPortatil select 0) != 3) exitWith {hint "Está cerrada. Muy cerrada."; ocupado = nil };
	
	// cajaFuerte setPos (getMarkerPos "lejos");
	itemDocumentos setPos (getMarkerPos "lejos");
	
	paq = [player, "portatil", "reset"]; publicVariableServer "paq"; paq = nil;

	_din = fondosPublicos;
	fondosPublicos = 0;
	publicVariable "fondosPublicos";
	
	life_cash = life_cash + _din;
	hint format ["Has robado %1€", _din];
	
	[[["useATM"], "ica\robos\roboDePortatil.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
	ocupado = nil;
};

if (_param isEqualTo "useATM") exitWith {
	if ((player distance Portatilalcade) < 60) then {
		[] spawn {
			life_use_atm = false;
			sleep (60 * 10);
			life_use_atm = true;
		};
	};
};