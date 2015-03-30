/*
Demanda de droga por Icaruk
["menu"] execVM "ica\mafia\demandaDroga.sqf";
*/

_param = _this select 0;

if (_param == "menu") exitWith {

	if (!isNil {ocupado}) exitWith {hint "Espera 3s"};
	[] spawn {
		ocupado = true;
		sleep 3;
		ocupado = nil;
	};
	
	["demandaDeDroga"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	menuAbierto = "droga";
	waitUntil {!isNil {demCoc}};
	
	disableSerialization;
	createDialog "demandaDroga";
	_ui = uiNameSpace getVariable "demandaDroga";
	_titulo = (_ui displayCtrl 5017);	
	_lista = (_ui displayCtrl 5032);
	_titulo ctrlSetText "Demanda";
	lbClear _lista;
	_lista lbAdd "Cannabis";
	_lista lbSetData [0, "cannabis"];
	_lista lbAdd "Marihuana";
	_lista lbSetData [1, "marijuana"];
	_lista lbAdd "Opio";
	_lista lbSetData [2, "heroinu"];
	_lista lbAdd "Heroína";
	_lista lbSetData [3, "heroinp"];
	_lista lbAdd "Coca";
	_lista lbSetData [4, "cocaine"];
	_lista lbAdd "Cocaína";
	_lista lbSetData [5, "cocainep"];
	
	["actualiza"] execVM "ica\mafia\demandaDroga.sqf";
};

if (_param == "actualiza") exitWith {
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

	
	_idxLista = lbCurSel 5032;
	cosa = _lista lbData _idxLista;	
	can = parseNumber (ctrlText _entrada);
	
	_txt1 ctrlSetText format ["  Cannabis"];
	_txt2 ctrlSetText format [" Marihuana"];
	_txt3 ctrlSetText format ["   Opio"];
	_txt4 ctrlSetText format ["       Heroína"];
	_txt5 ctrlSetText format ["   Coca"];
	_txt6 ctrlSetText format ["      Cocaína"];

	_b1 progressSetPosition (demCan / 100);
	_b2 progressSetPosition (demMar / 100);
	_b3 progressSetPosition (demOpi / 100);
	_b4 progressSetPosition (demHer / 100);
	_b5 progressSetPosition (demHC / 100);
	_b6 progressSetPosition (demCoc / 100);
	
	_boton buttonSetAction '
		["vendo", cosa, can] execVM "ica\mafia\demandaDroga.sqf";
	';
};

if (_param == "vendo") exitWith {
	disableSerialization;
	_cosa = _this select 1;
	_can = _this select 2;
	if (_cosa == "") exitWith { hint "No soy adivino, dime qué es lo que quieres venderme, amigo."; };
	if (_can < 0) exitWith { hint "Si usas números negativos, no estás vendiendo, estás comprando. Y yo no tengo nada que venderte, amigo."; };
	if (_can == 0) exitWith { hint "A ver si lo entiendo, vienes aquí a vender droga, y me intentas vender 0 unidades... de acuerdo, trato hecho. Tus beneficios son de 0€."; };
	
	if ([false, _cosa, _can] call life_fnc_handleInv) then {
		_din = [_cosa] call ica_precioDrogas;
		[_cosa, _can] call ica_bajaDemandaDeDrogas;
		
		life_cash = life_cash + round (_din * _can);
		hint format ["Gracias por tus %2 unidades de %1, amigo. \n\nTus beneficios son %3€.", _cosa, _can, (_din * _can)];
		
		["actualiza"] execVM "ica\mafia\demandaDroga.sqf";
	} else {
		hint "No me vengas con tonterías, si no tienes mercancía será mejor que te vayas, amigo.";
	};
	
};

