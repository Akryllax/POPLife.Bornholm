/*
	File: fn_makeLegal.sqf
	Author: Akryllax
	Desc: Makes the item legal.
*/

private ["_itemName"];

_itemName = [_this, 0 ,"", [""]] call BIS_fnc_param;
if((count _itemName) == 0) exitWith {};

{
	if(_itemName in _x) then {
		life_illegal_items deleteAt _forEachIndex;
	};
} forEach (life_illegal_items);
publicVariable "life_illegal_items";