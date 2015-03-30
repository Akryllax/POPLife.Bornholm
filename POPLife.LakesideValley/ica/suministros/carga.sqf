/*
Carga del camión
by: Icaruk

Función: Carga al camión de X ciudad con una caja dependiendo de la variable elegida.
	Requiere dinero según Y impuestos. Resta suministros de la ciudad X.
	
	["zonac_1"] execVM "ica\suministros\menuSuministros.sqf";
	life_cash = 11000; ["prod1", "alimento", 1] execVM "ica\suministros\carga.sqf";
*/

_busqueda = 5;

private ["_cosa", "_can", "_caja", "_veh", "_cargaMax"];

_estoy = _this select 0;
_cosa = _this select 1;
_can = _this select 2;
_listaVeh = ["I_Truck_02_transport_F", "B_Truck_01_transport_F", "cl3_mackr_flat_forest_camo",
	"cl3_mackr_flat_brown_camo", "cl3_mackr_flat_black_white", "cl3_mackr_flat_american"];

if ((typeName _can) != "SCALAR") exitWith {hint "La cantidad debe de ser un número"};
if !(_can > 0) exitWith {hint "La cantidad debe de ser mayor que 0"};

_veh = (nearestObjects [(getMarkerPos _estoy), _listaVeh, _busqueda]) select 0; // busco el camión
if (isNil {_veh}) exitWith {hint "No hay ningún vehículo"};

switch (typeOf _veh) do {
	case "I_Truck_02_transport_F": {_cargaMax = 50; };
	case "B_Truck_01_transport_F": {_cargaMax = 100; };
	case "cl3_mackr_flat_forest_camo": {_cargaMax = 150; };	
	case "cl3_mackr_flat_brown_camo": {_cargaMax = 150; };	
	case "cl3_mackr_flat_black_white": {_cargaMax = 150; };	
	case "cl3_mackr_flat_american": {_cargaMax = 150; };	
};
if (_can > _cargaMax) exitWith {
	if (_cargaMax == 50) exitWith {hint "Sólo puedes llevar 50 toneladas"; };
	if (_cargaMax == 100) exitWith {hint "Sólo puedes llevar 100 toneladas"; };	
	if (_cargaMax == 100) exitWith {hint "Sólo puedes llevar 150 toneladas"; };	
};

_carga = nearestObjects [(getMarkerPos _estoy), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_red_F"
	], 15];
if (count _carga != 0) exitWith {hint "El camión ya está cargado"; };
if ((_veh distance (getMarkerPos _estoy)) > _busqueda) exitWith {hint "Estás demasiado lejos"; };

["suministrosCen"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;

if !([_estoy, _cosa, _can] call ica_subeBajaSuministros) exitWith {hint "No hay suficientes suministros"}; // baja sum, si no hay, no avanzas

_valor = ([_cosa] call ica_precioSuministrosTrans) * _can;
_pago = round (_valor * 0.12);
if (_pago > life_cash) exitWith {hint format ["Necesitas %1€ más para pagar los impuestos", _pago - life_cash]; };
life_cash = life_cash - _pago;

switch (_cosa) do { // creo la caja
	case "alimento": { _caja = "Land_Cargo20_light_green_F" createVehicle (getMarkerPos "") };
	case "agua": { _caja = "Land_Cargo20_blue_F" createVehicle (getMarkerPos "") };
	case "combustible": { _caja = "Land_Cargo20_yellow_F" createVehicle (getMarkerPos "") };
	case "medicamentos": { _caja = "Land_Cargo20_red_F" createVehicle (getMarkerPos "") };
};

hint format ["Empaquetando %1 tonelada(s) de %2(s)...", _can, _cosa];
sleep 4;
hint "Montando la mercancia en el camion...";
sleep 2;

_carga = nearestObjects [(getMarkerPos _estoy), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_red_F"
	], 15];
if (count _carga != 0) exitWith {hint "Ya había una carga en tu camión, has intentado abusar y te has quedado sin dinero. Enhorabuena."; };
if ((_veh distance (getMarkerPos _estoy)) > _busqueda) exitWith {hint "Has movido el camión mientras se cargaba la mercancía y se ha derramado todo."};
if !(isNil {_veh getVariable "carga"}) exitWith {hint "El camion ya está cargado"};
hint format ["Todo listo, buen viaje :)"];


waitUntil {!isNull _caja};

_caja setVariable ["carga", [_cosa, _can], true];
switch (_cargaMax) do {
	case 50: { _caja attachTo [_veh, [0.1 ,-1.69, 0.6]]; };
	case 100: { _caja attachTo [_veh, [0.05, -2.4, 0.7]]; };
	case 150: { _caja attachTo [_veh, [0, -3.7, 0.8]]; };
};

_caja setdir 270;
[[_caja, ["<t color='#DF0101'>Eliminar magicamente</t>",'deleteVehicle (_this select 0)', "", 1,false,true,"","side player != CIVILIAN"]], "ica_meteAccion", true, true] spawn BIS_fnc_MP; 
