/*
	File: fn_makeIlegal.sqf
	Author: Akryllax
	Desc: Adds an item from the illegal_items array.
*/

private ["_itemName"];
		
_itemName = [_this, 0 ,"", [""]] call BIS_fnc_param;
_price = [_this, 0 ,-1, [-1]] call BIS_fnc_param;
if((count _itemName) == 0) exitWith {};
if(_price < 0) exitWith {};

_found = false;
{
	if(_itemName in _x) then {
		_found = true;
	};
} forEach (life_illegal_items);

if(!_found) then {
	life_illegal_items pushBack [_itemName, _price];
	publicVariable "life_illegal_items";
};