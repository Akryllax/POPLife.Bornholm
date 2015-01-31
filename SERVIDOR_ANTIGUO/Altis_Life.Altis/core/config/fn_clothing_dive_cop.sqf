/*
	File: fn_clothing_dive_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Altis Diving Shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tienda buceo de la policia"];

switch (_filter) do
{
	case (playerSide != west): {"No eres policia!"};
	//Uniforms
	case 0:
	{
		[
			["U_O_Wetsuit",nil,1]
		];
	};
	
	//Hats
	case 1:
	{
		[
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Diving",nil,1]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherIA",nil,1]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};