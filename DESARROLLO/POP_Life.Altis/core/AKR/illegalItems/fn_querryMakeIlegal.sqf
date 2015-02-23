/*
	File: fn_querryMakeIllegal.sqf
	Author: Akryllax
	Desc: Ask the server to add an item from illegal items.
*/

private ["_itemName"];
	
_itemName = [_this, 0 ,"", [""]] call BIS_fnc_param;
_price = [_this, 0 ,-1, [-1]] call BIS_fnc_param;
if((count _itemName) == 0) exitWith {};
if(_price < 0) exitWith {};

[[_itemName, _price], "AKR_fnc_makeILegal", false] call life_fnc_MP;