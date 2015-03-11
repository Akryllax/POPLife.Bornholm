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
				  ["TRYK_U_denim_hood_blk",8000],
				  ["B_OD_OD_R_soldier_F",8000],
				  ["B_TAN_TAN_soldier_F",8000],
				  ["B_TAN_TAN_R_soldier_F",8000],
				  ["B_BLK_BLK_soldier_F",8000],
				  ["B_BLK_BLK_R_soldier_F",8000],
				  ["B_GRY_OCP_soldier_F",8000],
				  ["B_GRY_OCP_R_soldier_F",8000],
				  ["B_TAN_OCP_soldier_F",8000],
				  ["B_TAN_OCP_R_soldier_F",8000],
				  ["B_BLK_OCP_soldier_F",8000],
				  ["B_BLK_OCP_R_soldier_F",8000],
				  ["B_BLK_TAN_soldier_F",8000],
				  ["B_BLK_TAN_R_soldier_F",8000],
				  ["B_wood3c_soldier_F",8000],
				  ["B_wood3cR_soldier_02_F",8000],
				  ["B_ODTANind_soldier_F",8000],
				  ["B_ODTANR_soldier_02_F",8000],
				  ["B_GRTANind_soldier_F",8000],
				  ["B_GRTANR_soldier_02_F",8000],
				  ["B_wood_soldier_F",8000],
				  ["B_woodR_soldier_02_F",8000],
				  ["B_MARPAT_WOOD_F",8000],
				  ["B_MARPAT_WOODR_soldier_02_F",8000],
				  ["B_WOOD_MARPAT_soldier_02_F",8000],
				  ["B_WOOD_MARPATR_F",8000],
				  ["B_woodtan_soldier_F",8000],
				  ["B_woodtanR_soldier_02_F",8000],
				  ["B_JSDF_soldier_F",8000],
				  ["B_JSDF_soldier_02_F",8000],
				  ["B_3CD_Delta_soldier_F",8000],
				  ["B_3CD_Delta_soldier_02_F",8000],
				  ["B_3CD_Ranger_soldier_02_F",8000],
				  ["B_3CD_Ranger_soldier_F",8000],
				  ["B_ACU_soldier_02_F",8000],
				  ["B_ACU_soldier_F",8000],
				  ["B_MARPAT_Wood_soldier_F",8000],
				  ["B_MARPAT_Wood_soldier_02_F",8000],
				  ["B_BLK_OD_soldier_F",8000],
				  ["B_BLK_OD_soldier_02_F",8000],
				  ["B_3C_soldier_F", 8000],
				  ["B_3C_soldier_02_F",8000],
				  ["B_Sage_soldier_F",8000],
				  ["B_Sage_soldier_02_F",8000],
				  ["B_BLK_soldier_F",8000],
				  ["B_BLK_soldier_02_F",8000],
				  ["B_BLKTAN_soldier_F",8000],
				  ["B_BLKTAN_soldier_02_F",8000],
				  ["B_BLK3CD_soldier_F",8000],
				  ["B_BLK3CD_soldier_02_F",8000],
				  ["B_ODTANi_soldier_F", 8000],
				  ["B_ODTANi_soldier_02_F", 8000],
				  ["B_C01_soldier_F", 8000],
				  ["B_C02_soldier_F", 8000],
				  ["TRYK_U_B_OD_OD_CombatUniform",8000],
				  ["TRYK_U_B_OD_OD_R_CombatUniform",8000],
				  ["TRYK_U_B_TANTAN_CombatUniform",8000],
				  ["TRYK_U_B_TANTAN_R_CombatUniform",8000],
				  ["TRYK_U_B_BLKBLK_CombatUniform",8000],
				  ["TRYK_U_B_BLKBLK_R_CombatUniform",8000],
				  ["TRYK_U_B_GRYOCP_CombatUniform",8000],
				  ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",8000],
				  ["TRYK_U_B_TANOCP_CombatUniform", 8000],
				  ["TRYK_U_B_TANOCP_R_CombatUniformTshirt",8000],
				  ["TRYK_U_B_BLKOCP_CombatUniform" , 8000],
				  ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",8000],
				  ["TRYK_U_B_BLKTAN_CombatUniform", 8000],
				  ["TRYK_U_B_BLKTANR_CombatUniformTshirt",8000],
				  ["TRYK_U_B_ODTAN_CombatUniform", 8000],
				  ["TRYK_U_B_ODTANR_CombatUniformTshirt",8000],
				  ["TRYK_U_B_GRTAN_CombatUniform" , 8000],
				  ["TRYK_U_B_GRTANR_CombatUniformTshirt",8000],
				  ["TRYK_U_B_wood_CombatUniform", 8000],
				  ["TRYK_U_B_woodR_CombatUniformTshir", 8000],
				  ["TRYK_U_B_wood3c_CombatUniform", 8000],
				  ["TRYK_U_B_wood3c_CombatUniformTshirt", 8000],
				  ["TRYK_U_B_MARPAT_WOOD_CombatUniform", 8000],
				  ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt", 8000],
				  ["TRYK_U_B_WOOD_MARPAT_CombatUniform",8000],
				  ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",8000],
				  ["TRYK_U_B_woodtan_CombatUniform",8000],
				  ["TRYK_U_B_woodtanR_CombatUniformTshirt",8000],
				  ["TRYK_U_B_JSDF_CombatUniform",8000],
				  ["RYK_U_B_JSDF_CombatUniformTshirt",8000],
				  ["TRYK_U_B_3CD_Delta_BDU",8000],
				  ["TRYK_U_B_3CD_Delta_BDUTshirt",8000],
				  ["TRYK_U_B_3CD_Ranger_BDU", 8000],
				  ["TRYK_U_B_3CD_Ranger_BDUTshirt",8000],
				  ["TRYK_U_B_ACU",8000],
				  ["TRYK_U_B_ACUTshirt",8000],
				  ["TRYK_U_B_MARPAT_Wood",8000],
				  ["TRYK_U_B_MARPAT_Wood_Tshirt",8000],
				  ["TRYK_U_B_MARPAT_Desert",8000],
				  ["TRYK_U_B_MARPAT_Desert_Tshirt",8000],
				  ["TRYK_U_B_3c",8000],
				  ["TRYK_U_B_3cr",8000],
				  ["TRYK_U_B_Sage_Tshirt",8000],
				  ["TRYK_U_B_BLK3CD",8000],
				  ["TRYK_U_B_BLK3CD_Tshirt",8000],
				  ["TRYK_U_B_BLK",8000],
				  ["TRYK_U_B_BLK_Tshirt",8000],
				  ["TRYK_U_B_BLKTAN",8000],
				  ["TRYK_U_B_BLKTAN_Tshirt",8000],
				  ["TRYK_U_B_ODTAN",8000],
				  ["TRYK_U_B_ODTAN_TshirtTRYK_U_B_BLK_OD",8000],
				  ["TRYK_U_B_C01_Tsirt",8000],
				  ["TRYK_V_PlateCarrier_JSDF",8000]
		];

	};

	//Goros
	case 1:
	{
	_ret =
		 [

				  ["kio_vfv_mask", 15000],
				  ["Kio_Capital_Hat", 15000],
				  ["casco_moto", 15000],
				  ["H_Orel_Mask_Dead", 15000],
				  ["H_Orel_FireFighter", 15000],
				  ["H_Orel_FireFighter_Gaz", 15000],
				  ["Kio_No1_Hat", 15000],
				  ["Kio_Pirate_Hat", 15000],
				  ["Kio_Santa_Hat", 15000],
				  ["H_Soccer_Orange", 15000],
				  ["Kio_Spinning_Hat", 15000],
				  ["H_Spliff", 15000],
				  ["H_Orel_Swat", 15000],
				  ["Kio_Hat", 15000]
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

			  ["TRYK_V_ArmorVest_AOR1", 15000],
			  ["TRYK_V_ArmorVest_AOR2", 15000],
			  ["TRYK_V_ArmorVest_coyo", 15000],
			  ["TRYK_V_ArmorVest_Brown", 15000],
			  ["TRYK_V_ArmorVest_CBR", 15000],
			  ["TRYK_V_ArmorVest_khk", 15000],
			  ["TRYK_V_ArmorVest_green", 15000],
			  ["TRYK_V_ArmorVest_tan", 15000],
			  ["TRYK_V_ArmorVest_Delta", 15000],
			  ["TRYK_V_ArmorVest_Ranger", 15000],
			  ["TRYK_V_ArmorVest_AOR1_2", 15000],
			  ["TRYK_V_ArmorVest_AOR2_2", 15000],
			  ["TRYK_V_ArmorVest_Brown2", 15000],
			  ["TRYK_V_ArmorVest_coyo2", 15000],
			  ["TRYK_V_ArmorVest_cbr2", 15000],
			  ["RYK_V_ArmorVest_khk2", 15000],
			  ["TRYK_V_ArmorVest_green2", 15000],
			  ["TRYK_V_ArmorVest_tan2", 15000],
			  ["TRYK_V_ArmorVest_Delta2", 15000],
			  ["TRYK_V_ArmorVest_Ranger2", 15000],
		      ["TRYK_V_PlateCarrier_blk", 15000],
			  ["TRYK_V_PlateCarrier_oli", 15000],
			  ["TRYK_V_PlateCarrier_coyo", 15000],
			  ["RYK_V_PlateCarrier_wood", 15000],
			  ["TRYK_V_PlateCarrier_ACU", 15000],
			  ["TRYK_V_TacVest_coyo", 15000]
		];
	};

	//Mochilas
	case 4:
	{
	_ret =
		[
			  ["TRYK_V_ArmorVest_AOR1", 15000],
			  ["TRYK_V_ArmorVest_AOR2", 15000],
			  ["TRYK_V_ArmorVest_coyo", 15000],
			  ["TRYK_V_ArmorVest_Brown", 15000],
			  ["TRYK_V_ArmorVest_CBR", 15000],
			  ["TRYK_V_ArmorVest_khk", 15000],
			  ["TRYK_V_ArmorVest_green", 15000],
			  ["TRYK_V_ArmorVest_tan", 15000],
			  ["TRYK_V_ArmorVest_Delta", 15000],
			  ["TRYK_V_ArmorVest_Ranger", 15000],
			  ["TRYK_V_ArmorVest_AOR1_2", 15000],
			  ["TRYK_V_ArmorVest_AOR2_2", 15000],
			  ["TRYK_V_ArmorVest_Brown2", 15000],
			  ["TRYK_V_ArmorVest_coyo2", 15000],
			  ["TRYK_V_ArmorVest_cbr2", 15000],
			  ["RYK_V_ArmorVest_khk2", 15000],
			  ["TRYK_V_ArmorVest_green2", 15000],
			  ["TRYK_V_ArmorVest_tan2", 15000],
			  ["TRYK_V_ArmorVest_Delta2", 15000],
			  ["TRYK_V_ArmorVest_Ranger2", 15000],
		      ["TRYK_V_PlateCarrier_blk", 15000],
			  ["TRYK_V_PlateCarrier_oli", 15000],
			  ["TRYK_V_PlateCarrier_coyo", 15000],
			  ["RYK_V_PlateCarrier_wood", 15000],
			  ["TRYK_V_PlateCarrier_ACU", 15000],
			  ["TRYK_V_TacVest_coyo", 15000]
			];
	};
};
_ret;