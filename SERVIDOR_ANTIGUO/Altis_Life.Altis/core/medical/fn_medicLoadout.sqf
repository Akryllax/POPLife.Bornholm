/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

removeAllContainers player;
removeAllWeapons player;
player addItem "ItemRadio"; //ADD THIS
player assignItem "ItemRadio"; //ADD THIS
player addUniform "U_Rangemaster";
player addHeadgear "H_MilCap_blue";		
player addBackpack "B_AssaultPack_blk";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
player additem "Medikit";
player additem "ToolKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";

[] call life_fnc_saveGear;