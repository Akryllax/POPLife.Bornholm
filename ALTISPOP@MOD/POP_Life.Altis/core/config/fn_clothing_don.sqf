#include <macro.h>
/*
        File: fn_clothing_cop.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Master config file for Cop clothing store.
*/
private ["_filter", "_ret"];
_filter = [_this, 0, 0, [0]] call BIS_fnc_param;
// Classname, Custom Display name (use nil for Cfg->DisplayName, price

// Shop Title Name
ctrlSetText [3103, "DonDonDingDon"];

_ret = [];
switch (_filter) do {
	// Uniforms
	case 0: {
		if (__GETC__(life_donator) > 1) then
			{
			    _ret pushBack ["B_OD_OD_soldier_F",8000 ];
				_ret pushBack ["B_OD_OD_R_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_R_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_R_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_R_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_R_soldier_F",8000];
				_ret pushBack ["B_wood3c_soldier_F",8000];
				_ret pushBack ["B_wood3cR_soldier_02_F",8000];
				_ret pushBack ["B_ODTANind_soldier_F",8000];
				_ret pushBack ["B_ODTANR_soldier_02_F",8000];
				_ret pushBack ["B_GRTANind_soldier_F",8000];
				_ret pushBack ["B_GRTANR_soldier_02_F",8000];
				_ret pushBack ["B_wood_soldier_F",8000];
				_ret pushBack ["B_woodR_soldier_02_F",8000];
				_ret pushBack ["B_MARPAT_WOOD_F",8000];
				_ret pushBack ["B_MARPAT_WOODR_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPAT_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPATR_F",8000];
				_ret pushBack ["B_woodtan_soldier_F",8000];
				_ret pushBack ["B_woodtanR_soldier_02_F",8000];
				_ret pushBack ["B_JSDF_soldier_F",8000];
				_ret pushBack ["B_JSDF_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_F",8000];
				_ret pushBack ["B_ACU_soldier_02_F",8000];
				_ret pushBack ["B_ACU_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_02_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_02_F",8000];
				_ret pushBack ["B_3C_soldier_F", 8000];
				_ret pushBack ["B_3C_soldier_02_F",8000];
				_ret pushBack ["B_Sage_soldier_F",8000];
				_ret pushBack ["B_Sage_soldier_02_F",8000];
				_ret pushBack ["B_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_soldier_02_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_02_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_02_F",8000];
				_ret pushBack ["B_ODTANi_soldier_F", 8000];
				_ret pushBack ["B_ODTANi_soldier_02_F", 8000];
				_ret pushBack ["B_C01_soldier_F", 8000];
				_ret pushBack ["B_C02_soldier_F", 8000];
				_ret pushBack ["TRYK_U_B_OD_OD_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_OD_OD_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_TANOCP_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_TANOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_BLKTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_ODTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_GRTAN_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_GRTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_wood_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_woodR_CombatUniformTshir", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_woodtan_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_woodtanR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_JSDF_CombatUniform",8000];
				_ret pushBack ["RYK_U_B_JSDF_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDU",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDU", 8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_ACU",8000];
				_ret pushBack ["TRYK_U_B_ACUTshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_3c",8000];
				_ret pushBack ["TRYK_U_B_3cr",8000];
				_ret pushBack ["TRYK_U_B_Sage_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK",8000];
				_ret pushBack ["TRYK_U_B_BLK_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_TshirtTRYK_U_B_BLK_OD",8000];
				_ret pushBack ["TRYK_U_B_C01_Tsirt",8000];
				_ret pushBack ["TRYK_V_PlateCarrier_JSDF",8000];
				
			};
	};
		if (__GETC__(life_donator) > 2) then
			{
			    _ret pushBack ["B_OD_OD_soldier_F",8000 ];
				_ret pushBack ["B_OD_OD_R_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_R_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_R_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_R_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_R_soldier_F",8000];
				_ret pushBack ["B_wood3c_soldier_F",8000];
				_ret pushBack ["B_wood3cR_soldier_02_F",8000];
				_ret pushBack ["B_ODTANind_soldier_F",8000];
				_ret pushBack ["B_ODTANR_soldier_02_F",8000];
				_ret pushBack ["B_GRTANind_soldier_F",8000];
				_ret pushBack ["B_GRTANR_soldier_02_F",8000];
				_ret pushBack ["B_wood_soldier_F",8000];
				_ret pushBack ["B_woodR_soldier_02_F",8000];
				_ret pushBack ["B_MARPAT_WOOD_F",8000];
				_ret pushBack ["B_MARPAT_WOODR_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPAT_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPATR_F",8000];
				_ret pushBack ["B_woodtan_soldier_F",8000];
				_ret pushBack ["B_woodtanR_soldier_02_F",8000];
				_ret pushBack ["B_JSDF_soldier_F",8000];
				_ret pushBack ["B_JSDF_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_F",8000];
				_ret pushBack ["B_ACU_soldier_02_F",8000];
				_ret pushBack ["B_ACU_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_02_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_02_F",8000];
				_ret pushBack ["B_3C_soldier_F", 8000];
				_ret pushBack ["B_3C_soldier_02_F",8000];
				_ret pushBack ["B_Sage_soldier_F",8000];
				_ret pushBack ["B_Sage_soldier_02_F",8000];
				_ret pushBack ["B_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_soldier_02_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_02_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_02_F",8000];
				_ret pushBack ["B_ODTANi_soldier_F", 8000];
				_ret pushBack ["B_ODTANi_soldier_02_F", 8000];
				_ret pushBack ["B_C01_soldier_F", 8000];
				_ret pushBack ["B_C02_soldier_F", 8000];
				_ret pushBack ["TRYK_U_B_OD_OD_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_OD_OD_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_TANOCP_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_TANOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_BLKTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_ODTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_GRTAN_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_GRTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_wood_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_woodR_CombatUniformTshir", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_woodtan_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_woodtanR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_JSDF_CombatUniform",8000];
				_ret pushBack ["RYK_U_B_JSDF_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDU",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDU", 8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_ACU",8000];
				_ret pushBack ["TRYK_U_B_ACUTshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_3c",8000];
				_ret pushBack ["TRYK_U_B_3cr",8000];
				_ret pushBack ["TRYK_U_B_Sage_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK",8000];
				_ret pushBack ["TRYK_U_B_BLK_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_TshirtTRYK_U_B_BLK_OD",8000];
				_ret pushBack ["TRYK_U_B_C01_Tsirt",8000];
				_ret pushBack ["TRYK_V_PlateCarrier_JSDF",8000];
				
		};

		if (__GETC__(life_donator) > 3) then
			{
			     _ret pushBack ["B_OD_OD_soldier_F",8000 ];
				_ret pushBack ["B_OD_OD_R_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_R_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_R_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_R_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_R_soldier_F",8000];
				_ret pushBack ["B_wood3c_soldier_F",8000];
				_ret pushBack ["B_wood3cR_soldier_02_F",8000];
				_ret pushBack ["B_ODTANind_soldier_F",8000];
				_ret pushBack ["B_ODTANR_soldier_02_F",8000];
				_ret pushBack ["B_GRTANind_soldier_F",8000];
				_ret pushBack ["B_GRTANR_soldier_02_F",8000];
				_ret pushBack ["B_wood_soldier_F",8000];
				_ret pushBack ["B_woodR_soldier_02_F",8000];
				_ret pushBack ["B_MARPAT_WOOD_F",8000];
				_ret pushBack ["B_MARPAT_WOODR_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPAT_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPATR_F",8000];
				_ret pushBack ["B_woodtan_soldier_F",8000];
				_ret pushBack ["B_woodtanR_soldier_02_F",8000];
				_ret pushBack ["B_JSDF_soldier_F",8000];
				_ret pushBack ["B_JSDF_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_F",8000];
				_ret pushBack ["B_ACU_soldier_02_F",8000];
				_ret pushBack ["B_ACU_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_02_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_02_F",8000];
				_ret pushBack ["B_3C_soldier_F", 8000];
				_ret pushBack ["B_3C_soldier_02_F",8000];
				_ret pushBack ["B_Sage_soldier_F",8000];
				_ret pushBack ["B_Sage_soldier_02_F",8000];
				_ret pushBack ["B_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_soldier_02_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_02_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_02_F",8000];
				_ret pushBack ["B_ODTANi_soldier_F", 8000];
				_ret pushBack ["B_ODTANi_soldier_02_F", 8000];
				_ret pushBack ["B_C01_soldier_F", 8000];
				_ret pushBack ["B_C02_soldier_F", 8000];
				_ret pushBack ["TRYK_U_B_OD_OD_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_OD_OD_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_TANOCP_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_TANOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_BLKTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_ODTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_GRTAN_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_GRTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_wood_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_woodR_CombatUniformTshir", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_woodtan_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_woodtanR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_JSDF_CombatUniform",8000];
				_ret pushBack ["RYK_U_B_JSDF_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDU",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDU", 8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_ACU",8000];
				_ret pushBack ["TRYK_U_B_ACUTshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_3c",8000];
				_ret pushBack ["TRYK_U_B_3cr",8000];
				_ret pushBack ["TRYK_U_B_Sage_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK",8000];
				_ret pushBack ["TRYK_U_B_BLK_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_TshirtTRYK_U_B_BLK_OD",8000];
				_ret pushBack ["TRYK_U_B_C01_Tsirt",8000];
				_ret pushBack ["TRYK_V_PlateCarrier_JSDF",8000];
				
		};
	
		if (__GETC__(life_donator) > 4) then
			{
			    _ret pushBack ["B_OD_OD_soldier_F",8000 ];
				_ret pushBack ["B_OD_OD_R_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_soldier_F",8000];
				_ret pushBack ["B_TAN_TAN_R_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_BLK_R_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_soldier_F",8000];
				_ret pushBack ["B_GRY_OCP_R_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_soldier_F",8000];
				_ret pushBack ["B_TAN_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_soldier_F",8000];
				_ret pushBack ["B_BLK_OCP_R_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_soldier_F",8000];
				_ret pushBack ["B_BLK_TAN_R_soldier_F",8000];
				_ret pushBack ["B_wood3c_soldier_F",8000];
				_ret pushBack ["B_wood3cR_soldier_02_F",8000];
				_ret pushBack ["B_ODTANind_soldier_F",8000];
				_ret pushBack ["B_ODTANR_soldier_02_F",8000];
				_ret pushBack ["B_GRTANind_soldier_F",8000];
				_ret pushBack ["B_GRTANR_soldier_02_F",8000];
				_ret pushBack ["B_wood_soldier_F",8000];
				_ret pushBack ["B_woodR_soldier_02_F",8000];
				_ret pushBack ["B_MARPAT_WOOD_F",8000];
				_ret pushBack ["B_MARPAT_WOODR_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPAT_soldier_02_F",8000];
				_ret pushBack ["B_WOOD_MARPATR_F",8000];
				_ret pushBack ["B_woodtan_soldier_F",8000];
				_ret pushBack ["B_woodtanR_soldier_02_F",8000];
				_ret pushBack ["B_JSDF_soldier_F",8000];
				_ret pushBack ["B_JSDF_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_F",8000];
				_ret pushBack ["B_3CD_Delta_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_02_F",8000];
				_ret pushBack ["B_3CD_Ranger_soldier_F",8000];
				_ret pushBack ["B_ACU_soldier_02_F",8000];
				_ret pushBack ["B_ACU_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_F",8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_02_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_F",8000];
				_ret pushBack ["B_BLK_OD_soldier_02_F",8000];
				_ret pushBack ["B_3C_soldier_F", 8000];
				_ret pushBack ["B_3C_soldier_02_F",8000];
				_ret pushBack ["B_Sage_soldier_F",8000];
				_ret pushBack ["B_Sage_soldier_02_F",8000];
				_ret pushBack ["B_BLK_soldier_F",8000];
				_ret pushBack ["B_BLK_soldier_02_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_F",8000];
				_ret pushBack ["B_BLKTAN_soldier_02_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_F",8000];
				_ret pushBack ["B_BLK3CD_soldier_02_F",8000];
				_ret pushBack ["B_ODTANi_soldier_F", 8000];
				_ret pushBack ["B_ODTANi_soldier_02_F", 8000];
				_ret pushBack ["B_C01_soldier_F", 8000];
				_ret pushBack ["B_C02_soldier_F", 8000];
				_ret pushBack ["TRYK_U_B_OD_OD_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_OD_OD_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_TANTAN_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_R_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_TANOCP_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_TANOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_BLKTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_ODTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_GRTAN_CombatUniform" , 8000];
				_ret pushBack ["TRYK_U_B_GRTANR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_wood_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_woodR_CombatUniformTshir", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniform", 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt", 8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_woodtan_CombatUniform",8000];
				_ret pushBack ["TRYK_U_B_woodtanR_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_JSDF_CombatUniform",8000];
				_ret pushBack ["RYK_U_B_JSDF_CombatUniformTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDU",8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDU", 8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDUTshirt",8000];
				_ret pushBack ["TRYK_U_B_ACU",8000];
				_ret pushBack ["TRYK_U_B_ACUTshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert",8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_3c",8000];
				_ret pushBack ["TRYK_U_B_3cr",8000];
				_ret pushBack ["TRYK_U_B_Sage_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD",8000];
				_ret pushBack ["TRYK_U_B_BLK3CD_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLK",8000];
				_ret pushBack ["TRYK_U_B_BLK_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN",8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_Tshirt",8000];
				_ret pushBack ["TRYK_U_B_ODTAN",8000];
				_ret pushBack ["TRYK_U_B_ODTAN_TshirtTRYK_U_B_BLK_OD",8000];
				_ret pushBack ["TRYK_U_B_C01_Tsirt",8000];
				_ret pushBack ["TRYK_V_PlateCarrier_JSDF",8000];
				
		};
	};

	// Hats
	case 1: {
		if (__GETC__(life_donator) > 1) then
			{
				_ret pushBack ["kio_vfv_mask", 15000];
				_ret pushBack ["Kio_Capital_Hat", 15000];
				_ret pushBack ["casco_moto", 15000];
				_ret pushBack ["H_Orel_Mask_Dead", 15000];
				_ret pushBack ["H_Orel_FireFighter", 15000];
				_ret pushBack ["H_Orel_FireFighter_Gaz", 15000];
				_ret pushBack ["Kio_No1_Hat", 15000];
				_ret pushBack ["Kio_Pirate_Hat", 15000];
				_ret pushBack ["Kio_Santa_Hat", 15000];
				_ret pushBack ["H_Soccer_Orange", 15000];
				_ret pushBack ["Kio_Spinning_Hat", 15000];
				_ret pushBack ["H_Spliff", 15000];
				_ret pushBack ["H_Orel_Swat", 15000];
				_ret pushBack ["Kio_Hat", 15000];
			};
	
			if (__GETC__(life_donator) > 2) then
			{
				_ret pushBack ["kio_vfv_mask", 15000];
				_ret pushBack ["Kio_Capital_Hat", 15000];
				_ret pushBack ["casco_moto", 15000];
				_ret pushBack ["H_Orel_Mask_Dead", 15000];
				_ret pushBack ["H_Orel_FireFighter", 15000];
				_ret pushBack ["H_Orel_FireFighter_Gaz", 15000];
				_ret pushBack ["Kio_No1_Hat", 15000];
				_ret pushBack ["Kio_Pirate_Hat", 15000];
				_ret pushBack ["Kio_Santa_Hat", 15000];
				_ret pushBack ["H_Soccer_Orange", 15000];
				_ret pushBack ["Kio_Spinning_Hat", 15000];
				_ret pushBack ["H_Spliff", 15000];
				_ret pushBack ["H_Orel_Swat", 15000];
				_ret pushBack ["Kio_Hat", 15000];
				};

			if (__GETC__(life_donator) > 3) then
			{
				_ret pushBack ["kio_vfv_mask", 15000];
				_ret pushBack ["Kio_Capital_Hat", 15000];
				_ret pushBack ["casco_moto", 15000];
				_ret pushBack ["H_Orel_Mask_Dead", 15000];
				_ret pushBack ["H_Orel_FireFighter", 15000];
				_ret pushBack ["H_Orel_FireFighter_Gaz", 15000];
				_ret pushBack ["Kio_No1_Hat", 15000];
				_ret pushBack ["Kio_Pirate_Hat", 15000];
				_ret pushBack ["Kio_Santa_Hat", 15000];
				_ret pushBack ["H_Soccer_Orange", 15000];
				_ret pushBack ["Kio_Spinning_Hat", 15000];
				_ret pushBack ["H_Spliff", 15000];
				_ret pushBack ["H_Orel_Swat", 15000];
				_ret pushBack ["Kio_Hat", 15000];
		};
	
			if (__GETC__(life_donator) > 4) then
			{
				_ret pushBack ["kio_vfv_mask", 15000];
				_ret pushBack ["Kio_Capital_Hat", 15000];
				_ret pushBack ["casco_moto", 15000];
				_ret pushBack ["H_Orel_Mask_Dead", 15000];
				_ret pushBack ["H_Orel_FireFighter", 15000];
				_ret pushBack ["H_Orel_FireFighter_Gaz", 15000];
				_ret pushBack ["Kio_No1_Hat", 15000];
				_ret pushBack ["Kio_Pirate_Hat", 15000];
				_ret pushBack ["Kio_Santa_Hat", 15000];
				_ret pushBack ["H_Soccer_Orange", 15000];
				_ret pushBack ["Kio_Spinning_Hat", 15000];
				_ret pushBack ["H_Spliff", 15000];
				_ret pushBack ["H_Orel_Swat", 15000];
				_ret pushBack ["Kio_Hat", 15000];
			};
	

	// Glasses
	case 2: {
       if (__GETC__(life_donator) > 1) then
		{
            _ret pushBack ["G_Combat",55];
		};
		if (__GETC__(life_donator) > 2) then
		{
            _ret pushBack ["G_Combat",55];
		};
		if (__GETC__(life_donator) > 3) then
		{
            _ret pushBack ["G_Combat",55];
		};
		if (__GETC__(life_donator) > 4) then
		{
            _ret pushBack ["G_Combat",55];
		};
	};

	// Vest
	case 3: {
	if (__GETC__(life_donator) > 1) then
			{
			_ret pushBack ["TRYK_V_ArmorVest_AOR1", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_CBR", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_khk", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR1_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_cbr2", 15000];
			_ret pushBack ["RYK_V_ArmorVest_khk2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger2", 15000];
		    _ret pushBack ["TRYK_V_PlateCarrier_blk", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_oli", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_coyo", 15000];
			_ret pushBack ["RYK_V_PlateCarrier_wood", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_ACU", 15000];
			_ret pushBack ["TRYK_V_TacVest_coyo", 15000];
				};
	
			if (__GETC__(life_donator) > 2) then
			{
			_ret pushBack ["TRYK_V_ArmorVest_AOR1", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_CBR", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_khk", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR1_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_cbr2", 15000];
			_ret pushBack ["RYK_V_ArmorVest_khk2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger2", 15000];
		    _ret pushBack ["TRYK_V_PlateCarrier_blk", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_oli", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_coyo", 15000];
			_ret pushBack ["RYK_V_PlateCarrier_wood", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_ACU", 15000];
			_ret pushBack ["TRYK_V_TacVest_coyo", 15000];
				};

			if (__GETC__(life_donator) > 3) then
			{
			_ret pushBack ["TRYK_V_ArmorVest_AOR1", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_CBR", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_khk", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR1_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_cbr2", 15000];
			_ret pushBack ["RYK_V_ArmorVest_khk2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger2", 15000];
		    _ret pushBack ["TRYK_V_PlateCarrier_blk", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_oli", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_coyo", 15000];
			_ret pushBack ["RYK_V_PlateCarrier_wood", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_ACU", 15000];
			_ret pushBack ["TRYK_V_TacVest_coyo", 15000];
				};

			if (__GETC__(life_donator) > 4) then
			{
			_ret pushBack ["TRYK_V_ArmorVest_AOR1", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_CBR", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_khk", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR1_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2_2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_cbr2", 15000];
			_ret pushBack ["RYK_V_ArmorVest_khk2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta2", 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger2", 15000];
		    _ret pushBack ["TRYK_V_PlateCarrier_blk", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_oli", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_coyo", 15000];
			_ret pushBack ["RYK_V_PlateCarrier_wood", 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_ACU", 15000];
			_ret pushBack ["TRYK_V_TacVest_coyo", 15000];
			
			};


	// Backpacks
	case 4: {
		if (__GETC__(life_donator) > 1) then
			{
                _ret pushBack ["TRYK_B_AssaultPack_Type2camo", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Desert", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Wood", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base", 8000];
				_ret pushBack ["TRYK_B_Kitbag_blk", 8000];
				_ret pushBack ["TRYK_B_Kitbag_aaf", 8000];
				_ret pushBack ["TRYK_B_Carryall_blk", 8000];
				_ret pushBack ["TRYK_B_Carryall_wood", 8000];
				_ret pushBack ["TRYK_B_Carryall_JSDF", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base_JSDF", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_OD", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_BLK", 8000];
				_ret pushBack ["TRYK_B_Alicepack", 8000];
			    _ret pushBack ["TRYK_B_Medbag", 8000];
				_ret pushBack ["TRYK_B_Medbag_OD", 8000];
				_ret pushBack ["TRYK_B_Medbag_BK", 8000];
				_ret pushBack ["TRYK_B_Medbag_ucp", 8000];
				_ret pushBack ["TRYK_B_Belt", 8000];
				_ret pushBack ["TRYK_B_Belt_BLK", 8000];
				_ret pushBack ["TRYK_B_Belt_CYT", 8000];
				_ret pushBack ["TRYK_B_Belt_tan", 8000];
				_ret pushBack ["TRYK_B_Belt_br", 8000];
				_ret pushBack ["TRYK_B_Belt_GR", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR1", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR2", 8000];
				_ret pushBack ["TRYK_B_FieldPack_Wood", 8000];
		};
	
			if (__GETC__(life_donator) > 2) then
			{
                _ret pushBack ["TRYK_B_AssaultPack_Type2camo", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Desert", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Wood", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base", 8000];
				_ret pushBack ["TRYK_B_Kitbag_blk", 8000];
				_ret pushBack ["TRYK_B_Kitbag_aaf", 8000];
				_ret pushBack ["TRYK_B_Carryall_blk", 8000];
				_ret pushBack ["TRYK_B_Carryall_wood", 8000];
				_ret pushBack ["TRYK_B_Carryall_JSDF", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base_JSDF", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_OD", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_BLK", 8000];
				_ret pushBack ["TRYK_B_Alicepack", 8000];
			    _ret pushBack ["TRYK_B_Medbag", 8000];
				_ret pushBack ["TRYK_B_Medbag_OD", 8000];
				_ret pushBack ["TRYK_B_Medbag_BK", 8000];
				_ret pushBack ["TRYK_B_Medbag_ucp", 8000];
				_ret pushBack ["TRYK_B_Belt", 8000];
				_ret pushBack ["TRYK_B_Belt_BLK", 8000];
				_ret pushBack ["TRYK_B_Belt_CYT", 8000];
				_ret pushBack ["TRYK_B_Belt_tan", 8000];
				_ret pushBack ["TRYK_B_Belt_br", 8000];
				_ret pushBack ["TRYK_B_Belt_GR", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR1", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR2", 8000];
				_ret pushBack ["TRYK_B_FieldPack_Wood", 8000];
		};

			if (__GETC__(life_donator) > 3) then
			{
                _ret pushBack ["TRYK_B_AssaultPack_Type2camo", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Desert", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Wood", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base", 8000];
				_ret pushBack ["TRYK_B_Kitbag_blk", 8000];
				_ret pushBack ["TRYK_B_Kitbag_aaf", 8000];
				_ret pushBack ["TRYK_B_Carryall_blk", 8000];
				_ret pushBack ["TRYK_B_Carryall_wood", 8000];
				_ret pushBack ["TRYK_B_Carryall_JSDF", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base_JSDF", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_OD", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_BLK", 8000];
				_ret pushBack ["TRYK_B_Alicepack", 8000];
			    _ret pushBack ["TRYK_B_Medbag", 8000];
				_ret pushBack ["TRYK_B_Medbag_OD", 8000];
				_ret pushBack ["TRYK_B_Medbag_BK", 8000];
				_ret pushBack ["TRYK_B_Medbag_ucp", 8000];
				_ret pushBack ["TRYK_B_Belt", 8000];
				_ret pushBack ["TRYK_B_Belt_BLK", 8000];
				_ret pushBack ["TRYK_B_Belt_CYT", 8000];
				_ret pushBack ["TRYK_B_Belt_tan", 8000];
				_ret pushBack ["TRYK_B_Belt_br", 8000];
				_ret pushBack ["TRYK_B_Belt_GR", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR1", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR2", 8000];
				_ret pushBack ["TRYK_B_FieldPack_Wood", 8000];
				};

			if (__GETC__(life_donator) > 4) then
			{
                _ret pushBack ["TRYK_B_AssaultPack_Type2camo", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Desert", 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Wood", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base", 8000];
				_ret pushBack ["TRYK_B_Kitbag_blk", 8000];
				_ret pushBack ["TRYK_B_Kitbag_aaf", 8000];
				_ret pushBack ["TRYK_B_Carryall_blk", 8000];
				_ret pushBack ["TRYK_B_Carryall_wood", 8000];
				_ret pushBack ["TRYK_B_Carryall_JSDF", 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base_JSDF", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_OD", 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_BLK", 8000];
				_ret pushBack ["TRYK_B_Alicepack", 8000];
			    _ret pushBack ["TRYK_B_Medbag", 8000];
				_ret pushBack ["TRYK_B_Medbag_OD", 8000];
				_ret pushBack ["TRYK_B_Medbag_BK", 8000];
				_ret pushBack ["TRYK_B_Medbag_ucp", 8000];
				_ret pushBack ["TRYK_B_Belt", 8000];
				_ret pushBack ["TRYK_B_Belt_BLK", 8000];
				_ret pushBack ["TRYK_B_Belt_CYT", 8000];
				_ret pushBack ["TRYK_B_Belt_tan", 8000];
				_ret pushBack ["TRYK_B_Belt_br", 8000];
				_ret pushBack ["TRYK_B_Belt_GR", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR1", 8000];
				_ret pushBack ["TRYK_B_Belt_AOR2", 8000];
				_ret pushBack ["TRYK_B_FieldPack_Wood", 8000];

			};
	};

_ret;