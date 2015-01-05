#include <macro.h>
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
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",10000],
			["C_SUV_01_F",15000]
		];
	};

	case "med_air_hs": {
		_return = [
			["I_Heli_light_03_unarmed_F",150000],
			["O_Heli_Transport_04_medevac_F", 250000]
		];
	};

	case "civ_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Offroad_01_F",22000],
			["C_Hatchback_01_F",30000],
			["C_SUV_01_F",45000],
			["C_Hatchback_01_sport_F",65000]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_transport_F",40000],
			["I_G_Van_01_fuel_F",50000],
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",125000],
			["I_Truck_02_covered_F",200000],
			["O_Truck_02_fuel_F",250000],
			["B_Truck_01_transport_F",900000],
			["B_Truck_01_box_F",1200000],
			["B_Truck_01_fuel_F",900000]
		];


		if(license_civ_rebel) then
		{
			_return pushBack
			["O_Truck_02_transport_F",150000];

		};
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_Truck_02_covered_F",225000];

		};
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_Truck_03_transport_F",800000];

		};
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_Truck_03_covered_F",1000000];

		};
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_Truck_03_fuel_F",800000];

		};
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_Truck_03_device_F",1500000];

		};

	};

		case "civ_noob_truck":
	{
		_return =
		[
			["C_Van_01_transport_F",40000],
			["I_G_Van_01_fuel_F",50000],
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",125000],
			["I_Truck_02_covered_F",200000],
			["O_Truck_02_fuel_F",250000]
		];

	};

	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["I_G_Van_01_fuel_F",50000]
		];
		if(license_civ_rebel) then
		{
			_return pushBack ["O_MRAP_02_F",2900000];
			_return pushBack ["B_G_Offroad_01_armed_F",1200000];
			_return pushBack ["O_MRAP_02_hmg_F",5000000];
		};
	};

	case "cop_car":
	{
			_return pushBack ["B_Quadbike_01_F",1000];
			_return pushBack ["C_Hatchback_01_sport_F",6000];
			_return pushBack ["C_Offroad_01_F",5000];
		if(__GETC__(life_coplevel) >= 3) then {
			_return pushBack ["C_SUV_01_F",9000];
		};
		if(__GETC__(life_coplevel) >= 7) then {
            _return pushBack ["B_MRAP_01_F",30000];
		};
		if(__GETC__(life_coplevel) >= 8) then {
			_return pushBack ["I_MRAP_03_hmg_F",30000];
		};
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",400000],
			["C_Heli_Light_01_civil_F", 550000],
			["O_Heli_Light_02_unarmed_F",1250000],
			["I_Heli_Transport_02_F",2450000]
		];
	};

	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",400000],
			["C_Heli_Light_01_civil_F", 550000],
			["O_Heli_Light_02_unarmed_F",1250000],
			["I_Heli_Transport_02_F",2450000],
			["O_Heli_Transport_04_F",2550000],
			["O_Heli_Transport_04_bench_F", 2600000],
			["O_Heli_Transport_04_covered_F", 2700000],
			["B_Heli_Transport_03_F", 2800000],
			["B_Heli_Attack_01_F", 5250000],
			["O_Heli_Attack_02_F", 5450000]
		];
	};

	case "cop_air":
	{

			_return pushBack ["B_Heli_Light_01_F",100000];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",1000];
			_return pushBack ["B_Heli_Transport_03_unarmed_F", 1000];
			_return pushBack ["O_Heli_Transport_04_F", 1000];
			_return pushBack ["O_Heli_Transport_04_bench_F", 1000];
			_return pushBack ["O_Heli_Transport_04_box_F", 1000];
			_return pushBack ["O_Heli_Transport_04_covered_F", 1000];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",1000];
			_return pushBack ["B_Heli_Transport_03_F", 1000];
		};
	};

	case "cop_airhq":
	{
			_return pushBack
		["B_Heli_Light_01_F",100000];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",1000];
			_return pushBack ["B_Heli_Transport_03_unarmed_F", 10000];
			_return pushBack ["O_Heli_Transport_04_F", 1000];
			_return pushBack ["O_Heli_Transport_04_bench_F", 1000];
			_return pushBack ["O_Heli_Transport_04_box_F", 1000];
			_return pushBack ["O_Heli_Transport_04_covered_F", 1000];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",10];
			_return pushBack ["B_Heli_Transport_03_F", 10];
		};
	};


	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",10000],
			["C_Boat_Civil_01_F",22000]

		];
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_Boat_Transport_01_F",12000];
		};
		if(license_civ_rebel) then
		{
			_return pushBack
			["B_Boat_Armed_01_minigun_F",200000];
		};
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_SDV_01_F",250000];
		};
	};

	case "cop_ship":
	{
		_return =
		[
			["B_G_Boat_Transport_01_F",1000],
			["C_Boat_Civil_01_police_F",1000],
			["B_Boat_Armed_01_minigun_F",1000],
			["B_SDV_01_F",50000]
		];
	};

	case "mer_car_shop":
	{
		_return = [
			["I_Quadbike_01_F",1000],
			["I_G_Offroad_01_F",9000],
			["I_G_Offroad_01_armed_F",450000],
			["C_Hatchback_01_sport_F",9000],
			["I_MRAP_03_F",1200000],
			["I_MRAP_03_hmg_F",2500000]
		];
	};

	case "mer_air_shop":
	{
		_return = [
			["B_Heli_Light_01_F",300000],
			["O_Heli_Light_02_unarmed_F",450000],
			["I_Heli_light_03_unarmed_F",550000]
		];

		if(__GETC__(life_merlevel) > 3) then
		{
			_return pushBack ["B_Heli_Light_01_armed_F", 3500000];
		};
	};
	case "mer_ship":
	{
		_return =
		[
			["I_Boat_Transport_01_F",8000],
			["C_Boat_Civil_01_F",22000],
			["B_Boat_Armed_01_minigun_F",100000],
			["I_SDV_01_F",100000]
		];
	};
	case "civ_plane":
	{
		_return =
		[
			["B_Plane_CAS_01_F",8000000],
			["I_Plane_Fighter_03_CAS_F",8500000],
			["O_Plane_CAS_02_F",9200000]
		];
	};

	case "donor_car":
	{
		if(__GETC__(life_donator) < 1) exitWith
		{
			hint "Tienes que ser donador para usar esta tienda.";
			[]
		};
		if(__GETC__(life_donator) == 1) then
		{
			_return pushBack ["B_Quadbike_01_F",2125];
			_return pushBack ["C_Offroad_01_F",18700];
			_return pushBack ["C_Hatchback_01_F",25500];
			_return pushBack ["C_SUV_01_F",38250];
			_return pushBack ["C_Hatchback_01_sport_F",55250];
		};
		if(__GETC__(life_donator) == 2) then
		{
			_return pushBack ["B_Quadbike_01_F",2000];
			_return pushBack ["C_Offroad_01_F",17600];
			_return pushBack ["C_Hatchback_01_F",24000];
			_return pushBack ["C_SUV_01_F",36000];
			_return pushBack ["C_Hatchback_01_sport_F",52000];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_return pushBack ["B_Quadbike_01_F",1750];
			_return pushBack ["C_Offroad_01_F",15400];
			_return pushBack ["C_Hatchback_01_F",21000];
			_return pushBack ["C_SUV_01_F",31500];
			_return pushBack ["C_Hatchback_01_sport_F",45500];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_return pushBack ["B_Quadbike_01_F",1250];
			_return pushBack ["C_Offroad_01_F",11000];
			_return pushBack ["C_Hatchback_01_F",15000];
			_return pushBack ["C_SUV_01_F",22500];
			_return pushBack ["C_Hatchback_01_sport_F",32500];
		};
	};

	case "donor_air":
	{

		if(__GETC__(life_donator) < 1) exitWith
		{
			hint "Tienes que ser donador para usar esta tienda.";
			[]
		};
		if(__GETC__(life_donator) == 1) then
		{
			_return =
			[
				["B_Heli_Light_01_F",340000],
				["C_Heli_Light_01_civil_F", 467500],
				["O_Heli_Light_02_unarmed_F",1062500],
				["I_Heli_Transport_02_F",2082500]
			];
		};
		if(__GETC__(life_donator) == 2) then
		{
			_return =
			[
				["B_Heli_Light_01_F",320000],
				["C_Heli_Light_01_civil_F", 440000],
				["O_Heli_Light_02_unarmed_F",1000000],
				["I_Heli_Transport_02_F",1960000]
			];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_return =
			[
				["B_Heli_Light_01_F",280000],
				["C_Heli_Light_01_civil_F", 385000],
				["O_Heli_Light_02_unarmed_F",875000],
				["I_Heli_Transport_02_F",1715000]
			];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_return =
			[
				["B_Heli_Light_01_F",200000],
				["C_Heli_Light_01_civil_F", 275000],
				["O_Heli_Light_02_unarmed_F",625000],
				["I_Heli_Transport_02_F",1225000]
			];
		};
	};

	case "donor_reb_car":
	{
		if(__GETC__(life_donator) < 1) exitWith
		{
			hint "Tienes que ser donador para usar esta tienda.";
			[]
		};
		if(__GETC__(life_donator) == 1) then
		{
			_return =
			[
				["B_Quadbike_01_F",2125],
				["B_G_Offroad_01_F",12750],
				["I_G_Van_01_fuel_F",42500]
			];
			if(license_civ_rebel) then
			{
				_return pushBack ["O_MRAP_02_F",2465000];
				_return pushBack ["B_G_Offroad_01_armed_F",1020000];
				_return pushBack ["O_MRAP_02_hmg_F",4250000];
			};
		};
		if(__GETC__(life_donator) == 2) then
		{
			_return =
			[
				["B_Quadbike_01_F",2000],
				["B_G_Offroad_01_F",12000],
				["I_G_Van_01_fuel_F",42500]
			];
			if(license_civ_rebel) then
			{
				_return pushBack ["O_MRAP_02_F",2320000];
				_return pushBack ["B_G_Offroad_01_armed_F",960000];
				_return pushBack ["O_MRAP_02_hmg_F",4000000];
			};
		};
		if(__GETC__(life_donator) == 3) then
		{
			_return =
			[
				["B_Quadbike_01_F",1750],
				["B_G_Offroad_01_F",10500],
				["I_G_Van_01_fuel_F",35000]
			];
			if(license_civ_rebel) then
			{
				_return pushBack ["O_MRAP_02_F",2030000];
				_return pushBack ["B_G_Offroad_01_armed_F",840000];
				_return pushBack ["O_MRAP_02_hmg_F",3500000];
			};
		};
		if(__GETC__(life_donator) == 4) then
		{
			_return =
			[
				["B_Quadbike_01_F",1250],
				["B_G_Offroad_01_F",7500],
				["I_G_Van_01_fuel_F",25000]
			];
			if(license_civ_rebel) then
			{
				_return pushBack ["O_MRAP_02_F",1450000];
				_return pushBack ["B_G_Offroad_01_armed_F",600000];
				_return pushBack ["O_MRAP_02_hmg_F",2500000];
			};
		};
	};

	case "donor_reb_heli":
	{
		if(__GETC__(life_donator) < 1) exitWith
		{
			hint "Tienes que ser donador para usar esta tienda.";
			[]
		};
		if(__GETC__(life_donator) == 1) then
		{
			_return =
			[
				["B_Heli_Light_01_F",340000],
				["C_Heli_Light_01_civil_F", 467500],
				["O_Heli_Light_02_unarmed_F",1062500],
				["I_Heli_Transport_02_F",2082500],
				["O_Heli_Transport_04_F",2167500],
				["O_Heli_Transport_04_bench_F", 2210000],
				["O_Heli_Transport_04_covered_F", 2295000],
				["B_Heli_Transport_03_F", 2380000],
				["B_Heli_Attack_01_F", 4462500],
				["O_Heli_Attack_02_F", 4632500]
			];
		};
		if(__GETC__(life_donator) == 2) then
		{
			_return =
			[
				["B_Heli_Light_01_F",320000],
				["C_Heli_Light_01_civil_F", 440000],
				["O_Heli_Light_02_unarmed_F",1000000],
				["I_Heli_Transport_02_F",1960000],
				["O_Heli_Transport_04_F",2040000],
				["O_Heli_Transport_04_bench_F", 2080000],
				["O_Heli_Transport_04_covered_F", 2160000],
				["B_Heli_Transport_03_F", 2240000],
				["B_Heli_Attack_01_F", 4200000],
				["O_Heli_Attack_02_F", 4360000]
			];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_return =
			[
				["B_Heli_Light_01_F",280000],
				["C_Heli_Light_01_civil_F", 385000],
				["O_Heli_Light_02_unarmed_F",875000],
				["I_Heli_Transport_02_F",1715000],
				["O_Heli_Transport_04_F",1785000],
				["O_Heli_Transport_04_bench_F", 1820000],
				["O_Heli_Transport_04_covered_F", 1890000],
				["B_Heli_Transport_03_F", 1960000],
				["B_Heli_Attack_01_F", 3675000],
				["O_Heli_Attack_02_F", 3815000]
			];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_return =
			[
				["B_Heli_Light_01_F",200000],
				["C_Heli_Light_01_civil_F", 275000],
				["O_Heli_Light_02_unarmed_F",625000],
				["I_Heli_Transport_02_F",1225000],
				["O_Heli_Transport_04_F",1275000],
				["O_Heli_Transport_04_bench_F", 1300000],
				["O_Heli_Transport_04_covered_F", 1350000],
				["B_Heli_Transport_03_F", 1400000],
				["B_Heli_Attack_01_F", 2625000],
				["O_Heli_Attack_02_F", 2725000]
			];
		};
	};

	case "donor_plane":
	{
		if(__GETC__(life_donator) < 1) exitWith
		{
			hint "Tienes que ser donador para usar esta tienda.";
			[]
		};
		if(__GETC__(life_donator) == 1) then
		{
			_return =
			[
				["B_Plane_CAS_01_F",6800000],
				["I_Plane_Fighter_03_CAS_F",7225000],
				["O_Plane_CAS_02_F",7820000]
			];
		};
		if(__GETC__(life_donator) == 2) then
		{
			_return =
			[
				["B_Plane_CAS_01_F",6400000],
				["I_Plane_Fighter_03_CAS_F",6800000],
				["O_Plane_CAS_02_F",7360000]
			];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_return =
			[
				["B_Plane_CAS_01_F",5600000],
				["I_Plane_Fighter_03_CAS_F",5950000],
				["O_Plane_CAS_02_F",6440000]
			];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_return =
			[
				["B_Plane_CAS_01_F",4000000],
				["I_Plane_Fighter_03_CAS_F",4250000],
				["O_Plane_CAS_02_F",4600000]
			];
		};
	};
};

_return;
