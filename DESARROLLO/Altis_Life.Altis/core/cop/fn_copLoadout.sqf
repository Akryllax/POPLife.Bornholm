#include <macro.h>
/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka,Quickskill

	Description:
	Loads the cops out with the default gear.
*/

private["_handle","_lvl"];
#define __GETC__(var) (call var)

if(__GETC__(life_coplevel) > 0) then {
_lvl = __GETC__(life_coplevel);
}else{
_lvl = 1;
};

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};




//Recluta
if(_lvl == 1) then
	{
        player forceaddUniform "U_Rangemaster";
		player addVest "V_Rangemaster_belt";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//local 1
if(_lvl == 2 ) then
	{
        player forceaddUniform "U_Rangemaster";
		player addVest "V_Rangemaster_belt";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//nacional 1
if(_lvl == 3 ) then
	{

        player forceaddUniform "U_Rangemaster";
		player addVest "V_BandollierB_blk";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//nacional 2
if(_lvl == 4 ) then
	{
        player forceaddUniform "U_Rangemaster";
		player addVest "V_BandollierB_blk";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Guardia Civil
if(_lvl == 5 ) then
	{

        player forceaddUniform "U_Rangemaster";
		player addVest "V_TacVest_blk_POLICE";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addWeapon "hgun_P07_snds_F";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Guardia Civil
if(_lvl == 6) then
	{

        player forceaddUniform "U_B_CombatUniform_mcam_worn";
		removeHeadGear player;
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_TacVest_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};

//GEO
if(_lvl == 7) then
	{
		player forceaddUniform "U_B_CombatUniform_mcam_worn";
		player addGoggles "G_Balaclava_Lowprofile";
		removeHeadGear player;
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_TacVest_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "hgun_P07_snds_F";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Capitan
if(_lvl == 8) then
	{

		player forceaddUniform "U_B_CombatUniform_mcam_worn";
		removeHeadGear player;
		player addHeadgear "H_Beret_red";
		player addVest "V_TacVest_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "G_Squares_Tinted";
		player assignItem "G_Squares_Tinted";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "hgun_P07_snds_F";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};

[] call life_fnc_copUniform;
[] call life_fnc_saveGear;