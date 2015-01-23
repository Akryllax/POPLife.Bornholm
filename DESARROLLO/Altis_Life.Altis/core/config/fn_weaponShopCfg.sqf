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
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200]
					]
				];
			};

          	case (__GETC__(life_coplevel) == 2) :
		    {
				["Tienda locales",
					[
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200],
						["optic_ACO_grn_smg",nil,300],
						["optic_ACO_smg",nil,300]
					]
				];
		    };

	        case (__GETC__(life_coplevel) == 3) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200],
						["optic_ACO_grn_smg",nil,300],
						["optic_ACO_smg",nil,300],
						["arifle_MXC_F",nil,25000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Hamr",nil,600],
						["optic_DMS",nil,1000]

					]
				];
		    };
		        case (__GETC__(life_coplevel) == 4) :
		   {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200],
						["optic_ACO_grn_smg",nil,300],
						["optic_ACO_smg",nil,300],
						["arifle_MXC_F",nil,25000],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Hamr",nil,600],
						["optic_DMS",nil,1000]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 5) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200],
						["optic_ACO_grn_smg",nil,300],
						["optic_ACO_smg",nil,300],
						["arifle_MXC_F",nil,25000],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Hamr",nil,600],
						["optic_DMS",nil,1000],
						["srifle_DMR_01_F",nil,40000],
						["10Rnd_762x51_Mag",nil,200],
                        ["optic_SOS",nil,4000]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 6) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200],
						["optic_ACO_grn_smg",nil,300],
						["optic_ACO_smg",nil,300],
						["arifle_MXC_F",nil,25000],
						["arifle_MX_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Hamr",nil,600],
						["optic_DMS",nil,1000],
						["srifle_DMR_01_F",nil,40000],
						["10Rnd_762x51_Mag",nil,200],
                        ["optic_SOS",nil,4000],
                        ["srifle_EBR_DMS_F",nil,50000],
                        ["20Rnd_762x51_Mag",nil,300],
                        ["SMG_01_F",nil,20000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,100],
                        ["muzzle_snds_acp",nil,300]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 7) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200],
						["optic_ACO_grn_smg",nil,300],
						["optic_ACO_smg",nil,300],
						["arifle_MXC_F",nil,25000],
						["arifle_MX_F",nil,30000],
						["muzzle_snds_H",nil,1500],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Hamr",nil,600],
						["optic_DMS",nil,1000],
						["srifle_DMR_01_F",nil,40000],
						["muzzle_snds_B",nil,2000],
						["10Rnd_762x51_Mag",nil,200],
                        ["optic_SOS",nil,4000],
                        ["srifle_EBR_DMS_F",nil,50000],
                        ["muzzle_snds_B",nil,2500],
                        ["20Rnd_762x51_Mag",nil,300],
                        ["SMG_01_F",nil,20000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,100],
                        ["muzzle_snds_acp",nil,300],
                        ["arifle_MX_SW_Black_F",nil,50000],
                        ["100Rnd_65x39_caseless_mag",nil,300],
                        ["arifle_MX_SW_Black_F",nil,50000],
                        ["100Rnd_65x39_caseless_mag",nil,300],
                        ["srifle_LRR_F",nil,100000],
                        ["7Rnd_408_Mag",nil,500],
                        ["optic_LRPS",nil,8000],
                        ["launch_NLAW_F",nil,200000],
                        ["NLAW_F",nil,20000]
					]
				];
		    };

			case (__GETC__(life_coplevel) == 8) :
		    {
				["Tienda nacionales",
					[
						["hgun_P07_snds_F","Taser",1000],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,15000],
						["30Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["SmokeShell",nil,200],
						["optic_ACO_grn_smg",nil,300],
						["optic_ACO_smg",nil,300],
						["arifle_MXC_F",nil,25000],
						["arifle_MX_F",nil,30000],
						["arifle_MX_GL_F",nil,35000],
						["muzzle_snds_H",nil,1500],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Hamr",nil,600],
						["optic_DMS",nil,1000],
						["srifle_DMR_01_F",nil,40000],
						["muzzle_snds_B",nil,2000],
						["10Rnd_762x51_Mag",nil,200],
                        ["optic_SOS",nil,4000],
                        ["srifle_EBR_DMS_F",nil,50000],
                        ["muzzle_snds_B",nil,2500],
                        ["20Rnd_762x51_Mag",nil,300],
                        ["SMG_01_F",nil,20000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,100],
                        ["muzzle_snds_acp",nil,300],
                        ["arifle_MX_SW_Black_F",nil,50000],
                        ["100Rnd_65x39_caseless_mag",nil,300],
                        ["srifle_LRR_F",nil,100000],
                        ["7Rnd_408_Mag",nil,500],
                        ["optic_LRPS",nil,8000],
                        ["launch_NLAW_F",nil,200000],
                        ["NLAW_F",nil,20000],
                        ["LMG_Zafir_F",nil,100000],
                        ["150Rnd_762x51_Box_Tracer",nil,10000],
                        ["srifle_GM6_F",nil,150000],
                        ["5Rnd_127x108_APDS_Mag",nil,5000]
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
			case (__GETC__(life_mediclevel) == 1):
		    {
				["Hospital EMS Shop",
					[
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
						["SMG_01_Holo_pointer_snds_F",nil,40000],
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

	case "gang":
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
						["30Rnd_9x21_Mag",nil,75],
						["arifle_Katiba_F",nil,50000],
						["30Rnd_65x39_caseless_green",nil,275],
						["SMG_02_F",nil,30000],
					    ["30Rnd_9x21_Mag",nil,200]

					]
				];
			};
		};
	};

	case "genstore":
	{
		["tienda general",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000]
			]
		];
	};


    case "merc":
	{
		switch (true) do
		{
			case (playerSide != opfor): {"No eres un mercenario"};
			case (__GETC__(life_merclevel) <= 1):
		    {
				["Tienda Basica Mercenarios",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_INDEP",nil,2000],
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
						["SMG_01_Holo_pointer_snds_F",nil,40000],
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

			case (__GETC__(life_merclevel) >= 2) :
		    {
				["Tienda superior mercenarios",
					[
                        ["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_INDEP",nil,2000],
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
						["SMG_01_Holo_pointer_snds_F",nil,40000],
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
  };
