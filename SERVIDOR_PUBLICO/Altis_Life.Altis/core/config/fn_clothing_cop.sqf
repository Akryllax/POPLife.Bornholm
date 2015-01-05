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
		_lvl = __GETC__(life_coplevel);
		switch(_lvl) do {
			case 1: {
				_ret pushBack ["U_Rangemaster","Uniforme Policia Municipal",1]; // Municipal
			};

			case 2: {
				_ret pushBack ["U_Rangemaster","Uniforme Policia Municipal",1]; // Municipal
			};

			case 3: {
				_ret pushBack ["U_Rangemaster","Uniforme Policia Nacional",1]; // Nacional
			};

			case 4: {
				_ret pushBack ["U_Rangemaster","Uniforme Policia Nacional",1]; // Nacional
			};

			case 5: {
				_ret pushBack ["U_Rangemaster","Uniforme Policia Nacional",1]; // Nacional
			};

			case 6: {
				_ret pushBack ["U_B_CombatUniform_mcam_vest","Uniforme Guardia Civil",1]; // Guardia civil
			};

			case 7: {
				_ret pushBack ["U_B_CombatUniform_mcam_vest","Uniforme Guardia Civil",1]; // Guardia civil
			};

			case 8: {
				_ret pushBack ["U_B_CombatUniform_mcam_vest","Uniforme GEO",1]; // GEO
			};

			case 9: {
				_ret pushBack ["U_B_CombatUniform_mcam_vest","Uniforme Capitan",1]; // Capitan
			};
		}; [] call life_fnc_copUniform;

		_ret pushBack ["U_C_Scientist","Uniforme NBQ",1000];
	};

	//Hats
	case 1:
	{

		_ret pushBack ["H_Cap_blk",nil,75];
		if(__GETC__(life_coplevel) > 2) then
		{
		_ret pushBack ["H_Beret_blk_POLICE",nil,75];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
		_ret pushBack ["H_Watchcap_blk",nil,100];
		};

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
            _ret pushBack ["V_Rangemaster_belt",nil,1000];
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret pushBack ["V_PlateCarrier1_blk",nil,2000];
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_AssaultPack_blk",nil,1000],
			["B_FieldPack_blk",nil,1000],
			["B_OutdoorPack_blk",nil,1000]
		];
	};
};

_ret;