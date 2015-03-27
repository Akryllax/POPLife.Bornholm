
_param = _this select 0;

_pos = [
	[8458.48,6375.68,0.488497],
	[8618.25,6401.71,0.916515],
	[8324.54,6021.59,0.00143909],
	[8037.47,6222.47,0.214217],
	[8166.32,6414.38,0.00143909],
	[8745.63,6719.23,0.0267],
	[8537.75,6690.04,3.70144],
	[8491.38,6584.41,0.380289],
	[8636.52,6836.61,0.101439],
	[8695.51,6800.69,0.10144]
] call BIS_fnc_selectRandom;

if (_param == "reset0") exitWith {
	desencriptando = nil; 
	publicVariable "desencriptando";

	sleep (60 * 15);
	
	cajaFuerte setPos [7973.94,5374.09,4.52424];
	itemDocumentos setPos _pos;
	_codigoDSC = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	_codigoSEG = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	estadoPortatil = [0, _codigoDSC, _codigoSEG];
};

if (_param == "reset") exitWith {
	desencriptando = nil; 
	publicVariable "desencriptando";
	cajaFuerte setPos (getMarkerPos "lejos");
	estadoPortatil = [99, estadoPortatil select 1, estadoPortatil select 2]; publicVariableServer "estadoPortatil";

	sleep (60 * 45);
	
	cajaFuerte setPos [7973.94,5374.09,4.52424]; // vuelta a su sitio
	itemDocumentos setPos _pos;
	_codigoDSC = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	_codigoSEG = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	estadoPortatil = [0, _codigoDSC, _codigoSEG];
};

if (_param == "loop") exitWith {
	fondosPublicos = 0;
	while {true} do {
		_g = ((WEST countSide playableUnits) + (EAST countSide playableUnits) + (CIVILIAN countSide playableUnits));
		fondosPublicos = fondosPublicos + (500 * _g); //  ((500 * 5) * 12) * 50 personas = 1.500.000 cada hora
		sleep (60 * 5);
	};	
};

if (_param == "policia") exitWith {
	if ((side player) != WEST) exitWith {hint "¿Para qué vas a querer hacer eso?"; };
	
	["estadoPortatil"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	if ((estadoPortatil select 0) == 0) exitWith {hint "Nadie ha robado nada, no sé que estás intentando..."; };
	
	desencriptando = nil;
	publicVariable "desencriptando";
	
	itemDocumentos setPos _pos;
	_codigoDSC = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	_codigoSEG = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	estadoPortatil = [0, _codigoDSC, _codigoSEG];
};


