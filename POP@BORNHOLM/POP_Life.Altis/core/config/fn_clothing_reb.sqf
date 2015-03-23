/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		    ["TRYK_U_denim_hood_blk",nil,18000 * Desc],
			["TRYK_U_B_OD_OD_CombatUniform",nil,18000 * Desc],
			["TRYK_U_B_OD_OD_R_CombatUniform",nil,18000 * Desc],
			["TRYK_U_B_TANTAN_CombatUniform",nil,18000 * Desc],
		    ["TRYK_U_B_TANTAN_R_CombatUniform",nil,18000 * Desc],
			["TRYK_U_B_BLKBLK_CombatUniform",nil,18000 * Desc],
			["TRYK_U_B_BLKBLK_R_CombatUniform",nil,18000 * Desc],
		    ["TRYK_U_B_GRYOCP_CombatUniform",nil,18000 * Desc],
			["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",nil,18000 * Desc],
		    ["TRYK_U_B_TANOCP_CombatUniform",nil, 18000 * Desc],
			["TRYK_U_B_TANOCP_R_CombatUniformTshirt",nil,18000 * Desc],
		    ["TRYK_U_B_BLKOCP_CombatUniform",nil,18000 * Desc],
			["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",nil,8000 * Desc],
		    ["TRYK_U_B_BLKTAN_CombatUniform",nil,18000 * Desc],
		    ["TRYK_U_B_BLKTANR_CombatUniformTshirt",nil,18000 * Desc],          
			["U_IG_Guerilla1_1",nil,5000 * Desc],
			["U_I_G_Story_Protagonist_F",nil,7500 * Desc],
			["U_B_CombatUniform_mcam_tshirt",nil,12500 * Desc],
			["U_B_CombatUniform_mcam",nil,12500 * Desc],
			["U_B_CombatUniform_mcam_vest",nil,12500 * Desc],
			["U_O_OfficerUniform_ocamo",nil,12500 * Desc],
			["U_O_SpecopsUniform_ocamo",nil,17500 * Desc],
			["U_O_PilotCoveralls",nil,15610 * Desc],
			["U_IG_leader",nil,15340 * Desc],
			["U_O_CombatUniform_oucamo",nil,20000 * Desc],
			["U_B_GhillieSuit",nil,50000 * Desc],
			["U_O_GhillieSuit",nil,50000 * Desc],
			["U_C_Scientist","Uniforme NBQ",100000 * Desc]
		];
	};

	//Hats
	case 1:
	{
		[
			
			["G_Balaclava_blk",nil, 1500 * Desc],
            ["G_Bandanna_beast",nil, 1500 * Desc],
            ["G_Balaclava_oli",nil, 1500 * Desc],
			["H_Bandanna_cbr",nil,650 * Desc],
			["H_Bandanna_gry",nil,650 * Desc],
			["H_Bandanna_khk",nil,650 * Desc],
			["H_Bandanna_sgg",nil,650 * Desc],
			["H_Bandanna_mcamo",nil,650 * Desc],
			["H_Bandanna_camo",nil,650 * Desc],
			["H_ShemagOpen_tan",nil,850 * Desc],
			["H_Shemag_olive",nil,850 * Desc],
			["H_ShemagOpen_khk",nil,850 * Desc],
			["H_Booniehat_dirty",nil,1000 * Desc],
			["H_Booniehat_tan",nil,1000 * Desc],
			["H_Booniehat_mcamo",nil,1000 * Desc],
			["H_Cap_khaki_specops_UK",nil,1200 * Desc],
			["H_Cap_oli",nil,1200 * Desc],
			["H_Cap_tan",nil,1200 * Desc],
			["H_Cap_tan_specops_US",nil,1200 * Desc],
			["H_Cap_brn_SPECOPS",nil,1200 * Desc],
			["H_MilCap_oucamo",nil,1500 * Desc],
			["H_MilCap_gry",nil,1500 * Desc],
			["H_MilCap_mcamo",nil,1500 * Desc],
			["H_MilCap_ocamo",nil,1500 * Desc],
			["H_MilCap_rucamo",nil,1500 * Desc],
			["H_CrewHelmetHeli_B","Mascara de Gas",10000 * Desc],
			["H_CrewHelmetHeli_O",nil,2000 * Desc],
			["H_HelmetO_ocamo",nil,3500 * Desc],
			["H_HelmetB_light",nil,5000 * Desc],
			["H_HelmetB_light_grass",nil,5000 * Desc],
			["H_Helmet_Kerry",nil,5000 * Desc],
			["H_HelmetB_grass",nil,5000 * Desc],
			["H_HelmetB_snakeskin",nil,5000 * Desc],
			["H_HelmetB_desert",nil,5000 * Desc],
			["H_HelmetB_black",nil,5000 * Desc],
			["H_HelmetB_sand",nil,5000 * Desc],
			["H_HelmetB_camo",nil,5000 * Desc]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25 * Desc],
			["G_Shades_Blue",nil,20 * Desc],
			["G_Sport_Blackred",nil,20 * Desc],
			["G_Sport_Checkered",nil,20 * Desc],
			["G_Sport_Blackyellow",nil,20 * Desc],
			["G_Sport_BlackWhite",nil,20 * Desc],
			["G_Squares",nil,10 * Desc],
			["G_Lowprofile",nil,30 * Desc],
			["G_Combat",nil,55 * Desc]
			
		];
	};

	//Vest
	case 3:
	{
		[
			["TRYK_V_ArmorVest_AOR1",nil, 15000 * Desc],
			["TRYK_V_ArmorVest_AOR2",nil, 15000 * Desc],
			["TRYK_V_ArmorVest_coyo",nil, 15000 * Desc],
			["TRYK_V_ArmorVest_Brown",nil, 15000 * Desc],
			["TRYK_V_ArmorVest_CBR",nil, 15000 * Desc],
			["V_Press_F",nil,4000 * Desc],
			["V_BandollierB_blk",nil,4500 * Desc],
			["V_BandollierB_cbr",nil,4500 * Desc],
			["V_BandollierB_khk",nil,4500 * Desc],
			["V_BandollierB_oli",nil,4500 * Desc],
			["V_BandollierB_rgr",nil,4500 * Desc],
			["V_HarnessO_brn",nil,7500 * Desc],
			["V_HarnessO_gry",nil,7500 * Desc],
			["V_HarnessOGL_brn",nil,7500 * Desc],
			["V_HarnessOGL_gry",nil,7500 * Desc],
			["V_HarnessOSpec_brn",nil,7500 * Desc],
			["V_HarnessOSpec_gry",nil,7500 * Desc],
			["V_Chestrig_khk",nil,10500 * Desc],
			["V_Chestrig_oli",nil,10500 * Desc],
			["V_Chestrig_rgr",nil,10500 * Desc],
			["V_TacVest_khk",nil,12500 * Desc],
			["V_TacVest_oli",nil,12500 * Desc],
			["V_TacVest_brn",nil,12500 * Desc],
			["V_TacVest_camo",nil,12500 * Desc],
			["V_PlateCarrier1_rgr",nil,14500 * Desc],
			["V_PlateCarrier2_rgr",nil,14500 * Desc]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["TRYK_B_AssaultPack_Type2camo",nil, 15000 * Desc],
			["TRYK_B_AssaultPack_MARPAT_Desert",nil, 15000 * Desc],
			["TRYK_B_AssaultPack_MARPAT_Wood",nil, 15000 * Desc],
		    ["TRYK_B_Kitbag_Base",nil, 15000 * Desc],
			["TRYK_B_Kitbag_blk",nil, 15000 * Desc],
			["TRYK_B_Kitbag_aaf",nil, 15000 * Desc],
			["TRYK_B_Carryall_blk",nil, 15000 * Desc],
			["TRYK_B_Carryall_wood",nil, 15000 *Desc],
			["TRYK_B_Carryall_JSDF",nil, 15000 *Desc],
			["B_AssaultPack_cbr",nil,2500 * Desc],
			["B_AssaultPack_rgr",nil,2500 * Desc],
			["B_AssaultPack_khk",nil,2500 * Desc],
			["B_AssaultPack_sgg",nil,2500 * Desc],
			["B_AssaultPack_mcamo",nil,2500 * Desc],
			["B_FieldPack_cbr",nil,3000 * Desc],
			["B_FieldPack_oucamo",nil,3000 * Desc],
			["B_FieldPack_ocamo",nil,3000 * Desc],
			["B_Bergen_sgg",nil,4500 * Desc],
			["B_Bergen_rgr",nil,4500 * Desc],
			["B_Bergen_mcamo",nil,4500 * Desc],
			["B_Kitbag_sgg",nil,4500 * Desc],
			["B_Kitbag_cbr",nil,4500 * Desc],
			["B_Kitbag_mcamo",nil,4500 * Desc],
			["B_Carryall_oli",nil,5000 * Desc],
			["B_Carryall_khk",nil,5000 * Desc],
			["B_Carryall_cbr",nil,5000 * Desc],
			["B_Carryall_ocamo",nil,5000 * Desc],
			["B_Carryall_oucamo",nil,5000 * Desc],
			["B_Carryall_mcamo",nil,5000 * Desc]
		];
	};
};