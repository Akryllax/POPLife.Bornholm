/*
Demanda de droga por Icaruk
["menu"] execVM "ica\farmeo\demandaSuministros.sqf";
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
	
	["suministrosCen"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	menuAbierto = "suministros";
	waitUntil {!isNil {medExt}};
	
	disableSerialization;
	createDialog "demandaDroga";
	_ui = uiNameSpace getVariable "demandaDroga";
	_titulo = (_ui displayCtrl 5017);	
	_lista = (_ui displayCtrl 5032);
	_titulo ctrlSetText "Almacenes";
	lbClear _lista;
	_lista lbAdd "Agua sucia";
	_lista lbSetData [0, "aguasucia"];
	_lista lbAdd "Petróleo";
	_lista lbSetData [1, "oilp"];
	_lista lbAdd "Combustible";
	_lista lbSetData [2, "fuelF"];
	_lista lbAdd "Trigo";
	_lista lbSetData [3, "wheat"];
	_lista lbAdd "Girasoles";
	_lista lbSetData [4, "sunflower"];
	_lista lbAdd "Maíz";
	_lista lbSetData [5, "corn"];
	_lista lbAdd "Algodón";
	_lista lbSetData [6, "cotton"];
	_lista lbAdd "Aceitunas";
	_lista lbSetData [7, "olive"];
	
	["actualiza"] execVM "ica\farmeo\demandaSuministros.sqf";
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
	
	_b1 ctrlSetTextColor [0,0.8,0.3,0.7];
	_b2 ctrlSetTextColor [0.1,0.3,0.8,0.7];
	_b3 ctrlSetTextColor [0.7,0.8,0.1,0.7];
	_b4 ctrlSetTextColor [0.8,0,0,0.7];
	
	_idxLista = lbCurSel 5032;
	cosa = _lista lbData _idxLista;	
	can = parseNumber (ctrlText _entrada);
	
	_txt1 ctrlSetStructuredText parseText "<t size='0.99'>Alimento</t>";
	_txt2 ctrlSetStructuredText parseText "<t size='0.99'>  Agua</t>";
	_txt3 ctrlSetStructuredText parseText "<t size='0.82'>Combustible</t>";
	_txt4 ctrlSetStructuredText parseText "<t size='0.81'>        Medicamentos</t>";
	_txt5 ctrlSetText "";
	_txt6 ctrlSetText "";

	_b1 progressSetPosition (aliExt / 1000);
	_b2 progressSetPosition (aguExt / 1000);
	_b3 progressSetPosition (comExt / 1000);
	_b4 progressSetPosition (MedExt / 1000);
	_b5 progressSetPosition 0;
	_b6 progressSetPosition 0;
	
	_boton buttonSetAction '
		["vendo", cosa, can] execVM "ica\farmeo\demandaSuministros.sqf";
	';
};

if (_param isEqualTo "vendo") exitWith {
	disableSerialization;
	_cosa = _this select 1;
	_can = _this select 2;
	
	if (_cosa == "") exitWith { hint "Dime qué es lo que quieres venderme colega, entonces hablaremos de negocios."; };
	if (_can < 0) exitWith { hint "Si usas números negativos, no estás vendiendo, estás comprando."; };
	if (_can == 0) exitWith { hint "A ver si lo entiendo, ¿vienes hasta aquí a vender 0 unidades de nada esperando algo a cambio? De acuerdo, tus beneficios son de 0€."; };
	
	["suministrosCen"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	["beneficiosEmpresas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	if ([false, _cosa, _can] call life_fnc_handleInv) then {
		_din = [_cosa] call ica_precioSuministros;
		["central", _cosa, round (_can * 1)] call ica_subeBajaSuministros;
		[_cosa, round (_din * _can)] call ica_subeBajaBeneficios;
		
		life_cash = life_cash + round (_din * _can);
		hint format ["Gracias por tus %2 unidades de %1, colega. \n\nTus beneficios son %3€.", _cosa, _can, round (_din * _can)];
		
		["actualiza"] execVM "ica\farmeo\demandaSuministros.sqf";
	} else {
		hint "Colega siento decirte que no tienes nada que venderme :/";
	};
	
};

