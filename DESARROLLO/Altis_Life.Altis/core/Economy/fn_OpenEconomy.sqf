#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan

	Description:
	Opens the cellphone menu?
*/
private["_display","_units","_type","_icon","_gear_list","_item_list"];

disableSerialization;
createDialog "Market";
waitUntil {!isNull findDisplay 39000};
_display = findDisplay 39000;
_venteliste = _display displayCtrl 39002;
_achatliste = _display displayCtrl 39003;

lbClear _venteliste;
lbClear _achatliste;

[[0,player,"economy"],"TON_fnc_getprices",false,false] spawn life_fnc_MP;

{
	_icon = [([_x,0] call life_fnc_varHandle)] call life_fnc_itemIcon;
	if(_index != -1) then
		{
		_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
	};
} foreach (_shop_data select 1);
{
	_icon = [_var] call life_fnc_itemIcon;
	if(_val > 0) then
		{
		_gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
			};
} foreach (_shop_data select 1);
/*
{
	if(alive _x && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
			case east: {_type = "Merc"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [3004,0];*/