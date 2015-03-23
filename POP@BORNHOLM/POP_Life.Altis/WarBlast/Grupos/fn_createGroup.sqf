/*
	File: fn_createGroup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Functionality meant for creating groups.
*/
private["_value","_len","_group"];
_value = ctrlText 2522;
_len = [_value] call KRON_StrLen;

if(_len > 25) exitWith {hint "El nombre del grupo solo puede contener maximo 25 caracteres."};
if(([_value,life_group_list] call TON_fnc_index) != -1) exitWith {hint "Ya hay un grupo con ese nombre."};

_group = createGroup civilian;

//Set Array
life_group_list set[count life_group_list,[_value,_group,false,str(player),getPlayerUID player]];
publicVariable "life_group_list";
[player] joinSilent _group;
player setRank "CORPORAL";
life_my_group = _group;
_group setVariable["group_id",round(random(9999999)),true];
if(!isNull life_my_group) then
{
	closeDialog 0;
	createDialog "life_my_group_Diag";
	publicVariable "life_group_list";
};