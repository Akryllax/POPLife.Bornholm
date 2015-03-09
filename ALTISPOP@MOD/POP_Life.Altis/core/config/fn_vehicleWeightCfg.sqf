/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Offroad_01_F": {65};
	case "B_G_Offroad_01_F": {65};
	case "B_Quadbike_01_F": {25};
	case "I_Truck_02_covered_F": {250};
	case "I_Truck_02_transport_F": {200};
	case "O_Truck_02_covered_F": {280};
	case "O_Truck_02_transport_F": {220};
	case "O_Truck_02_fuel_F": {350};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {45};
	case "C_SUV_01_F": {50};
	case "C_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100};
	case "I_G_Van_01_fuel_F": {180};
	case "C_Van_01_box_F": {150};
	case "C_Boat_Civil_01_F": {180};
	case "C_Boat_Civil_01_police_F": {90};
	case "B_Truck_01_transport_F": {420};
	case "B_Truck_01_box_F": {500};
	case "B_Truck_01_medical_F": {800};
	case "O_Truck_02_medical_F": {470};
	case "O_Truck_03_medical_F": {725};
	case "B_Truck_01_fuel_F": {650};
	case "B_MRAP_01_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {58};
	case "B_Heli_Light_01_F": {30};
	case "O_Heli_Light_02_unarmed_F": {80};
	case "I_Heli_Transport_02_F": {120};
	case "C_Rubberboat": {90};
	case "O_Boat_Transport_01_F": {90};
	case "I_Boat_Transport_01_F": {90};
	case "O_Boat_Armed_01_hmg_F": {250};
	case "B_Boat_Armed_01_minigun_F": {250};
	case "I_Boat_Armed_01_minigun_F": {250};
	case "B_G_Boat_Transport_01_F": {90};
	case "B_Boat_Transport_01_F": {90};
	case "O_Truck_03_transport_F": {380};
	case "O_Truck_03_covered_F": {450};
	case "O_Truck_03_device_F": {320};
	case "O_Truck_03_fuel_F": {600};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	case "DAR_ChargerCiv": {58};
	case "DAR_TahoeCiv": {58};
	case "DAR_TahoeCivBlack": {58};
	case "DAR_TahoeCivBlue": {58};
	case "DAR_TahoeCivRed": {58};
	case "DAR_TahoeCivSilver": {58};
	case "DAR_FusionCivBlack": {58};
	case "DAR_FusionCivBlue": {58};
	case "DAR_FusionCivRed": {58};
	case "DAR_FusionCiv": {58};
	case "DAR_TaurusCivBlack": {58};
	case "DAR_TaurusCivBlue": {58};
	case "DAR_TaurusCiv": {58};
	case "DAR_ImpalaCivA": {58};
	case "DAR_ImpalaCivC": {58};
	case "DAR_ImpalaCivB": {58};
	case "DAR_ImpalaCivD": {58};
	case "DAR_ImpalaCiv": {58};
	case "DAR_ImpalaCivG": {58};
	case "DAR_ImpalaCivF": {58};
	case "DAR_ImpalaCivE": {58};
	case "exxpensive_mini_cooper_base": {58};
	case "exxpensive_volvo_242_base": {58};
	case "exxpensive_chevrolet_caprice_base": {58};
	case "exxpensive_2cv_base": {58};
	case "exxpensive_cadillac_sedan_base": {58};
	case "exxpensive_jaguar_base": {58};
	case "exxpensive_ferrari_458_base": {58};
	case "exxpensive_ford_raptor_base": {58};
	case "exxpensive_aventador_base": {58};
	case "exxpensive_BMWM3E46_base": {58};
	case "exxpensive_mercedes_sls_base": {58};
	case "exxpensive_audi_R8_base": {58};
	case "exxpensive_bugatti_base": {58};
	case "exxpensive_m5_e34_base": {58};
	case "TDR_Explorer_GC": {58};
	case "TDR_Tahoe_K": {58};
	case "TDR_BlindadoGEO": {58};
	case "TDR_Explorer_K": {58};
	case "TDR_Taurus_CNP_ST": {58};
	case "dezkit_b206_news": {58};
	case "dezkit_b206_ls": {58};
	case "dezkit_b206x_unarmed": {58};
	case "ec135_policia_f": {58};
	case "BAF_Jackal2_GMG_W": {58};
	case "BAF_Jackal2_GMG_D": {58};
	case "BAF_Offroad_W": {58};
	case "BAF_Offroad_D": {58};
	case "ambulancia_f": {58};
	case "dezkit_b206_ems": {58};
	
	
	default {-1};
};