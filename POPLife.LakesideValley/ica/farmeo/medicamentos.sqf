
/*
Carga de medicamentos para llevarlos hasta el hospital en cierto tiempo
by: Icaruk

["carga"] execVM "ica\farmeo\medicamentos.sqf"
["descarga"] execVM "ica\farmeo\medicamentos.sqf"
*/

_param = _this select 0;

if (_param isEqualTo "carga") exitWith {
	_veh = nearestObject [farmaciaAbandonada, "C_Offroad_01_F"]; // busco el offroad
	if (isNull _veh) exitWith {hint "No hay ninguna ranchera para cargar"};
	if (_veh distance (farmaciaAbandonada) > 10) exitWith {hint "Estás demasiado lejos"};
	_carga = nearestObject [farmaciaAbandonada, "Land_PlasticCase_01_large_F"]; // busco la carga	
	if (((_carga distance _veh) <= 10) AND (!isNil {_carga})) exitWith {hint "El offroad ya está cargado"};

	hint format ["¡Rápido! \n\nTienes que llevar esta caja de medicamentos al hospital de Lakeside en menos de 2 min"];

	_caja = "Land_PlasticCase_01_large_F" createVehicle (getMarkerPos "");
	_caja attachTo [_veh, [0, -2, -0.29]];
	[_caja, (60 * 2) + 5] call ica_borrame;
};

if (_param isEqualTo "descarga") exitWith {
	_veh = nearestObject [almacenHospital, "C_Offroad_01_F"]; // busco el offroad
	if (isNull _veh) exitWith {hint "No hay ningún vehículo"};
	_carga = nearestObject [_veh, "Land_PlasticCase_01_large_F"]; // busco la carga	
	if (isNil {_carga}) exitWith {hint "El offroad no tiene carga"};
	if (_carga distance (almacenHospital) > 10) exitWith {hint "Estás demasiado lejos"};	
	if (_veh distance (almacenHospital) > 10) exitWith {hint "Estás demasiado lejos"};

	detach _carga;
	deleteVehicle _carga;
	
	["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	_din = round ((["medicamentos"] call ica_precioSuministros) * 30);
	life_cash = life_cash + _din;
	
	["farmacia", _din] call ica_subeBajaBeneficios;
	["central", "medicamentos", 30] call ica_subeBajaSuministros;
	
	hint format ["Gracias por entregar a tiempo los medicamentos :) \n\nEspero que estos %1€ sean suficientes para pagarte.", _din];
	
	if ((floor (random 100)) < 30) then {
		["Conduccion", 1] call ica_dameExp;
	};
};
