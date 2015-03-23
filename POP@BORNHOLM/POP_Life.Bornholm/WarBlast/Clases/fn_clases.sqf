/*
fn_clases
WarBlast
*/
waitUntil {!isNull player};

private ["_unit","_bando","_lista"];

_unit	   =     [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
_bando	   =     player side;
_lista	   =     [_this, 3, [], [ []]] call BIS_fnc_param;
_acera     =     _lista select 0;
_arma      =     _lista select 1;
_municion  =     _lista select 2;
_mira      =     _lista select 3;
_traje     =     _lista select 4;
_chaleco   =     _lista select 5;
_mochila   =     _lista select 6;
_precio    =     _lista select 7;
_objetos = _lista select 8;

//Comprobaciones
if !((_bando == _acera) or (_acera == "")) exitWith { hint "No tienes permitido la compra de esta clase";};
if (pop_banco < _precio) exitWith { hint "No tienes dinero!";};
if (isNull _unit) exitWith {};
pop_banco = pop_banco - _precio;

removeAllWeapons _unit;
removeallassigneditems _unit;
removeallcontainers _unit;
removeuniform _unit;
removevest _unit;
removebackpack _unit;

_unit additem 'ItemWatch';
_unit assignItem "ItemWatch";
_unit addItem "ItemRadio";
_unit assignItem "ItemRadio";
_unit addItem "ItemGPS";
_unit assignItem "ItemGPS";
_unit addItem "ItemMap";
_unit assignItem "ItemMap";
_unit addItem "ItemCompass";
_unit assignItem "ItemCompass";

_unit addWeapon _arma;
_unit addMagazines _municion;
_unit additem _mira;
_unit forceadduniform _traje;
_unit addvest _chaleco;
_unit addbackpack _mochila;
_unit additem _objetos;


