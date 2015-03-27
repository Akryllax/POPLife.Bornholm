/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		
			["A3L_EMT1",nil,5000],
			["A3L_EMT2",nil,5000],
			["EMTRM_uni",nil,5000],
			["emt_Uni1",nil,5000],
			["emt_Uni3",nil,5000],
			["emsoff_uni",nil,5000],
			["A3L_Worker_Outfit",nil,5000],
			["fire_uni1",nil,5000],
			["fire_uni2",nil,5000],
			["fireoff_uni",nil,5000],	
			["cl3_c_poloshirtpants_FD_uniform",nil,5000],
			["cl3_pilot_CGP_uniform",nil,5000],
			["cl3_coveralls_FD_black_uniform",nil,5000],
			["cl3_coveralls_mechanic_uniform",nil,5000]
		
		];
	};
	
	//Hats
	case 1:
	{
		[
			["A3L_firedeptmask",nil,850],
			["A3L_medic_helmet",nil,850],
			["a3l_hardhat",nil,850],
			["H_Orel_FireFighter",nil,850],
			["H_Orel_FireFighter_Gaz",nil,850],
			["firehat",nil,850]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Bandanna_aviator", nil, 20]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVestIR_blk",nil,300],
			["V_TacVest_blk",nil,300],
			["V_RebreatherB",nil,300],	
			["cl3_police_vest_CG2",nil,300],
			["cl3_police_vest_fd",nil,300],
			["cl3_police_vest_mr",nil,300],
			["cl3_police_vest_pm",nil,300],
			["V_Firefighter",nil,300]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_FieldPack_ocamo",nil,300],
			["B_Carryall_oucamo",nil,300],
			["B_TacticalPack_blk",nil,300]
		];
	};
};
