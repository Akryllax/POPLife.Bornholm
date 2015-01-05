/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]
		];
	};

	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"], 		//0
			[_path + "hatchback_01_ext_sport02_co.paa","civ"], 		//1
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],	 	//2
			[_path + "hatchback_01_ext_sport04_co.paa","civ"], 		//3
			[_path + "hatchback_01_ext_sport05_co.paa","civ"], 		//4
			[_path + "hatchback_01_ext_sport06_co.paa","civ"], 		//5
			["textures\COP\hatchback_local.jpg","cop"],//Local 		//6
			["textures\COP\cop_hatchback.jpg","cop"],//Nacional 	//7
			["textures\COP\hatch_guardia_civil_v1.jpg", "cop"],		//8
			["textures\CIV\civ_hatchback_racing.jpg", "civ"],		//9
			["textures\CIV\deportiva_camuflaje.jpg", "reb"],		//10
			["textures\CIV\DEPORTIVA-CIRCUITO.jpg", "civ"],			//11
			["textures\CIV\hatchback_redbull.jpg", "civ"],			//12
			["textures\CIV\hatchback_rockstar.jpg", "civ"],			//13
			["textures\CIV\lancia-martini.jpg", "civ"],				//14
			["textures\CIV\mercedesgt.jpg", "civ"],					//15
			["textures\CIV\monster.jpg", "civ"],					//16
			["textures\CIV\peugeot.jpg", "civ"]						//17

		];
	};

	case "C_Offroad_01_F":
	{
		_ret =
		[
			["textures\MED\offroad_notarzt.jpg", "med"], 						//0
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"], //1
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"], //2
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],	//3
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],  //4
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],	//5
			["#(ai,64,64,1)Fresnel(0.3,3)","fed"],								//6
			["textures\COP\police_offroad_local.jpg","cop"], //Policia local	//7
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],						//8
			["textures\COP\police_offroad.jpg","cop"], //Policia Nacional		//9
			["textures\COP\offroad_01_ext_base02_co.jpg","cop"], //Guardia Civil//10
			["textures\COP\geo_offroad.jpg","cop"], // Geos						//11
			["textures\CIV\GENERALLEEOFFROAD.jpg","civ"]						//12

		];
	};

	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};

	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],		//0
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],	//1
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],	//2
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],	//3
			["textures\COP\cop_suv.jpg","cop"], //Policia Nacional			//4
			["textures\COP\suv_01_ext_co.jpg","cop"], //Guardia Civil		//5
			["textures\MED\medic_suv_FINAL.jpg","med"],						//6
			["textures\CIV\CANIMOVIL.jpg","civ"],							//7
			["textures\CIV\ferrari.jpg","civ"],								//8
			["textures\CIV\suv_Ghostrider.jpg","civ"]						//9
		];
	};

	case "C_Van_01_box_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "C_Van_01_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	case "I_G_Van_01_fuel_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ","\a3\soft_f_gamma\Van_01\Data\van_01_tank_red_co.paa"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_ig_co.paa","reb","\a3\soft_f_gamma\Van_01\Data\van_01_tank_ig_co.paa"]
		];
	};

	case "B_Quadbike_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],					//0
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],				//1
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],	//2
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],		//3
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],		//4
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],	//5
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],			//6
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],	//7
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"],	//8
			["textures\COP\quadbike_local.jpg","cop"], //Policia Local					//9
			["textures\COP\quadbike_01_co.jpg","cop"] //Guardia Civil					//10
		];
	};

	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["textures\COP\police_heli.jpg","cop"], //Policia Nacional
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blufor_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","mer"],
			["textures\COP\mh9_guardia_civil_v1.jpg", "cop"] //Guardia Civil
		];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","cop"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","mer"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\MED\medic_orca.jpg","med"]
		];
	};

	case "I_Heli_Transport_02_F":
	{
		_ret =
		[
			["\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_indp_co.paa","civ"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_indp_co.paa","donate"]
		];
	};

	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			["textures\COP\police_hellcat.jpg","cop"],
			["\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa","mer"],
			["textures\MED\medic_heli_FINAL.jpg","med"]
		];
	};

	case "B_MRAP_01_F":
	{
		_ret =
		[
			["textures\COP\geo_hunter_1.jpg","cop","textures\COP\geo_hunter_2.jpg"], //GEOS
			["textures\COP\mrap_guardia_civil_verde.jpg", "cop", "textures\COP\mrap_01_adds_co.jpg"] //Guardia Civil
		];
	};

	case "B_MRAP_01_hmg_F":
	{
		_ret =
		[
			["textures\COP\geo_hunter_1.jpg","cop","textures\COP\geo_hunter_2.jpg","textures\turret_co.paa"],
			["textures\COP\mrap_guardia_civil_verde.jpg", "cop", "textures\COP\mrap_01_adds_co.jpg","textures\turret_co.paa"] //Guardia Civil
		];
	};

	case "I_MRAP_03_hmg_F":
	{
		_ret =
		[
			["textures\COP\strider.jpg","cop"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "I_Truck_02_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "O_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_opfor_co.paa"]
		];
	};

	case "O_Truck_02_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_opfor_co.paa"]
		];
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "O_Heli_Attack_02_black_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
};

_ret;