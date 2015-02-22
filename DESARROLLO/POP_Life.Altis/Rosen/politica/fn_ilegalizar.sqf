/*
* Archivo: fn_ilegalizar.sqf
* Autor: Rosen
* Descripción: Legalizar/Ilegalizar objetos.
*/

if(__GETC__(life_presidente) != 1) exitWith {hint "No eres presidente.";};

_array = [_this, 0, "", [""]] call BIS_fnc_param;
_objeto = _array select 0;
_legal = _array select 1;
{
	if ((_objeto select 0) in ["heroinu","heroinp","cocaine","cocainep","marijuana"]) then { life_illegal_items set [_forEachIndex, -1]; };
} forEach life_illegal_items;
life_illegal_items = life_illegal_items - [-1];

if (_legal == false) then {
{
	life_illegal_items pushBack ["heroinu",1000];
	life_illegal_items pushBack ["heroinp",2500];
	life_illegal_items pushBack ["cocaine",1500];
	life_illegal_items pushBack ["cocainep",3500];
	life_illegal_items pushBack ["marijuana",2000];
};

	


