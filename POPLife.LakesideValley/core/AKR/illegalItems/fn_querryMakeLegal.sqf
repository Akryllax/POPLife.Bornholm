/*
	File: fn_querryMakeLegal.sqf
	Author: Akryllax
	Desc: Client request to server to delete an item from illegal items.
*/

private ["_itemName"];

_itemName = [_this, 0 ,"", [""]] call BIS_fnc_param;
if((count _itemName) == 0) exitWith {};

[[_itemName], "life_fnc_makeLegal", false] call life_fnc_MP;