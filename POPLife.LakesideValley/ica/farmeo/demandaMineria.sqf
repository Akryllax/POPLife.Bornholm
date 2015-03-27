/*
Demanda de droga por Icaruk
["menu"] execVM "ica\farmeo\demandaMineria.sqf";
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	/*
	if (!isNil {ocupado}) exitWith {hint "Espera 3s"};
	[] spawn {
		ocupado = true;
		sleep 3;
		ocupado = nil;
	};
	*/
	
	["demandaDeMineria"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	menuAbierto = "mineria";
	waitUntil {!isNil {demDia}};
	
	disableSerialization;
	createDialog "demandaDroga";
	_ui = uiNameSpace getVariable "demandaDroga";
	_titulo = (_ui displayCtrl 5017);	
	_lista = (_ui displayCtrl 5032);
	_titulo ctrlSetText "Demanda";
	lbClear _lista;
	_lista lbAdd "Arena";
	_lista lbSetData [0, "sand"];
	_lista lbAdd "Carbón";
	_lista lbSetData [1, "carbon"];
	_lista lbAdd "Hierro";
	_lista lbSetData [2, "hierro"];
	_lista lbAdd "Pólvora";
	_lista lbSetData [3, "polvora"];
	_lista lbAdd "Oro";
	_lista lbSetData [4, "goldbar"];
	_lista lbAdd "Diamante";
	_lista lbSetData [5, "diamondr"];
	
	["actualiza"] execVM "ica\farmeo\demandaMineria.sqf";
};

if (_param isEqualTo "actualiza") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "demandaDroga";
	_txt1 = (_ui displayCtrl 5018);
	_txt2 = (_ui displayCtrl 5019);
	_txt3 = (_ui displayCtrl 5020);
	_txt4 = (_ui displayCtrl 5021);
	_txt5 = (_ui displayCtrl 5022);
	_txt6 = (_ui displayCtrl 5023);
	_b1 = (_ui displayCtrl 5024);
	_b2 = (_ui displayCtrl 5025);
	_b3 = (_ui displayCtrl 5026);
	_b4 = (_ui displayCtrl 5027);
	_b5 = (_ui displayCtrl 5028);
	_b6 = (_ui displayCtrl 5029);
	_boton = (_ui displayCtrl 5030);
	_lista = (_ui displayCtrl 5032);
	_entrada = (_ui displayCtrl 5031);
	
	{_x ctrlSetTextColor [0,0.8,0.3,0.7]} forEach [_b2, _b4, _b6];
	
	_idxLista = lbCurSel 5032;
	cosa = _lista lbData _idxLista;	
	can = parseNumber (ctrlText _entrada);
	
	_txt1 ctrlSetText format ["  Arena"];
	_txt2 ctrlSetText format [" Carbón"];
	_txt3 ctrlSetText format ["  Hierro"];
	_txt4 ctrlSetText format ["   Pólvora"];
	_txt5 ctrlSetText format ["   Oro"];
	_txt6 ctrlSetText format [" Diamante"];

	_b1 progressSetPosition (demAre / 100);
	_b2 progressSetPosition (demCar / 100);
	_b3 progressSetPosition (demHie / 100);
	_b4 progressSetPosition (demPol / 100);
	_b5 progressSetPosition (demOro / 100);
	_b6 progressSetPosition (demDia / 100);
	
	_boton buttonSetAction '
		["vendo", cosa, can] execVM "ica\farmeo\demandaMineria.sqf";
	';
};

if (_param isEqualTo "vendo") exitWith {
	disableSerialization;
	_cosa = _this select 1;
	_can = _this select 2;
	
	if (_cosa == "") exitWith { hint "Ye nano, no soy adivino, dime qué es lo que quieres venderme."; };
	if (_can < 0) exitWith { hint "Si usas números negativos, no estás vendiendo, estás comprando. Y yo no tengo nada que venderte nano."; };
	if (_can == 0) exitWith { hint "A ver si lo entiendo, ¿vienes hasta aquí a vender 0 unidades de nada esperando algo a cambio? De acuerdo, tus beneficios son de 0€."; };
	
	if ([false, _cosa, _can] call life_fnc_handleInv) then {
		["demandaDeMineria"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
		["beneficiosEmpresas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
		waitUntil {!isNil {benMina}};
		
		_din = [_cosa] call ica_precioMineria;
		[_cosa, round (_can / 2)] call ica_bajaDemandaDeMineria;
		["mina", round (_din * _can)] call ica_subeBajaBeneficios;
		
		life_cash = life_cash + round (_din * _can);
		hint format ["Gracias por tus %2 unidades de %1, nano. \n\nTus beneficios son %3€.", _cosa, _can, round(_din * _can)];
		
		["actualiza"] execVM "ica\farmeo\demandaMineria.sqf";
	} else {
		hint "No me jodas nano, sin piedras no hay paraí... dinero, sin piedras no hay dinero.";
	};
	
};

