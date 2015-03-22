/*
	File: fn_adminGear.sqf
	Author: Ciaran Langton	
	Description:
	Equips admin uniform and gear.
*/
if(call life_wilcorank < 1) exitWith {};
_script = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _script};

_random = ["U_B_Protagonist_VR","U_O_Protagonist_VR","U_I_Protagonist_VR"] call BIS_fnc_selectRandom;
player addHeadgear "H_Cap_headphones";
player addGoggles "G_Goggles_VR";
player forceAddUniform _random;
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";