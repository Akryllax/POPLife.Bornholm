#include <macro.h>
/*
	File: fn_skillUpdate.sqf
	Author: Ciaran Langton
	
	Desc:
	Updates the dialog with the current selection. ----ALTISLIFE.CO.UK ONLY----
*/
_display = findDisplay 3500;
_ctrl = _display displayCtrl 1100; //Our StructuredText
_listBox = _display displayCtrl 1500; //Get the list
//TALENTID AS STRING TO NUMBER
_skillID = lbData[1500,lbCurSel (1500)];
_skillID = call compile format["%1",_skillID];
//ERROR - TALENT ID WAS NULL - FAILED DIALOG?
if(isNil '_skillID') exitWith {};

_skill = [];
{if((_x select 0) == _skillID) exitWith {_skill = _X};} forEach (call life_skillCfg); //"Index function", getting the array via the number.
if(count _skill != 5) exitWith {};
_text = [];
_text pushBack format["<t font='puristaMedium' shadow='1' size='1.5'>%1</t><br/>",_skill select 2];

_text pushBack (_skill select 4);
_text pushBack "<br/>";

if(_skill select 3 != 0) then {
	_req = [];
	{if((_x select 0) == _skill select 3) exitWith {_req = _X};} forEach (call life_skillCfg);
	if(count _req != 5) exitWith {};
	_text pushBack format["<t shadow='2'>-Requires %1.</t><br/>", _req select 2];
} else {
	_text pushBack "<t shadow='2'>-No requirements.</t><br/>";
};

if(!(_skillID in (life_skills select 0))) then {
	//This is in their possession
	_text pushBack "-You have not yet learned this talent.<br/><br/>";
} else {
	_text pushBack "-You know this talent.<br/><br/>";
};


_final = "";
{_final = _final + _x} forEach _text; //Acts like a very basic stringbuilder from array.

_ctrl ctrlSetStructuredText parseText _final;