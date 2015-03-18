/*
	File: fn_joinGroup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Joins the selected group if it is open.
*/
private["_dialog","_sel","_gangs","_gang","_group","_locked"];
disableSerialization;

_dialog = findDisplay 2520;
_gangs = _dialog displayCtrl 2521;
_sel = lbCurSel _gangs;
_data = _gangs lbData _sel;

_index = [_data,life_group_list] call TON_fnc_index;
if(_index == -1) exitWith {hint "No se pudo encontrar ese grupo."};
_gang = life_group_list select _index;
_group = _gang select 1;
_locked = _gang select 2;

if(!isNull _group) then
{
	if(!_locked) then
	{
		[player] joinSilent _group;
		life_my_group = _group;
		hint format["Te has unido al grupo: %1",_gang select 0];

		closeDialog 0;
	}
		else
	{
		hint "Este grupo esta cerrado y no te puedes unir a el.";
	};
}
	else
{
	hint "Este grupo no es valido";
};