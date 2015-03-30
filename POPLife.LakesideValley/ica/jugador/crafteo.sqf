/*
Crafteo por Icaruk
	Las recetas pueden ser variables o classnames
	Los ingredientes sólo pueden ser variables
["menu"] execVM "ica\jugador\crafteo.sqf";
*/

_param = _this select 0;

_fnc_ingredientes = {
	private ["_cosa", "_ingred"];
	_cosa = _this select 0;
	switch (_cosa) do {
		//Mirillas de punto rojo
		case "": {_ingred = ["", 0] };
		case "RH_t1_tan": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_compM2_tan": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "Trixie_Eotech": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_reflex": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_barska_rds": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_cmore": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_LTdocterl": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_LTdocter": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "Trixie_M68CCO_Net": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "Trixie_Aimpoint": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_compm4s": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "Trixie_xm8dot": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		case "RH_eothhs1": {_ingred = ["Carbon", 1, "Lingote  de hierro", 1, "Cristal",1] };
		//Mirillas con aumentos
		case "Trixie_XM8ACOG": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "RH_c79": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "Trixie_C79": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "RH_m145": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "RH_ta31rco_tan": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal", 2] };
		case "optic_MRCO": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "optic_Hamr": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "RH_shortdot": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "RH_m3lr": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		//Mirillas Para AKS
		case "hlc_optic_kobra": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "HLC_Optic_1p29": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		case "HLC_Optic_PSO1": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		// Drogas
		case "Heroina": {_ingred = ["Opio", 2] };
		case "Heroina x 5": {_ingred = ["Opio", 10] };
		case "Marihuana": {_ingred = ["Cannabis", 2] };
		case "Marihuana x 5": {_ingred = ["Cannabis", 10] };
		case "Cocaina": {_ingred = ["Hoja de Coca", 2] };
		case "Cocaina x 5": {_ingred = ["Hoja de Coca", 10] };
		// Vehiculos
		case "cl3_jetpack": {_ingred = ["Carbon", 5, "Gran Lingote", 5, "Panel de Cristal",2,"Componentes electricos", 5] };
		case "mosquito_epoch": {_ingred = ["Carbon", 5, "Gran Lingote", 5, "Panel de Cristal",2,"Pintura",5,"Componentes electricos",5] };
		case "cl3_jeep_purge_woodcamo": {_ingred = ["Carbon", 5, "Gran Lingote", 5, "Panel de Cristal",2,"Pintura", 2] };
		//Procesado
		case "Gran Lingote": {_ingred = ["Lingote  de hierro", 5] };
		case "Panel de Cristal": {_ingred = ["Cristal", 2] };
		case "Amoniaco": {_ingred = ["Cristal", 1, "Carbon", 1,"Arena", 1]};
		case "Acohol": {_ingred = ["Cristal", 1, "Carbon", 1, "Agua Sucia", 1]};
		case "Papel": {_ingred = ["Algodon", 1,"Carbon", 1,"Agua Sucia", 1]};
		case "Pintura": {_ingred = ["Algodon", 1,"Carbon", 1,"Agua Sucia", 1] };
		case "Papel Moneda": {_ingred = ["Algodon", 1,"Carbon", 1,"Acohol", 1,"Pintura", 1]};
		case "Lingote de hierro": {_ingred = ["Carbon", 1,"Hierro", 2]};
		
		//Quimica
		case "Pocion Parkour": {_ingred = ["Cocaina", 1, "Agua Sucia", 1, "Cristal", 1, "Acohol", 2]};
		case "Coctel Molotov": {_ingred = ["Cristal", 2, "Barril de Combustible", 1, "Algodon", 2]};
		case "Pastilla de Experiencia": {_ingred = ["Cannabis", 2, "Agua Sucia", 1, "Cristal", 1, "Acohol", 2]};
		case "Dinero": {_ingred = ["Papel Moneda", 5, "Pintura", 2, "Amoniaco", 2]};
		case "O_IR_Grenade": {_ingred = ["Hierro", 2, "Componentes electricos", 2] }; //Granada PM
		case "Barril de Combustible": {_ingred = ["Barril de Crudo", 5] };
		case "Cristal": {_ingred = ["Carbon", 1 , "Arena" , 2] };
		//Armas
		case "Trixie_CZ550": {_ingred = ["Carbon", 2, "Lingote  de hierro", 5, "Cristal",2] };
		case "cl3_crossbow": {_ingred = ["Carbon", 1, "Lingote  de hierro", 2, "Cristal",2] };
		//Municion
		case "Trixie_CZ550_Mag": {_ingred = ["Polvora", 1, "Hierro", 1, "Algodon",1]};
		case "4Rnd_crossbow_mag": {_ingred = ["Carbon", 1, "Hierro", 1, "Algodon",1]};
		
		
	};
	_ingred
};

