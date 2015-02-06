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
		    case (__GETC__(life_coplevel) == 1) :
			{
				["Tienda general de policia",
					[
						["hgun_P07_snds_F",nil,1000 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc]
						
					]
				];
			};

          	case (__GETC__(life_coplevel) == 2) :
		    {
				["Tienda locales",
					[
						["arifle_SDAR_F",nil,25000 * Desc],
						["30Rnd_556x45_Stanag",nil,100 * Desc]
						["hgun_P07_snds_F",nil,1000 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["arifle_Mk20C_F",nil,9500 * Desc],
						["30Rnd_556x45_Stanag",nil,75 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc],
						["optic_ACO_grn_smg",nil,300 * Desc],
						["optic_ACO_smg",nil,300 * Desc]
					]
				];
		    };

	        case (__GETC__(life_coplevel) == 3) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F",nil,1000 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["arifle_Mk20C_F",nil,9500 * Desc],
						["30Rnd_556x45_Stanag",nil,75 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc],
						["optic_ACO_grn_smg",nil,300 * Desc],
						["optic_ACO_smg",nil,300 * Desc],
						["arifle_MXC_F",nil,12500 * Desc],
						["30Rnd_65x39_caseless_mag",nil,100 * Desc],
						["optic_Hamr",nil,600 * Desc],
						["optic_DMS",nil,1000 * Desc]

					]
				];
		    };
		        case (__GETC__(life_coplevel) == 4) :
		   {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F",nil,1000 * Desc],
						["16Rnd_9x21_Mag",nil,25 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["arifle_Mk20C_F",nil,9500 * Desc],
						["30Rnd_556x45_Stanag",nil,75 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc],
						["optic_ACO_grn_smg",nil,300 * Desc],
						["optic_ACO_smg",nil,300 * Desc],
						["arifle_MXC_F",nil,12500 * Desc],
						["arifle_MX_F",nil,15000 * Desc],
						["30Rnd_65x39_caseless_mag",nil,100 * Desc],
						["optic_Hamr",nil,600 * Desc],
						["optic_DMS",nil,1000 * Desc]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 5) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F",nil,1000 * Desc],
						["16Rnd_9x21_Mag",nil,25 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["arifle_Mk20C_F",nil,9500 * Desc],
						["30Rnd_556x45_Stanag",nil,75 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc],
						["optic_ACO_grn_smg",nil,300 * Desc],
						["optic_ACO_smg",nil,300 * Desc],
						["arifle_MXC_F",nil,12500 * Desc],
						["arifle_MX_F",nil,15000 * Desc],
						["arifle_MXM_F",nil,20000 * Desc],
						["30Rnd_65x39_caseless_mag",nil,100 * Desc],
						["optic_Hamr",nil,600 * Desc],
						["optic_DMS",nil,1000 * Desc],
						["srifle_DMR_01_F",nil,20000 * Desc],
						["10Rnd_762x51_Mag",nil,200 * Desc],
                        ["optic_SOS",nil,4000 * Desc]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 6) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000 * Desc],
						["16Rnd_9x21_Mag",nil,25 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["arifle_Mk20C_F",nil,9500 * Desc],
						["30Rnd_556x45_Stanag",nil,75 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc],
						["optic_ACO_grn_smg",nil,300 * Desc],
						["optic_ACO_smg",nil,300 * Desc],
						["arifle_MXC_F",nil,12500 * Desc],
						["arifle_MX_F",nil,15000 * Desc],
						["arifle_MXM_F",nil,20000 * Desc],
						["30Rnd_65x39_caseless_mag",nil,100 * Desc],
						["optic_Hamr",nil,600 * Desc],
						["optic_DMS",nil,1000 * Desc],
						["srifle_DMR_01_F",nil,20000 * Desc],
						["10Rnd_762x51_Mag",nil,200 * Desc],
                        ["optic_SOS",nil,4000 * Desc],
                        ["srifle_EBR_F",nil,25000 * Desc],
                        ["20Rnd_762x51_Mag",nil,300 * Desc],
                        ["SMG_01_F",nil,20000 * Desc],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,100 * Desc],
                        ["muzzle_snds_acp",nil,300 * Desc],
                        ["SmokeShellBlue","Gas Lacrimogeno",5000 * Desc]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 7) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000 * Desc],
						["16Rnd_9x21_Mag",nil,25 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["arifle_Mk20C_F",nil,9500 * Desc],
						["30Rnd_556x45_Stanag",nil,75 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc],
						["optic_ACO_grn_smg",nil,300 * Desc],
						["optic_ACO_smg",nil,300 * Desc],
						["arifle_MXC_F",nil,12500 * Desc],
						["arifle_MX_F",nil,15000 * Desc],
						["arifle_MXM_F",nil,20000 * Desc],
						["muzzle_snds_H",nil,1500 * Desc],
						["30Rnd_65x39_caseless_mag",nil,100 * Desc],
						["optic_Hamr",nil,600 * Desc],
						["optic_DMS",nil,1000 * Desc],
						["srifle_DMR_01_F",nil,20000 * Desc],
						["muzzle_snds_B",nil,2000 * Desc],
						["10Rnd_762x51_Mag",nil,200 * Desc],
                        ["optic_SOS",nil,4000 * Desc],
                        ["srifle_EBR_F",nil,25000 * Desc],
                        ["muzzle_snds_B",nil,2500 * Desc],
                        ["20Rnd_762x51_Mag",nil,300 * Desc],
                        ["SMG_01_F",nil,20000 * Desc],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,100 * Desc],
                        ["muzzle_snds_acp",nil,300 * Desc],
                        ["arifle_MX_SW_Black_F",nil,25000 * Desc],
                        ["100Rnd_65x39_caseless_mag",nil,300 * Desc],
                        ["srifle_LRR_F",nil,100000 * Desc],
                        ["7Rnd_408_Mag",nil,500 * Desc],
                        ["optic_LRPS",nil,8000 * Desc],
                        ["launch_NLAW_F",nil,200000 * Desc],
                        ["NLAW_F",nil,20000 * Desc],
                        ["SmokeShellBlue","Gas Lacrimogeno",5000 * Desc]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 8) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000 * Desc],
						["16Rnd_9x21_Mag",nil,25 * Desc],
						["SMG_02_F",nil,7500 * Desc],
						["30Rnd_9x21_Mag",nil,50 * Desc],
						["arifle_Mk20C_F",nil,9500 * Desc],
						["30Rnd_556x45_Stanag",nil,75 * Desc],
						["Binocular",nil,150 * Desc],
						["Rangefinder",nil,500 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["muzzle_snds_L",nil,650 * Desc],
						["Medikit",nil,1000 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["SmokeShell",nil,200 * Desc],
						["optic_ACO_grn_smg",nil,300 * Desc],
						["optic_ACO_smg",nil,300 * Desc],
						["arifle_MXC_F",nil,12500 * Desc],
						["arifle_MX_F",nil,15000 * Desc],
						["arifle_MX_GL_F",nil,35000 * Desc],
						["arifle_MXM_F",nil,20000 * Desc],
						["muzzle_snds_H",nil,1500 * Desc],
						["30Rnd_65x39_caseless_mag",nil,100 * Desc],
						["optic_Hamr",nil,600 * Desc],
						["optic_DMS",nil,1000 * Desc],
						["srifle_DMR_01_F",nil,20000 * Desc],
						["muzzle_snds_B",nil,2000 * Desc],
						["10Rnd_762x51_Mag",nil,200 * Desc],
                        ["optic_SOS",nil,4000 * Desc],
                        ["srifle_EBR_F",nil,25000 * Desc],
                        ["muzzle_snds_B",nil,2500 * Desc],
                        ["20Rnd_762x51_Mag",nil,300 * Desc],
                        ["SMG_01_F",nil,20000 * Desc],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,100 * Desc],
                        ["muzzle_snds_acp",nil,300 * Desc],
                        ["arifle_MX_SW_Black_F",nil,25000 * Desc],
                        ["100Rnd_65x39_caseless_mag",nil,300 * Desc],
                        ["srifle_LRR_F",nil,100000 * Desc],
                        ["7Rnd_408_Mag",nil,500 * Desc],
                        ["optic_LRPS",nil,8000 * Desc],
                        ["launch_NLAW_F",nil,200000 * Desc],
                        ["NLAW_F",nil,20000 * Desc],
                        ["LMG_Zafir_F",nil,100000 * Desc],
                        ["150Rnd_762x51_Box_Tracer",nil,10000 * Desc],
                        ["srifle_GM6_F",nil,150000 * Desc],
                        ["5Rnd_127x108_APDS_Mag",nil,5000 * Desc],
                        ["SmokeShellBlue","Gas Lacrimogeno",5000 * Desc]
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
			case (__GETC__(life_mediclevel) > 1):
		    {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100 * Desc],
						["Binocular",nil,150 * Desc],
						["ToolKit",nil,250 * Desc],
						["FirstAidKit",nil,150 * Desc],
						["Medikit",nil,500 * Desc],
						["NVGoggles",nil,1200 * Desc],
						["B_AssaultPack_blk",nil,3000 * Desc],
						["H_MilCap_blue",nil,100 * Desc]
					]
				];
			};
		};
	};



	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu no eres civil!"};
			case (!license_civ_rebel): {"No tienes la licencia de mafioso!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["Binocular",nil,150 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["FirstAidKit",nil,150 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["NVGoggles_INDEP",nil,2000 * Desc],
						["NVGoggles_OPFOR",nil,2000 * Desc],
						["hgun_ACPC2_F",nil,6000 * Desc],
						["9Rnd_45ACP_Mag",nil,100 * Desc],
						["hgun_P07_F",nil,6000 * Desc],
						["16Rnd_9x21_Mag",nil,100 * Desc],
						["hgun_Rook40_F",nil,6000 * Desc],
						["30Rnd_9x21_Mag",nil,250 * Desc],
						["hgun_Pistol_heavy_01_F",nil,9000 * Desc],
						["11Rnd_45ACP_Mag",nil,350 * Desc],
						["hgun_Pistol_heavy_02_F",nil,10000 * Desc],
						["6Rnd_45ACP_Cylinder",nil,350 * Desc],
						["hgun_PDW2000_F",nil,20000 * Desc],
						["30Rnd_9x21_Mag",nil,200 * Desc],
						["SMG_02_F",nil,30000 * Desc],
						["30Rnd_9x21_Mag",nil,200 * Desc],
						["SMG_01_F",nil,35000 * Desc],
						["SMG_01_Holo_pointer_snds_F",nil,40000 * Desc],
						["muzzle_snds_acp",nil,15000 * Desc],
						["30Rnd_45ACP_Mag_SMG_01",nil,200 * Desc],
						["arifle_TRG20_F",nil,40000 * Desc],
						["arifle_Mk20_F",nil,45000 * Desc],
						["30Rnd_556x45_Stanag",nil,300 * Desc],
						["arifle_Katiba_F",nil,50000 * Desc],
						["arifle_Katiba_GL_F",nil,100000 * Desc],
						["30Rnd_65x39_caseless_green",nil,275 * Desc],
						["1Rnd_HE_Grenade_shell",nil,100000 * Desc],
						["arifle_MX_F",nil,80000 * Desc],
						["30Rnd_65x39_caseless_mag",nil,500 * Desc],
						["srifle_DMR_01_F",nil,60000 * Desc],
						["10Rnd_762x51_Mag",nil,500 * Desc],
						["srifle_EBR_F",nil,100000 * Desc],
						["20Rnd_762x51_Mag",nil,1000 * Desc],
						["acc_flashlight",nil,1000 * Desc],
						["muzzle_snds_L",nil,5000 * Desc],
						["optic_Yorris",nil,1500 * Desc],
						["optic_MRD",nil,1500 * Desc],
						["optic_ACO_grn",nil,2500 * Desc],
						["optic_Holosight",nil,2500 * Desc],
						["optic_Arco",nil,3000 * Desc],
						["optic_Hamr",nil,3000 * Desc],
						["optic_NVS",nil,5000 * Desc],
						["optic_DMS",nil,4500 * Desc],
						["optic_SOS",nil,5000 * Desc],
						["optic_LRPS",nil,5000 * Desc]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu no eres civil!"};
			case (!license_civ_gun): {"Necesitas  licencia de armas!"};
			default
			{
				["Tienda de armas con licencia",
					[
						["Binocular",nil,150 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["FirstAidKit",nil,150 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["hgun_ACPC2_F",nil,6000 * Desc],
						["9Rnd_45ACP_Mag",nil,100 * Desc],
						["hgun_P07_F",nil,6000 * Desc],
						["16Rnd_9x21_Mag",nil,100 * Desc],
						["hgun_Rook40_F",nil,6000 * Desc],
						["30Rnd_9x21_Mag",nil,250 * Desc],
						["hgun_Pistol_heavy_01_F",nil,9000 * Desc],
						["11Rnd_45ACP_Mag",nil,350 * Desc],
						["hgun_Pistol_heavy_02_F",nil,10000 * Desc],
						["6Rnd_45ACP_Cylinder",nil,350 * Desc],
						["hgun_PDW2000_F",nil,20000 * Desc],
						["30Rnd_9x21_Mag",nil,200 * Desc],
						["arifle_SDAR_F",nil,25000 * Desc],
						["30Rnd_556x45_Stanag",nil,100 * Desc]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu no eres civil!"};
			default
			{
				["Tienda guarida de banda",
					[
						["hgun_Rook40_F",nil,1500 * Desc],
						["hgun_Pistol_heavy_02_F",nil,2500 * Desc],
						["hgun_ACPC2_F",nil,4500 * Desc],
						["hgun_PDW2000_F",nil,9500 * Desc],
						["optic_ACO_grn_smg",nil,950 * Desc],
						["V_Rangemaster_belt",nil,1900 * Desc],
						["16Rnd_9x21_Mag",nil,25 * Desc],
						["9Rnd_45ACP_Mag",nil,45 * Desc],
						["6Rnd_45ACP_Cylinder",nil,50 * Desc],
						["30Rnd_9x21_Mag",nil,75 * Desc],
						["arifle_Katiba_F",nil,50000 * Desc],
						["30Rnd_65x39_caseless_green",nil,275 * Desc],
						["SMG_02_F",nil,30000 * Desc],
					    ["30Rnd_9x21_Mag",nil,200 * Desc]

					]
				];
			};
		};
	};

	case "genstore":
	{
		["tienda general",
			[
				["Binocular",nil,150 * Desc],
				["ItemGPS",nil,100 * Desc],
				["ToolKit",nil,250 * Desc],
				["FirstAidKit",nil,150 * Desc],
				["NVGoggles",nil,2000 * Desc]
			]
		];
	};


    case "merc":
	{
		switch (true) do
		{
			case (playerSide != opfor): {"No eres un mercenario"};
			case (__GETC__(life_merclevel) >= 1):
		    {
				["Tienda Basica Mercenarios",
					[
						["Binocular",nil,150 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["FirstAidKit",nil,150 * Desc],
						["NVGoggles_INDEP",nil,2000 * Desc],
						["hgun_ACPC2_F",nil,6000 * Desc],
						["9Rnd_45ACP_Mag",nil,100 * Desc],
						["hgun_P07_F",nil,6000 * Desc],
						["16Rnd_9x21_Mag",nil,100 * Desc],
						["hgun_Rook40_F",nil,6000 * Desc],
						["30Rnd_9x21_Mag",nil,250 * Desc],
						["hgun_Pistol_heavy_01_F",nil,9000 * Desc],
						["11Rnd_45ACP_Mag",nil,350 * Desc],
						["hgun_Pistol_heavy_02_F",nil,10000 * Desc],
						["6Rnd_45ACP_Cylinder",nil,350 * Desc],
						["hgun_PDW2000_F",nil,20000 * Desc],
						["30Rnd_9x21_Mag",nil,200 * Desc],
						["SMG_02_F",nil,30000 * Desc],
						["30Rnd_9x21_Mag",nil,200 * Desc],
						["SMG_01_F",nil,35000 * Desc],
						["SMG_01_Holo_pointer_snds_F",nil,40000 * Desc],
						["muzzle_snds_acp",nil,15000 * Desc],
						["30Rnd_45ACP_Mag_SMG_01",nil,200 * Desc],
						["arifle_TRG20_F",nil,40000 * Desc],
						["arifle_Mk20_F",nil,45000 * Desc],
						["30Rnd_556x45_Stanag",nil,300 * Desc],
						["arifle_Katiba_F",nil,50000 * Desc],
						["arifle_Katiba_GL_F",nil,100000 * Desc],
						["30Rnd_65x39_caseless_green",nil,275 * Desc],
						["1Rnd_HE_Grenade_shell",nil,100000 * Desc],
						["arifle_MX_F",nil,80000 * Desc],
						["30Rnd_65x39_caseless_mag",nil,500 * Desc],
						["srifle_DMR_01_F",nil,60000 * Desc],
						["10Rnd_762x51_Mag",nil,500 * Desc],
						["srifle_EBR_F",nil,100000 * Desc],
						["20Rnd_762x51_Mag",nil,1000 * Desc],
						["acc_flashlight",nil,1000 * Desc],
						["muzzle_snds_L",nil,5000 * Desc],
						["optic_Yorris",nil,1500 * Desc],
						["optic_MRD",nil,1500 * Desc],
						["optic_ACO_grn",nil,2500 * Desc],
						["optic_Holosight",nil,2500 * Desc],
						["optic_Arco",nil,3000 * Desc],
						["optic_Hamr",nil,3000 * Desc],
						["optic_NVS",nil,5000 * Desc],
						["optic_DMS",nil,4500 * Desc],
						["optic_SOS",nil,5000 * Desc],
						["optic_LRPS",nil,5000 * Desc],
						["7Rnd_408_Mag",nil,500 * Desc],
                        ["optic_LRPS",nil,8000 * Desc],
                        ["launch_NLAW_F",nil,200000 * Desc],
                        ["NLAW_F",nil,20000 * Desc],
                        ["LMG_Zafir_F",nil,100000 * Desc],
                        ["150Rnd_762x51_Box_Tracer",nil,10000 * Desc],
                        ["srifle_GM6_F",nil,150000 * Desc],
                        ["5Rnd_127x108_APDS_Mag",nil,5000 * Desc]
					]
				];
			};

			case (__GETC__(life_merclevel) >= 3) :
		    {
				["Tienda superior mercenarios",
					[
                        ["Binocular",nil,150 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["FirstAidKit",nil,150 * Desc],
						["NVGoggles_INDEP",nil,2000 * Desc],
						["hgun_ACPC2_F",nil,6000 * Desc],
						["9Rnd_45ACP_Mag",nil,100 * Desc],
						["hgun_P07_F",nil,6000 * Desc],
						["16Rnd_9x21_Mag",nil,100 * Desc],
						["hgun_Rook40_F",nil,6000 * Desc],
						["30Rnd_9x21_Mag",nil,250 * Desc],
						["hgun_Pistol_heavy_01_F",nil,9000 * Desc],
						["11Rnd_45ACP_Mag",nil,350 * Desc],
						["hgun_Pistol_heavy_02_F",nil,10000 * Desc],
						["6Rnd_45ACP_Cylinder",nil,350 * Desc],
						["hgun_PDW2000_F",nil,20000 * Desc],
						["30Rnd_9x21_Mag",nil,200 * Desc],
						["SMG_02_F",nil,30000 * Desc],
						["30Rnd_9x21_Mag",nil,200 * Desc],
						["SMG_01_F",nil,35000 * Desc],
						["SMG_01_Holo_pointer_snds_F",nil,40000 * Desc],
						["muzzle_snds_acp",nil,15000 * Desc],
						["30Rnd_45ACP_Mag_SMG_01",nil,200 * Desc],
						["arifle_TRG20_F",nil,40000 * Desc],
						["arifle_Mk20_F",nil,45000 * Desc],
						["30Rnd_556x45_Stanag",nil,300 * Desc],
						["arifle_Katiba_F",nil,50000 * Desc],
						["arifle_Katiba_GL_F",nil,100000 * Desc],
						["30Rnd_65x39_caseless_green",nil,275 * Desc],
						["1Rnd_HE_Grenade_shell",nil,100000 * Desc],
						["arifle_MX_F",nil,80000 * Desc],
						["30Rnd_65x39_caseless_mag",nil,500 * Desc],
						["srifle_DMR_01_F",nil,60000 * Desc],
						["10Rnd_762x51_Mag",nil,500 * Desc],
						["srifle_EBR_F",nil,100000 * Desc],
						["20Rnd_762x51_Mag",nil,1000 * Desc],
						["acc_flashlight",nil,1000 * Desc],
						["muzzle_snds_L",nil,5000 * Desc],
						["optic_Yorris",nil,1500 * Desc],
						["optic_MRD",nil,1500 * Desc],
						["optic_ACO_grn",nil,2500 * Desc],
						["optic_Holosight",nil,2500 * Desc],
						["optic_Arco",nil,3000 * Desc],
						["optic_Hamr",nil,3000 * Desc],
						["optic_NVS",nil,5000 * Desc],
						["optic_DMS",nil,4500 * Desc],
						["optic_SOS",nil,5000 * Desc],
						["optic_LRPS",nil,5000 * Desc]
					]
				];
		     };
	     };
     };

	case "cazarrecompensas":
	{
		switch(true) do
		{
			case (!license_civ_cazarrecompensas): {"No eres cazarrecompensas"};
			default
			{
				["Tienda de armas con licencia",
					[
						["Binocular",nil,150 * Desc],
						["ItemGPS",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["FirstAidKit",nil,150 * Desc],
						["NVGoggles",nil,2000 * Desc],
						["hgun_P07_snds_F", 5500 * Desc],
						["16Rnd_9x21_Mag", 100 * Desc],
						["SMG_02_ACO_F", 6500 * Desc],
						["30Rnd_9x21_Mag", 200 * Desc]
					]
				];
			};
		};
	};
  };
