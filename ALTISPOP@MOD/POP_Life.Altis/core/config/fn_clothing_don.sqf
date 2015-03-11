#include <macro.h>

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tienda de Donadores"];

_ret = [];
switch (_filter) do
{
	//Uniformes
	case 0:
	{
	_ret =
		[
				  ["TRYK_U_denim_hood_blk",nil,8000],
				  ["B_OD_OD_R_soldier_F",nil,8000],
				  ["B_TAN_TAN_soldier_F",nil,8000],
				  ["B_TAN_TAN_R_soldier_F",nil,8000],
				  ["B_BLK_BLK_soldier_F",nil,8000],
				  ["B_BLK_BLK_R_soldier_F",nil,8000],
				  ["B_GRY_OCP_soldier_F",nil,8000],
				  ["B_GRY_OCP_R_soldier_F",nil,8000],
				  ["B_TAN_OCP_soldier_F",nil,8000],
				  ["B_TAN_OCP_R_soldier_F",nil,8000],
				  ["B_BLK_OCP_soldier_F",nil,8000],
				  ["B_BLK_OCP_R_soldier_F",nil,8000],
				  ["B_BLK_TAN_soldier_F",nil,8000],
				  ["B_BLK_TAN_R_soldier_F",nil,8000],
				  ["B_wood3c_soldier_F",nil,8000],
				  ["B_wood3cR_soldier_02_F",nil,8000],
				  ["B_ODTANind_soldier_F",nil,8000],
				  ["B_ODTANR_soldier_02_F",nil,8000],
				  ["B_GRTANind_soldier_F",nil,8000],
				  ["B_GRTANR_soldier_02_F",nil,8000],
				  ["B_wood_soldier_F",nil,8000],
				  ["B_woodR_soldier_02_F",nil,8000],
				  ["B_MARPAT_WOOD_F",nil,8000],
				  ["B_MARPAT_WOODR_soldier_02_F",nil,8000],
				  ["B_WOOD_MARPAT_soldier_02_F",nil,8000],
				  ["B_WOOD_MARPATR_F",nil,8000],
				  ["B_woodtan_soldier_F",nil,8000],
				  ["B_woodtanR_soldier_02_F",nil,8000],
				  ["B_JSDF_soldier_F",nil,8000],
				  ["B_JSDF_soldier_02_F",nil,8000],
				  ["B_3CD_Delta_soldier_F",nil,8000],
				  ["B_3CD_Delta_soldier_02_F",nil,8000],
				  ["B_3CD_Ranger_soldier_02_F",nil,8000],
				  ["B_3CD_Ranger_soldier_F",nil,8000],
				  ["B_ACU_soldier_02_F",nil,8000],
				  ["B_ACU_soldier_F",nil,8000],
				  ["B_MARPAT_Wood_soldier_F",nil,8000],
				  ["B_MARPAT_Wood_soldier_02_F",nil,8000],
				  ["B_BLK_OD_soldier_F",nil,8000],
				  ["B_BLK_OD_soldier_02_F",nil,8000],
				  ["B_3C_soldier_F",nil, 8000],
				  ["B_3C_soldier_02_F",nil,8000],
				  ["B_Sage_soldier_F",nil,8000],
				  ["B_Sage_soldier_02_F",nil,8000],
				  ["B_BLK_soldier_F",nil,8000],
				  ["B_BLK_soldier_02_F",nil,8000],
				  ["B_BLKTAN_soldier_F",nil,8000],
				  ["B_BLKTAN_soldier_02_F",nil,8000],
				  ["B_BLK3CD_soldier_F",nil,8000],
				  ["B_BLK3CD_soldier_02_F",nil,8000],
				  ["B_ODTANi_soldier_F",nil, 8000],
				  ["B_ODTANi_soldier_02_F",nil, 8000],
				  ["B_C01_soldier_F",nil, 8000],
				  ["B_C02_soldier_F",nil, 8000],
				  ["TRYK_U_B_OD_OD_CombatUniform",nil,8000],
				  ["TRYK_U_B_OD_OD_R_CombatUniform",nil,8000],
				  ["TRYK_U_B_TANTAN_CombatUniform",nil,8000],
				  ["TRYK_U_B_TANTAN_R_CombatUniform",nil,8000],
				  ["TRYK_U_B_BLKBLK_CombatUniform",nil,8000],
				  ["TRYK_U_B_BLKBLK_R_CombatUniform",nil,8000],
				  ["TRYK_U_B_GRYOCP_CombatUniform",nil,8000],
				  ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_TANOCP_CombatUniform",nil, 8000],
				  ["TRYK_U_B_TANOCP_R_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_BLKOCP_CombatUniform",nil, 8000],
				  ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_BLKTAN_CombatUniform",nil, 8000],
				  ["TRYK_U_B_BLKTANR_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_ODTAN_CombatUniform",nil, 8000],
				  ["TRYK_U_B_ODTANR_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_GRTAN_CombatUniform",nil, 8000],
				  ["TRYK_U_B_GRTANR_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_wood_CombatUniform",nil, 8000],
				  ["TRYK_U_B_woodR_CombatUniformTshir",nil, 8000],
				  ["TRYK_U_B_wood3c_CombatUniform",nil, 8000],
				  ["TRYK_U_B_wood3c_CombatUniformTshirt",nil, 8000],
				  ["TRYK_U_B_MARPAT_WOOD_CombatUniform",nil, 8000],
				  ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt",nil, 8000],
				  ["TRYK_U_B_WOOD_MARPAT_CombatUniform",nil,8000],
				  ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_woodtan_CombatUniform",nil,8000],
				  ["TRYK_U_B_woodtanR_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_JSDF_CombatUniform",nil,8000],
				  ["RYK_U_B_JSDF_CombatUniformTshirt",nil,8000],
				  ["TRYK_U_B_3CD_Delta_BDU",nil,8000],
				  ["TRYK_U_B_3CD_Delta_BDUTshirt",nil,8000],
				  ["TRYK_U_B_3CD_Ranger_BDU",nil, 8000],
				  ["TRYK_U_B_3CD_Ranger_BDUTshirt",nil,8000],
				  ["TRYK_U_B_ACU",nil,8000],
				  ["TRYK_U_B_ACUTshirt",nil,8000],
				  ["TRYK_U_B_MARPAT_Wood",nil,8000],
				  ["TRYK_U_B_MARPAT_Wood_Tshirt",nil,8000],
				  ["TRYK_U_B_MARPAT_Desert",nil,8000],
				  ["TRYK_U_B_MARPAT_Desert_Tshirt",nil,8000],
				  ["TRYK_U_B_3c",nil,8000],
				  ["TRYK_U_B_3cr",nil,8000],
				  ["TRYK_U_B_Sage_Tshirt",nil,8000],
				  ["TRYK_U_B_BLK3CD",nil,8000],
				  ["TRYK_U_B_BLK3CD_Tshirt",nil,8000],
				  ["TRYK_U_B_BLK",nil,8000],
				  ["TRYK_U_B_BLK_Tshirt",nil,8000],
				  ["TRYK_U_B_BLKTAN",nil,8000],
				  ["TRYK_U_B_BLKTAN_Tshirt",nil,8000],
				  ["TRYK_U_B_ODTAN",nil,8000],
				  ["TRYK_U_B_ODTAN_TshirtTRYK_U_B_BLK_OD",nil,8000],
				  ["TRYK_U_B_C01_Tsirt",nil,8000],
				  ["TRYK_V_PlateCarrier_JSDF",nil,8000]
		];

	};

	//Goros
	case 1:
	{
	_ret =
		 [

				  ["kio_vfv_mask",nil, 15000],
				  ["Kio_Capital_Hat",nil, 15000],
				  ["casco_moto",nil, 15000],
				  ["H_Orel_Mask_Dead",nil, 15000],
				  ["H_Orel_FireFighter",nil, 15000],
				  ["H_Orel_FireFighter_Gaz",nil, 15000],
				  ["Kio_No1_Hat",nil, 15000],
				  ["Kio_Pirate_Hat",nil, 15000],
				  ["Kio_Santa_Hat",nil, 15000],
				  ["H_Soccer_Orange",nil, 15000],
				  ["Kio_Spinning_Hat",nil, 15000],
				  ["H_Spliff",nil, 15000],
				  ["H_Orel_Swat",nil, 15000],
				  ["Kio_Hat",nil, 15000]
		];
	};

	//Gafas
	case 2:
	{
	_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};

	//Chalecos
	case 3:
	{
	_ret =
		[

			  ["TRYK_V_ArmorVest_AOR1",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR2",nil, 15000],
			  ["TRYK_V_ArmorVest_coyo",nil, 15000],
			  ["TRYK_V_ArmorVest_Brown",nil, 15000],
			  ["TRYK_V_ArmorVest_CBR",nil, 15000],
			  ["TRYK_V_ArmorVest_khk",nil, 15000],
			  ["TRYK_V_ArmorVest_green",nil, 15000],
			  ["TRYK_V_ArmorVest_tan",nil, 15000],
			  ["TRYK_V_ArmorVest_Delta",nil, 15000],
			  ["TRYK_V_ArmorVest_Ranger",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR1_2",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR2_2",nil, 15000],
			  ["TRYK_V_ArmorVest_Brown2",nil, 15000],
			  ["TRYK_V_ArmorVest_coyo2",nil, 15000],
			  ["TRYK_V_ArmorVest_cbr2",nil, 15000],
			  ["RYK_V_ArmorVest_khk2",nil, 15000],
			  ["TRYK_V_ArmorVest_green2",nil, 15000],
			  ["TRYK_V_ArmorVest_tan2",nil, 15000],
			  ["TRYK_V_ArmorVest_Delta2",nil, 15000],
			  ["TRYK_V_ArmorVest_Ranger2",nil, 15000],
		      ["TRYK_V_PlateCarrier_blk",nil, 15000],
			  ["TRYK_V_PlateCarrier_oli",nil, 15000],
			  ["TRYK_V_PlateCarrier_coyo",nil, 15000],
			  ["RYK_V_PlateCarrier_wood",nil, 15000],
			  ["TRYK_V_PlateCarrier_ACU",nil, 15000],
			  ["TRYK_V_TacVest_coyo",nil, 15000]
		];
	};

	//Mochilas
	case 4:
	{
	_ret =
		[
			  ["TRYK_V_ArmorVest_AOR1",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR2",nil, 15000],
			  ["TRYK_V_ArmorVest_coyo",nil, 15000],
			  ["TRYK_V_ArmorVest_Brown",nil, 15000],
			  ["TRYK_V_ArmorVest_CBR",nil, 15000],
			  ["TRYK_V_ArmorVest_khk",nil, 15000],
			  ["TRYK_V_ArmorVest_green",nil, 15000],
			  ["TRYK_V_ArmorVest_tan",nil, 15000],
			  ["TRYK_V_ArmorVest_Delta",nil, 15000],
			  ["TRYK_V_ArmorVest_Ranger",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR1_2",nil, 15000],
			  ["TRYK_V_ArmorVest_AOR2_2",nil, 15000],
			  ["TRYK_V_ArmorVest_Brown2",nil, 15000],
			  ["TRYK_V_ArmorVest_coyo2",nil, 15000],
			  ["TRYK_V_ArmorVest_cbr2",nil, 15000],
			  ["RYK_V_ArmorVest_khk2",nil, 15000],
			  ["TRYK_V_ArmorVest_green2",nil, 15000],
			  ["TRYK_V_ArmorVest_tan2",nil, 15000],
			  ["TRYK_V_ArmorVest_Delta2",nil, 15000],
			  ["TRYK_V_ArmorVest_Ranger2",nil, 15000],
		      ["TRYK_V_PlateCarrier_blk",nil, 15000],
			  ["TRYK_V_PlateCarrier_oli",nil, 15000],
			  ["TRYK_V_PlateCarrier_coyo",nil, 15000],
			  ["RYK_V_PlateCarrier_wood",nil, 15000],
			  ["TRYK_V_PlateCarrier_ACU",nil, 15000],
			  ["TRYK_V_TacVest_coyo",nil, 15000]
			];
	};
};
_ret;