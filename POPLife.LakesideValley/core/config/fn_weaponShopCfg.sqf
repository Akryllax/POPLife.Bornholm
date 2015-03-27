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
 
switch(_shop) do
{
        case "med_basic":
        {
                switch (true) do
                {
                        case (playerSide != independent): {"No eres un medico de las EMS"};
                        default {
                                ["Hospital EMS Shop",
                                        [
                                                ["itemRadio",nil,500 * Desc],
                                                ["ItemGPS",nil,500 * Desc],
                                                ["Binocular",nil,350 * Desc],
                                                ["ToolKit",nil,1500 * Desc],
                                                ["FirstAidKit",nil,200 * Desc],
                                                ["Medikit",nil,750 * Desc],
                                                ["NVGoggles",nil,2000 * Desc],
                                                ["EMTRM_uni",nil,250 * Desc],	
												["B_Carryall_cbr",nil,100 * Desc],
												["A3L_EMT1",nil,5000 * Desc],
												["A3L_EMT2",nil,5000 * Desc],
												["EMTRM_uni",nil,5000 * Desc],
												["emt_Uni1",nil,5000 * Desc],
												["emt_Uni3",nil,5000 * Desc],
												["emsoff_uni",nil,5000 * Desc],
												["A3L_Worker_Outfit",nil,5000 * Desc],
												["fire_uni1",nil,5000 * Desc],
												["fire_uni2",nil,5000 * Desc],
												["fireoff_uni",nil,5000 * Desc],	
												["cl3_c_poloshirtpants_FD_uniform",nil,5000 * Desc],
												["cl3_pilot_CGP_uniform",nil,5000 * Desc],
												["cl3_coveralls_FD_black_uniform",nil,5000 * Desc],
												["cl3_coveralls_mechanic_uniform",nil,5000 * Desc],
												["A3L_firedeptmask",nil,850 * Desc],
												["A3L_medic_helmet",nil,850 * Desc],
												["a3l_hardhat",nil,850 * Desc],
												["H_Orel_FireFighter",nil,850 * Desc],
												["H_Orel_FireFighter_Gaz",nil,850 * Desc],
												["firehat",nil,850 * Desc],
												["V_TacVestIR_blk",nil,300 * Desc],
												["V_TacVest_blk",nil,300 * Desc],
												["V_RebreatherB",nil,300 * Desc],	
												["cl3_police_vest_CG2",nil,300 * Desc],
												["cl3_police_vest_fd",nil,300 * Desc],
												["cl3_police_vest_mr",nil,300 * Desc],
												["cl3_police_vest_pm",nil,300 * Desc],
												["V_Firefighter",nil,300 * Desc],
												["B_FieldPack_ocamo",nil,300 * Desc],
												["B_Carryall_oucamo",nil,300 * Desc],
												["B_TacticalPack_blk",nil,300 * Desc],
												["U_B_Wetsuit",nil,2000 * Desc],
												["G_Diving",nil,500 * Desc],
												["V_RebreatherB",nil,5000 * Desc]
                                        ]
                                ];
                        };
                };
        };
			
		case "cop_basic":
        {
                switch(true) do
                {
                        case (playerSide != west): {"No eres un policia!"};
                        default
                        {
                                ["Cadet Shop",
                                        [
                                                ["Taser_26","Taser",200 * Desc],
                                                ["26_cartridge",nil,50 * Desc],
                                                ["Binocular",nil,150 * Desc],
                                                ["ItemGPS",nil,100 * Desc],
												["FirstAidKit",nil,150 * Desc],
                                                ["ToolKit",nil,250 * Desc],
												["B_UavTerminal",nil,250 * Desc],
												["I_UavTerminal",nil,250 * Desc],
												["O_UavTerminal",nil,250 * Desc],
                                                ["NVGoggles",nil,200 * Desc],
												["26_cartridge",nil,500 * Desc],
												["RH_usp",nil,2000 * Desc],
												["RH_12Rnd_45cal_usp",nil,500 * Desc],
												["RH_uspm",nil,2000 * Desc],
												["RH_16Rnd_40cal_usp",nil,500 * Desc],
												["RH_fn57",nil,2000 * Desc],
                                                ["RH_20Rnd_57x28_FN",nil,500 * Desc],	
												["RH_g17",nil,500 * Desc],
                                                ["RH_17Rnd_9x19_g17",nil,500 * Desc],	
												["Orel_Matraque",nil,2000 * Desc],
												["O_IR_Grenade",nil,500 * Desc],
												["Radar_Gun",nil,1000 * Desc]
																				
                                        ]
                                ];
                        };
                };
        };
		
        case "cop_patrol":
        {
                switch(true) do
                {
                        case (playerSide != west): {"No eres un policia!"};
                        case (__GETC__(life_coplevel) < 2): {"No eres Patrullero"};
                        default
                        {
                                ["Patrol Officer Shop",
                                        [ 
										        ["Taser_26",nil,2000 * Desc],
                                                ["hlc_smg_mp5k",nil,2500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["26_cartridge",nil,500 * Desc],
												["RH_usp",nil,2500 * Desc],
												["RH_12Rnd_45cal_usp",nil,500 * Desc],
												["RH_uspm",nil,2500 * Desc],
												["RH_16Rnd_40cal_usp",nil,500 * Desc],
												["RH_fn57",nil,2500 * Desc],
                                                ["RH_20Rnd_57x28_FN",nil,500 * Desc],	
												["RH_g17",nil,2500 * Desc],
                                                ["RH_17Rnd_9x19_g17",nil,500 * Desc],	
												["Orel_Matraque",nil,2500 * Desc],
												["Radar_Gun",nil,1000 * Desc],
												["hlc_smg_mp5k_PDW",nil,3500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["hlc_smg_mp5a2",nil,4500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],	
                                                ["hlc_rifle_auga2para_b",nil,4500 * Desc],
                                                ["hlc_25Rnd_9x19mm_M882_AUG",nil,500 * Desc],
                                                ["hlc_smg_mp5sd6",nil,4500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc]
												
                                        ]
                                ];
                        };
                };
        };
 
        case "cop_sergeant":
        {
                switch(true) do
                {
                        case (playerSide != west): {"No eres policia!"};
                        case (__GETC__(life_coplevel) < 3): {"No eres Sargento!"};
                        default
                        {
                                ["Sergeant Officer Shop",
                                        [
										        ["Taser_26",nil,2000 * Desc],
                                                ["hlc_smg_mp5k",nil,2500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["26_cartridge",nil,500 * Desc],
												["RH_usp",nil,2500 * Desc],
												["RH_12Rnd_45cal_usp",nil,500 * Desc],
												["RH_uspm",nil,2500 * Desc],
												["RH_16Rnd_40cal_usp",nil,500 * Desc],
												["RH_fn57",nil,2500 * Desc],
                                                ["RH_20Rnd_57x28_FN",nil,500 * Desc],	
												["RH_g17",nil,2500 * Desc],
                                                ["RH_17Rnd_9x19_g17",nil,500 * Desc],	
												["Orel_Matraque",nil,2500 * Desc],
												["Radar_Gun",nil,1000 * Desc],										
												["RH_M4sbr_b",nil,5500 * Desc],
												["RH_hb_b",nil,5500 * Desc],	
												["RH_m4",nil,5500 * Desc],	
												["RH_30Rnd_762x35_FMJ",nil,500 * Desc],
												["RH_Hk416s",nil,5500 * Desc],	
												["RH_30Rnd_556x45_M855A1",nil,500 * Desc],	
												["hlc_rifle_augsrcarb_b",nil,5500 * Desc],	
												["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc]
												
                                        ]
                                ];
                        };
                };
        };
		
        case "cop_highrank":
        {
                switch(true) do
                {
                        case (playerSide != west): {"No eres un policia!"};
                        case (__GETC__(life_coplevel) < 6): {"No eres de los Geos"};
                        default
                        {
                                ["SWAT shop",
                                        [     
										        ["Taser_26",nil,2000 * Desc],
                                                ["hlc_smg_mp5k",nil,2500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["26_cartridge",nil,500 * Desc],
												["RH_usp",nil,2500 * Desc],
												["RH_12Rnd_45cal_usp",nil,500 * Desc],
												["RH_uspm",nil,2500 * Desc],
												["RH_16Rnd_40cal_usp",nil,500 * Desc],
												["RH_fn57",nil,2500 * Desc],
                                                ["RH_20Rnd_57x28_FN",nil,500 * Desc],	
												["RH_g17",nil,2500 * Desc],
                                                ["RH_17Rnd_9x19_g17",nil,500 * Desc],	
												["Orel_Matraque",nil,2500 * Desc],
												["Radar_Gun",nil,1000 * Desc],
												["arifle_MX_Black_F",nil,6500 * Desc],
												["30Rnd_65x39_caseless_mag",nil,500 * Desc],
												["RH_M16A4",nil,6500 * Desc],
												["RH_30Rnd_556x45_M855A1",nil,500 * Desc],
												["RH_M4A6",nil,6500 * Desc],
												["RH_30Rnd_68x43_FMJ",nil,500 * Desc],
												["hlc_rifle_auga1_b",nil,6500 * Desc],
												["hlc_30Rnd_556x45_B_AUG",nil,500 * Desc],
											    ["RH_Mk12mod1",nil,1000 * Desc],
                                                ["RH_SAMR",nil,1000 * Desc],
                                                ["RH_30Rnd_556x45_Mk262",nil,1000 * Desc],    
                                                ["RH_m110",nil,1000 * Desc],          
                                                ["RH_20Rnd_762x51_M80A1",nil,1000 * Desc],
												["RH_barska_rds",nil,1000 * Desc],
												["RH_eotech553",nil,1000 * Desc],
												["RH_eotech553mag",nil,1000 * Desc],
												["RH_reflex",nil,1000 * Desc],
												["RH_cmore",nil,1000 * Desc],
												["RH_compm4s",nil,1000 * Desc],
												["Trixie_xm8dot",nil,1000 * Desc],
												["RH_ta31rmr",nil,1000 * Desc],
												["optic_Hamr",nil,1000 * Desc],
												["RH_shortdot",nil,1000* Desc],
												["RH_matchsd",nil,1000 * Desc],
												["hlc_muzzle_Tundra",nil,1000 * Desc],
												["RH_spr_mbs",nil,1000 * Desc],
												["RH_fa556",nil,1000 * Desc],
												["RH_m110sd_t",nil,1000 * Desc],
										     	["RH_SFM952V",nil,1000 * Desc],
											    ["acc_flashlight",nil,1000 * Desc],
												["RH_peq15b",nil,1000 * Desc],
												["RH_peq2",nil,1000 * Desc],
                                                ["Trixie_M24_Black",nil,1000 * Desc],  
                                                ["Trixie_5x762_Mag",nil,1000 * Desc]
                                        ]
                                ];
                        };
                };
        };
		
		case "cop_lieutenant":
        {
                switch(true) do
                {
                        case (playerSide != west): {"No eres un policia!"};
                        case (__GETC__(life_coplevel) < 4): {"No eres Teniente!"};
                        default
                        {
                                ["lieutenant shop",
                                        [
										        ["Taser_26",nil,2000 * Desc],
                                                ["hlc_smg_mp5k",nil,2500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["26_cartridge",nil,500 * Desc],
												["RH_usp",nil,2500 * Desc],
												["RH_12Rnd_45cal_usp",nil,500 * Desc],
												["RH_uspm",nil,2500 * Desc],
												["RH_16Rnd_40cal_usp",nil,500 * Desc],
												["RH_fn57",nil,2500 * Desc],
                                                ["RH_20Rnd_57x28_FN",nil,500 * Desc],	
												["RH_g17",nil,2500 * Desc],
                                                ["RH_17Rnd_9x19_g17",nil,500 * Desc],	
												["Orel_Matraque",nil,2500 * Desc],
												["Radar_Gun",nil,1000 * Desc],
												["arifle_MX_Black_F",nil,6500 * Desc],
												["30Rnd_65x39_caseless_mag",nil,500 * Desc],
												["RH_M16A4",nil,6500 * Desc],
												["RH_30Rnd_556x45_M855A1",nil,500 * Desc],
												["RH_M4A6",nil,6500 * Desc],
												["RH_30Rnd_68x43_FMJ",nil,500 * Desc],
												["hlc_rifle_auga1_b",nil,6500 * Desc],
												["hlc_30Rnd_556x45_B_AUG",nil,500 * Desc],
												["RH_Mk12mod1",nil,1000 * Desc],
                                                ["RH_SAMR",nil,1000 * Desc],
                                                ["RH_30Rnd_556x45_Mk262",nil,1000 * Desc],    
                                                ["RH_m110",nil,1000 * Desc],          
                                                ["RH_20Rnd_762x51_M80A1",nil,1000 * Desc],
                                                ["Trixie_M24_Black",nil,1000 * Desc],         
                                                ["Trixie_5x762_Mag",nil,1000 * Desc]
                                        ]
                                ];
                        };
                };
        };
		
		case "cop_command":
        {
                switch(true) do
                {
                        case (playerSide != west): {"No eres policia!"};
                        case (__GETC__(life_coplevel) < 5): {"No eres comandante!"};
                        default
                        {
                                [" shop",
                                        [
										        ["Taser_26",nil,2000 * Desc],
                                                ["hlc_smg_mp5k",nil,2500 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["26_cartridge",nil,500 * Desc],
												["RH_usp",nil,2500 * Desc],
												["RH_12Rnd_45cal_usp",nil,500 * Desc],
												["RH_uspm",nil,2500 * Desc],
												["RH_16Rnd_40cal_usp",nil,500 * Desc],
												["RH_fn57",nil,2500 * Desc],
                                                ["RH_20Rnd_57x28_FN",nil,500 * Desc],	
												["RH_g17",nil,2500 * Desc],
                                                ["RH_17Rnd_9x19_g17",nil,500 * Desc],	
												["Orel_Matraque",nil,2500 * Desc],
												["Radar_Gun",nil,1000 * Desc],
												["arifle_MX_Black_F",nil,6500 * Desc],
												["30Rnd_65x39_caseless_mag",nil,500 * Desc],
												["RH_M16A4",nil,6500 * Desc],
												["RH_30Rnd_556x45_M855A1",nil,500 * Desc],
												["RH_M4A6",nil,6500 * Desc],
												["RH_30Rnd_68x43_FMJ",nil,500 * Desc],
												["hlc_rifle_auga1_b",nil,6500 * Desc],
												["hlc_30Rnd_556x45_B_AUG",nil,500 * Desc],
												["RH_Mk12mod1",nil,1000 * Desc],
                                                ["RH_SAMR",nil,1000 * Desc],
                                                ["RH_30Rnd_556x45_Mk262",nil,1000 * Desc],    
                                                ["RH_m110",nil,1000 * Desc],          
                                                ["RH_20Rnd_762x51_M80A1",nil,1000 * Desc],
                                                ["Trixie_M24_Black",nil,1000 * Desc],         
                                                ["Trixie_5x762_Mag",nil,1000 * Desc]
                                        ]
                                ];
                        };
                };
        };
		
		case "signstore":
		{
				["Sign Shop",
						[
						        ["A3L_sign",nil,5000 * Desc],
                                ["A3L_sign2",nil,1500 * Desc],
                                ["A3L_sign3",nil,1000 * Desc]
						]
				];
		};
		
		case "taxista_tienda":
		{
				["Tienda de Taxista",
						[
						    ["itemRadio",nil,1500 * Desc],
							["Binocular",nil,1500 * Desc],
							["ItemGPS",nil,1000 * Desc],
							["ToolKit",nil,2500 * Desc],
							["FirstAidKit",nil,1500 * Desc],
							["NVGoggles",nil,2000 * Desc],
							["cl3_civ_tacticalbelt_black",nil,3000 * Desc],
							["taxi_uni",nil,3000 * Desc],
							["H_StrawHat",nil,3000 * Desc]
						]
				];
		};
		
		case "periodista_tienda":
		{
				["Tienda de Periodista",
						[
						    ["itemRadio",nil,1500 * Desc],
							["Binocular",nil,1500 * Desc],
							["ItemGPS",nil,1000 * Desc],
							["ToolKit",nil,2500 * Desc],
							["FirstAidKit",nil,1500 * Desc],
							["NVGoggles",nil,2000 * Desc],
							["Tv_Camera",nil,3000 * Desc],
							["cl3_c_poloshirt_9_uniform",nil,3000 * Desc],
							["H_Cap_press",nil,3000 * Desc],
							["V_Press_F",nil,3000 * Desc],
							["cl3_civ_tacticalbelt_black",nil,3000 * Desc]
						]
				];
		};
		
		case "black":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"No eres un civil!"};
                        case (!license_civ_rebel): {"No posees la licencia de rebelde!"};
                        default
                        {
                                ["Mohammed's Ghetto Weapons Shop",
                                        [
                                           //Nivel 1 - Pistolas automáticas
                                                ["RH_g18",nil,30000 * Desc],
                                                ["RH_33Rnd_9x19_g18",nil,500 * Desc],
                                                ["RH_vz61",nil,30000 * Desc],
                                                ["RH_20Rnd_32cal_vz61",nil,500 * Desc],
                                                ["RH_tec9",nil,30000 * Desc],												
                                                ["RH_32Rnd_9x19_tec",nil,500 * Desc],
                                                ["RH_muzi",nil,30000 * Desc],
                                                ["RH_30Rnd_9x19_UZI",nil,500 * Desc],
                                                ["hlc_smg_mp5k",nil,30000 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["RH_deagle",nil,75000 * Desc],
												["RH_deagleg",nil,80000 * Desc],
												["7Rnd_408_Mag",nil,1000 * Desc],
                                           //Nivel 2 - Subfusiles pequeños
                                                ["SMG_02_F",nil,40000 * Desc],
                                                ["30Rnd_9x21_Mag",nil,600 * Desc],
                                                ["SMG_01_F",nil,40000 * Desc],
                                                ["30Rnd_45ACP_Mag_SMG_01",nil,600 * Desc],
                                                ["hgun_PDW2000_F",nil,40000 * Desc],
                                                ["30Rnd_9x21_Mag",nil,600 * Desc],
                                                ["hlc_smg_mp5k_PDW",nil,40000 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,600 * Desc],	
                                           //Nivel 3 - Subfusiles grandes
                                                ["hlc_smg_mp510",nil,45000 * Desc],
                                                ["hlc_30Rnd_10mm_B_MP5",nil,600 * Desc],
                                                ["RH_sbr9_des",nil,45000 * Desc],
                                                ["RH_sbr9_tg",nil,45000 * Desc],
                                                ["RH_sbr9_wdl",nil,45000 * Desc],
                                                ["RH_32Rnd_9mm_M822",nil,600 * Desc],
                                           //Nivel 4 - fusiles 5,56
                                                ["RH_Hk416c",nil,75000 * Desc],
                                                ["RH_M4m",nil,75000 * Desc],
                                                ["RH_M4sbr",nil,75000 * Desc],
												["RH_M4sbr_g",nil,75000 * Desc],	
                                                ["RH_30Rnd_556x45_M855A1",nil,700 * Desc],
                                                ["RH_hb",nil,50000 * Desc],
                                                ["RH_30Rnd_762x35_FMJ",nil,700 * Desc],
                                                ["Trixie_XM8_Carbine",nil,50000 * Desc],
												["Trixie_XM8_Compact",nil,50000 * Desc],
                                                ["Trixie_XM8_30Rnd",nil,50000 * Desc],
                                                ["arifle_TRG20_F",nil,50000 * Desc],
                                                ["30Rnd_556x45_Stanag",nil,700 * Desc],
                                                ["arifle_Mk20C_plain_F",nil,50000 * Desc],
                                                ["30Rnd_556x45_Stanag",nil,700 * Desc],
                                                ["Trixie_l85a2_nr",nil,50000 * Desc],
                                                ["Trixie_30Rnd",nil,700 * Desc],
                                                ["hlc_smg_mp5k_PDW",nil,50000 * Desc],
												["RH_M4_moe",nil,80000 * Desc],
                                                ["RH_m4_des",nil,80000 * Desc],	
                                                ["RH_m4_tg",nil,80000 * Desc],		
                                                ["RH_m4_wdl",nil,80000 * Desc],		
                                                ["RH_30Rnd_556x45_M855A1",nil,700 * Desc],	
                                           //Nivel 5 - Ak cortas
                                                ["hlc_rifle_aks74u",nil,120000 * Desc],	
                                                ["hlc_rifle_aku12",nil,120000 * Desc],
                                                ["hlc_30Rnd_545x39_B_AK",nil,1000 * Desc]	
                                        ]
                                ];
                        };
                };
        };
       
        case "rebel":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"No eres un civil!"};
                        case (!license_civ_rebel): {"No posees la licencia de rebelde!"};
                        default
                        {
                                ["Mohammed's Jihadi Shop",
                                        [                                               
                                                //Nivel 1 - Pistolas automáticas
                                                ["RH_g18",nil,30000 * Desc],
                                                ["RH_33Rnd_9x19_g18",nil,500 * Desc],
                                                ["RH_vz61",nil,30000 * Desc],
                                                ["RH_20Rnd_32cal_vz61",nil,500 * Desc],
                                                ["RH_tec9",nil,30000 * Desc],												
                                                ["RH_32Rnd_9x19_tec",nil,500 * Desc],
                                                ["RH_muzi",nil,30000 * Desc],
                                                ["RH_30Rnd_9x19_UZI",nil,500 * Desc],
                                                ["hlc_smg_mp5k",nil,30000 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
												["RH_deagle",nil,75000 * Desc],
												["RH_deagleg",nil,80000 * Desc],
												["7Rnd_408_Mag",nil,1000 * Desc],
                                           //Nivel 2 - Subfusiles pequeños
                                                ["SMG_02_F",nil,40000 * Desc],
                                                ["30Rnd_9x21_Mag",nil,600 * Desc],
                                                ["SMG_01_F",nil,40000 * Desc],
                                                ["30Rnd_45ACP_Mag_SMG_01",nil,600 * Desc],
                                                ["hgun_PDW2000_F",nil,40000 * Desc],
                                                ["30Rnd_9x21_Mag",nil,600 * Desc],
                                                ["hlc_smg_mp5k_PDW",nil,40000 * Desc],
                                                ["hlc_30Rnd_9x19_B_MP5",nil,600 * Desc],	
                                           //Nivel 3 - Subfusiles grandes
                                                ["hlc_smg_mp510",nil,45000 * Desc],
                                                ["hlc_30Rnd_10mm_B_MP5",nil,600 * Desc],
                                                ["RH_sbr9_des",nil,45000 * Desc],
                                                ["RH_sbr9_tg",nil,45000 * Desc],
                                                ["RH_sbr9_wdl",nil,45000 * Desc],
                                                ["RH_32Rnd_9mm_M822",nil,600 * Desc],
                                           //Nivel 4 - fusiles 5,56
                                                ["RH_Hk416c",nil,75000 * Desc],
                                                ["RH_M4m",nil,75000 * Desc],
                                                ["RH_M4sbr",nil,75000 * Desc],
												["RH_M4sbr_g",nil,75000 * Desc],	
                                                ["RH_30Rnd_556x45_M855A1",nil,700 * Desc],
                                                ["RH_hb",nil,50000 * Desc],
                                                ["RH_30Rnd_762x35_FMJ",nil,700 * Desc],
                                                ["Trixie_XM8_Carbine",nil,50000 * Desc],
												["Trixie_XM8_Compact",nil,50000 * Desc],
                                                ["Trixie_XM8_30Rnd",nil,50000 * Desc],
                                                ["arifle_TRG20_F",nil,50000 * Desc],
                                                ["30Rnd_556x45_Stanag",nil,700 * Desc],
                                                ["arifle_Mk20C_plain_F",nil,50000 * Desc],
                                                ["30Rnd_556x45_Stanag",nil,700 * Desc],
                                                ["Trixie_l85a2_nr",nil,50000 * Desc],
                                                ["Trixie_30Rnd",nil,700 * Desc],
                                                ["hlc_smg_mp5k_PDW",nil,50000 * Desc],
												["RH_M4_moe",nil,80000 * Desc],
                                                ["RH_m4_des",nil,80000 * Desc],	
                                                ["RH_m4_tg",nil,80000 * Desc],		
                                                ["RH_m4_wdl",nil,80000 * Desc],		
                                                ["RH_30Rnd_556x45_M855A1",nil,700 * Desc],	
                                           //Nivel 5 - Ak cortas
                                                ["hlc_rifle_aks74u",nil,120000 * Desc],	
                                                ["hlc_rifle_aku12",nil,120000 * Desc],
                                                ["hlc_30Rnd_545x39_B_AK",nil,1000* Desc]	
																							
                                        ]
                                ];
                        };
                };
        };
		
		
		case "donator_gun":
	    {
		switch(true) do
		{
			case (playerSide != civilian): {"No eres un civil!"};
			case (!license_civ_donator): {"No eres donador!"};
			default
			{
				                        ["Donator Shop",					
                                        [
                                                ["V_Rangemaster_belt",nil,4900 * Desc],
                                                ["RH_deagle",nil,5000 * Desc],
												["srifle_LRR_F",nil,1000 * Desc],						
					                           	["7Rnd_408_Mag",nil,1000 * Desc], 
                                                ["RH_deagleg",nil,5000 * Desc],
                                                ["RH_deagles",nil,5000 * Desc],
												["optic_SOS",nil,505 * Desc],
												["muzzle_snds_L",nil,505 * Desc],
                                                ["RH_deaglem",nil,5000 * Desc],
                                                ["RH_7Rnd_50_AE",nil,100 * Desc],
                                                ["RH_cz75",nil,6000 * Desc],
                                                ["RH_16Rnd_9x19_cz",nil,125 * Desc],
                                                ["RH_sw659",nil,2000 * Desc],
                                                ["RH_14Rnd_9x19_sw",nil,100 * Desc],
                                                ["RH_usp",nil,2000 * Desc],
                                                ["RH_12Rnd_45cal_usp",nil,100 * Desc],
                                                ["RH_mak",nil,1500 * Desc],
                                                ["RH_8Rnd_9x18_Mak",nil,75 * Desc],
                                                ["RH_uspm",nil,1750 * Desc],
                                                ["RH_16Rnd_40cal_usp",nil,125 * Desc],
                                                ["RH_m9",nil,1250 * Desc],
                                                ["RH_15Rnd_9x19_M9",nil,75 * Desc],
                                                ["RH_m9c",nil,2000 * Desc],
                                                ["RH_tt33",nil,1750 * Desc],
                                                ["RH_8Rnd_762_tt33",nil,50 * Desc],            
                                                ["RH_mk2",nil,1500 * Desc],
                                                ["RH_10Rnd_22LR_mk2",nil,75 * Desc],          
                                                ["RH_p226",nil,2500 * Desc],
                                                ["RH_15Rnd_9x19_SIG",nil,125 * Desc],      
                                                ["RH_p226s",nil,2500 * Desc],
                                                ["RH_mateba",nil,2000 * Desc],            
                                                ["RH_6Rnd_44_Mag",nil,75 * Desc],              
                                                ["RH_python",nil,1900 * Desc],            
                                                ["RH_6Rnd_357_Mag",nil,75 * Desc],            
                                                ["RH_mp412",nil,3000 * Desc],                  
                                                ["RH_bull",nil,6000 * Desc],
                                                ["RH_6Rnd_454_Mag",nil,75 * Desc],            
                                                ["RH_bullb",nil,6000 * Desc],                          
                                                ["RH_ttracker",nil,6500 * Desc],          
                                                ["RH_6Rnd_45ACP_Mag",nil,75 * Desc],      
                                                ["RH_ttracker_g",nil,5000 * Desc],                
                                                ["RH_fnp45",nil,2000 * Desc],              
                                                ["RH_15Rnd_45cal_fnp",nil,75 * Desc],      
                                                ["RH_fnp45t",nil,2000 * Desc],                  
                                                ["RH_fn57",nil,1500 * Desc],              
                                                ["RH_20Rnd_57x28_FN",nil,75 * Desc],        
                                                ["RH_fn57_g",nil,2000 * Desc],                  
                                                ["RH_fn57_t",nil,2000 * Desc],                  
                                                ["RH_gsh18",nil,4000 * Desc],              
                                                ["RH_18Rnd_9x19_gsh",nil,75 * Desc],
												["RH_g18",nil,3500 * Desc],
                                                ["RH_33Rnd_9x19_g18",nil,2500 * Desc],
                                                ["RH_tec9",nil,7500 * Desc],              
                                                ["RH_32Rnd_9x19_tec",nil,200 * Desc],        
                                                ["RH_muzi",nil,8000 * Desc],              
                                                ["RH_30Rnd_9x19_UZI",nil,125 * Desc],
												["RH_ar10",nil,12500 * Desc],
												["RH_20Rnd_762x51_AR10",nil,300 * Desc],
												["RH_m16a3",nil,14000 * Desc],
												["RH_m16a4",nil,18000 * Desc],
												["30rnd_556x45_STANAG",nil,800 * Desc],
												["30Rnd_556x45_Stanag_Tracer_Red",nil,800 * Desc],
												["RH_mk12mod1",nil,25000 * Desc],
												["RH_compM4s",nil,5000 * Desc],
												["RH_eotech533",nil,5000 * Desc],
												["RH_shortdot",nil,5000 * Desc],
												["RH_reflex",nil,5000 * Desc],
												["LMG_mas_mk48_F",nil,35000 * Desc],
												["LMG_mas_Mk200_F",nil,35000 * Desc],
												["LMG_mas_M249a_F",nil,35000 * Desc],
												["20Rnd_556x45_UW_mag",nil,2500 * Desc],
												["200Rnd_mas_556x45_Stanag",nil,2000 * Desc],
												["100Rnd_mas_762x51_Stanag",nil,2000 * Desc],
												["150Rnd_762x51_Box",nil,2000 * Desc],
												["muzzle_snds_H_MG",nil,15000 * Desc],
												["acc_flashlight",nil,1000 * Desc],
												["acc_pointer_IR",nil,1500 * Desc],
												["acc_mas_pointer_IR",nil,1500 * Desc],
												["optic_mas_term",nil,5500 * Desc],
                                                ["optic_Nightstalker",nil,7500 * Desc],
												["optic_NVS",nil,7500 * Desc],
												["arifle_mas_mp5",nil,27500 * Desc],
												["30Rnd_mas_9x21_Stanag",nil,2500 * Desc],
												["muzzle_snds_L",nil,2500 * Desc],
												["optic_mas_aim",nil,2500 * Desc],
												["optic_mas_acog",nil,2500 * Desc],
												["srifle_mas_m24",nil,37500 * Desc],
												["5Rnd_mas_762x51_Stanag",nil,2500 * Desc],
												["muzzle_mas_snds_SH",nil,7500 * Desc],
												["optic_Nightstalker",nil,7500 * Desc],
												["optic_NVS",nil,7500 * Desc],
												["srifle_mas_hk417",nil,17500 * Desc],
												["20Rnd_mas_762x51_Stanag",nil,2500 * Desc],
												["optic_mas_aim",nil,2500 * Desc],
												["optic_mas_acog",nil,2500 * Desc],
												["muzzle_mas_snds_SM",nil,2500 * Desc],
												["LMG_mas_rpk_F",nil,27500 * Desc],
												["100Rnd_mas_545x39_mag",nil,2500 * Desc],
												["srifle_mas_ksvk",nil,27500 * Desc],
												["5Rnd_mas_127x108_mag",nil,7500 * Desc],
												["optic_Nightstalker",nil,7500 * Desc],
												["optic_NVS",nil,7500 * Desc],
												["arifle_mas_bizon",nil,17500 * Desc],
												["64Rnd_mas_9x18_mag",nil,2500 * Desc],
												["optic_mas_aim",nil,7500 * Desc],
												["optic_mas_acog",nil,7500 * Desc],
												["arifle_mas_saiga",nil,17500 * Desc],
												["10Rnd_mas_12Gauge_Slug",nil,2500 * Desc],
												["10Rnd_mas_12Gauge_Pellets",nil,2500 * Desc],
												["optic_mas_aim",nil,7500 * Desc],
												["optic_mas_acog",nil,7500 * Desc],
												["arifle_mas_akm",nil,27500 * Desc],
												["30Rnd_mas_762x39_mag",nil,2500 * Desc],
												["optic_Nightstalker",nil,7500 * Desc],
												["optic_NVS",nil,7500 * Desc],
												["optic_mas_aim",nil,7500 * Desc],
												["optic_mas_acog",nil,7500 * Desc],
												["arifle_mas_aks74",nil,27500 * Desc],
												["arifle_mas_ak_74m",nil,27500 * Desc],
												["arifle_mas_aks74u",nil,27500 * Desc],
												["30Rnd_mas_545x39_mag",nil,2500 * Desc],
												["optic_mas_aim",nil,7500 * Desc],
												["optic_mas_acog",nil,7500 * Desc],
												["muzzle_mas_snds_AK",nil,7500 * Desc],
                                                ["srifle_mas_m107",nil,27500 * Desc],
                                                ["5Rnd_mas_127x99_Stanag",nil,2500 * Desc],
                                                ["muzzle_snds_B",nil,2500 * Desc],
                                                ["optic_Nightstalker",nil,7500 * Desc],
												["optic_NVS",nil,7500 * Desc],
                                                ["arifle_mas_m1014",nil,12500 * Desc],
                                                ["7Rnd_mas_12Gauge_Slug",nil,2500 * Desc],
												["7Rnd_mas_12Gauge_Pellets",nil,2500 * Desc] 
                                        ]
                                ];
                        };
                };
        };
		
        case "gun":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"No eres un civil!"};
                        case (!license_civ_gun): {"No tienes la licencia de armas!"};
                        default
                        {
                                ["Billy Joe's Firearms",
                                        [
                                                ["V_Rangemaster_belt",nil,1000 * Desc],
                                                ["RH_cz75",nil,45000 * Desc],
                                                ["RH_16Rnd_9x19_cz",nil,1250 * Desc],
                                                ["RH_sw659",nil,45000 * Desc],
                                                ["RH_14Rnd_9x19_sw",nil,1000 * Desc],
                                                ["RH_usp",nil,45000 * Desc],
                                                ["RH_12Rnd_45cal_usp",nil,1000 * Desc],
                                                ["RH_mak",nil,45000 * Desc],
                                                ["RH_8Rnd_9x18_Mak",nil,1000 * Desc],
                                                ["RH_uspm",nil,55000 * Desc],
                                                ["RH_16Rnd_40cal_usp",nil,1250 * Desc],
                                                ["RH_m9",nil,55000 * Desc],
                                                ["RH_m9c",nil,55000 * Desc],												
                                                ["RH_15Rnd_9x19_M9",nil,1000 * Desc],
                                                ["RH_tt33",nil,55000 * Desc],
                                                ["RH_8Rnd_762_tt33",nil,1000 * Desc],            
                                                ["RH_mk2",nil,55000 * Desc],
                                                ["RH_10Rnd_22LR_mk2",nil,1000 * Desc],          
                                                ["RH_p226",nil,45000 * Desc],
                                                ["RH_p226s",nil,45000 * Desc],												
                                                ["RH_15Rnd_9x19_SIG",nil,1000 * Desc],      
                                                ["RH_mateba",nil,45000 * Desc],            
                                                ["RH_6Rnd_44_Mag",nil,1000 * Desc],              
                                                ["RH_python",nil,45000 * Desc],  
                                                ["RH_mp412",nil,45000 * Desc],  												
                                                ["RH_6Rnd_357_Mag",nil,1000 * Desc],                            
                                                ["RH_bull",nil,55000 * Desc],           
                                                ["RH_bullb",nil,55000 * Desc],  
                                                ["RH_6Rnd_454_Mag",nil,1000 * Desc], 												
                                                ["RH_ttracker",nil,55000 * Desc],          
                                                ["RH_6Rnd_45ACP_Mag",nil,1000 * Desc],                 
                                                ["RH_fnp45",nil,55000 * Desc],  
                                                ["RH_fnp45t",nil,55000 * Desc],  												
                                                ["RH_15Rnd_45cal_fnp",nil,1000 * Desc],                      
                                                ["RH_fn57",nil,55000 * Desc],                      
                                                ["RH_fn57_g",nil,55000 * Desc],                  
                                                ["RH_fn57_t",nil,55000 * Desc],
                                                ["RH_20Rnd_57x28_FN",nil,1000 * Desc],												
                                                ["RH_gsh18",nil,45000 * Desc], 
												["RH_18Rnd_9x19_gsh",nil,1000 * Desc],
												["hgun_Pistol_heavy_01_F",nil,45000 * Desc], 
												["11Rnd_45ACP_Mag",nil,1000 * Desc], 
												["hgun_ACPC2_F",nil,45000 * Desc], 
												["9Rnd_45ACP_Mag",nil,1000 * Desc], 
												["hgun_P07_F",nil,45000 * Desc], 
												["hgun_Rook40_F",nil,45000 * Desc],
												["16Rnd_9x21_Mag",nil,1000 * Desc], 
												["hgun_Pistol_heavy_02_F",nil,45000 * Desc], 
												["6Rnd_45ACP_Cylinder",nil,1000 * Desc]
                                               
                                        ]
                                ];
                        };
                };
        };

        case "gundiver":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"No eres un civil!"};
                        case (([expMarinero] call ica_expToLevel) < 10): {"Necesitas ser marinero nivel 10"};
                        default {
							["Armas acuáticas de Manolo",
								[
									["arifle_sdar_F","underwater Rifle",60000 * Desc],
									["20Rnd_556x45_UW_mag","underwater Magazine",1000 * Desc]
									   
								]
							];
                        };
                };
        };		
       
        case "gang":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"No eres un civil!"};
                        default
                        {
                                ["Hideout Armament",
                                        [
                                                ["RH_g18",nil,3500 * Desc],
                                                ["RH_33Rnd_9x19_g18",nil,3000 * Desc],
                                                ["RH_tec9",nil,25500 * Desc],              
                                                ["RH_32Rnd_9x19_tec",nil,200 * Desc],        
                                                ["RH_muzi",nil,20000 * Desc],              
                                                ["RH_30Rnd_9x19_UZI",nil,1250 * Desc]
                                        ]
                                ];
                        };
                };
        };
		
		case "nicknack":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"No eres un civil!"};
                        default
                        {
                                ["Nick-Nacks Store",
                                        [
                                                ["MeleeHatchet",nil,2500 * Desc],
                                                ["firehat",nil,2500 * Desc],
                                                ["a3l_hardhat",nil,2500 * Desc],              
                                                ["A3L_Mask",nil,2500 * Desc],        
                                                ["A3L_SkateHelmet_green",nil,2500 * Desc],                                                            
												["A3L_Halloween_Pumpkinhead",nil,2500 * Desc],
                                                ["A3L_Halloween_JigSaw",nil,2500 * Desc],
                                                ["A3L_Helmet",nil,2500 * Desc],              
                                                ["A3L_Helmetblack",nil,2500 * Desc],        
                                                ["A3L_Sign2",nil,2500 * Desc],              
                                                ["A3L_Sign",nil,2500 * Desc],
												["A3L_Shovel",nil,2500 * Desc],
                                                ["A3L_Spanner",nil,2500 * Desc],
                                                ["A3L_SpookyVest",nil,2500 * Desc],              
                                                ["A3L_SpiderVest",nil,2500 * Desc],        
                                                ["jokermask",nil,1500 * Desc],              
                                                ["A3L_ChainSaw",nil,2500 * Desc],
												["A3L_Extinguisher",nil,3000 * Desc],              
                                                ["A3L_JackHammer",nil,2500 * Desc],        
												["A3L_Bikini_Girl",nil,3500 * Desc]																																																													
                                        ]
                                ];
                        };
                };
        };
		
		case "paintball":
        {
                switch(true) do
                {
                        case (playerSide != civilian): {"No eres un civil!"};
                        default
                        {
                                ["PaintBall Store",
                                        [
                                                ["A3L_PaintballGun_red",nil,12350 * Desc],
                                                ["A3L_PaintballGun_blue",nil,12350 * Desc],
                                                ["A3L_PaintballGun_pink",nil,12350 * Desc],              
                                                ["PaintBalls",nil,200 * Desc]                                                                                                                  
                                        ]
                                ];
                        };
                };
        };
		
		case "genstore":
		{
					["Altis General Store",
						[
							["itemRadio",nil,1500 * Desc],
							["Binocular",nil,1500 * Desc],
							["ItemGPS",nil,1000 * Desc],
							["ToolKit",nil,2500 * Desc],
							["FirstAidKit",nil,1500 * Desc],
							["NVGoggles",nil,2000 * Desc],
							["Chemlight_red",nil,3000 * Desc],
							["Chemlight_yellow",nil,3000 * Desc],
							["Chemlight_green",nil,3000 * Desc],
							["Chemlight_blue",nil,3000 * Desc]
					]
				];
		};
};
