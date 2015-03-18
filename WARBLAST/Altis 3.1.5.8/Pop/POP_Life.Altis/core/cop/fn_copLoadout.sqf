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
        player forceaddUniform "U_Competitor";
		player addVest "policia_sniper_vest";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//local 1
if(_lvl == 2 ) then
	{
        player forceaddUniform "U_Competitor";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//nacional 1
if(_lvl == 3 ) then
	{

        player forceaddUniform "policia_man_uniform";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addHeadgear "policia_cnp_gorra";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
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
        player forceaddUniform "policia_goes_uniform_camu";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addHeadgear "policia_cnp_gorra";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
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

        player forceaddUniform "U_B_CombatUniform_mcam_worn";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addHeadgear "H_Beret_blk_POLICE";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
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
if(_lvl == 6) then
	{

        player forceaddUniform "U_B_CombatUniform_mcam_worn";
		removeHeadGear player;
		player addHeadgear "H_Watchcap_blk";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};

//GEO
if(_lvl == 7) then
	{
		player forceaddUniform "policia_geo_man_uniform";
		player addGoggles "G_Balaclava_Lowprofile";
		removeHeadGear player;
		player addHeadgear "policia_sniper_cap";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
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

		player forceaddUniform "policia_inspector_uniform_geo";
		removeHeadGear player;
		player addHeadgear "policia_cnp_gorra";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addBackpack "B_Carryall_Base";
		player addItem "G_Squares_Tinted";
		player assignItem "G_Squares_Tinted";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addMagazine "DDOPP_1Rnd_X26";
		player addWeapon "DDOPP_X26";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "SmokeShellBlue";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};
[] call War_fnc_texturas;
[] call life_fnc_saveGear;