/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

switch(playerSide) do
{
	case west: {}; //Blah
	case civilian: {
		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in ["U_B_CombatUniform_mcam_worn"] && !license_civ_bounty) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
		if(_item in ["hgun_P07_snds_F","hgun_Rook40_snds_F"]) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
		if(_item == "U_NikosAgedBody" && !(life_mayor_settings select 0 == getPlayerUID player)) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
	case independent: {};
};

if(_item in ["U_B_Protagonist_VR","U_O_Protagonist_VR","U_I_Protagonist_VR"]) then {
	[_item,false,false,false,false] call life_fnc_handleItem;
};

[player, true] call life_fnc_HandleUniforms; //choose uniform retexture and send it to everyone. CL - Enable pickup of uniform and retexture.