_fnc_ingToVar = {
	private ["_param", "_ing", "_n", "_final"];
	_param = _this select 0;
	_ing = _this select 1;
	_n = _this select 2;
	
	switch (_ing) do {
		case "Lingote  de hierro": { 
			if (_param == "pregunto") then { if (life_inv_lingotehierro < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"lingotehierro",_n] call life_fnc_handleInv; };
		};
		case "Carbon": {
			if (_param == "pregunto") then { if (life_inv_carbon < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"carbon",_n] call life_fnc_handleInv; };
        };
		case "Arena": { 
			if (_param == "pregunto") then { if (life_inv_sand < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"sand",_n] call life_fnc_handleInv; };
		};
		case "Hierro": {
			if (_param == "pregunto") then { if (life_inv_hierro < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"hierro",_n] call life_fnc_handleInv; };
        };
		case "Cristal": { 
			if (_param == "pregunto") then { if (life_inv_glass < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"glass",_n] call life_fnc_handleInv; };
		};
		// Drogas
		case "Marihuana": { 
			if (_param == "pregunto") then { if (life_inv_marijuana < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"marijuana",_n] call life_fnc_handleInv; };
		};
		case "Cannabis": { 
			if (_param == "pregunto") then { if (life_inv_cannabis < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"cannabis",_n] call life_fnc_handleInv; };
		};
		case "Heroina": { 
			if (_param == "pregunto") then { if (life_inv_heroinp < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"heroinp",_n] call life_fnc_handleInv; };
		};
		case "Opio": { 
			if (_param == "pregunto") then { if (life_inv_heroinu < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"heroinu",_n] call life_fnc_handleInv; };
		};
		case "Hoja de Coca": { 
			if (_param == "pregunto") then { if (life_inv_coke < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"cocaine",_n] call life_fnc_handleInv; };
		};
		case "Cocaina": {
			if (_param == "pregunto") then { if (life_inv_cokep < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"cocainep",_n] call life_fnc_handleInv; };
		};
		//Items 
		case "Gran Lingote": { 
			if (_param == "pregunto") then { if (life_inv_granlingote < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"granlingote",_n] call life_fnc_handleInv; };
		};
		case "Panel de Cristal": { 
			if (_param == "pregunto") then { if (life_inv_placadecristal < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"placadecristal",_n] call life_fnc_handleInv; };
		};
		case "Pocion Parkour": { 
			if (_param == "pregunto") then { if (life_inv_pocionparkour < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"pocionparkour",_n] call life_fnc_handleInv; };
		};
		case "Coctel Molotov": { 
			if (_param == "pregunto") then { if (life_inv_coctelmolotov < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"coctelmolotov",_n] call life_fnc_handleInv; };
		};
		case "Pastilla de Experiencia": { 
			if (_param == "pregunto") then { if (life_inv_pastilladeexperiencia < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"pastilladeexperiencia",_n] call life_fnc_handleInv; };
		};
		case "Papel Moneda": { 
			if (_param == "pregunto") then { if (life_inv_pepelmoneda < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"papelmoneda",_n] call life_fnc_handleInv; };
		};
		case "Papel": { 
			if (_param == "pregunto") then { if (life_inv_papel < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"papel",_n] call life_fnc_handleInv; };
		};
		case "Pintura": { 
			if (_param == "pregunto") then { if (life_inv_pintura < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"pintura",_n] call life_fnc_handleInv; };
		};
		case "Acohol": { 
			if (_param == "pregunto") then { if (life_inv_alcohol < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"alcohol",_n] call life_fnc_handleInv; };
		};
		case "Amoniaco": { 
			if (_param == "pregunto") then { if (life_inv_amoniaco < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"amoniaco",_n] call life_fnc_handleInv; };
		};
		case "Componentes electricos": { 
			if (_param == "pregunto") then { if (life_inv_componenteselectricos < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"componenteselectricos",_n] call life_fnc_handleInv; };
		};
		case "Algodon": { 
			if (_param == "pregunto") then { if (life_inv_cotton < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"cotton",_n] call life_fnc_handleInv; };
		};
		case "Agua Sucia": { 
			if (_param == "pregunto") then { if (life_inv_aguasucia < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"aguasucia",_n] call life_fnc_handleInv; };
		};
		case "Barril de Crudo": { 
			if (_param == "pregunto") then { if (life_inv_oilp < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"oilp",_n] call life_fnc_handleInv; };
		};
		case "Barril de Combustible": {
			if (_param == "pregunto") then { if (life_inv_fuelF < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"fuelF",_n] call life_fnc_handleInv; };
		};
		case "Polvora": {
			if (_param == "pregunto") then { if (life_inv_polvora < _n) then {_final = false} else {_final = true}; };
			if (_param == "resto") then { [false,"polvora",_n] call life_fnc_handleInv; };
		};
	};
	if (isNil {_final}) exitWith {};
	_final
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param == "menu") exitWith {
	createDialog "crafteo";
	_ui = uiNamespace getVariable "crafteo";
	_lista1 = (_ui displayCtrl 5035);
	_lista3 = (_ui displayCtrl 5037);
	
	_categorias = ["Química", "Procesado", "Armamento", "Visores", "Equipamiento", "Vehículos"];
	
	_idx = 0;
	lbClear _lista1;
	while {_idx < (count _categorias)} do { // categorias
		_lista1 lbAdd format [(_categorias select _idx)];
		_lista1 lbSetData [_idx, (_categorias select _idx)];
		_idx = _idx + 1;
	};	
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param == "actualiza2") exitWith { // ver recetas
	_ui = uiNamespace getVariable "crafteo";
	_lista1 = (_ui displayCtrl 5035);
	_lista2 = (_ui displayCtrl 5036);
	_lista3 = (_ui displayCtrl 5037);
	_idxLista1 = lbCurSel 5035;
	_categoria = _lista1 lbData _idxLista1;
	
	private "_recetas";
	switch (_categoria) do {
		case "Química": {
			_recetas = [["", 1]];
			_recetas = [["Heroina", 1], ["Heroina x 5", 5], ["Marihuana", 1], ["Marihuana x 5", 5],["Cocaina", 1],
			["Cocaina x 5", 5],["Pocion Parkour", 1],["Coctel Molotov", 1],["Dinero", 1],["O_IR_Grenade", 1],["Pastilla de Experiencia", 1],["Barril de Combustible", 1]];
		};
		case "Procesado": {
			_recetas = [["Gran Lingote", 1],["Panel de Cristal", 1],["Papel", 1],["Amoniaco", 1],["Pintura", 1],["Acohol", 1],["Papel Moneda", 1],["Lingote de hierro", 1],
			["Cristal", 1]];
		};
		case "Armamento": {
			_recetas = [["Trixie_CZ550", 1],["Trixie_CZ550_Mag", 1],["cl3_crossbow", 1],["4Rnd_crossbow_mag", 1]];
		};
		case "Visores": {
			_recetas = [["RH_t1_tan", 1], ["RH_compM2_tan", 1], ["Trixie_Eotech", 1],["RH_reflex", 1],["RH_barska_rds", 1],["RH_cmore", 1],["RH_LTdocterl", 1],["RH_LTdocter", 1],
			["Trixie_M68CCO_Net", 1],["Trixie_Aimpoint", 1],["RH_compm4s", 1],["Trixie_xm8dot", 1],["RH_eothhs1", 1],["Trixie_XM8ACOG", 1],["RH_c79", 1],["Trixie_C79", 1],["RH_m145", 1],["RH_ta31rco_tan", 1],
			["optic_MRCO", 1],["optic_Hamr", 1],["RH_shortdot", 1],["RH_m3lr", 1],["hlc_optic_kobra", 1],["HLC_Optic_1p29", 1],["HLC_Optic_PSO1", 1]];		
		};
		case "Equipamiento": {
			_recetas = [["", 1]];
		};
		case "Vehículos": {
			_recetas = [["cl3_jetpack", 1],["mosquito_epoch", 1],["cl3_jeep_purge_woodcamo", 1]];
		};	
	};	
	
	_idx = 0;
	lbClear _lista2;
	lbClear _lista3;
	while {_idx < (count _recetas)} do { // recetas
		_nom = [_recetas select _idx select 0] call ica_classToName;
		_lista2 lbAdd format [_nom];
		_lista2 lbSetData [_idx, (_recetas select _idx select 0)];
		_lista2 lbSetValue [_idx, (_recetas select _idx select 1)];
		_idx = _idx + 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param == "actualiza3") exitWith { // ver ingredientes
	disableSerialization;
	_ui = uiNamespace getVariable "crafteo";
	_lista2 = (_ui displayCtrl 5036);
	_lista3 = (_ui displayCtrl 5037);
	_boton = (_ui displayCtrl 5039);
	_idxLista2 = lbCurSel 5036;
	_receta = [_lista2 lbData _idxLista2, _lista2 lbValue _idxLista2];
	
	_ingredientes = ([_receta select 0] call _fnc_ingredientes);	
	
	lbClear _lista3;
	_idx = 0;
	_idxLista = 0;
	while {_idx < (count _ingredientes)} do { // meto ingredientes en lista
		_lista3 lbAdd format ["%1 x %2", (_ingredientes select _idx), (_ingredientes select (_idx + 1))];
		_lista3 lbSetColor [_idxLista, [0.2, 1, 0.2, 1]]; // verde
		
		if !(["pregunto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_ingToVar) then {
			_lista3 lbSetColor [_idxLista, [1, 0.2, 0.2, 1]]; // rojo
		};
		
		_idx = _idx + 2;	
		_idxLista = _idxLista + 1;
	};
	
	receta = _receta;
	ingredientes = _ingredientes;
	
	_boton buttonSetAction '
		["craft", receta, ingredientes] execVM "ica\jugador\crafteo.sqf";
	';
	
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param == "craft") exitWith {
	_ui = uiNamespace getVariable "crafteo";
	_barrita = (_ui displayCtrl 5038);
	_boton = (_ui displayCtrl 5039);
	_receta = _this select 1;
	_ingredientes = _this select 2;
	
	private "_fuera";
	
	_idx = 0; // tengo ingredientes?
	while {_idx < (count _ingredientes)} do {
		if !(["pregunto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_ingToVar) exitWith {_fuera = true; };
		_idx = _idx + 2;
	};
	if (!isNil {_fuera}) exitWith {hint "No tienes suficientes ingredientes"; };

	_boton CtrlEnable false;
	
	_t = 10;
	_t = 1;
	_frag = (100 / _t) / 100;
	_frag = _frag / 10;
	while {true} do {
		if (_t <= 0) exitWith {_barrita progressSetPosition 0; };
		if (!alive player) exitWith {fuera = true; _t = 0; };
		if (isNull (findDisplay 5040)) exitWith {fuera = true; _t = 0; };
		_barrita progressSetPosition ((progressPosition _barrita) + _frag);
		_t = _t - 0.1;
		sleep 0.1;
	};
	_boton CtrlEnable true;
	if (!isNil {fuera}) exitWith {hint "Crafteo cancelado"; fuera = nil; };
	
	// Compruebo niveles química
	_niv = [expQuimica] call ica_expToLevel;
	
	if (((_receta select 0) == "Barril de Combustible") AND (_niv < 1)) then {hint "Necesitas química nivel 1"; fuera = true;};
	if (((_receta select 0) == "Marihuana") AND (_niv < 2)) then {hint "Necesitas química nivel 2"; fuera = true;};
	if (((_receta select 0) == "Marihuana x 5") AND (_niv < 2)) then {hint "Necesitas química nivel 2"; fuera = true;};
	if (((_receta select 0) == "Cocaina") AND (_niv < 3)) then {hint "Necesitas química nivel 3"; fuera = true;};
	if (((_receta select 0) == "Cocaina x 5") AND (_niv < 3)) then {hint "Necesitas química nivel 3"; fuera = true;};
	if (((_receta select 0) == "Heroina") AND (_niv < 4)) then {hint "Necesitas química nivel 4"; fuera = true;};
	if (((_receta select 0) == "Heroina x 5") AND (_niv < 4)) then {hint "Necesitas química nivel 4"; fuera = true;};
	if (((_receta select 0) == "Coctel Molotov") AND (_niv < 5)) then {hint "Necesitas química nivel 5"; fuera = true;};
	if (((_receta select 0) == "Pocion Parkour") AND (_niv < 6)) then {hint "Necesitas química nivel 6"; fuera = true;};
	if (((_receta select 0) == "Bomba de Humo") AND (_niv < 7)) then {hint "Necesitas química nivel 7"; fuera = true;};
	if (((_receta select 0) == "Granada PM") AND (_niv < 8)) then {hint "Necesitas química nivel 8"; fuera = true;};
	if (((_receta select 0) == "Dinero") AND (_niv < 9)) then {hint "Necesitas química nivel 9"; fuera = true;};
	if (((_receta select 0) == "Pastilla de Experiencia") AND (_niv < 10)) then {hint "Necesitas química nivel 10"; fuera = true;};
	
	if (!isNil {fuera}) exitWith {fuera = nil};
	
	
	// Resto ingredientes y crafteo
	_idx = 0; // resto ingredientes
	while {_idx < (count _ingredientes)} do {
		["resto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_ingToVar;
		_idx = _idx + 2;
	};
	
	if ((_receta select 0) == "") exitWith {
		hint "¿Qué intentas?";
		sleep 3;
		hint "No, en serio, ¿qué intentas? xD";
	};
	
	hint format ["%1 \n %2", ([_receta select 0] call ica_classToName), _receta select 1];
	
	[_receta select 0, _receta select 1] call ica_dameItem;
	hint format ["Has crafteado %1 unidad(es) de %2", _receta select 1, [_receta select 0] call ica_classToName];
};


/*
[true, "glass", 3] call life_fnc_handleinv;  [true, "carbon", 3] call life_fnc_handleinv;   [true, "lingotehierro", 5] call life_fnc_handleinv; 
*/


