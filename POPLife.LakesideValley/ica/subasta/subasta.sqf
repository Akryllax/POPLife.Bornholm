
/*
Sistema de subasta
by: Icaruk

Función: Dependiendo del parámetro, se puja en una subasta u otra.
["menu", "campo"] execVM "ica\subasta\subasta.sqf";
*/

_param = _this select 0;
_nPuja = 4000;


private "_subastaActual";

if (_param == "menu") exitWith {
	_cosa = _this select 1; // campo, purificadora, refineria, farmacia, mina
	["subastas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	private ["_str1", "_str2", "_str3"];
	switch (_cosa) do {
		case "campo": { _str1 = campo select 0; _str2 = campo select 1; _str3 = campo select 2; };
		case "purificadora": { _str1 = purificadora select 0; _str2 = purificadora select 1; _str3 = purificadora select 2; };
		case "refineria": { _str1 = refineria select 0; _str2 = refineria select 1; _str3 = refineria select 2; };
		case "farmacia": { _str1 = farmacia select 0; _str2 = farmacia select 1; _str3 = farmacia select 2; };
		case "mina": { _str1 = mina select 0; _str2 = mina select 1; _str3 = mina select 2; };
	};
	
	createDialog "subasta";
	disableSerialization;
	_ui = uiNameSpace getVariable "subasta";
	_tiempo = (_ui displayCtrl 4055);
	_cabecera = (_ui displayCtrl 4052);
	_pujatxt = (_ui displayCtrl 4053);
	_boton = (_ui displayCtrl 4054);
	
	cosa = _cosa;
	
	if (subastaActual  == _cosa) then { // si hay subasta muestro su tiempo, si no, no
		_tiempo ctrlSetText format ["Tiempo: %1 min", round(_str3 / 60)];
	} else {
		_tiempo ctrlSetText "";
	};
	
	_cabecera ctrlSetText format ["Subasta: %1", _cosa];
	_boton ctrlSetText format ["PUJAR +%1€", _nPuja];
	_boton buttonSetAction '	["pujo", cosa] execVM "ica\subasta\subasta.sqf"	';
	_pujatxt ctrlSetText format ["Puja: %1 (%2€)", _str1, _str2];
};

if (_param == "pujo") exitWith {
	if (vehicle player != player) exitWith {hint "¿Pretendes pujar desde un vehículo? No me seas vago."};

	_cosa = _this select 1;


	if (!isNil {spamSubasta}) exitWith {
		spamSubasta = spamSubasta + 5;
		closeDialog 0;
		hint format ["Tienes que esperar %1 segundos", spamSubasta];
		sleep 3;
		hint "";
	};
	[] spawn {
		if (isNil {spamSubasta}) then {
			spamSubasta = 5;

			while {true} do {
				if (spamSubasta <= 0) exitWith {spamSubasta = nil };
				spamSubasta = spamSubasta - 1;
				sleep 1;
			};
		};
	};	
	
	_empiezaPuja = {
		if (subastaActual  == "") then { 		// si no hay ninguna subasta activa
			subastaActual = _cosa; 		// empiezo esta
			publicVariableServer "subastaActual";
			paq = [player, "subasta", _cosa]; publicVariableServer "paq"; paq = nil;
		};
	};
	
	if ((subastaActual != _cosa) AND (subastaActual != "")) exitWith {hint "Actualmente ya hay una subasta activa, espera a que termine para empezar esta.";};

	// Empiezo a pujar	
	
	["subastas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	if (_cosa == "campo") then {
		if ((campo select 2) <= 0) exitWith {hint "Esta puja ha finalizado"};
		call _empiezaPuja;
		if (name player == (campo select 0)) exitWith {hint "No puedes superar tu propia puja"};
		if (life_atmcash < ((campo select 1) + _nPuja)) exitWith {hint "No tienes dinero para superar la puja máxima"};
		campo = [name player, (campo select 1) + _nPuja, campo select 2];
		publicVariableServer "campo";
	};

	if (_cosa == "purificadora") then {
		if ((purificadora select 2) <= 0) exitWith {hint "Esta puja ha finalizado"};
		call _empiezaPuja;
		if (name player == (purificadora select 0)) exitWith {hint "No puedes superar tu propia puja"};
		if (life_atmcash < ((purificadora select 1) + _nPuja)) exitWith {hint "No tienes dinero para superar la puja máxima"};
		purificadora = [name player, (purificadora select 1) + _nPuja, purificadora select 2];
		publicVariableServer "purificadora";
	};

	if (_cosa == "refineria") then {
		if ((refineria select 2) <= 0) exitWith {hint "Esta puja ha finalizado"};
		call _empiezaPuja;
		if (name player == (refineria select 0)) exitWith {hint "No puedes superar tu propia puja"};
		if (life_atmcash < ((refineria select 1) + _nPuja)) exitWith {hint "No tienes dinero para superar la puja máxima"};
		refineria = [name player, (refineria select 1) + _nPuja, refineria select 2];
		publicVariableServer "refineria";
	};

	if (_cosa == "farmacia") then {
		if ((farmacia select 2) <= 0) exitWith {hint "Esta puja ha finalizado"};
		call _empiezaPuja;
		if (name player == (farmacia select 0)) exitWith {hint "No puedes superar tu propia puja"};
		if (life_atmcash < ((farmacia select 1) + _nPuja)) exitWith {hint "No tienes dinero para superar la puja máxima"};
		farmacia = [name player, (farmacia select 1) + _nPuja, farmacia select 2];
		publicVariableServer "farmacia";
	};

	if (_cosa == "mina") then {
		if ((mina select 2) <= 0) exitWith {hint "Esta puja ha finalizado"};
		call _empiezaPuja;
		if (name player == (mina select 0)) exitWith {hint "No puedes superar tu propia puja"};
		if (life_atmcash < ((mina select 1) + _nPuja)) exitWith {hint "No tienes dinero para superar la puja máxima"};
		mina = [name player, (mina select 1) + _nPuja, mina select 2];
		publicVariableServer "mina";
	};
	closeDialog 0;
};

