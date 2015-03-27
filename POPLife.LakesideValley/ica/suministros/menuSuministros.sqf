/*
Menu de suministros.
by: Icaruk

Función: Muestra el menú para cargar el camión, dando información de todos los suministros.
	["zonac_1"] execVM "ica\suministros\menuSuministros.sqf";
	["centro"] execVM "ica\suministros\menuSuministros.sqf";
*/
if (!isNil {ocupado}) exitWith {};
[] spawn {
	ocupado = true;
	sleep 2;
	ocupado = nil;
};

_estoy = _this select 0;

createDialog "suministros";

disableSerialization;
_ui = uiNameSpace getVariable "suministros";

/*
(_ui displayCtrl 4011) ctrlSetText "Lakeside";
(_ui displayCtrl 4012) ctrlSetText "Diablos";
(_ui displayCtrl 4013) ctrlSetText "Memorial";
(_ui displayCtrl 4014) ctrlSetText "Morrison";
*/

_boton = (_ui displayCtrl 4010);
_lista = (_ui displayCtrl 4015);
lbClear _lista;

switch (_estoy) do {
	case "zonac_1": {
		_lista lbAdd "Alimento";
		_lista lbSetData [0, "alimento"];
	};
	case "zonac_2": {
		_lista lbAdd "Agua";
		_lista lbSetData [0, "agua"];
	};
	case "zonac_3": {
		_lista lbAdd "Combustible";
		_lista lbSetData [0, "combustible"];
	};
	case "zonac_4": {
		_lista lbAdd "Medicamentos";
		_lista lbSetData [0, "medicamentos"];
	};
	case "centro": {
		_boton ctrlSetFade 1;
		_boton ctrlCommit 0;
		_lista ctrlSetFade 1;
		_lista ctrlCommit 0;
		(_ui displayCtrl 4016) ctrlSetFade 1;
		(_ui displayCtrl 4016) ctrlCommit 0;
	};
};


private ["_cosa", "_precio"];

["suministrosCen"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;

waitUntil {!isNil {medExt}};

_formula = {
	_n = _this;	
	_n = (1000 - _n) / 1000;
	_n
};

while {!isNil {abierto}} do {
	
	// 1, 2, 3 y 4
	(_ui displayCtrl 4020) progressSetPosition (aliExt / 1000);
	(_ui displayCtrl 4021) progressSetPosition (aguExt / 1000);
	(_ui displayCtrl 4022) progressSetPosition (comExt / 1000);
	(_ui displayCtrl 4023) progressSetPosition (medExt / 1000);
	
	(_ui displayCtrl 4028) ctrlSetText format ["%1", aliExt];
	(_ui displayCtrl 4029) ctrlSetText format ["%1", aguExt];
	(_ui displayCtrl 4030) ctrlSetText format ["%1", comExt];
	(_ui displayCtrl 4031) ctrlSetText format ["%1", medExt];
	
	// lakeside
	(_ui displayCtrl 4024) progressSetPosition (aliCen call _formula);
	(_ui displayCtrl 4025) progressSetPosition (aguCen call _formula);
	(_ui displayCtrl 4026) progressSetPosition (comCen call _formula);
	(_ui displayCtrl 4027) progressSetPosition (medCen call _formula);	
	
	_can = parseNumber (ctrlText 4016);
	_idxLista = lbCurSel 4015;
	
	if (lbCurSel 4015 != -1) then {
		_cosa = _lista lbData _idxLista;
		_precio = ([_cosa] call ica_precioSuministrosTrans) * _can;
		
		_impuestos = round (_precio * 0.12);
		(_ui displayCtrl 4041) ctrlSetText format ["%1", _precio]; // precio
		(_ui displayCtrl 4040) ctrlSetText format ["%1", _impuestos]; // impuestos		
	} else {
		_cosa = "";
		(_ui displayCtrl 4041) ctrlSetText "";
		(_ui displayCtrl 4040) ctrlSetText "";
	};
	
	cosa = _cosa;
	can = _can;
	estoy = _estoy;
	
	if (_cosa != "") then {
		_boton buttonSetAction '
			[estoy, cosa, can] execVM "ica\suministros\carga.sqf";
			closeDialog 0;
		';	
	};
	
	// hint format ["%1, %2 y %3", _estoy, _cosa, _can];
	
	
	sleep 0.5;
};

cosa = nil; // Quito las variables necesarias para dar la acción al botón de menuSuministros
can = nil;
estoy = nil; 

