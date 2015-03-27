/*
Sistema de experiencia
by: Icaruk

["menu"] execVM "ica\exp\universidad.sqf"
["menumafia"] execVM "ica\exp\universidad.sqf"
*/

_param = _this select 0;


if (_param == "menu") exitWith {
	createDialog "universidad";
	_ui = uiNameSpace getVariable "universidad";
	_lista = (_ui displayCtrl 5002);
	_ramas = ["Marinero", "Minería", "Química", "Conducción", "Primeros auxilios", "Supervivencia", "Fortaleza", "Economía"];
	_vars = [expMarinero, expMineria, expQuimica, expConduccion, expPA, expSupervivencia, expFortaleza, expEconomia];
	_coste = [1600, 2000, 2800, 1600, 1600, 1200, 2500, 1700];
	
	_idx = 0;
	while {_idx < (count _ramas)} do { // pongo en la lista las ramas
		_lista lbAdd format [(_ramas select _idx) + " (nivel %1)", ([_vars select _idx] call ica_expToLevel)];
		_lista lbSetData [_idx, (_ramas select _idx)];
		_lista lbSetValue [_idx, (_coste select _idx)];
		_idx = _idx + 1;
	};
	_lista lbSetCurSel 0;
};

if (_param == "menumafia") exitWith {
	disableSerialization;
	createDialog "universidad";
	_ui = uiNameSpace getVariable "universidad";
	_lista = (_ui displayCtrl 5002);
	_ramas = ["Mafia"];
	_vars = [expMafia];
	_coste = [4000];
	
	_idx = 0;
	while {_idx < (count _ramas)} do { // pongo en la lista las ramas
		_lista lbAdd format [(_ramas select _idx) + " (nivel %1)", ([_vars select _idx] call ica_expToLevel)];
		_lista lbSetData [_idx, (_ramas select _idx)];
		_lista lbSetValue [_idx, (_coste select _idx)];
		_idx = _idx + 1;
	};	
	_lista lbSetCurSel 0;
	["rellena"] execVM "ica\exp\universidad.sqf";
};


