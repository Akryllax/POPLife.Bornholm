#include <macro.h>
/*
	File: fn_clothing_mer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for mercenaty clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mercenary Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{	
		_ret set[count _ret,["U_BG_Guerilla1_1","Reclutas",100]];
		if(__GETC__(life_merlevel) > 3) then
		{
			_ret set[count _ret,["U_I_CombatUniform",nil,100]];
		};
		if(__GETC__(life_merlevel) > 3) then
		{
			_ret set[count _ret,["U_I_GhillieSuit",nil,20000]];
		};	
	};
	
	//Hats
	case 1:
	{
		_ret =
		[
			["H_MilCap_dgtl",nil,50],
			["H_Cap_blk_Raven",nil,50],
			["H_Beret_grn",nil,50],		
			["H_Beret_Colonel",nil,50],
			["H_HelmetIA_camo",nil,50]			
		];	
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
	_ret = 
		[
			["V_PlateCarrierIA1_dgtl",nil,20],
			["V_PlateCarrierIA2_dgtl",nil,20]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_AssaultPack_dgtl",nil,100],
			["B_Carryall_ocamo",nil,100]		
		];
	};
};

_ret;