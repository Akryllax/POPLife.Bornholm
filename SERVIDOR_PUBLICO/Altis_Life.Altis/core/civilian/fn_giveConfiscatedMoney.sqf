/*
	File: fn_giveConfiscatedMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit", "_caller"];
_unit = _this select 0;
_caller = _this select 1;

if(isNil "_unit") then { hint "Error: ""_unit"" isNil"};
if(_unit == player) then {hint "Error: target == player"};
if(isNull _unit) then {hint "Error: target isNull"};

hint format["%1 te ha consficado %2€", _caller getVariable["realname",name _unit], life_cash];
_cash = life_cash + 0;
life_cash = 0;

AKR_fnc_conficateHint = {
	life_cash = life_cash + _this select 1;
	hint format["Has confiscado %1€ de %2", _this select 1, (_this select 0) getVariable["realname",objNull]];
};

publicVariable "AKR_fnc_conficateHint";

[[_caller,life_cash,player],"AKR_fnc_conficateHint", _caller, false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;
[0] call SOCK_fnc_updatePartial;