/*
Carga del camión
by: Icaruk

Función: Busca la caja de un camión para eliminarla, dando dinero acorde con los suministros. Aumenta suministros.
	["central"] execVM "ica\suministros\descarga.sqf";
*/

disableUserInput true;

_estoy = _this select 0;

_caja = nearestObjects [(getMarkerPos _estoy), [
	"Land_Cargo20_light_green_F", "Land_Cargo20_blue_F", "Land_Cargo20_yellow_F", "Land_Cargo20_red_F"
], 10]; // busco la caja

if (isNil {_caja select 0}) exitWith {hint "No hay ninguna mercancía"; disableUserInput false; };
if (((_caja select 0) distance (getMarkerPos _estoy)) > 10) exitWith {hint "El camión está demasiado lejos"; disableUserInput false; };

_var = (_caja select 0) getVariable "carga";
if (isNil {_var}) exitWith {hint "Variable carga no encontrada"};

_cosa = _var select 0;
_can = _var select 1;

detach (_caja select 0);
deleteVehicle (_caja select 0);

["suministrosCen"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;

_valor = [_cosa] call ica_precioSuministrosTrans;
life_cash = life_cash + (_can * _valor);

hint format ["Has ganado %1€", (_can * _valor)];

if !(["descarga", _cosa, _can] call ica_subeBajaSuministros) exitWith {disableUserInput false; };  // sube sum, si está a tope no

disableUserInput false;
