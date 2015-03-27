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
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["A3L_Priest_Uniform","Priest Uniform",10000],
		["A3L_Suit_Uniform","Suit",17500],
		["A3L_Character_Uniform","Life Uniform",15000],
		["A3L_Dude_Outfit","Dude outfit",20000],
		["A3L_Farmer_Outfit","Farmer Outfit",20000],
		["A3L_Worker_Outfit","Worker Outfit",20000],
		["A3LShirt","ArmA 3 Life Shirt",2500],
		["A3L_Poop2day","I Pooped Today!",2750],
		["A3L_A3LogoPants","A3L Logo Pants",1500],
		["pervt_uni","Pervert Shirt",1750],
		["BluePlaid_uni","A3L Plaid (Blue)",3250],
		["OrangePlaid_uni","A3L Plaid (Orange)",3500],
		["PinkPlaid_uni","A3L Plaid (Pink)",3500],
		["RedPlaid_uni","A3L Plaid (Red)",3500],
		["YellowPlaid_uni","A3L Plaid (Yellow)",3500],
		["checkered_uni","A3L Polo (Checkered)",3500],
		["GbGyBr_uni","A3L Polo (GB-GY-BR)",3500],
		["GnBlBr_uni","A3L Polo (GN-BL-BR)",3500],
		["GnGyBr_uni","A3L Polo (GN-GN-GY)",3500],
		["GyBlBr_uni","A3L Polo (GY-BL-BR)",3500],
		["kingfish_uni","A3L Polo (Kingfish)",3500],
		["mothertrucker_uni","A3L Polo (Mothertrucker)",3500],
		["OrBlBr_uni","A3L Polo (OR-BL-BR)",3500],
		["OrGnGy_uni","A3L Polo (OR-GN-GY)",3500],
		["OrGyBr_uni","A3L Polo (OR-GY-BR)",3500],
		["PkGnGy_uni","A3L Polo (PK-GN-GY)",3500],
		["PkGyBr_uni","A3L Polo (PK-GY-BR)",3500],
		["RdBlBr_uni","A3L Polo (RD-BL-BR)",3500],
		["RdGnGy_uni","A3L Polo (RD-GN-GY)",3500],
		["RdGyBr_uni","A3L Polo (RD-GY-BR)",3500],
		["sohoku_uni","A3L Polo (Sohoku)",3500],
		["WhBlBr_uni","A3L Polo (WH-BL-BR)",3500],
		["WhGyBr_uni","A3L Polo (WH-GY-BR)",3500],
		["YlBlBr_uni","A3L Polo (YL-BL-BR)",3500],
		["YlGnGy_unI","A3L Polo (YL-GN-GY)",3500],
		["YlGyBr_uni","A3L Polo (YL-GY-BR)",3500],
		["racer_uni","A3L Racer Uniform",3500],
		["taxi_uni","A3L Taxi Uniform",3500],
		["arma3","ArmA 3 Polo",3500],
		["arma3black","ArmA 3 Polo (Black)",3500],
		["ATI","ATI Enthusiast",3500],
		["tacobell","Delgado Shirt",3500],
		["dutch","Dutch Shirt",3500],
		["hanacd","Hannes Academy",3500],
		["nvidia","Nvidia Enthusiast",3500],
		["SFG","SF Giant",3500],
		["walkingdead","The Walking Dead",3500],
		
		
		["cl3_c_poloshirt_1_uniform",nil,3600],
		["cl3_c_poloshirt_2_uniform",nil,3600],
		["cl3_c_poloshirt_3_uniform",nil,3600],
		["cl3_c_poloshirt_4_uniform",nil,3600],
		["cl3_c_poloshirt_5_uniform",nil,3600],
		["cl3_c_poloshirt_6_uniform",nil,3600],
		["cl3_c_poloshirt_7_uniform",nil,3600],
		["cl3_c_poloshirt_8_uniform",nil,3600],
		["cl3_c_poloshirt_9_uniform",nil,3600],
		["cl3_c_poloshirt_10_uniform",nil,3600],
		["cl3_c_poloshirt_11_uniform",nil,3600],
		["cl3_c_poloshirt_12_uniform",nil,3600],
		["cl3_c_poloshirt_13_uniform",nil,3600],
		["cl3_c_poloshirt_14_uniform",nil,3600],
		["cl3_c_poloshirt_15_uniform",nil,3600],
		["cl3_c_poloshirt_16_uniform",nil,3600],
		["cl3_c_poloshirt_17_uniform",nil,3600],
		["cl3_c_poloshirt_18_uniform",nil,3600],
		["cl3_c_poloshirt_19_uniform",nil,3600],
		["cl3_c_poloshirt_20_uniform",nil,3600],
		["cl3_c_poloshirt_21_uniform",nil,3600],
		["cl3_c_poloshirt_22_uniform",nil,3600],
		["cl3_c_poloshirt_23_uniform",nil,3600],
		["cl3_hunter_bushman_hunter1_uniform",nil,4000],
		["cl3_hunter_bushman_hunter2_uniform",nil,4000],
		["cl3_hunter_bushman_hunter3_uniform",nil,4000],
		["cl3_hunter_bushman_hunter4_uniform",nil,4000],
		["cl3_citizen4_1_uniform",nil,4000],
		["cl3_citizen4_2_uniform",nil,4000],
		["cl3_citizen4_3_uniform",nil,4000],
		["cl3_citizen4_4_uniform",nil,4000],
		["cl3_citizen4_5_uniform",nil,4000],
		["cl3_citizen4_6_uniform",nil,4000],
		["cl3_citizen4_7_uniform",nil,4000],
		["cl3_citizen4_8_uniform",nil,4000],
		["cl3_citizen4_9_uniform",nil,4000],
		["cl3_citizen4_10_uniform",nil,4000],
		["cl3_citizen4_11_uniform",nil,4000],
		["cl3_citizen4_12_uniform",nil,4000],
		["cl3_citizen4_13_uniform",nil,4000],
		["cl3_citizen4_14_uniform",nil,4000],
		["cl3_citizen4_15_uniform",nil,4000],
		["cl3_citizen4_16_uniform",nil,4000],
		["cl3_citizen4_17_uniform",nil,4000],
		["cl3_citizen4_18_uniform",nil,4000],
		["cl3_citizen4_19_uniform",nil,4000],
		["cl3_citizen4_20_uniform",nil,4000],
		["cl3_citizen4_21_uniform",nil,4000],
		["cl3_citizen4_22_uniform",nil,4000],
		["cl3_citizen4_23_uniform",nil,4000],
		["cl3_citizen3_1_uniform",nil,3000],
		["cl3_citizen3_2_uniform",nil,3000],
		["cl3_citizen3_3_uniform",nil,3000],
		["cl3_citizen3_4_uniform",nil,3000],
		["cl3_citizen3_5_uniform",nil,3000],
		["cl3_citizen3_6_uniform",nil,3000],
		["cl3_citizen3_7_uniform",nil,3000],
		["cl3_citizen3_8_uniform",nil,3000],
		["cl3_citizen3_9_uniform",nil,3000],
		["cl3_citizen3_10_uniform",nil,3000],
		["cl3_citizen3_11_uniform",nil,3000],
		["cl3_citizen3_12_uniform",nil,3000],
		["cl3_citizen3_13_uniform",nil,3000],
		["cl3_citizen3_14_uniform",nil,3000],
		["cl3_citizen3_15_uniform",nil,3000],
		["cl3_citizen3_16_uniform",nil,3000],
		["cl3_citizen3_17_uniform",nil,3000],
		["cl3_citizen3_18_uniform",nil,3000],
		["cl3_citizen3_19_uniform",nil,3000],
		["cl3_citizen3_20_uniform",nil,3000],
		["cl3_citizen3_21_uniform",nil,3000],
		["cl3_citizen3_22_uniform",nil,3000],
		["cl3_citizen3_23_uniform",nil,3000],
		["cl3_citizen3_24_uniform",nil,3000],
		["cl3_citizen3_25_uniform",nil,3000],
		
		["cl3_citizen2_1_uniform",nil,3500],
		["cl3_citizen2_2_uniform",nil,3500],
		["cl3_citizen2_3_uniform",nil,3500],
		["cl3_citizen2_4_uniform",nil,3500],
		["cl3_citizen2_5_uniform",nil,3500],
		["cl3_citizen2_6_uniform",nil,3500],
		["cl3_citizen2_7_uniform",nil,3500],
		["cl3_citizen2_8_uniform",nil,3500],
		["cl3_citizen2_9_uniform",nil,3500],
		["cl3_citizen2_10_uniform",nil,3500],
		["cl3_citizen2_11_uniform",nil,3500],
		["cl3_citizen2_12_uniform",nil,3500],
		["cl3_citizen2_13_uniform",nil,3500],
		["cl3_citizen2_13_uniform",nil,3500],
		["cl3_citizen2_14_uniform",nil,3500],
		["cl3_citizen2_15_uniform",nil,3500],
		["cl3_citizen2_16_uniform",nil,3500],
		["cl3_citizen2_17_uniform",nil,3500],
		["cl3_citizen2_18_uniform",nil,3500],
		["cl3_citizen2_19_uniform",nil,3500],
		["cl3_citizen2_20_uniform",nil,3500],
		["cl3_citizen2_21_uniform",nil,3500],
		["cl3_citizen2_22_uniform",nil,3500],
		["cl3_citizen2_23_uniform",nil,3500],
		["cl3_citizen2_24_uniform",nil,3500],
		["cl3_citizen2_25_uniform",nil,3500],
		["cl3_c_poloshirt_funk_co_uniform",nil,4500],
		["cl3_c_poloshirt_gravity_co_uniform",nil,4500]
		
		
		];
	};
	
	//Hats
	case 1:
	{
		[
			["A3L_Legoman","Lego Helmet",1500],
			["A3L_soa_helmet","Biker Helmet",1500],
			["A3L_gangster_hat","Gangster Mask",1500],
			["A3L_Mask","Mask",1500],
			["A3L_longhairblack","Long Hair Black",1500],
			["A3L_longhairblond","Long Hair Blond",1500],
			["A3L_longhairbrown","Long Hair Brown",1500],
			["A3L_Crown","Crown",1500],
			["cowboyhat","Cowboyhat",1500],
			["A3L_mexicanhat","Mexican Hat",1500],
			["santahat","Santa hat",1500],
			["A3L_Sombrero","Sombrero",1500],
			["turban","Turban",1500],
			["A3L_russianhat","Russianhat",1500],
			["A3L_Halloween_Pumpkinhead","Pumpkin Head",1500],
			["A3L_Halloween_PredatorMask","Predator Mask",1500],
			["A3L_Halloween_JigSaw","JigSaw Mask",500],
			["A3L_Helmet",nil,1500],
			["A3L_Helmetblack",nil,1500],			
			["H_RacingHelmet_1_black_F",nil,1500],
			["H_RacingHelmet_1_red_F",nil,1500],
			["H_RacingHelmet_1_white_F",nil,1500],
			["H_RacingHelmet_1_blue_F",nil,1500],
			["H_RacingHelmet_1_yellow_F",nil,1500],
			["H_RacingHelmet_1_green_F",nil,1500],
			["H_RacingHelmet_1_F",nil,1500],
			["H_RacingHelmet_2_F",nil,1500],
			["H_RacingHelmet_3_F",nil,1500],
			["H_RacingHelmet_4_F",nil,1500]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,600],
			["G_Shades_Blue",nil,600],
			["G_Sport_Blackred",nil,600],
			["G_Sport_Checkered",nil,600],
			["G_Sport_Blackyellow",nil,600],
			["G_Sport_BlackWhite",nil,600],
			["G_Squares",nil,600],
			["G_Aviator",nil,600],
			["G_Lady_Mirror",nil,600],
			["G_Lady_Dark",nil,600],
			["G_Lady_Blue",nil,600],
			["G_Lowprofile",nil,600],
			["G_Combat",nil,600]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["A3L_SpiderVest","Spidie The Spider!",7500],
			["A3L_SpookyVest","Ghost and Spider",8500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000]
		];
	};
};