#include <macro.h>
/*
	File: fn_mercLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the mercenaries out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if(__GETC__(life_merclevel) == 1) then
	{
		player forceaddUniform "U_IG_Guerilla1_1";
		player addVest "V_BandollierB_oli";
		player addBackpack "B_AssaultPack_dgtl";
		player addHeadgear "H_Cap_oli";
		player addItem "NVGoggles_INDEP";
		player assignItem "NVGoggles_INDEP";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player additem "FirstAidKit";
	};

if(__GETC__(life_merclevel) == 2) then
	{
		player forceaddUniform "U_IG_Guerilla2_1";
		player addVest "V_Chestrig_blk";
		player addBackpack "B_AssaultPack_dgtl";
		player addHeadgear "H_Shemag_olive";
		player addItem "NVGoggles_INDEP";
		player assignItem "NVGoggles_INDEP";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player additem "FirstAidKit";
	};
if(__GETC__(life_merclevel) == 3) then
	{
		player forceaddUniform "U_I_CombatUniform";
		player addVest "V_PlateCarrierIA1_dgtl";
		player addBackpack "B_AssaultPack_dgtl";
		player addHeadgear "H_HelmetIA";
		player addItem "NVGoggles_INDEP";
		player assignItem "NVGoggles_INDEP";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player additem "FirstAidKit";
	};
if(__GETC__(life_merclevel) == 4) then
	{
		player forceaddUniform "U_I_GhillieSuit";
		player addVest "V_PlateCarrierIA2_dgtl";
		player addBackpack "B_AssaultPack_dgtl";
		player addHeadgear "H_HelmetIA";
		player addItem "NVGoggles_INDEP";
		player assignItem "NVGoggles_INDEP";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player additem "FirstAidKit";
	};

[] call life_fnc_saveGear;