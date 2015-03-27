/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(license_civ_donator && playerSide == civilian) then
		{
			_ret set[count _ret,["U_IG_Guerilla1_1",nil,2000]];
			_ret set[count _ret,["U_I_G_Story_Protagonist_F",nil,2000]];
			_ret set[count _ret,["U_I_G_resistanceLeader_F",nil,2500]];
			_ret set[count _ret,["U_O_SpecopsUniform_ocamo",nil,2500]];
			_ret set[count _ret,["U_O_PilotCoveralls",nil,2610]];
			_ret set[count _ret,["U_IG_leader","Guerilla Leader",2340]];
			_ret set[count _ret,["U_O_GhillieSuit",nil,10000]];
			_ret set[count _ret,["A3L_Priest_Uniform","Priest Uniform",5000]];
			_ret set[count _ret,["A3L_Suit_Uniform","Suit",7500]];
			_ret set[count _ret,["A3L_Character_Uniform","Life Uniform",5000]];
			_ret set[count _ret,["A3L_Dude_Outfit","Dude outfit",10000]];
			_ret set[count _ret,["A3L_Farmer_Outfit","Farmer Outfit",10000]];
			_ret set[count _ret,["A3L_Worker_Outfit","Worker Outfit",10000]];
			_ret set[count _ret,["A3LShirt","ArmA 3 Life Shirt",5000]];
			_ret set[count _ret,["A3L_Poop2day","I Pooped Today!",7500]];
			_ret set[count _ret,["A3L_A3LogoPants","A3L Logo Pants",5000]];
			_ret set[count _ret,["pervt_uni","Pervert Shirt",7500]];
			_ret set[count _ret,["BluePlaid_uni","A3L Plaid (Blue)",2500]];
			_ret set[count _ret,["OrangePlaid_uni","A3L Plaid (Orange)",1500]];
			_ret set[count _ret,["PinkPlaid_uni","A3L Plaid (Pink)",1500]];
			_ret set[count _ret,["RedPlaid_uni","A3L Plaid (Red)",1500]];
			_ret set[count _ret,["YellowPlaid_uni","A3L Plaid (Yellow)",1500]];
			_ret set[count _ret,["checkered_uni","A3L Polo (Checkered)",1500]];
			_ret set[count _ret,["GbGyBr_uni","A3L Polo (GB-GY-BR)",1500]];
			_ret set[count _ret,["GnBlBr_uni","A3L Polo (GN-BL-BR)",1500]];
			_ret set[count _ret,["GnGyBr_uni","A3L Polo (GN-GN-GY)",1500]];
			_ret set[count _ret,["GyBlBr_uni","A3L Polo (GY-BL-BR)",1500]];
			_ret set[count _ret,["kingfish_uni","A3L Polo (Kingfish)",1500]];
			_ret set[count _ret,["mothertrucker_uni","A3L Polo (Mothertrucker)",1500]];
			_ret set[count _ret,["OrBlBr_uni","A3L Polo (OR-BL-BR)",1500]];
			_ret set[count _ret,["OrGnGy_uni","A3L Polo (OR-GN-GY)",1500]];
			_ret set[count _ret,["OrGyBr_uni","A3L Polo (OR-GY-BR)",1500]];
			_ret set[count _ret,["PkGnGy_uni","A3L Polo (PK-GN-GY)",1500]];
			_ret set[count _ret,["PkGyBr_uni","A3L Polo (PK-GY-BR)",1500]];
			_ret set[count _ret,["RdBlBr_uni","A3L Polo (RD-BL-BR)",1500]];
			_ret set[count _ret,["RdGnGy_uni","A3L Polo (RD-GN-GY)",1500]];
			_ret set[count _ret,["RdGyBr_uni","A3L Polo (RD-GY-BR)",1500]];
			_ret set[count _ret,["sohoku_uni","A3L Polo (Sohoku)",1500]];
			_ret set[count _ret,["WhBlBr_uni","A3L Polo (WH-BL-BR)",1500]];
			_ret set[count _ret,["WhGyBr_uni","A3L Polo (WH-GY-BR)",1500]];
			_ret set[count _ret,["YlBlBr_uni","A3L Polo (YL-BL-BR)",1500]];
			_ret set[count _ret,["YlGnGy_unI","A3L Polo (YL-GN-GY)",1500]];
			_ret set[count _ret,["YlGyBr_uni","A3L Polo (YL-GY-BR)",1500]];
			_ret set[count _ret,["racer_uni","A3L Racer Uniform",1500]];
			_ret set[count _ret,["taxi_uni","A3L Taxi Uniform",1500]];
			_ret set[count _ret,["arma3","ArmA 3 Polo",1500]];
			_ret set[count _ret,["arma3black","ArmA 3 Polo (Black)",1500]];
			_ret set[count _ret,["ATI","ATI Enthusiast",1500]];
			_ret set[count _ret,["tacobell","Delgado Shirt",1500]];
			_ret set[count _ret,["dutch","Dutch Shirt",1500]];
			_ret set[count _ret,["hanacd","Hannes Academy",1500]];
			_ret set[count _ret,["nvidia","Nvidia Enthusiast",1500]];
			_ret set[count _ret,["SFG","SF Giant",1500]];
			_ret set[count _ret,["walkingdead","The Walking Dead",1500]];
		};
	};
	
	//Hats
	case 1:
	{
		if(license_civ_donator && playerSide == civilian) then
		{
			_ret set[count _ret,["A3L_Legoman","Lego Helmet",5000]];
			_ret set[count _ret,["A3L_soa_helmet","Biker Helmet",2000]];
			_ret set[count _ret,["A3L_gangster_hat","Gangster Mask",500]];
			_ret set[count _ret,["A3L_Mask","Mask",500]];
			_ret set[count _ret,["A3L_longhairblack","Long Hair Black",500]];
			_ret set[count _ret,["A3L_longhairblond","Long Hair Blond",500]];
			_ret set[count _ret,["A3L_longhairbrown","Long Hair Brown",500]];
			_ret set[count _ret,["A3L_Crown","Crown",500]];
			_ret set[count _ret,["cowboyhat","Cowboyhat",500]];
			_ret set[count _ret,["A3L_mexicanhat","Mexican Hat",500]];
			_ret set[count _ret,["santahat","Santa hat",500]];
			_ret set[count _ret,["A3L_Sombrero","Sombrero",500]];
			_ret set[count _ret,["turban","Turban",500]];
			_ret set[count _ret,["A3L_russianhat","Russianhat",500]];
			_ret set[count _ret,["H_ShemagOpen_tan",nil,500]];
			_ret set[count _ret,["H_Shemag_olive",nil,500]];
			_ret set[count _ret,["H_ShemagOpen_khk",nil,500]];
			_ret set[count _ret,["H_HelmetO_ocamo",nil,500]];
			_ret set[count _ret,["H_MilCap_oucamo",nil,200]];
			_ret set[count _ret,["H_Bandanna_camo",nil,500]];
		};
	};

	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,250],
			["G_Shades_Blue",nil,200],
			["G_Sport_Blackred",nil,200],
			["G_Sport_Checkered",nil,200],
			["G_Sport_Blackyellow",nil,200],
			["G_Sport_BlackWhite",nil,200],
			["G_Squares",nil,100],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,300],
			["G_Combat",nil,550]
		];
	};
	
	//Vest
	case 3:
	{
		if(license_civ_donator && playerSide == civilian) then
		{
			_ret set[count _ret,["V_TacVest_khk",nil,5000]];
			_ret set[count _ret,["V_BandollierB_cbr",nil,5000]];
			_ret set[count _ret,["V_HarnessO_brn",nil,5000]];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(license_civ_donator && playerSide == civilian) then
		{
			_ret set[count _ret,["B_AssaultPack_cbr",nil,1500]];
			_ret set[count _ret,["B_Kitbag_mcamo",nil,1500]];
			_ret set[count _ret,["B_TacticalPack_oli",nil,1500]];
			_ret set[count _ret,["B_FieldPack_ocamo",nil,1500]];
			_ret set[count _ret,["B_Bergen_sgg",nil,1500]];
			_ret set[count _ret,["B_Kitbag_cbr",nil,1500]];
			_ret set[count _ret,["B_Carryall_oli",nil,1700]];
			_ret set[count _ret,["B_Carryall_khk",nil,1700]];
		};
	};
};
_ret;