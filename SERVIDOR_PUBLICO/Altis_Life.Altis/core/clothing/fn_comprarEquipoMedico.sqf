/*
	File: fn_comprarEquipoMedico.sqf
	Author: Akryllax
	Desc: Le da al medico su uniforme.
*/

private["_caller"];

_caller = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if(isNull _caller) exitWith {};
if(side _caller != independent) exitWith { hint "Tienes que ser medico." };

removeUniform _caller;
_caller forceAddUniform "U_Rangemaster";

[] spawn {
	waitUntil {uniform player == "U_Rangemaster"};
	player setObjectTextureGlobal [0,"textures\MED\medic_uniform.jpg"];
	waitUntil {uniform player != "U_Rangemaster"};
};

removeHeadgear _caller;
removeVest _caller;
removeAllItems _caller;
removeAllWeapons _caller;
removeAllAssignedItems _caller;