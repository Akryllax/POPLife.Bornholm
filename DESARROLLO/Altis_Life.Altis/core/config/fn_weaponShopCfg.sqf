#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine //Modificado por PKE
	
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

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia!"};
			default
			{
				["Tienda general de policia",
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
			case (playerSide != independent): {"Tu no eres medico"};
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

	case "Nivel recluta":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia!"};
			case (__GETC__(life_coplevel) < 1): {"tu no eres recluta!"};
			default
			{
				["tienda recluta",
					[
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
					]
				];
			};
		};
	};

	case "Nivel policia local":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia!"};
			case (__GETC__(life_coplevel) < 2): {"tu no eres policia local!"};
			default
			{
				["tienda policia local",
					[
						["arifle_Katiba_GL_F",nil,25000],
							["30Rnd_65x39_caseless_green",nil,175],
							["1Rnd_Smoke_Grenade_shell",nil,200],	
							["arifle_MX_GL_Black_F",nil,30000],
							["muzzle_snds_acp",nil,5000]
					]
				];
			};
		};
	};

	case "Nivel policia local 2":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia!"};
			case (__GETC__(life_coplevel) < 3): {"tu no eres policia local 2!"};
			default
			{
				["tienda policia local 2",
					[
						["arifle_Katiba_GL_F",nil,25000],
							["30Rnd_65x39_caseless_green",nil,175],
							["1Rnd_Smoke_Grenade_shell",nil,200],	
							["arifle_MX_GL_Black_F",nil,30000],
							["muzzle_snds_acp",nil,5000]
					]
				];
			};
		};
	};	
	
	case "Nivel policia nacional  1":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia!"};
			case (__GETC__(life_coplevel) < 4): {"tu no eres policia nacional 1!"};
			default
			{
				["tienda policia nacional 1",
					[
						["30Rnd_65x39_caseless_mag",nil,175], 
							["arifle_MXM_DMS_F",nil,20000]
					]
				];
			};
		};
	};	
	
	case "Nivel policia nacional  2":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia !"};
			case (__GETC__(life_coplevel) < 5): {"tu no eres policia nacional 2!"};
			default
			{
				["tienda policia nacional 2",
					[
						    ["srifle_DMR_01_F",nil,20000], 
							["10Rnd_762x51_Mag",nil,250],					
							["srifle_EBR_F",nil,20000],
							["20Rnd_762x51_Mag",nil,500]
					]
				];
			};
		};
	};	
	
	case "Nivel guardia civil 1":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia !"};
			case (__GETC__(life_coplevel) < 6): {"tu no eres guardia civil 1!"};
			default
			{
				["tienda guardia civil 1",
					[
						    ["LMG_Mk200_F",nil,50000],  
							["200Rnd_65x39_cased_Box",nil,5000],					
							["150Rnd_762x51_Box",nil,7500],
							["5Rnd_127x108_Mag",nil,1000],						
							["srifle_LRR_F",nil,40000],
							["7Rnd_408_Mag",nil,1000],	
							["launch_NLAW_F",nil,250000],
							["optic_SOS",nil,2500],
							["optic_MRCO",nil,850]
					]
				];
			};
		};
	};	
	
	case "Nivel guardia civil 2":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia !"};
			case (__GETC__(life_coplevel) < 7): {"tu no eres guardia civil 2!"};
			default
			{
				["tienda guardia civil 2",
					[
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
					]
				];
			};
		};
	};	

	case "Nivel geo":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia !"};
			case (__GETC__(life_coplevel) < 8): {"tu no eres geo!"};
			default
			{
				["tienda geo",
					[
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

						]
				];
			};
		};
	};	
	
	case "Nivel capitan":
	{
		switch(true) do
		{
			case (playerSide != west): {"Tu no eres policia !"};
			case (__GETC__(life_coplevel) < 9): {"tu no eres capitan!"};
			default
			{
				["tienda capitan",
					[
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

						]
				];
			};
		};
	};	
	
	case "mafioso":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu no eres civil!"};
			case (!license_civ_rebel): {"No tienes la licencia de mafioso!"};
			default
			{
				["Mohammed's Jihadi Shop",
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
			};
		};
	};
	
	case "Armeria":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu no eres civil!"};
			case (!license_civ_gun): {"Necesitas  licencia de armas!"};
			default
			{
				["Tienda de armas con licencia",
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
			};
		};
	};
	
	case "Guarida de banda":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu no eres civil!"};
			default
			{
				["Tienda guarida de banda",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
						["arifle_Katiba_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,275],
						["SMG_02_F",nil,30000],
					    ["30Rnd_9x21_Mag",nil,200],	

					]
				];
			};
		};
	};
	
	case "Items generales":
	{
		["tienda general",
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
	};
};