if (_param == "rellena") exitWith {
	// repito la misma mierda
	disableSerialization;
	_ui = uiNameSpace getVariable "universidad";
	_lista = (_ui displayCtrl 5002);
	_titulo = (_ui displayCtrl 5000);
	_precio = (_ui displayCtrl 5004);
	_entrada = (_ui displayCtrl 5003);
	_listaDesbl = (_ui displayCtrl 5001);
	_calculo = (_ui displayCtrl 5005);
	_boton = (_ui displayCtrl 5006);
	
	private "_vars";
	if ((lbSize _lista) == 1) then { // sólo mafia
		_vars = [expMafia];
	} else {
		_vars = [expMarinero, expMineria, expQuimica, expConduccion, expPA, expSupervivencia, expFortaleza, expEconomia];
	};
	
	_idxLista = lbCurSel 5002;
	_cosa = _lista lbData _idxLista;
	_coste = _lista lbValue _idxLista;
	
	private "_cuanto";
	switch (toLower _cosa) do {
		case "marinero": {_cuanto = expMarinero; };
		case "minería": {_cuanto = expMineria; };
		case "química": {_cuanto = expQuimica; };
		case "conducción": {_cuanto = expConduccion; };
		case "primeros auxilios": {_cuanto = expPA; };
		case "supervivencia": {_cuanto = expSupervivencia; };
		case "fortaleza": {_cuanto = expFortaleza; };
		case "economía": {_cuanto = expEconomia; };
		case "mafia": {_cuanto = expMafia; };
	};
	_titulo ctrlSetText format ["%1/2506 \nExperiencia para subir: %2", _cuanto, _vars select _idxLista call ica_expToLevel];
	
	private "_din";
	/*
	if ((lbSize _lista) == 1) then { // sólo mafia
		_din = (parseNumber (ctrlText _entrada)) * _coste;
	} else {
		_din = (parseNumber (ctrlText _entrada)) * _coste;
	};
	*/
	_din = (parseNumber (ctrlText _entrada)) * _coste;
	_calculo ctrlSetText "exp para aprender.";
	_precio ctrlSetText format ["Precio: %1€", ([_din, 3] call BIS_fnc_numberText)];	
	
	cosa = _cosa;
	cuanto = parseNumber (ctrlText _entrada);
	precio = _din;
	_boton buttonSetAction '
		["aprende", cosa, cuanto, precio] execVM "ica\exp\universidad.sqf";
	';
	
	_descr = "";
	_desbloqueos = [];

	switch (_cosa) do {
		case "Marinero": {
			_descr = "¡Arr!";
			_desbloqueos = ["10%1 de pescar +1", "1%1 de pescar un tesoro", "20%1 de pescar +1", "3%1 de pescar un tesoro", "30%1 de pescar +1", "7%1 de pescar un tesoro", "Desbloqueas traje de buzo", "Eres incansable bajo el agua", "Puedes abrir los tesoros de los naufragios", "Desbloqueas SDAR"];
		};
		case "Minería": {
			_descr = "Soy mineeeeeerooo... y puedo picar todo tipo de minerales, ¡y a toda velocidad!";
			_desbloqueos = ["Extraer carbón", "Picas 1 segundo más rápido", "Extraer arena", "7%1 de extraer + 1 mineral", "Extraer hierro", "15%1 de extraer +1 minerales", "Picas 2 segundos más rápido", "Extraer pólvora", "Si la eficacia es > 9 materiales x3", "Puños de titanio"];
		};
		case "Química": {
			_descr = "Siendo maestro químico puedo crear medicamentos, sustancias ilegales, bombas... Sólo necesito C + KNO3 + S.";
			_desbloqueos = ["Craft combustible", "Craft cannabis", "Craft cocaína", "Craft heroína", "Craft  bomba de fuego", "Craft pastilla Parkour", "Craft  bomba de humo", "(en construcción)", "Craft dinero (en construcción)", "Craft pastilla de experiencia (en construcción)"];
		};
		case "Conducción": {
			_descr = "No se me resiste ninguna carretera, soy más eficiente en el consumo de combustible y en las reparaciones.";
			_desbloqueos = ["Gastas 5%1 menos de combustible", "10%1 de no gastar kit de reparación", "Gastas 10%1 menos de combustible", "20%1 de no gastar kit de reparación", "Gastas 15%1 menos de combustible", "30%1 de no gastar kit de reparación", "Gastas 20%1 menos de combustible", "40%1 de no gastar kit de reparación", "50%1 de no gastar kit de reparación", "Puedes comprar un vehículo exclusivo (en construcción)"];
		};
		case "Primeros auxilios": {
			_descr = "No soy médico, pero casi. Puedo regenerarme  y ser más eficiente en el uso de los botoquines.";
			_desbloqueos = ["Regeneración de 1%1 vida cada 10m", "10%1 de no gastar el botiquín", "Regeneración de 2%1 vida cada 10m", "20%1 de no gastar el botiquín", "Regeneración de 4%1 vida cada 10m", "30%1 de no gastar el botiquín", "Regeneración de 8%1 vida cada 10m", "40%1 de no gastar el botiquín", "Regeneración de 12%1 vida cada 10m", "60%1 de no gastar el botiquín"];
		};
		case "Supervivencia": {
			_descr = "Cuanto más tiempo esté vivo, más sabré de la vida, duraré más sin comer ni beber y hasta podré canibalizar... puaj.";
			_desbloqueos = ["-5 hambre y sed cada 45m", "-5 daño de caída", "-5 hambre y sed cada 40m", "-10 daño de caída", "-5 hambre y sed cada 35m", "-15 daño de caída", "-5 hambre y sed cada 30m", "-20 daño de caída", "-5 hambre y sed cada 25m", "Craft ghillie suit (en construcción)"];
		};
		case "Fortaleza": {
			_descr = "Con este cuerpo puedo correr durante más tiempo y usar diferentes golpes.";
			_desbloqueos = ["Recuperas 0.1%1 de aguante cada 30s", "Recuperas 0.15%1 de aguante cada 30s", "Recuperas 0.2%1 de aguante cada 30s", "Recuperas 0.25%1 de aguante cada 30s", "Recuperas 0.3%1 de aguante cada 30s", "Recuperas 0.35%1 de aguante cada 30s", "Recuperas 0.4%1 de aguante cada 30s", "Recuperas 0.45%1 de aguante cada 30s", "Recuperas 0.6%1 de aguante cada 30s", "Puñetazo poderoso"];
		};
		case "Economía": {
			_descr = "Manejo todos los números y estadísticas, así que gano más dinero cada 5 minutos.";
			_desbloqueos = ["Tu paga aumenta en un 10%1", "Tu paga aumenta en un 15%1", "Tu paga aumenta en un 20%1", "Tu paga aumenta en un 25%1", "Tu paga aumenta en un 50%1", "Tu paga aumenta en un 65%1", "Tu paga aumenta en un 75%1", "Tu paga aumenta en un 85%1", "Tu paga aumenta en un 95%1", "Tu paga aumenta en un 130%1"];
		};
		case "Mafia": {
			_descr = "Podré comprar armas, equipamiento y vehículos de la mafia.";
			_desbloqueos = ["Desbloqueas pistolas auto", "Desbl. ropa mafiosa", "Desbl. subfusiles", "Desbl. subfusiles grandes", "Desbl. chalecos mafiosos", "Desbl. carabinas", "Desbl. fusiles de asalto", "Desbl. vehículo mafioso", "Desbl. fusiles de asalto potentes", "Desbl. vehículo blindado"];
		};
	};
	
	_idx = 0;
	lbClear _listaDesbl;
	while {_idx < (count _desbloqueos)} do { // pongo en la lista los desbloqueos
		_txt = format ["Nivel %1:  ", _idx + 1];
		_listaDesbl lbAdd format [_txt + (_desbloqueos select _idx), "%"];
		_idx = _idx + 1;
	};
	_idx = 0;
	_miNivel = [_vars select _idxLista] call ica_expToLevel;
	while {_idx < _minivel} do { // coloreo de verde lo que tengo desbloqueado
		_listaDesbl lbSetColor [_idx, [0, 1, 0, 0.5]];
		_idx = _idx + 1;
	};
	_idx = (count _desbloqueos);
	while {_idx >= _minivel} do { // coloreo de gris lo que NO tengo desbloqueado
		_listaDesbl lbSetColor [_idx, [0.3, 0.3, 0.3, 0.7]];
		_idx = _idx - 1;
	};

};

if (_param == "aprende") exitWith {
	_que = _this select 1;
	_cuanto = _this select 2;
	_precio = _this select 3;
	
	if ((typeName _cuanto) != "SCALAR") exitWith {hint "La cantidad debe de ser un número"};
	if !(_cuanto > 0) exitWith {hint "Escribe un número mayor que 0"};
	if !(life_cash >= _precio) exitWith {hint "No tienes suficiente dinero"};
	
	if (!isNil {aprendido}) exitWith {hint "Tienes que dejar reposar tus nuevos conocimientos un mínimo de 20 segundos."; };
	[] spawn {
		aprendido = true;
		sleep 20;
		aprendido = nil;
	};
	
	life_cash = life_cash - _precio;
	
	[_que, _cuanto] call ica_dameExp;
	
	["rellena"] execVM "ica\exp\universidad.sqf";
};
