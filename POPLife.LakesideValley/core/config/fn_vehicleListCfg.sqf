#include <macro.h>
/*
        File:
        Author: Bryan "Tonic" Boardwine

        Description:
        Master configuration list / array for buyable vehicles & prices and their shop.
*/
private ["_shop", "_return"];
_shop = [_this, 0, "", [""]] call BIS_fnc_param;
if (_shop == "") exitWith { []};
_return = [];
switch (_shop) do {
	case "dezzie_car": {
		_return = [ 
		
				["IVORY_PRIUS", 15000 * Desc],
			    ["IVORY_R8", 130000 * Desc],
			    ["IVORY_R8SPYDER", 135000 * Desc],
			    ["cl3_batmobile", 6000000 * Desc],
			    ["cl3_lamborghini_gt1_2tone1", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_2tone2", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_2tone3", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_2tone4", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_2tone5", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_black", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_blue", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_red", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_white", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_camo", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_camo_urban", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_flame", 1110000* Desc],
			    ["cl3_lamborghini_gt1_flame1", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_flame2", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_gold", 1110000 * Desc],
			    ["cl3_lamborghini_gt1_silver", 1110000* Desc],
			    ["cl3_reventon_2tone2", 910000 * Desc],
			    ["cl3_reventon_2tone3", 910000 * Desc],
			    ["cl3_reventon_2tone5", 910000 * Desc],
			    ["cl3_reventon_flame", 910000 * Desc],
			    ["cl3_reventon_flame1", 910000 * Desc],
			    ["cl3_reventon_flame2", 910000 * Desc],
			    ["cl3_reventon_gold", 910000 * Desc],
			    ["cl3_reventon_lime", 910000 * Desc],
			    ["cl3_murcielago_2tone2", 910000 * Desc],
			    ["cl3_murcielago_2tone3", 910000 * Desc],
			    ["cl3_murcielago_2tone4", 910000 * Desc],
			    ["cl3_murcielago_2tone5", 910000 * Desc],
			    ["cl3_murcielago_black", 910000 * Desc],
			    ["cl3_murcielago_blue", 910000 * Desc],
			    ["cl3_murcielago_red", 910000 * Desc],
			    ["cl3_murcielago_camo", 910000 * Desc],
			    ["cl3_murcielago_camo_urban", 9100000 * Desc],
			    ["cl3_murcielago_flame", 910000 * Desc],
			    ["cl3_murcielago_flame1", 910000 * Desc],
			    ["cl3_murcielago_flame2", 910000 * Desc],
			    ["cl3_murcielago_gold", 910000 * Desc],
			    ["IVORY_REV", 710000 * Desc],
			    ["cl3_z4_2008_black", 310000 * Desc],
			    ["cl3_z4_2008_blue", 310000 * Desc],
			    ["cl3_z4_2008_silver", 310000 * Desc],
			    ["cl3_z4_2008_red", 310000 * Desc],
			    ["cl3_z4_2008_white", 310000 * Desc],
			    ["cl3_z4_2008_yellow", 310000 * Desc],
			    ["cl3_z4_2008_orange", 310000 * Desc],
			    ["cl3_z4_2008_gold", 310000 * Desc],
			    ["cl3_z4_2008_babyblue", 310000 * Desc],
			    ["cl3_z4_2008_babypink", 310000 * Desc],
			    ["cl3_z4_2008_sand", 310000 * Desc],
			    ["cl3_r8_spyder_flame", 710000 * Desc],
			    ["cl3_r8_spyder_flame1", 710000 * Desc],
			    ["cl3_r8_spyder_flame2", 7100000 * Desc],
			    ["cl3_r8_spyder_2tone1", 710000 * Desc],
			    ["cl3_r8_spyder_2tone2", 710000 * Desc],
			    ["cl3_r8_spyder_2tone3", 710000 * Desc],
			    ["cl3_r8_spyder_2tone4", 710000 * Desc],
			    ["cl3_r8_spyder_2tone5", 710000 * Desc],
			    ["cl3_r8_spyder_lime", 710000 * Desc],
			    ["cl3_r8_spyder_aqua", 710000 * Desc],
			    ["A3L_MonsterTruck", 910000 * Desc],
			    ["cl3_arielatom_race_aqua", 160000 * Desc],
			    ["cl3_arielatom_race_black", 160000 * Desc],
			    ["cl3_arielatom_race_blue", 160000 * Desc],
			    ["cl3_arielatom_race_camo", 160000 * Desc],
			    ["cl3_arielatom_race_camo_urban", 160000 * Desc],
			    ["cl3_arielatom_race_gold", 160000 * Desc],
			    ["cl3_arielatom_race_green", 160000 * Desc],
			    ["cl3_arielatom_race_lime", 160000 * Desc],
			    ["cl3_arielatom_race_red", 160000 * Desc],
			    ["cl3_arielatom_race_purple", 160000 * Desc],
			    ["cl3_arielatom_race_silver", 160000 * Desc],
			    ["cl3_arielatom_race_white", 160000 * Desc],
			    ["A3L_Atom", 310000 * Desc],
			    ["A3L_Flipcar", 310000 * Desc]
		];
	};
	case "kart_shop": {
		_return = [ 
				["A3L_Karts", 10000 * Desc],
			    ["C_Kart_01_Blu_F", 15000 * Desc],
			    ["C_Kart_01_Fuel_F", 15000 * Desc],
			    ["C_Kart_01_Red_F", 15000 * Desc],
			    ["C_Kart_01_Vrana_F", 15000 * Desc]
		];
	};
	case "taxista_shop": {
		_return = [ 
				["cl3_suv_taxi", 25000 * Desc]
		];
	};
	case "periodista_shop": {
		_return = [ 
				["cl3_transitNews", 10000 * Desc],
			    ["ivory_b206_news", 450000 * Desc]
		];
	};
	case "med_shop": {
		_return = [ 
				["ambulancia_f", 3000 * Desc],
			    ["IVORY_PRIUS", 1500 * Desc],
			    ["A3L_CVPILBFD", 1500 * Desc],
			    ["A3L_AmberLamps", 3000 * Desc],
			    ["Jonzie_Ambulance", 3000 * Desc],
			    ["A3L_Towtruck", 5000 * Desc],
			    ["A3L_Laddertruck", 4000 * Desc],
			    ["cl3_xr_1000_emt", 4000 * Desc]
		];
	};
	case "med_air_hs": {
		_return = [ 
				["ivory_b206_rescue", 45000 * Desc],
				["Orel_Heli_Light_Samu", 45000 * Desc],
			    ["IVORY_BELL512_RESCUE", 85000 * Desc],
			    ["C_Heli_Light_01_civil_F", 50000 * Desc],
			    ["O_Heli_Light_02_unarmed_F", 100000 * Desc],
			    ["O_Heli_Transport_04_medevac_F", 150000 * Desc]
		];
	};
	case "exo_car": {
		_return = [ 
			    ["A3L_Cooper_concept_black", 46000 * Desc],
			    ["A3L_AMC", 67000 * Desc],
			    ["A3L_VolvoS60RBlack", 67000 * Desc],
			    ["S_Skyline_Black", 81000 * Desc],
				["S_Vantage_Black", 160000 * Desc],
			    ["A3L_Ferrari458black", 568000 * Desc],
			    ["S_PorscheRS_Black", 568000 * Desc],
			    ["S_McLarenP1_Black", 1150000 * Desc],
			    ["cl3_458_2tone1", 460000 * Desc],
			    ["cl3_458_2tone2", 460000 * Desc],
			    ["cl3_458_2tone3", 460000 * Desc],
			    ["cl3_458_2tone4", 460000 * Desc],
			    ["cl3_458_2tone5", 460000 * Desc],
			    ["cl3_458_aqua", 460000 * Desc],
			    ["cl3_458_babyblue", 460000 * Desc],
			    ["cl3_458_babypink", 460000 * Desc],
			    ["cl3_458_blue", 460000 * Desc],
			    ["cl3_458_lime", 460000 * Desc],
			    ["cl3_458_orange", 460000 * Desc],
			    ["cl3_458_red", 460000 * Desc],
			    ["cl3_458_sand", 460000 * Desc],
			    ["cl3_458_silver", 460000 * Desc],
			    ["cl3_carrera_gt_aqua", 610000 * Desc],
			    ["cl3_carrera_gt_black", 610000 * Desc],
			    ["cl3_carrera_gt_lime", 610000 * Desc],
			    ["cl3_carrera_gt_orange", 610000 * Desc],
			    ["cl3_carrera_gt_red", 610000 * Desc],
			    ["cl3_carrera_gt_silver", 610000 * Desc],
			    ["cl3_dbs_volante_black", 1110000 * Desc],
			    ["cl3_dbs_volante_blue", 1110000 * Desc],
			    ["cl3_dbs_volante_red", 1110000 * Desc],
			    ["cl3_dbs_volante_white", 1110000 * Desc],
			    ["cl3_dbs_volante_silver", 1110000 * Desc],
			    ["cl3_dbs_volante_lime", 1110000 * Desc],
			    ["cl3_dbs_volante_flame", 1110000 * Desc],
			    ["cl3_dbs_volante_flame2", 1110000* Desc],
			    ["cl3_dbs_volante_orange", 1110000 * Desc],
			    ["cl3_dbs_volante_babypink", 1110000 * Desc],
			    ["cl3_dbs_volante_yellow", 1110000 * Desc],
			    ["cl3_dbs_volante_lavender", 1110000 * Desc],
			    ["cl3_dbs_volante_green", 1110000 * Desc],
			    ["cl3_dbs_volante_sand", 1110000 * Desc],
			    ["cl3_e60_m5_blue", 140000 * Desc],
			    ["cl3_e60_m5_camo", 140000 * Desc],
			    ["cl3_e60_m5_camo_urban", 140000 * Desc],
			    ["cl3_e60_m5_lime", 140000 * Desc],
			    ["cl3_e60_m5_babyblue", 140000 * Desc],
			    ["cl3_e60_m5_babypink", 140000 * Desc],
			    ["cl3_e60_m5_orange", 140000 * Desc],
			    ["cl3_e60_m5_purple", 140000 * Desc],
			    ["cl3_e63_amg_black", 180000 * Desc],
			    ["cl3_e63_amg_blue", 180000 * Desc],
			    ["cl3_e63_amg_red", 180000 * Desc],
			    ["cl3_e63_amg_silver", 180000 * Desc],
			    ["cl3_e63_amg_white", 180000 * Desc],
			    ["cl3_e63_amg_camo", 180000 * Desc],
			    ["cl3_e63_amg_camo_urban", 180000 * Desc],
			    ["cl3_e63_amg_lime", 180000 * Desc],
			    ["cl3_e63_amg_orange", 180000 * Desc],
			    ["cl3_e63_amg_purple", 180000 * Desc],
			    ["cl3_e63_amg_babypink", 180000 * Desc],
			    ["cl3_golf_learner_white", 14000 * Desc],
			    ["cl3_golf_mk2_black", 10000 * Desc],
			    ["cl3_golf_mk2_lime", 10000 * Desc],
			    ["cl3_golf_mk2_sand", 10000 * Desc],
			    ["cl3_golf_mk2_white", 10000 * Desc],
			    ["cl3_insignia_black", 200000 * Desc],
			    ["cl3_insignia_blue", 200000 * Desc],
			    ["cl3_insignia_silver", 200000 * Desc],
			    ["cl3_insignia_orange", 200000 * Desc],
			    ["cl3_insignia_camo", 200000 * Desc],
			    ["cl3_insignia_lime", 200000 * Desc],
			    ["cl3_insignia_babyblue", 200000 * Desc],
			    ["cl3_insignia_babypink", 200000 * Desc],
			    ["cl3_insignia_sand", 200000 * Desc],
			    ["cl3_insignia_white", 200000 * Desc],
			    ["cl3_polo_gti_black", 30000 * Desc],
			    ["cl3_polo_gti_blue", 30000 * Desc],
			    ["cl3_polo_gti_red", 30000 * Desc],
			    ["cl3_polo_gti_silver", 30000 * Desc],
			    ["cl3_polo_gti_white", 30000 * Desc],
			    ["cl3_polo_gti_camo", 30000 * Desc],
			    ["cl3_polo_gti_purple", 30000 * Desc],
			    ["cl3_q7_black", 161000 * Desc],
			    ["cl3_q7_blue", 161000 * Desc],
			    ["cl3_q7_red", 161000 * Desc],
			    ["cl3_q7_silver", 161000 * Desc],
			    ["cl3_q7_camo", 161000 * Desc],
			    ["cl3_q7_camo_urban", 161000 * Desc],
			    ["cl3_q7_green", 161000 * Desc],
			    ["cl3_q7_gold", 161000 * Desc],
			    ["cl3_q7_lime", 161000 * Desc],
			    ["cl3_q7_babyblue", 161000 * Desc],
			    ["cl3_q7_babypink", 161000 * Desc],
			    ["cl3_veyron_red_red", 1200000 * Desc]
		];
	};
	case "chev_car": {
		_return = [ 
			    ["A3L_SuburbanBlack", 190000 * Desc],
			    ["A3L_Camaro", 195000 * Desc]
		];
	};

	case "moto_chop": {
		_return = [ 
				["cl3_enduro_black ", 30000 * Desc],
			    ["cl3_enduro_blue", 30000 * Desc],
			    ["cl3_enduro_aqua", 30000 * Desc],
			    ["cl3_enduro_babypink", 30000 * Desc],
			    ["cl3_enduro_red", 30000 * Desc],
			    ["cl3_enduro_burgundy", 30000 * Desc],
			    ["cl3_enduro_cardinal", 30000 * Desc],
			    ["cl3_enduro_dark_green", 30000 * Desc],
			    ["cl3_enduro_gold", 30000 * Desc],
			    ["cl3_enduro_green", 30000 * Desc],
			    ["cl3_enduro_flame", 30000 * Desc],
			    ["cl3_enduro_flame1", 30000 * Desc],
			    ["cl3_enduro_flame2", 30000 * Desc],
			    ["cl3_chopper_gold", 40000 * Desc],
			    ["cl3_chopper_blue", 40000 * Desc],
			    ["cl3_chopper_green", 40000 * Desc],
			    ["cl3_chopper_red", 40000 * Desc],
			    ["cl3_chopper_silver", 40000 * Desc],
			    ["cl3_xr_1000_yellow", 35000 * Desc],
			    ["cl3_xr_1000_black", 35000 * Desc],
			    ["cl3_xr_1000_babypink", 35000 * Desc],
			    ["cl3_xr_1000_burgundy", 35000 * Desc],
			    ["cl3_xr_1000_red", 35000 * Desc],
			    ["cl3_xr_1000_cardinal", 35000 * Desc],
			    ["cl3_xr_1000_dark_green", 35000 * Desc],
			    ["cl3_xr_1000_gold", 35000 * Desc],
			    ["cl3_xr_1000_camo_urban", 35000 * Desc],
			    ["cl3_xr_1000_white", 35000 * Desc],
			    ["cl3_xr_1000_violet", 35000 * Desc],
			    ["cl3_xr_1000_flame", 35000 * Desc],
			    ["cl3_xr_1000_camo", 35000 * Desc],
			    ["cl3_xr_1000_flame1", 35000 * Desc],
			    ["cl3_xr_1000_flame2", 35000 * Desc],
			    ["cl3_xr_1000_silver", 35000 * Desc],
			    ["cl3_xr_1000_lime", 35000 * Desc]
		];
	};
	case "ford_car": {
		_return = [ 
				["A3L_CVWhite", 30000 * Desc],
			    ["A3L_CVBlack", 30000 * Desc],
			    ["A3L_CVGrey", 30000 * Desc],
			    ["A3L_CVRed", 30000 * Desc],
			    ["A3L_CVPink", 30000 * Desc],
			    ["A3L_CVBlue", 30000 * Desc],
			    ["A3L_Taurus", 35000 * Desc],
			    ["A3L_TaurusBlack", 35000 * Desc],
			    ["A3L_TaurusBlue", 35000 * Desc],
			    ["A3L_TaurusRed", 35000 * Desc],
			    ["A3L_TaurusWhite", 35000 * Desc]
		];
	};
	case "dodge_car": {
		_return = [ 
				["A3L_GrandCaravan", 32000 * Desc],
			    ["A3L_Challenger", 50000 * Desc],
			    ["cl3_dodge_charger_f_black", 60000 * Desc],
			    ["cl3_dodge_charger_f_blue", 60000 * Desc],
			    ["cl3_dodge_charger_f_lime", 60000 * Desc],
			    ["cl3_dodge_charger_f_red", 60000 * Desc],
			    ["cl3_dodge_charger_f_pink", 60000 * Desc],
			    ["cl3_dodge_charger_o_blue", 60000 * Desc],
			    ["cl3_dodge_charger_o_red", 60000 * Desc],
			    ["cl3_dodge_charger_o_lime", 60000 * Desc],
			    ["cl3_dodge_charger_o_pink", 60000 * Desc],
			    ["cl3_dodge_charger_s_black", 60000 * Desc],
			    ["cl3_dodge_charger_s_green", 60000 * Desc],
			    ["cl3_dodge_charger_s_red", 60000 * Desc],
			    ["cl3_dodge_charger_s_lime", 60000 * Desc],
			    ["cl3_dodge_charger_s_pink", 60000 * Desc],
			    ["cl3_dodge_chargerum_f_black", 60000 * Desc],
			    ["cl3_dodge_chargerum_f_red", 60000 * Desc],
			    ["cl3_dodge_chargerum_f_silver", 60000 * Desc],
			    ["cl3_dodge_chargerum_f_orange", 60000 * Desc],
			    ["cl3_dodge_chargerum_f_lime", 60000 * Desc],
			    ["cl3_dodge_chargerum_f_pink", 60000 * Desc],
			    ["cl3_dodge_chargerum_f_purple", 60000 * Desc],
			    ["cl3_dodge_chargerum_s_black", 60000 * Desc],
			    ["cl3_dodge_chargerum_s_red", 60000 * Desc],
			    ["cl3_dodge_chargerum_s_white", 60000 * Desc],
			    ["cl3_dodge_chargerum_s_green", 60000 * Desc],
			    ["cl3_dodge_chargerum_s_pink", 60000 * Desc],
			    ["A3L_ChallengerGreen", 50000 * Desc],
			    ["A3L_ChallengerRed", 50000 * Desc],
			    ["A3L_ChallengerWhite", 50000 * Desc],
			    ["A3L_ChallengerBlack", 50000 * Desc],
			    ["A3L_ChallengerBlue", 50000 * Desc],
			    ["A3L_ChargerBlue", 50000 * Desc],
			    ["A3L_ChargerBlack", 50000 * Desc],
			    ["A3L_ChargerRed", 50000 * Desc],
			    ["Jonzie_Viper", 1100000 * Desc]
		];
	};
	
	case "civ_car": {
		_return = [    
				["C_Hatchback_01_F", 15000 * Desc],
				  ["Jonzie_Mini_Cooper", 20000 * Desc],
				  ["Jonzie_Mini_Cooper_R_spec", 50000 * Desc],
				  ["cl3_volha_black", 30000 * Desc],
				  ["cl3_volha_grey", 30000 * Desc],
				  ["C_Hatchback_01_sport_F", 60500 * Desc],
				  ["C_SUV_01_F", 40500 * Desc],
				  ["C_Offroad_01_F", 10500 * Desc],
				  ["I_G_Van_01_transport_F", 30500 * Desc],
				  ["cl3_lada_red", 30000 * Desc],
				  ["cl3_lada_white", 30000 * Desc],
				  ["A3L_PuntoRed", 22000 * Desc],
				  ["A3L_PuntoBlack", 22000 * Desc],
				  ["A3L_PuntoWhite", 22000 * Desc],
				  ["A3L_PuntoGrey", 22000 * Desc],
				  ["A3L_RegalBlack", 22000 * Desc],
				  ["A3L_RegalBlue", 22000 * Desc],
				  ["A3L_RegalOrange", 22000 * Desc],
				  ["A3L_RegalRed", 22000 * Desc],
				  ["A3L_RegalWhite", 22000 * Desc],
				  ["cl3_defender_110_cammo", 30000 * Desc],
				  ["cl3_defender_110_red", 30000 * Desc],
				  ["cl3_defender_110_yellow", 30000 * Desc],
				  ["A3L_VolksWagenGolfGTired", 18000 * Desc],
				  ["A3L_VolksWagenGolfGTiblack", 18000 * Desc],
				  ["A3L_VolksWagenGolfGTiblue", 18000 * Desc],
				  ["A3L_VolksWagenGolfGTiwhite", 18000 * Desc],
				  ["S_Rangerover_Black", 50000 * Desc],
				  ["cl3_civic_vti_aqua", 40000 * Desc],
				  ["cl3_civic_vti_babypink", 40000 * Desc],
				  ["cl3_civic_vti_black", 40000 * Desc],
				  ["cl3_civic_vti_blue", 40000 * Desc],
				  ["cl3_civic_vti_camo", 40000 * Desc],
				  ["cl3_civic_vti_camo_urban", 40000 * Desc],
				  ["cl3_civic_vti_gold", 40000 * Desc],
				  ["cl3_civic_vti_green", 40000 * Desc],
				  ["cl3_civic_vti_grey", 40000 * Desc],
				  ["cl3_civic_vti_lime", 40000 * Desc],
				  ["cl3_civic_vti_orange", 40000 * Desc],
				  ["cl3_civic_vti_red", 40000 * Desc],
				  ["cl3_civic_vti_white", 40000 * Desc],
				  ["cl3_civic_vti_silver", 40000 * Desc],
				  ["cl3_civic_vti_yellow", 40000 * Desc],
				  ["cl3_transit_aqua", 50000 * Desc],
				  ["cl3_transit_black", 50000 * Desc],
				  ["cl3_transit_blue", 50000 * Desc],
				  ["cl3_transit_silver", 50000 * Desc],
				  ["cl3_transit_red", 50000 * Desc],
				  ["cl3_transit_camo", 50000 * Desc],
				  ["cl3_transit_babypink", 50000 * Desc],
				  ["cl3_transit_lime", 50000 * Desc],
				  ["cl3_transit_grey", 50000 * Desc],
				  ["A3L_RX7_Black", 60000 * Desc],
				  ["A3L_RX7_Blue", 60000 * Desc],
				  ["A3L_RX7_Red", 60000 * Desc]
		];
	};
	case "skate_shop": {
		_return = [       
				["Skateboard_boobs", 500 * Desc],
				  ["Skateboard_colorful", 500 * Desc],
				  ["Skateboard", 500 * Desc],
				  ["Skateboard_skull", 500 * Desc]
		];
		
	};
	case "tienda_trasporte": {
		_return = [
				["I_Truck_02_transport_F", 80000 * Desc],
				["B_Truck_01_transport_F", 290000 * Desc],
				["cl3_mackr_flat_forest_camo", 630000 * Desc],
				["cl3_mackr_flat_brown_camo",630000 * Desc],
				["cl3_mackr_flat_black_white", 630000 * Desc],
				["cl3_mackr_flat_american", 630000 * Desc]
		];
	};
	case "civ_truck": {
		_return = [       
					["A3L_F350Black", 45000],
				  ["B_G_Offroad_01_repair_F", 80000 * Desc],
				  ["A3L_Dumptruck", 150000 * Desc],
				  ["C_Van_01_box_F", 150000 * Desc],
				  ["C_Van_01_transport_F", 80000 * Desc],
				  ["A3L_Bus", 75000 * Desc],
				  ["B_Truck_01_box_F", 670000 * Desc],
				  ["A3L_SchoolBus", 85000 * Desc],
				  ["CL3_Van_01_box_F_GreenCamo", 30000 * Desc],
				  ["CL3_Van_01_box_F_red", 30000 * Desc],
				  ["CL3_Van_01_box_F_white", 30000 * Desc],
				  ["CL3_Van_01_transport_F_GreenCamo", 30000 * Desc],
				  ["CL3_Van_01_transport_F_red", 30000 * Desc],
				  ["CL3_Van_01_transport_F_white", 30000 * Desc],
				  ["A3L_Hyster60", 30000 * Desc],
				  ["CL3_bus_cl_black", 200000 * Desc],
				  ["CL3_bus_cl_blue", 200000 * Desc],
				  ["CL3_bus_cl_grey", 200000 * Desc],
				  ["CL3_bus_cl_purple", 200000 * Desc],
				  ["CL3_bus_cl_yellow", 200000 * Desc],
				  ["cl3_mackr_del_forest_camo", 900000 * Desc],
				  ["cl3_mackr_del_brown_camo", 900000 * Desc],
				  ["cl3_mackr_del_black_white", 900000 * Desc],
				  ["cl3_mackr_del_american", 900000 * Desc],
				  ["I_Truck_02_covered_F", 500000 * Desc],
				  ["O_Truck_03_transport_F", 400000 * Desc],
				  ["O_Truck_03_covered_F", 550000 * Desc],
				  ["O_Truck_03_device_F", 950000 * Desc],
				  ["Jonzie_Forklift", 50500 * Desc]
		];
	};
	case "reb_car": {
		_return = [  
			      ["B_Quadbike_01_F", 2500 * Desc],
				  ["B_G_Offroad_01_F", 15000 * Desc],
				  ["max_H3_urbancamo", 100000 * Desc],
				  ["max_H3_vegeta", 100000 * Desc],
				  ["HMMWV", 300000 * Desc],
				  ["O_Truck_02_box_F", 1000000 * Desc],
				  ["DAR_LHS_16", 375000 * Desc],
				  ["B_Heli_Light_01_F", 300000 * Desc],
				  ["O_Heli_Light_02_unarmed_F", 750000 * Desc]
		];

		if (license_civ_rebel) then
			{};
	};
	case "cop_car": {
		_return = [ 
		        ["tcg_hrlycop", 10 * Desc],
			    ["cl3_xr_1000_police", 2010 * Desc],
			    ["cl3_enduro_police", 2010 * Desc],
			    ["IVORY_PRIUS", 15000 * Desc],
			    ["A3L_GrandCaravanUC", 25000 * Desc],
			    ["A3L_GrandCaravanUCBlack", 25000 * Desc],
			    ["A3L_TaurusFPBLBPD", 25000 * Desc],
			    ["A3L_TaurusFPBLBCSO", 25000 * Desc],
			    ["A3L_TaurusFPBPD", 25000 * Desc],
			    ["A3L_TaurusFPBPDGM", 25000 * Desc],
			    ["A3L_TaurusFPBCSO", 25000 * Desc],
			    ["A3L_TaurusUCGrey", 25000 * Desc],
			    ["A3L_TaurusUCWhite", 25000 * Desc],
			    ["A3L_TaurusUCBlue", 25000 * Desc],
			    ["A3L_TaurusUCRed", 25000 * Desc],
			    ["A3L_CVPIUC", 50000 * Desc],
			    ["A3L_CVPIUCBlack", 50000 * Desc],
			    ["A3L_CVPIUCWhite", 50000 * Desc],
			    ["A3L_CVPIUCRed", 50000 * Desc],
			    ["A3L_CVPIUCBlue", 50000 * Desc],
			    ["A3L_CVPIFPBPD", 45000 * Desc],
			    ["A3L_CVPIFPBCSO", 45000 * Desc],
			    ["A3L_CVPIFPBFG", 45000 * Desc],
			    ["A3L_CVPIFPBLBPD", 45000 * Desc],
			    ["A3L_CVPIFPBLBCSO", 45000 * Desc],
			    ["A3L_CVPIFPBLBFG", 45000 * Desc],
			    ["A3L_jailBus", 50000 * Desc],
			    ["A3L_ChargerUC", 60000 * Desc],
			    ["A3L_ChargerUCWhite", 60000 * Desc],
			    ["A3L_EvoXFPBLBPD", 60000 * Desc],
			    ["A3L_EvoXFPBLBSO", 60000 * Desc],
			    ["A3L_EvoXBlack", 60000 * Desc],
				["IVORY_REV", 67000 * Desc],
			    ["Hummer_H2_Swat_base", 67000 * Desc],
			    ["B_MRAP_01_F", 50000 * Desc]
		];
	};
	case "civ_air": {
		_return = [       
				  ["B_Heli_Light_01_F", 700000 * Desc],
				  ["ivory_b206", 800000 * Desc],
				  ["ASL_AS350_1", 800000 * Desc],
				  ["ARMSCor_A109_Civ", 950000 * Desc],
				  ["O_Heli_Light_02_unarmed_F", 850000 * Desc]
		];
	};
	case "cop_air": {
		_return = [      
				  ["policia_helicopter", 45000 * Desc],
				  ["ARMSCor_A109LUH_B", 45000 * Desc],
				  ["ivory_b206_police", 45000 * Desc],
				  ["ec135_policia_f", 45000 * Desc],
				  ["B_Heli_Light_01_F", 45000 * Desc],
				  ["IVORY_BELL512_POLICE", 45000 * Desc],
				  ["C_Heli_Light_01_civil_F", 45000 * Desc],
				  ["B_Heli_Transport_01_F", 200000 * Desc]
		];
	};
	case "cop_airhq": {
		_return = [       
				  ["policia_helicopter", 45000 * Desc],
				  ["ARMSCor_A109LUH_B", 45000 * Desc],
				  ["ivory_b206_police", 45000 * Desc],
				  ["ec135_policia_f", 45000 * Desc],
				  ["B_Heli_Light_01_F", 45000 * Desc],
				  ["IVORY_BELL512_POLICE", 45000 * Desc],
				  ["C_Heli_Light_01_civil_F", 45000 * Desc],
				  ["B_Heli_Transport_01_F", 200000 * Desc]
		];
	};
	case "civ_ship": {
		_return = [      
					["C_Rubberboat", 10000 * Desc],
					["C_Boat_Civil_01_F", 22000 * Desc],
					["CL3_Basic_Fishing_blue", 7000 * Desc],
					["CL3_Basic_Fishing_green", 7000 * Desc],
					["CL3_Basic_Fishing_grey", 7000 * Desc],
					["CL3_Basic_Fishing_red", 7000 * Desc],
					["CL3_Basic_Fishing_yellow", 7000 * Desc]
		];
	};
	case "cop_ship": {
		_return = [       
		          ["B_Boat_Transport_01_F", 3000 * Desc],
				  ["C_Boat_Civil_01_police_F", 20000 * Desc],
				  ["B_SDV_01_F", 100000 * Desc]
		 ];
	};
};

_return;