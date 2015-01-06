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
if(_lvl == 1 ) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
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
		player addWeapon "arifle_TRG20_ACO_F";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Municipal
if(_lvl == 2) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
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
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_Mk20C_ACO_pointer_F";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";	
		player addMagazine "30Rnd_556x45_Stanag";
		player addMagazine "30Rnd_556x45_Stanag";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Nacional 1
if(_lvl == 3 ) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
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
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_Hamr_pointer_F";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Nacional 2
if(_lvl == 4 ) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
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
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MXM_Hamr_pointer_F";
		player addItem "optic_DMS";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";	
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Nacional 3
if(_lvl == 5 ) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
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
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "srifle_EBR_DMS_F";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "optic_LRPS";
		player addItem "optic_NVS";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";		
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};
	
//Guardia Civil
if(_lvl == 6 ) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
		player addVest "V_PlateCarrier1_blk";
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
		player addWeapon "srifle_EBR_MRCO_pointer_F";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "optic_LRPS";
		player addItem "optic_NVS";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";		
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player additem "Medikit";
		player additem "ToolKit";
	};

//Guardia Civil
if(_lvl == 7) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
		removeHeadGear player;
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "srifle_EBR_DMS_pointer_snds_F";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "optic_LRPS";
		player addItem "optic_NVS";
		player addItem "SmokeShell"; 
		player addItem "SmokeShell"; 
		player addItem "SmokeShell"; 
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};

//GEO
if(_lvl == 8) then
	{
		
		player addGoggles "G_Balaclava_Lowprofile";
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
		removeHeadGear player;
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Carryall_Base";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "srifle_EBR_DMS_pointer_snds_F";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "optic_LRPS";
		player addItem "optic_NVS";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};
	
//Capitan
if(_lvl == 9) then
	{
		
		player addItem "ItemRadio"; //ADD THIS
		player assignItem "ItemRadio"; //ADD THIS
		removeHeadGear player;
		player addHeadgear "H_Beret_red";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Carryall_Base";		
		player addItem "G_Squares_Tinted";
		player assignItem "G_Squares_Tinted";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "srifle_EBR_DMS_pointer_snds_F";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addItem "20Rnd_762x51_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addItem "SmokeShell"; 
		player addItem "SmokeShell"; 
		player addItem "SmokeShell"; 			
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addItem "optic_NVS";
		player addItem "optic_LRPS";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player additem "Medikit";
		player additem "ToolKit";
	};
	
[] call life_fnc_copUniform;
[] call life_fnc_saveGear;