/*
Gasolinera por Icaruk
["menu"] execVM "ica\suministros\gasolinera.sqf";
*/

_param = _this select 0;

if (_param == "menu") exitWith {
	if (!isNil {ocupado}) exitWith {hint "No spamees tanto"};
	[] spawn {
		ocupado = true;
		sleep 2;
		ocupado = nil;
	};

	_veh = ((nearestObjects [player, ["Car"], 15]) select 0);
	if (isNil {_veh}) exitWith {hint "No hay ningun vehiculo cerca"; };
	
	["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	["suministrosCen"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	createDialog "gasolinera";
	_ui = uiNamespace getVariable "gasolinera";
	_tengo = (_ui displayCtrl 5015);
	_tengo ctrlSetText format ["Combustible actual: %1%2", round ((fuel _veh) * 100), "%"];
};

if (_param == "actualiza") exitWith {
	_ui = uiNamespace getVariable "gasolinera";
	_boton = (_ui displayCtrl 5012);
	_txtprecio = (_ui displayCtrl 5013);

	_veh = ((nearestObjects [player, ["Car"], 15]) select 0);
	if (isNil {_veh}) exitWith {hint "No hay ningun vehiculo cerca"; closeDialog 0};

	entrada = parseNumber ctrlText 5014;
	
	_precio = round ((call ica_precioCombustible) * entrada);
	_txtprecio ctrlSetText format ["Precio: %1€", _precio];
	
	_boton buttonSetAction "
		['llena', entrada] execVM 'ica\suministros\gasolinera.sqf';
	";
};

if (_param == "llena") exitWith {
	_com = _this select 1;
	if (_com < 0) exitWith {
		hint "Escribe un numero mayor que 0";
		if (isNil {negativo}) then { negativo = []; publicVariable "negativo"; };
		negativo pushback [name player, _com];
	};
	if (_com > 100) exitWith {hint "Escribe un número menor que 100"; };
	if (_com == 0) exitWith {hint "De acuerdo, quieres 0 de combustible. Ahí lo tienes, buen viaje"; };
	
	
	_veh = ((nearestObjects [player, ["Car"], 15]) select 0);
	if (isNil {_veh}) exitWith {hint "No hay ningún vehiculo cerca"; closeDialog 0; };
	if !(_veh isKindOf "Land") exitWith {hint "No hay ningún vehículo adecuado"; closeDialog 0; };
	_pos = getPos _veh;
	
	_precio = round ((call ica_precioCombustible) * entrada);
	if !(life_cash >= _precio) exitWith {hint "No tienes suficiente dinero"; closeDialog 0; };
	life_cash = life_cash - _precio;
	
	closeDialog 0;
	
	["zonac_4", "combustible", round (_com / 2)] call ica_subeBajaSuministros;
	["refineria", _precio] call ica_subeBajaBeneficios;
	
	hint "Repostando...";
	sleep round (_com / 8);
	if ((_veh distance _pos) > 10) exitWith {hint format ["Te has ido mientras repostabas y se ha derramado todo... \nNo se aceptan devoluciones."]; closeDialog 0; };
	_veh setFuel ((fuel _veh) + (_com / 100));
	hint "Todo listo, buen viaje :D";
	closeDialog 0;
};