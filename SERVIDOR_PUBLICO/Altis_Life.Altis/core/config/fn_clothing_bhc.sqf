/*
File: fn_clothing_bhc.sqf
Author: Bryan "Tonic" Boardwine


Description:
Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price


//Shop Title Name
ctrlSetText[3103,"Bounty Hunter Clothing Shop"];


switch (_filter) do
{
//Uniforms
case 0:
	{
		[
			["U_I_G_resistanceLeader_F",nil,11500]
		];
	};


//Hats
case 1:
	{
		[
			["H_Cap_red",nil,100]
		];
	};


//Glasses
case 2:
	{
		[
			["G_Squares",nil,25]
		];
	};


//Vest
case 3:
	{
		[
			["V_PlateCarrier1_blk",nil,10000]
		];
	};


//Backpacks
case 4:
	{
		[
			["B_OutdoorPack_blk",nil,2000]
		];
	};
};