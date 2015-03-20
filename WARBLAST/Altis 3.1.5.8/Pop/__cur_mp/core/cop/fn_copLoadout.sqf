#include <macro.h>
/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default cop configuration.
*/
//Strip the player down
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
_uniform = "U_B_CTRG_1";
if(__GETC__(life_plodrank) >= 3) then {_uniform = "U_B_CombatUniform_mcam";};
player forceAddUniform _uniform;

_headgear = "H_Cap_blk";
if(__GETC__(life_plodrank) >= 3) then {_headgear = "H_Beret_blk";};
player addItem _headgear;
player assignItem _headgear;

//NDJ 03May14 - if cop, retexture me
[player, true] call life_fnc_HandleUniforms; //choose uniform retexture and send it to everyone.
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

[] call life_fnc_saveGear;