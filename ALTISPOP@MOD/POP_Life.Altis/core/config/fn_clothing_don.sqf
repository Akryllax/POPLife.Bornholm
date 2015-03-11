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
			    _ret pushBack ["B_OD_OD_soldier_F", nil, 8000 ];
				_ret pushBack ["B_OD_OD_R_soldier_F", nil, 8000 ];
				_ret pushBack ["B_TAN_TAN_soldier_F", nil, 8000];
				_ret pushBack ["B_TAN_TAN_R_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_BLK_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_BLK_R_soldier_F", nil, 8000];
				_ret pushBack ["B_GRY_OCP_soldier_F", nil, 8000];
				_ret pushBack ["B_GRY_OCP_R_soldier_F", nil, 8000];
				_ret pushBack ["B_TAN_OCP_soldier_F", nil, 8000];
				_ret pushBack ["B_TAN_OCP_R_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_OCP_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_OCP_R_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_TAN_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_TAN_R_soldier_F", nil, 8000];
				_ret pushBack ["B_wood3c_soldier_F", nil, 8000];
				_ret pushBack ["B_wood3cR_soldier_02_F", nil, 8000];
				_ret pushBack ["B_ODTANind_soldier_F", nil, 8000];
				_ret pushBack ["B_ODTANR_soldier_02_F", nil, 8000];
				_ret pushBack ["B_GRTANind_soldier_F", nil, 8000];
				_ret pushBack ["B_GRTANR_soldier_02_F", nil, 8000];
				_ret pushBack ["B_wood_soldier_F", nil, 8000];
				_ret pushBack ["B_woodR_soldier_02_F", nil, 8000];
				_ret pushBack ["B_MARPAT_WOOD_F", nil, 8000];
				_ret pushBack ["B_MARPAT_WOODR_soldier_02_F", nil, 8000];
				_ret pushBack ["B_WOOD_MARPAT_soldier_02_F", nil, 8000];
				_ret pushBack ["B_WOOD_MARPATR_F", nil, 8000];
				_ret pushBack ["B_woodtan_soldier_F", nil, 8000];
				_ret pushBack ["B_woodtanR_soldier_02_F", nil, 8000];
				_ret pushBack ["B_JSDF_soldier_F", nil, 8000];
				_ret pushBack ["B_JSDF_soldier_02_F", nil, 8000];
				_ret pushBack ["B_3CD_Delta_soldier_F", nil, 8000];
				_ret pushBack ["B_3CD_Delta_soldier_02_F", nil, 8000];
				_ret pushBack ["B_3CD_Ranger_soldier_02_F", nil, 8000];
				_ret pushBack ["B_3CD_Ranger_soldier_F", nil, 8000];
				_ret pushBack ["B_ACU_soldier_02_F", nil, 8000];
				_ret pushBack ["B_ACU_soldier_F", nil, 8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_F", nil, 8000];
				_ret pushBack ["B_MARPAT_Wood_soldier_02_F", nil, 8000];
				_ret pushBack ["B_BLK_OD_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_OD_soldier_02_F", nil, 8000];
				_ret pushBack ["B_3C_soldier_F", nil, 8000];
				_ret pushBack ["B_3C_soldier_02_F", nil, 8000];
				_ret pushBack ["B_Sage_soldier_F", nil, 8000];
				_ret pushBack ["B_Sage_soldier_02_F", nil, 8000];
				_ret pushBack ["B_BLK_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK_soldier_02_F", nil, 8000];
				_ret pushBack ["B_BLKTAN_soldier_F", nil, 8000];
				_ret pushBack ["B_BLKTAN_soldier_02_F", nil, 8000];
				_ret pushBack ["B_BLK3CD_soldier_F", nil, 8000];
				_ret pushBack ["B_BLK3CD_soldier_02_F", nil, 8000];
				_ret pushBack ["B_ODTANi_soldier_F", nil, 8000];
				_ret pushBack ["B_ODTANi_soldier_02_F", nil, 8000];
				_ret pushBack ["B_C01_soldier_F", nil, 8000];
				_ret pushBack ["B_C02_soldier_F", nil, 8000];
				_ret pushBack ["TRYK_U_B_OD_OD_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_OD_OD_R_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_TANTAN_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_TANTAN_R_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKBLK_R_CombatUniform", nil, 8000;
				_ret pushBack ["TRYK_U_B_GRYOCP_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_GRYOCP_R_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_TANOCP_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_TANOCP_R_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKTANR_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_ODTAN_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_ODTANR_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_GRTAN_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_GRTANR_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_wood_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_woodR_CombatUniformTshir", nil, 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_wood3c_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_woodtan_CombatUniform", nil, 8000];
				_ret pushBack ["TRYK_U_B_woodtanR_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_JSDF_CombatUniform", nil, 8000];
				_ret pushBack ["RYK_U_B_JSDF_CombatUniformTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDU", nil, 8000];
				_ret pushBack ["TRYK_U_B_3CD_Delta_BDUTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDU", nil, 8000];
				_ret pushBack ["TRYK_U_B_3CD_Ranger_BDUTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_ACU", nil, 8000];
				_ret pushBack ["TRYK_U_B_ACUTshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood", nil, 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Wood_Tshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert", nil, 8000];
				_ret pushBack ["TRYK_U_B_MARPAT_Desert_Tshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_3c", nil, 8000];
				_ret pushBack ["TRYK_U_B_3cr", nil, 8000];
				_ret pushBack ["TRYK_U_B_Sage_Tshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLK3CD", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLK3CD_Tshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLK", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLK_Tshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKTAN", nil, 8000];
				_ret pushBack ["TRYK_U_B_BLKTAN_Tshirt", nil, 8000];
				_ret pushBack ["TRYK_U_B_ODTAN", nil, 8000];
				_ret pushBack ["TRYK_U_B_ODTAN_TshirtTRYK_U_B_BLK_OD", nil, 8000];
				_ret pushBack ["TRYK_U_B_C01_Tsirt", nil, 8000];
				_ret pushBack ["TRYK_V_PlateCarrier_JSDF", nil, 8000];
				
		};
	};

	// Hats
	case 1: {
		if (__GETC__(life_donator) > 1) then
			{
				_ret pushBack ["kio_vfv_mask", nil, 15000];
				_ret pushBack ["Kio_Capital_Hat", nil, 15000];
				_ret pushBack ["casco_moto", nil, 15000];
				_ret pushBack ["H_Orel_Mask_Dead", nil, 15000];
				_ret pushBack ["H_Orel_FireFighter", nil, 15000];
				_ret pushBack ["H_Orel_FireFighter_Gaz", nil, 15000];
				_ret pushBack ["Kio_No1_Hat", nil, 15000];
				_ret pushBack ["Kio_Pirate_Hat", nil, 15000];
				_ret pushBack ["Kio_Santa_Hat", nil, 15000];
				_ret pushBack ["H_Soccer_Orange", nil, 15000];
				_ret pushBack ["Kio_Spinning_Hat", nil, 15000];
				_ret pushBack ["H_Spliff", nil, 15000];
				_ret pushBack ["H_Orel_Swat", nil, 15000];
				_ret pushBack ["Kio_Hat", nil, 15000];
			};
	};

	// Glasses
	case 2: {
       if (__GETC__(life_donator) > 1) then
		{
            _ret pushBack ["G_Combat",nil,55];
		};
	};

	// Vest
	case 3: {
	if (__GETC__(life_donator) > 1) then
			{
			_ret pushBack ["TRYK_V_ArmorVest_AOR1", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_CBR", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_khk", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR1_2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_AOR2_2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Brown2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_coyo2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_cbr2", nil, 15000];
			_ret pushBack ["RYK_V_ArmorVest_khk2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_green2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_tan2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Delta2", nil, 15000];
			_ret pushBack ["TRYK_V_ArmorVest_Ranger2", nil, 15000];
		    _ret pushBack ["TRYK_V_PlateCarrier_blk", nil, 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_oli", nil, 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_coyo", nil, 15000];
			_ret pushBack ["RYK_V_PlateCarrier_wood", nil, 15000];
			_ret pushBack ["TRYK_V_PlateCarrier_ACU", nil, 15000];
			_ret pushBack ["TRYK_V_TacVest_coyo", nil, 15000];
			
			};
	};

	// Backpacks
	case 4: {
		if (__GETC__(life_donator) > 1) then
			{
                _ret pushBack ["TRYK_B_AssaultPack_Type2camo", nil, 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Desert", nil, 8000];
				_ret pushBack ["TRYK_B_AssaultPack_MARPAT_Wood", nil, 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base", nil, 8000];
				_ret pushBack ["TRYK_B_Kitbag_blk", nil, 8000];
				_ret pushBack ["TRYK_B_Kitbag_aaf", nil, 8000];
				_ret pushBack ["TRYK_B_Carryall_blk", nil, 8000];
				_ret pushBack ["TRYK_B_Carryall_wood", nil, 8000];
				_ret pushBack ["TRYK_B_Carryall_JSDF", nil, 8000];
				_ret pushBack ["TRYK_B_Kitbag_Base_JSDF", nil, 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack", nil, 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_OD", nil, 8000];
				_ret pushBack ["TRYK_B_Coyotebackpack_BLK", nil, 8000];
				_ret pushBack ["TRYK_B_Alicepack", nil, 8000];
			    _ret pushBack ["TRYK_B_Medbag", nil, 8000];
				_ret pushBack ["TRYK_B_Medbag_OD", nil, 8000];
				_ret pushBack ["TRYK_B_Medbag_BK", nil, 8000];
				_ret pushBack ["TRYK_B_Medbag_ucp", nil, 8000];
				_ret pushBack ["TRYK_B_Belt", nil, 8000];
				_ret pushBack ["TRYK_B_Belt_BLK", nil, 8000];
				_ret pushBack ["TRYK_B_Belt_CYT", nil, 8000];
				_ret pushBack ["TRYK_B_Belt_tan", nil, 8000];
				_ret pushBack ["TRYK_B_Belt_br", nil, 8000];
				_ret pushBack ["TRYK_B_Belt_GR", nil, 8000];
				_ret pushBack ["TRYK_B_Belt_AOR1", nil, 8000];
				_ret pushBack ["TRYK_B_Belt_AOR2", nil, 8000];
				_ret pushBack ["TRYK_B_FieldPack_Wood", nil, 8000];

			};
	};

_ret;