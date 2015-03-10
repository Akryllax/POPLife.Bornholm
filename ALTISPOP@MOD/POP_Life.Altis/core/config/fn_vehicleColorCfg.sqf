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

	case "DAR_ImpalaCiv":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "DAR_FusionCiv":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "DAR_TaurusCiv":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "DAR_M3CivGrey":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "DAR_MF1Civ":
	{
 		_ret = 
 		[
 			["DAR_MF1\Data\Body_coRed.paa","civ"],
			["DAR_MF1\Data\Body_coBlack.paa","civ"],
			["DAR_MF1\Data\Body_coSilver","civ"],
			["DAR_MF1\Data\Body_coOrange","civ"],
			["DAR_MF1\Data\Body_coBurgundy","civ"],
			["SAL_A4\Data\Body_co.paa","civ"]
 		];
 	};
	
	case "cl3_civic_vti_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_polo_gti_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_insignia_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_e63_amg_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_range_rover_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_dodge_charger_s_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_z4_2008_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_carrera_gt_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_dbs_volante_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_r8_spyder_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_458_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_murcielago_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"],
			["textures\murcielago_police.jpg","cop"]
 		];
 	};
	
	case "cl3_reventon_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_veyron_blk_wht":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_lamborghini_gt1_black":
	{
 		_ret = 
 		[
 			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["#(argb,8,8,3)color(0.1,0.1,0.1,0.7)","civ"],
			["#(argb,8,8,3)color(0.5,0.5,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.3,0.3,0.3,0.8)","civ"],
			["#(argb,8,8,3)color(1,1,1,1)","civ"],
			["#(argb,8,8,3)color(1.5,1.6,0.9,0.2)","civ"],
			["#(argb,8,8,3)color(1,0,0,0.1)","civ"],
			["#(argb,8,8,3)color(0.01,0.6,1,0.1)","civ"],
			["#(argb,8,8,3)color(0,0,0.5,0.1)","civ"],
			["#(argb,8,8,3)color(0.6,0,1,0.01)","civ"],
			["#(argb,8,8,3)color(0.5,1,0.5,0.05)","civ"],
			["#(argb,8,8,3)color(1,0,0,1)","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(argb,8,8,3)color(1,0.3,0.01,0.6)","civ"]
 		];
 	};
	
	case "cl3_insignia_camo":
	{
 		_ret = 
 		[
 			["cl3_vehiclefunctions\skins\skin_camo_co.paa","reb"],
			["cl3_vehiclefunctions\skins\skin_camo_urban_co.paa","reb"],
			["#(ai,64,64,1)Fresnel(0.3,3)","reb"]
 		];
 	};
	
	case "exxpensive_bmwm3e46_base":
	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };
	
	case "exxpensive_jaguar_base":	
	{
	_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		];
	};
	
	case "exxpensive_mercedes_sls_base":
	{
	_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		];
	};
	case "exxpensive_ferrari_458_base":
	{
	_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		];
	};
	 case "exxpensive_aventador_base":
	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		];
	 };
	case "exxpensive_mini_cooper_base":
	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };
	case "exxpensive_ford_raptor_base":
	{
	_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		];
	};
	 case "exxpensive_volvo_242_base":
	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	};
	case "exxpensive_cadillac_sedan":
	{
	_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		];
	};
	 case "exxpensive_2cv_base":
	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };
	case "exxpensive_cadillac_sedan_base":
	{
	_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		];
	};
	case "exxpensive_chevrolet_caprice_base":
	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };	
	 	case "exxpensive_bugatti_base":	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };	
	case "exxpensive_audi_R8_base":	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };	
	case "exxpensive_m5_e34_base": 	 {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };	
	case "exxpensive_volvo_242_base": {
	 _ret = 
		 [
			 ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			 ["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,0.501961,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,1,0,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(0,0.301961,0.6,1.0,CO)","civ"],
			 ["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"]
		 ];
	 };
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["textures\CIV\domino_sport.jpg","civ"],
			["textures\CIV\monsterwrcv2.jpg","civ"],
			["textures\CIV\sport_redbull.jpg","civ"],
			["textures\CIV\valkyriacar.jpg","civ"],
			["textures\CIV\civ_hatchback_racing.jpg","civ"],
			["textures\CIV\rsz_hatchback_badmobil.jpg","civ"],
			["textures\CIV\DEPORTIVA-CIRCUITO.jpg", "civ"],
			["textures\CIV\hatchback_rockstar.jpg", "civ"],
			["textures\CIV\lancia-martini.jpg", "civ"],
			["textures\CIV\mercedesgt.jpg", "civ"],
			["textures\CIV\monster.jpg", "civ"],
			["textures\CIV\peugeot.jpg", "civ"],
			["textures\COP\cop_hatchback.jpg","cop"],
			["textures\COP\hatchback_local.jpg","cop"],
			["textures\COP\hatch_guardia_civil_v1.jpg","cop"]
		];
	};

	case "C_Offroad_01_F":
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["textures\COP\police_offroad_local.jpg","cop"],
			["textures\COP\police_offroad.jpg","cop"],
			["textures\COP\offroad_01_ext_base02_co.jpg","cop"],
			["textures\COP\geo_offroad.jpg","cop"],
			["textures\CIV\GENERALLEEOFFROAD.jpg","civ"],
			["textures\CIV\taxi_2.jpg","civ"],
			["textures\MED\offroad_notarzt.jpg","med"]
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
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\COP\cop_suv.jpg","cop"],
			["textures\COP\suv_01_ext_co.jpg","cop"],
			["textures\MED\medic_suv_FINAL.jpg","med"],
			["textures\CIV\CANIMOVIL.jpg","civ"],
			["textures\CIV\ferrari.jpg","civ"],
			["textures\CIV\suv_Ghostrider.jpg","civ"],
			["textures\CIV\blackwhite.jpg","civ"],
			["textures\CIV\carbon_suv.jpg","civ"],
			["textures\CIV\civ_suv_skull.jpg","civ"],
			["textures\CIV\jurassicpark_suv.jpg","civ"],
			["textures\CIV\suv_racestripes_redblack.jpg","civ"],
			["textures\CIV\kitty.jpg","civ"],
			["textures\CIV\taxi_1.jpg","civ"],
			["textures\MED\medic_suv_final.jpg","med"]
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

	case "B_Quadbike_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","civ"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"],
			["textures\COP\quadbike_local.jpg","cop"],
			["textures\COP\quadbike_01_co.jpg","cop"]
		];
	};

	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["textures\COP\police_heli.jpg","cop"],
			["textures\COP\mh9_guardia_civil_v1.jpg","cop"],
			["textures\CIV\kitty_heli.jpg","civ"],
			["textures\MED\medic_heli.jpg","med"]
		];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"]
		];
	};

	case "B_MRAP_01_F":
	{
		_ret =
		[
			["textures\COP\geo_hunter_1.jpg","cop","textures\COP\geo_hunter_2.jpg"],
			["textures\COP\mrap_guardia_civil_verde.jpg","cop","textures\COP\mrap_guardia_civil_adds.jpg"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["textures\CIV\truckcabredbull.jpg","civ","textures\CIV\truckbackredbull.jpg","civ"]

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

	case "I_MRAP_03_F";
	{
	   _ret =
	   [
          ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","merc"]
	   ];
    };

    case "I_MRAP_03_hmg_F";
    {
	   _ret =
	   [
          ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","merc"]
	   ];
    };

    case "B_MRAP_01_hmg_F":
	{
		_ret =
		[
			["textures\COP\geo_hunter_1.jpg","cop","textures\COP\geo_hunter_2.jpg"]
		];
	};

	case "I_Heli_light_03_unarmed_F":
	{
	    _ret =
	    [
            ["textures\COP\police_hellcat.jpg","cop"]
	    ];
    };
};

_ret;