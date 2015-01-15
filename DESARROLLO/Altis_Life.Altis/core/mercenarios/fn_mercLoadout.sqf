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

if(__GETC__(life_merclevel) <= 3) then
	{
		player forceaddUniform "U_BG_Guerilla1_1";
		player addVest "V_PlateCarrierIA1_dgtl";
		player addBackpack "B_AssaultPack_dgtl";
		player addHeadgear "H_MilCap_dgtl";
		player addWeapon "hgun_Pistol_heavy_01_F";
		player addMagazine "11Rnd_45ACP_Mag";
		player addMagazine "11Rnd_45ACP_Mag";
		player addMagazine "11Rnd_45ACP_Mag";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player additem "FirstAidKit";
	};

if(__GETC__(life_merclevel) == 4) then
	{
		player forceaddUniform "U_I_CombatUniform";
		player addVest "V_PlateCarrierIA2_dgtl";
		player addBackpack "B_AssaultPack_dgtl";
		player addHeadgear "H_Beret_grn";
		player addWeapon "hgun_Pistol_heavy_01_F";
		player addMagazine "11Rnd_45ACP_Mag";
		player addMagazine "11Rnd_45ACP_Mag";
		player addMagazine "11Rnd_45ACP_Mag";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player additem "FirstAidKit";
	};

[] call life_fnc_saveGear;