/*
	File: fn_removeMoneyAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit"];
_unit = _this select 0;

if(isNil "_unit") then {hint "Error: Saca pantallazo (F12) y enseñale la foto a un admin\n\nERROR: fn_removeActionMoneyAction.sqf:\n""_unit"" isNil!"};
if(isNull _unit) then {hint "Error: Saca pantallazo (F12) y enseñale la foto a un admin\n\nERROR: fn_removeActionMoneyAction.sqf:\n""_unit"" isNull!"};

[[_unit,player],"life_fnc_giveConfiscatedMoney",_unit,false] spawn life_fnc_MP;