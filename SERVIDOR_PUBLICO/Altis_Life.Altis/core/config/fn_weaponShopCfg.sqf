#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

_AKR_fnc_processDiscount = {
	private["_result","_out","_discount"];
	_result = [_this,0,[],[[]]] call BIS_fnc_param;
	
	if(count _result <= 0) exitWith { hint "Error procesando descuento: ArrayNULL"; };
	
	_discount = -1;
	
	if(__GETC__(life_donator) == 0) then { _discount = 1};
	if(__GETC__(life_donator) == 1) then { _discount = 0.85};
	if(__GETC__(life_donator) == 2) then { _discount = 0.8};
	if(__GETC__(life_donator) == 3) then { _discount = 0.7};
	if(__GETC__(life_donator) == 4) then { _discount = 0.5};
	
	_temp = [];
	{
		diag_log format["Processing %1", _x];
		_x set [2, (_x select 2) * _discount];
		_temp pushBack _x;
		diag_log format["Processed '%1'. Set value to %2", _x, _x select 2];
	} forEach (_result select 1);
	
	_result set[1, _temp];
	
	_result
};

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			default
			{
				["Tienda policia",
					[
						["ItemRadio","Cellphone",500],
						["hgun_P07_snds_F","Stun Pistol",1000],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[	
						["ItemRadio","Cellphone",500],
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_AssaultPack_blk",nil,3000],
						["H_MilCap_blue",nil,100]
					]
				];
			};
		};
	};
	
	case "cop_weapons_general":
	{
		switch(true) do
		{
			case (playerSide != west): {"No eres policia!"};
			default
			{
				_out = ["Armeria Policial",
					[
						["ItemRadio","Cellphone",500],
						["acc_flashlight",nil,500],
						["optic_ACO_grn",nil,1200],							
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,1500],
						["optic_Hamr",nil,1500],
						["arifle_SDAR_F",nil,1500],
						["20Rnd_556x45_UW_mag",nil,200],
						["30Rnd_556x45_Stanag",nil,150],
						["arifle_TRG20_ACO_F",nil,1500]						
					]
				];
				
				_armas = _out select 1;

				//NIVEL 2
				if(__GETC__(life_coplevel) > 1) then
				{
					{
						_armas pushBack _x;
					} forEach [
							["hgun_PDW2000_F",nil,8000],
							["30Rnd_9x21_Mag",nil,100],	
							["SMG_02_F",nil,10000],
							["SMG_01_F",nil,12000],
							["30Rnd_45ACP_Mag_SMG_01",nil,100],	
							["arifle_TRG20_F",nil,12000],
							["arifle_Mk20_F",nil,14000],
							["arifle_Katiba_F",nil,15000],	
							["30Rnd_65x39_caseless_green",nil,250],
							["arifle_MX_Hamr_pointer_F",nil,20000],
							["arifle_MX_F",nil,20000],
							["30Rnd_65x39_caseless_mag",nil,250]									
						];
				};
				
				//NIVEL 3
				if(__GETC__(life_coplevel) > 2) then
				{
						{
							_armas pushBack _x;
						} forEach [
							["arifle_Katiba_GL_F",nil,25000],
							["30Rnd_65x39_caseless_green",nil,175],
							["1Rnd_Smoke_Grenade_shell",nil,200],	
							["arifle_MX_GL_Black_F",nil,30000],
							["muzzle_snds_acp",nil,5000]
						];
				};
				
				//NIVEL 4
				if(__GETC__(life_coplevel) > 3) then
				{
						{
							_armas pushBack _x;
						} forEach [
							["30Rnd_65x39_caseless_mag",nil,175], 
							["arifle_MXM_DMS_F",nil,20000]
						];
				};
				
				//NIVEL 5
				if(__GETC__(life_coplevel) > 4) then
				{
						{
							_armas pushBack _x;
						} forEach [
							["srifle_DMR_01_F",nil,20000], 
							["10Rnd_762x51_Mag",nil,250],					
							["srifle_EBR_F",nil,20000],
							["20Rnd_762x51_Mag",nil,500]
						];
				};
				
				//NIVEL 6
				if(__GETC__(life_coplevel) > 5) then
				{
						{
							_armas pushBack _x;
						} forEach [
							["LMG_Mk200_F",nil,50000],  
							["200Rnd_65x39_cased_Box",nil,5000],
							["LMG_Zafir_F",nil,80000],
							["150Rnd_762x51_Box",nil,7500],
							["srifle_GM6_F",nil,30000],
							["5Rnd_127x108_Mag",nil,1000],						
							["srifle_LRR_F",nil,40000],
							["7Rnd_408_Mag",nil,1000],	
							["launch_NLAW_F",nil,250000],
							["NLAW_F",nil,10000],
							["launch_RPG32_F",nil,200000],	
							["RPG32_F",nil,10000],		
							["optic_SOS",nil,2500],
							["optic_MRCO",nil,850]
						];
				};
				
				//NIVEL 8
				if(__GETC__(life_coplevel) > 7) then
				{
							_armas + [
							["hgun_ACPC2_F",nil,1000],
							["9Rnd_45ACP_Mag",nil,50],
							["hgun_P07_F",nil,1000],
							["16Rnd_9x21_Mag",nil,50],
							["hgun_Rook40_F",nil,1000],
							["30Rnd_9x21_Mag",nil,125],
							["hgun_Pistol_heavy_01_F",nil,3000], 
							["11Rnd_45ACP_Mag",nil,175],					
							["hgun_Pistol_heavy_02_F",nil,3500],
							["6Rnd_45ACP_Cylinder",nil,175],			
							["muzzle_snds_L",nil,500],
							["muzzle_snds_H",nil,500],
							["muzzle_snds_M",nil,500],
							["muzzle_snds_B",nil,500],					
							["optic_Yorris",nil,750],
							["optic_MRD",nil,750],
							["optic_NVS",nil,2500],
							["optic_DMS",nil,2500],
							["optic_LRPS",nil,2500],
							["B_UAV_01_backpack_F",nil,50000],
							["B_UavTerminal",nil,1000]
						];
				};				
				
				_out;
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres civil!"};
			case (!license_civ_rebel): {"Necesitas tener el entrenamiento rebelde!"};
			default
			{
				_result = ["Mohammed's Jihadi Shop",
					[
						["ItemRadio","Telefono",500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["NVGoggles_INDEP",nil,2000],
						["NVGoggles_OPFOR",nil,2000],
						["hgun_ACPC2_F",nil,6000],
						["9Rnd_45ACP_Mag",nil,100],
						["hgun_P07_F",nil,6000],
						["16Rnd_9x21_Mag",nil,100],
						["hgun_Rook40_F",nil,6000],
						["30Rnd_9x21_Mag",nil,250],
						["hgun_Pistol_heavy_01_F",nil,9000],
						["11Rnd_45ACP_Mag",nil,350],					
						["hgun_Pistol_heavy_02_F",nil,10000],
						["6Rnd_45ACP_Cylinder",nil,350],
						["hgun_PDW2000_F",nil,20000],
						["30Rnd_9x21_Mag",nil,200],	
						["SMG_02_F",nil,30000],
						["30Rnd_9x21_Mag",nil,200],	
						["SMG_01_F",nil,35000],
						["SMG_01_Holo_pointer_snds_F","Vermin SMG Silenciada",40000],
						["muzzle_snds_acp",nil,15000],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],							
						["arifle_TRG20_F",nil,40000],
						["arifle_Mk20_F",nil,45000],
						["30Rnd_556x45_Stanag",nil,300],
						["arifle_Katiba_F",nil,50000],						
						["arifle_Katiba_GL_F",nil,100000],
						["30Rnd_65x39_caseless_green",nil,275],
						["1Rnd_HE_Grenade_shell",nil,100000],	
						["arifle_MX_F",nil,80000],
						["30Rnd_65x39_caseless_mag",nil,500],
						["srifle_DMR_01_F",nil,60000],
						["10Rnd_762x51_Mag",nil,500],					
						["srifle_EBR_F",nil,100000],
						["20Rnd_762x51_Mag",nil,1000],
						["LMG_Mk200_F",nil,160000],
						["200Rnd_65x39_cased_Box",nil,10000],			
						["acc_flashlight",nil,1000],
						["muzzle_snds_L",nil,5000],
						["optic_Yorris",nil,1500],
						["optic_MRD",nil,1500],
						["optic_ACO_grn",nil,2500],
						["optic_Holosight",nil,2500],
						["optic_Arco",nil,3000],
						["optic_Hamr",nil,3000],
						["optic_NVS",nil,5000],
						["optic_DMS",nil,4500],
						["optic_SOS",nil,5000],
						["optic_LRPS",nil,5000]							
					]
				];
				
				_out = [_result] call _AKR_fnc_processDiscount;
				_out
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres civil!"};
			case (!license_civ_gun): {"Necesitas la licencia de armas!"};
			default
			{
				_result = ["Billy Joe's Firearms",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["hgun_ACPC2_F",nil,6000],
						["9Rnd_45ACP_Mag",nil,100],
						["hgun_P07_F",nil,6000],
						["16Rnd_9x21_Mag",nil,100],
						["hgun_Rook40_F",nil,6000],
						["30Rnd_9x21_Mag",nil,250],
						["hgun_Pistol_heavy_01_F",nil,9000],
						["11Rnd_45ACP_Mag",nil,350],					
						["hgun_Pistol_heavy_02_F",nil,10000],
						["6Rnd_45ACP_Cylinder",nil,350],
						["hgun_PDW2000_F",nil,20000],
						["30Rnd_9x21_Mag",nil,200],
						["arifle_SDAR_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,100]
					]
				];

				_out = [_result] call _AKR_fnc_processDiscount;
				_out
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"No eres civil!"};
			default
			{
				_result = ["Hideout Armament",
					[
					["ItemRadio","Cellphone",500],
					["hgun_ACPC2_F",nil,6000],
					["9Rnd_45ACP_Mag",nil,100],
					["hgun_P07_F",nil,6000],
					["16Rnd_9x21_Mag",nil,100],
					["hgun_Rook40_F",nil,6000],
					["30Rnd_9x21_Mag",nil,250],
					["hgun_Pistol_heavy_01_F",nil,9000],
					["11Rnd_45ACP_Mag",nil,350],					
					["hgun_Pistol_heavy_02_F",nil,10000],
					["6Rnd_45ACP_Cylinder",nil,350],
					["hgun_PDW2000_F",nil,20000],
					["30Rnd_9x21_Mag",nil,200],	
					["SMG_02_F",nil,30000],
					["30Rnd_9x21_Mag",nil,200],	
					["SMG_01_F",nil,35000],
					["30Rnd_45ACP_Mag_SMG_01",nil,200],							
					["arifle_TRG20_F",nil,40000],
					["arifle_Mk20_F",nil,45000],
					["30Rnd_556x45_Stanag",nil,300],
					["arifle_Katiba_F",nil,50000],						
					["arifle_Katiba_GL_F",nil,100000],
					["30Rnd_65x39_caseless_green",nil,275],
					["1Rnd_HE_Grenade_shell",nil,100000],	
					["arifle_MX_F",nil,80000],
					["30Rnd_65x39_caseless_mag",nil,500],
					["srifle_DMR_01_F",nil,60000],
					["10Rnd_762x51_Mag",nil,500],					
					["srifle_EBR_F",nil,100000],
					["20Rnd_762x51_Mag",nil,1000],
					["LMG_Mk200_F",nil,160000],
					["200Rnd_65x39_cased_Box",nil,10000],		
					["optic_Yorris",nil,1500],
					["optic_MRD",nil,1500],
					["optic_ACO_grn",nil,2500],
					["optic_Holosight",nil,2500],
					["optic_Arco",nil,3000],
					["optic_Hamr",nil,3000],
					["optic_NVS",nil,5000],
					["optic_DMS",nil,4500],
					["optic_SOS",nil,5000],
					["optic_LRPS",nil,5000]	
					]
				];
				
				_out = [_result] call _AKR_fnc_processDiscount;
				_out
			};
		};
	};
	
	case "genstore":
	{
		_result = ["Altis General Store",
			[
				["ItemRadio","Cellphone",500],
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];

		_out = [_result] call _AKR_fnc_processDiscount;
		_out
	};
	
	case "specialWeapons":
	{
		_result = ["Contrabandista de armas",
			[
				["launch_NLAW_F",nil,600000],
				["NLAW_F",nil,10000],
				["srifle_LRR_SOS_F",nil,500000],
				["7Rnd_408_Mag",nil,5000],
				["srifle_GM6_SOS_F",nil,300000],
				["5Rnd_127x108_Mag",nil,4000],
				["arifle_MXM_Black_F",nil,100000],
				["30Rnd_65x39_caseless_mag",nil,1000],	
				["LMG_Mk200_MRCO_F",nil,250000],
				["200Rnd_65x39_cased_Box",nil,3000],
				["200Rnd_65x39_cased_Box_Tracer",nil,4000],											
				["arifle_Katiba_GL_ACO_F",nil,100000],
				["30Rnd_65x39_caseless_green",nil,1500],
				["1Rnd_HE_Grenade_shell",nil,100000],
				["Rangefinder",nil,5000],
				["LMG_Zafir_F",nil,350000],
				["150Rnd_762x51_Box",nil,3500],
				["150Rnd_762x51_Box_Tracer",nil,4500],
				["DemoCharge_Remote_Mag",nil,700000],
				["optic_ACO_grn",nil,2500],
				["optic_Holosight",nil,2500],
				["optic_Arco",nil,3000],
				["optic_Hamr",nil,3000],
				["optic_NVS",nil,5000],
				["optic_DMS",nil,4500],
				["optic_SOS",nil,5000],
				["optic_LRPS",nil,5000]		
			]
		];
			
		_out = [_result] call _AKR_fnc_processDiscount;
		_out
	};
	
	case "galeriaTiro":
	{
		["Galeria de tiro",
			[
				["hgun_ACPC2_F",nil,6000],
				["9Rnd_45ACP_Mag",nil,100],
				["hgun_P07_F",nil,6000],
				["16Rnd_9x21_Mag",nil,100],
				["hgun_Rook40_F",nil,6000],
				["30Rnd_9x21_Mag",nil,250],
				["hgun_Pistol_heavy_01_F",nil,9000],
				["11Rnd_45ACP_Mag",nil,350],					
				["hgun_Pistol_heavy_02_F",nil,10000],
				["6Rnd_45ACP_Cylinder",nil,350],
				["hgun_PDW2000_F",nil,20000],
				["30Rnd_9x21_Mag",nil,200],	
				["SMG_02_F",nil,30000],
				["30Rnd_9x21_Mag",nil,200],	
				["SMG_01_F",nil,35000],
				["30Rnd_45ACP_Mag_SMG_01",nil,200],							
				["arifle_TRG20_F",nil,40000],
				["arifle_Mk20_F",nil,45000],
				["30Rnd_556x45_Stanag",nil,300],
				["arifle_Katiba_F",nil,50000],						
				["arifle_Katiba_GL_F",nil,100000],
				["30Rnd_65x39_caseless_green",nil,275],
				["1Rnd_HE_Grenade_shell",nil,100000],	
				["arifle_MX_F",nil,80000],
				["30Rnd_65x39_caseless_mag",nil,500],
				["srifle_DMR_01_F",nil,60000],
				["10Rnd_762x51_Mag",nil,500],					
				["srifle_EBR_F",nil,100000],
				["20Rnd_762x51_Mag",nil,1000],
				["LMG_Mk200_F",nil,160000],
				["200Rnd_65x39_cased_Box",nil,10000],		
				["optic_Yorris",nil,1500],
				["optic_MRD",nil,1500],
				["optic_ACO_grn",nil,2500],
				["optic_Holosight",nil,2500],
				["optic_Arco",nil,3000],
				["optic_Hamr",nil,3000],
				["optic_NVS",nil,5000],
				["optic_DMS",nil,4500],
				["optic_SOS",nil,5000],
				["optic_LRPS",nil,5000]		
			]
		];
	};
	
		
	case "mercenarios":
	{
		["Tienda de mercenarios",
			[
				["ItemRadio","Cellphone",500],
				["hgun_ACPC2_F",nil,1000],
				["9Rnd_45ACP_Mag",nil,50],
				["hgun_P07_F",nil,1000],
				["16Rnd_9x21_Mag",nil,50],
				["hgun_Rook40_F",nil,1000],
				["30Rnd_9x21_Mag",nil,125],
				["hgun_Pistol_heavy_01_F",nil,3000],
				["11Rnd_45ACP_Mag",nil,175],					
				["hgun_Pistol_heavy_02_F",nil,3500],
				["6Rnd_45ACP_Cylinder",nil,175],
				["hgun_PDW2000_F",nil,15000],
				["30Rnd_9x21_Mag",nil,100],	
				["SMG_02_F",nil,20000],
				["30Rnd_9x21_Mag",nil,100],	
				["SMG_01_F",nil,30000],
				["SMG_01_Holo_pointer_snds_F",nil,30000],
				["30Rnd_45ACP_Mag_SMG_01",nil,100],	
				["arifle_TRG20_F",nil,40000],
				["arifle_TRG21_GL_MRCO_F",nil,70000],
				["arifle_Mk20_F",nil,40000],
				["arifle_Mk20_GL_plain_F",nil,80000],
				["1Rnd_Smoke_Grenade_shell",nil,200],
				["1Rnd_HE_Grenade_shell",nil,80000],
				["30Rnd_556x45_Stanag",nil,150],
				["arifle_Katiba_F",nil,50000],						
				["arifle_Katiba_GL_F",nil,80000],
				["30Rnd_65x39_caseless_green",nil,175],
				["1Rnd_Smoke_Grenade_shell",nil,200],
				["1Rnd_HE_Grenade_shell",nil,80000],
				["arifle_MX_F",nil,50000],
				["arifle_MX_GL_Black_F",nil,80000],
				["30Rnd_65x39_caseless_mag",nil,175],
				["1Rnd_Smoke_Grenade_shell",nil,200],
				["1Rnd_HE_Grenade_shell",nil,80000],
				["srifle_DMR_01_F",nil,50000],
				["10Rnd_762x51_Mag",nil,250],					
				["srifle_EBR_F",nil,60000],
				["20Rnd_762x51_Mag",nil,500],
				["LMG_Mk200_F",nil,80000],
				["200Rnd_65x39_cased_Box",nil,5000],
				["LMG_Zafir_F",nil,100000],
				["150Rnd_762x51_Box",nil,7500],		
				["srifle_GM6_F",nil,120000],
				["5Rnd_127x108_Mag",nil,1800],						
				["srifle_LRR_F",nil,200000],
				["7Rnd_408_Mag",nil,2000],	
				["launch_RPG32_F",nil,300000],	
				["RPG32_F",nil,50000],	
				["launch_B_Titan_short_F",nil,350000],
				["Titan_AT",nil,50000],
				["acc_flashlight",nil,500],
				["muzzle_snds_L",nil,500],
				["muzzle_snds_H",nil,500],
				["muzzle_snds_M",nil,500],
				["muzzle_snds_B",nil,500],					
				["optic_Yorris",nil,750],
				["optic_MRD",nil,750],
				["optic_ACO_grn",nil,1200],
				["optic_Holosight",nil,1200],
				["optic_Arco",nil,1500],
				["optic_Hamr",nil,1500],
				["optic_NVS",nil,2500],
				["optic_DMS",nil,2500],
				["optic_SOS",nil,2500],
				["optic_LRPS",nil,2500],	
				["Rangefinder",nil,500],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["Medikit",nil,1000],
				["NVGoggles",nil,2000],
				["NVGoggles_INDEP",nil,2000],
				["NVGoggles_OPFOR",nil,2000],
				["O_UAV_01_backpack_F",nil,50000],
				["O_UavTerminal",nil,1000]
			]
		];
	};
	
	case "mercenarios_2":
	{
		switch(true) do
		{
			case (playerSide != east): {"No eres mercenario!"};
			case (__GETC__(life_merlevel) > 4): {"No tienes acceso al armamento especial"};
			default
			{
				["Armamento especial",
					[
						["optic_tws",nil,500000]
					]
				];
			};
		};
	};
	
	case "bhws":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tienes que ser un civil!"};
			case (!license_civ_bountyh): {"No tienes la licencia de cazarecompensas"};
			default
			{
				["Bounty hunter's shop",
					[
						["hgun_P07_snds_F","Taser",15000],
						["16Rnd_9x21_Mag","Municion taser",250],
						["Smokeshell","Granada de humo",5000]
					]
				];
			};
		};

	};
};
