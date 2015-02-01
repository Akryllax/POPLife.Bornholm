#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{

	};

	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["H_HelmetB_plain_mcamo",nil,75 * Desc];
			_ret pushBack ["H_Booniehat_mcamo",nil,120 * Desc];
			_ret pushBack ["H_MilCap_mcamo",nil,100 * Desc];
			_ret pushBack ["H_CrewHelmetHeli_B",Mascara de Gas,500 * Desc];
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25 * Desc],
			["G_Shades_Blue",nil,20 * Desc],
			["G_Sport_Blackred",nil,20 * Desc],
			["G_Sport_Checkered",nil,20 * Desc],
			["G_Sport_Blackyellow",nil,20 * Desc],
			["G_Sport_BlackWhite",nil,20 * Desc],
			["G_Aviator",nil,75 * Desc],
			["G_Squares",nil,10 * Desc],
			["G_Lowprofile",nil,30 * Desc],
			["G_Combat",nil,55 * Desc]
		];
	};

	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800 * Desc];
		if(__GETC__(life_coplevel) > 2) then
		{
		   _ret pushBack ["V_BandollierB_blk",nil,1500 * Desc];
	    };
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushBack ["V_TacVest_blk_POLICE",nil,3500 * Desc];
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800 * Desc],
			["B_FieldPack_cbr",nil,500 * Desc],
			["B_AssaultPack_cbr",nil,700 * Desc],
			["B_Bergen_sgg",nil,2500 * Desc],
			["B_Carryall_cbr",nil,3500 * Desc]
		];
	};
};

_ret;