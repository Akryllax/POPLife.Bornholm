/*
	File: fn_recieveConfiscatedMoney.sqf
	Author: Akryllax
	Desc: Gives the cop the confiscated money.
*/

private["_detained", "_money"];

_detained = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_money	 = [_this, 1, -1, [-1]] call BIS_fnc_param;

if(isNull _detained) exitWith{};
if(_money < 0) exitWith{};

life_cash = life_cash + _money;
hint format["Has confiscado %1$ de %2", _money, (_detained) getVariable["realname","ERROR"]];
life_action_inUse = false;