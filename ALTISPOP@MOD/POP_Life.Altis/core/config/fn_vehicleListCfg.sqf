#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000 * Desc],
			["C_Kart_01_Fuel_F",15000 * Desc],
			["C_Kart_01_Red_F",15000 * Desc],
			["C_Kart_01_Vrana_F",15000 * Desc]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",10000 * Desc],
			["C_SUV_01_F",15000 * Desc],
			["ambulancia_f",1000 * Desc]
		];
	};

	case "med_air_hs": {
		_return = [
			["B_Heli_Light_01_F",50000 * Desc],
			["dezkit_b206_ems",50000 * Desc]
		];
	};

	case "civ_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500 * Desc],
			["C_Hatchback_01_F",9500 * Desc],
			["C_Offroad_01_F",12500 * Desc],
			["C_SUV_01_F",35000 * Desc],
			["C_Van_01_transport_F",40000 * Desc],
			["C_Hatchback_01_sport_F",60000 * Desc],
			["DAR_TahoeCiv",99999 * Desc],
			["DAR_FusionCiv",70000 * Desc],
			["DAR_TaurusCiv",85000 * Desc],
			["DAR_ImpalaCivA",60000 * Desc],
			["cl3_civic_vti_black", 67000 * Desc],
			["cl3_polo_gti_black", 70000 * Desc],
			["cl3_insignia_black",70000 * Desc],
			["cl3_range_rover_black", 70000 * Desc],
			["Orel_Monster",1070000 * Desc],
			["cl3_e63_amg_black", 1170000 * Desc],
			["cl3_dodge_charger_s_black", 2070000 * Desc],
			["cl3_z4_2008_black",700000 * Desc]

		];

			if(__GETC__(life_donator) == 1) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Hatchback_01_F",9500 * Desc];
			_return pushBack ["C_Offroad_01_F",12500 * Desc];
			_return pushBack ["C_SUV_01_F",35000 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["DAR_TahoeCiv",99999 * Desc];
			_return pushBack ["DAR_TaurusCiv",85000 * Desc];
			_return pushBack ["DAR_ImpalaCivA",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
		};
			if(__GETC__(life_donator) == 2) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Hatchback_01_F",9500 * Desc];
			_return pushBack ["C_Offroad_01_F",12500 * Desc];
			_return pushBack ["C_SUV_01_F",35000 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["DAR_TahoeCiv",99999 * Desc];
			_return pushBack ["DAR_FusionCiv",70000 * Desc];
			_return pushBack ["DAR_TaurusCiv",85000 * Desc];
			_return pushBack ["DAR_ImpalaCivA",60000 * Desc];
			_return pushBack ["DAR_ImpalaCivC",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
			_return pushBack ["cl3_dbs_volante_black", 3700000 * Desc];
		};
			if(__GETC__(life_donator) == 3) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Hatchback_01_F",9500 * Desc];
			_return pushBack ["C_Offroad_01_F",12500 * Desc];
			_return pushBack ["C_SUV_01_F",35000 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["DAR_TahoeCiv",99999 * Desc];
			_return pushBack ["DAR_FusionCiv",70000 * Desc];
			_return pushBack ["DAR_TaurusCiv",85000 * Desc];
			_return pushBack ["DAR_ImpalaCivA",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
			_return pushBack ["cl3_dbs_volante_black",3700000 * Desc];
			_return pushBack ["cl3_r8_spyder_black",2070000 * Desc];
		};
			if(__GETC__(life_donator) == 4) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Hatchback_01_F",9500 * Desc];
			_return pushBack ["C_Offroad_01_F",12500 * Desc];
			_return pushBack ["C_SUV_01_F",35000 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["DAR_TahoeCiv",99999 * Desc];
			_return pushBack ["DAR_FusionCiv",70000 * Desc];
			_return pushBack ["DAR_TaurusCiv",85000 * Desc];
			_return pushBack ["DAR_ImpalaCivA",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
			_return pushBack ["cl3_dbs_volante_black",3700000 * Desc];
			_return pushBack ["cl3_r8_spyder_black",2070000 * Desc];
			_return pushBack ["cl3_murcielago_black",2070000 * Desc];
			_return pushBack ["cl3_reventon_black",4170000 * Desc];
		};
	};

	case "civ_truck":
	{
		_return =
		[
			["A3L_Bus",750000 * Desc],
			["C_Van_01_box_F",60000 * Desc],
			["I_Truck_02_transport_F",75000 * Desc],
			["I_Truck_02_covered_F",200000 * Desc],
			["B_Truck_01_transport_F",900000 * Desc],
			["O_Truck_03_transport_F",200000 * Desc],
			["O_Truck_03_covered_F",250000 * Desc],
			["B_Truck_01_box_F",1200000 * Desc],
			["O_Truck_03_device_F",1500000 * Desc]
		];
		if(license_civ_rebel) then {
			_return pushBack ["A3L_Bus",750000 * Desc];
			_return pushBack ["O_Truck_02_transport_F",150000 * Desc];
			_return pushBack ["O_Truck_02_covered_F",225000 * Desc];
			_return pushBack ["O_Truck_03_transport_F",800000 * Desc];
		    _return pushBack ["O_Truck_03_covered_F",1000000 * Desc];
			_return pushBack ["O_Truck_03_fuel_F",800000 * Desc];
			_return pushBack ["O_Truck_03_device_F",1500000 * Desc];
		};
	};


	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500 * Desc],
			["B_G_Offroad_01_F",25000 * Desc],
			["O_MRAP_02_F",2900000 * Desc],
			["BAF_Jackal2_GMG_W",2900000 * Desc],
			["BAF_Jackal2_GMG_D",2900000 * Desc],
			["BAF_Offroad_W",290000 * Desc],
			["BAF_Offroad_D",290000 * Desc],
			["DAR_MK23",290000 * Desc],
			["DAR_LHS_16",290000 * Desc],
			["DAR_4X4",290000 * Desc],
			["DAR_MK27T",290000 * Desc],
			["DAR_MK23",290000 * Desc],
			["B_Heli_Light_01_F",450000 * Desc]
		];

		if(license_civ_rebel) then
		{
			_return pushBack ["O_MRAP_02_hmg_F",6900000 * Desc];
			_return pushBack ["B_G_Offroad_01_armed_F",1200000 * Desc];
		};
	};

	case "cop_car":
	{
		_return pushBack ["B_Quadbike_01_F",1000 * Desc];
		_return pushBack ["C_Hatchback_01_sport_F",50000 * Desc];
		_return pushBack ["C_Offroad_01_F",25000 * Desc];
		_return pushBack ["C_SUV_01_F",35000 * Desc];

		if(__GETC__(life_coplevel) >= 6) then
			{
		_return pushBack ["B_MRAP_01_F",30000 * Desc];
		};

		if(__GETC__(life_coplevel) >= 7) then
			{
		_return pushBack ["B_MRAP_01_hmg_F",30000 * Desc];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["TDR_Explorer_GC",30000 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["TDR_Tahoe_K",50000 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["TDR_BlindadoGEO",50000 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["TDR_Explorer_K",50000 * Desc];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["TDR_Taurus_CNP_ST",30000* Desc];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return pushBack ["Orel_Dingo",60000 * Desc];
		};
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",400000 * Desc],
			["dezkit_b206x_unarmed",400000 * Desc],
			["dezkit_b206_news",400000 * Desc],
			["dezkit_b206_ls",400000 * Desc],
			["dezkit_b206x_unarmed",400000 * Desc],
			["C_Heli_Light_01_civil_F", 550000 * Desc],
			["O_Heli_Light_02_unarmed_F",1250000 * Desc],
			["I_Heli_Transport_02_F",2450000 * Desc],
			["O_Heli_Transport_04_F",2550000 * Desc],
			["O_Heli_Transport_04_bench_F", 2600000 * Desc],
			["O_Heli_Transport_04_covered_F", 2700000 * Desc],
			["B_Heli_Transport_03_F", 2800000 * Desc],
			["B_Heli_Attack_01_F", 5250000 * Desc],
			["O_Heli_Attack_02_F", 5450000 * Desc]
		];
	};

	case "cop_air":
	{
			_return pushBack ["B_Heli_Light_01_F",130000 * Desc];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["B_Heli_Transport_01_F",170000 * Desc];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",250000 * Desc];
			_return pushBack ["O_Heli_Transport_04_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_box_F", 350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_covered_F", 350000 * Desc];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",350000 * Desc];
			_return pushBack ["B_Heli_Transport_03_F", 350000 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["ec135_policia_f", 50000 * Desc];
		};
	};

	case "cop_airhq":
	{
			_return pushBack ["B_Heli_Light_01_F",130000 * Desc];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["B_Heli_Transport_01_F",170000 * Desc];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",250000 * Desc];
			_return pushBack ["O_Heli_Transport_04_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_box_F", 350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_covered_F", 350000 * Desc];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",350000 * Desc];
			_return pushBack ["B_Heli_Transport_03_F", 350000 * Desc];
		};
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000 * Desc],
			["C_Boat_Civil_01_F",22000 * Desc]
		];
		if(license_civ_rebel) then {
		_return pushBack ["O_Boat_Transport_01_F",12000 * Desc];
		_return pushBack ["B_Boat_Armed_01_minigun_F",200000 * Desc];
		_return pushBack ["O_SDV_01_F",250000 * Desc];
		};
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000 * Desc],
			["C_Boat_Civil_01_police_F",20000 * Desc],
			["B_Boat_Armed_01_minigun_F",75000 * Desc],
			["B_SDV_01_F",100000 * Desc]
		];
	};

	case "merc_c":
	{
        if(__GETC__(life_merclevel) == 1) then {
		_return pushBack	["I_Quadbike_01_F",1000 * Desc];
		_return pushBack	["I_G_Offroad_01_F",9000 * Desc];
		_return pushBack	["I_G_Offroad_01_armed_F",450000 * Desc];
		_return pushBack	["C_Hatchback_01_sport_F",9000 * Desc];
		_return pushBack	["ffaa_et_vamtac_ume",39000 * Desc];
		_return pushBack	["ffaa_et_anibal",39000 * Desc];
        };
        if(__GETC__(life_merclevel) == 2) then {
		_return pushBack	["I_MRAP_03_F",1200000 * Desc];
		_return pushBack	["I_MRAP_03_hmg_F",2500000 * Desc];
		_return pushBack	["ffaa_et_rg31_samson",2500000 * Desc];
		_return pushBack	["ffaa_et_vamtac_ume",39000 * Desc];
		_return pushBack	["ffaa_et_anibal",39000 * Desc];
		_return pushBack	["I_Quadbike_01_F",1000 * Desc];
		_return pushBack	["I_G_Offroad_01_F",9000 * Desc];
		_return pushBack	["I_G_Offroad_01_armed_F",450000 * Desc];
		_return pushBack	["C_Hatchback_01_sport_F",9000 * Desc];
        };
    };

    case "merc_a":
	{
        if(__GETC__(life_merclevel) >= 1) then {
		_return pushBack	["B_Heli_Light_01_F",300000 * Desc];
		_return pushBack	["O_Heli_Light_02_unarmed_F",450000 * Desc];
		_return pushBack	["I_Heli_light_03_unarmed_F",550000 * Desc];
        };
        if(__GETC__(life_merclevel) >= 3) then {
        _return pushBack    ["B_Heli_Light_01_armed_F", 3500000 * Desc];
        _return pushBack	["B_Heli_Light_01_F",300000 * Desc];
		_return pushBack	["O_Heli_Light_02_unarmed_F",450000 * Desc];
		_return pushBack	["I_Heli_light_03_unarmed_F",550000 * Desc];
        };
    };

	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",400000 * Desc],
			["C_Heli_Light_01_civil_F", 550000 * Desc],
			["O_Heli_Light_02_unarmed_F",1250000 * Desc],
			["I_Heli_Transport_02_F",2450000 * Desc],
			["O_Heli_Transport_04_F",2550000 * Desc],
			["O_Heli_Transport_04_bench_F", 2600000 * Desc],
			["O_Heli_Transport_04_covered_F", 2700000 * Desc],
			["B_Heli_Transport_03_F", 2800000 * Desc],
			["B_Heli_Attack_01_F", 5250000 * Desc],
			["O_Heli_Attack_02_F", 5450000 * Desc]
		];
	};
};

_return;
