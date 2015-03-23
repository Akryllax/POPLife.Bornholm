/*
	File: fn_giveConfiscatedMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:

*/
private["_unit", "_caller"];
_unit = _this select 0;
_caller = _this select 1;

if(isNil "_unit") then { hint "Error: ""_unit"" isNil"};
if(_unit == player) then {hint "Error: target == player"};
if(isNull _unit) then {hint "Error: target isNull"};

hint format["%1 te ha consficado %2$", _caller getVariable["realname",name _unit], pop_dinero];
_cash = pop_dinero + 0;
pop_dinero = 0;

live_fnc_conficateHint = {
	pop_dinero = pop_dinero + _this select 1;
	hint format["Has confiscado %1$ de %2", _this select 1, (_this select 0) getVariable["realname",objNull]];
};

publicVariable "live_fnc_conficateHint";

[[_caller,pop_dinero,player],"live_fnc_conficateHint", _caller, false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;
[0] call SOCK_fnc_updatePartial;