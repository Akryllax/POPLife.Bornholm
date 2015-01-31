/*
	File: fn_HandleUniforms.sqf
	Author: TinyBigJacko 03May2014

	Description: Selects local or global uniform texture override and calls accordingly
	_unit: player to be retextured
	_propagate: true = spawn via MP framework, false = just call locally. 

*/

private ["_unit", "_propagate", "_unitgrpside"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_propagate = [_this, 1, false, [false]] call BIS_fnc_param;

if (isNull _unit) exitWith {};
_unitgrpside = side (group _unit);

switch (_unitgrpside) do
{
	case west:
	{
		if(backpack _unit == "B_Carryall_mcamo") then {
			if (_propagate) then {
				[[_unit, "textures\COP\policecarryall.paa",backpack _unit], "life_fnc_ReTexBackpack", true, true] spawn life_fnc_MP ;
			} else {
				[_unit, "textures\COP\policecarryall.paa",backpack _unit] call life_fnc_ReTexBackpack;	
			};
		};
 
		switch (uniform _unit) do 
		{
			case "U_Rangemaster": 
			{
				if (_propagate) then {
					[[_unit, "textures\COP\policeuniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\COP\policeuniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case "U_Competitor":
			{
				if (_propagate) then {
					[[_unit, "textures\COP\PCSOuniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\COP\PCSOuniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case "U_Marshal":
			{
				if (_propagate) then {
					[[_unit, "textures\COP\deauniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\COP\deauniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case default {};
		};
	};
	
	case independent:
	{
		if(backpack _unit == "B_Carryall_mcamo") then {
			if (_propagate) then {
				[[_unit, "textures\NHS\mediccarryall.paa",backpack _unit], "life_fnc_ReTexBackpack", true, true] spawn life_fnc_MP ;
			} else {
				[_unit, "textures\NHS\mediccarryall.paa",backpack _unit] call life_fnc_ReTexBackpack;	
			};
		};

		switch (uniform _unit) do 
		{
			case "U_B_CombatUniform_mcam_worn": 
			{
				if (_propagate) then {
					[[_unit, "textures\NHS\medic_NHS_uniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\NHS\medic_NHS_uniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case default
			{
				if (_propagate) then {
					[[_unit, "textures\NHS\medic_NHS_uniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\NHS\medic_NHS_uniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
		};
	};

	case civilian:
	{
		switch (uniform _unit) do
		{
			case "U_B_CombatUniform_mcam_worn":
			{
				if (_propagate) then {
					[[_unit, "textures\CIV\bountyhunteruniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\CIV\bountyhunteruniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_Scientist":
			{
				if (_propagate) then {
					[[_unit, "textures\CIV\prisoner.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\CIV\prisoner.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};


			//CUSTOM CLOTHING
			case "U_C_Commoner_shorts":
			{
				if (_propagate) then {
					[[_unit, "textures\CIV\cookiemonster.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\CIV\cookiemonster.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_Poor_shorts_1":
			{
				if (_propagate) then {
					[[_unit, "textures\CIV\cheapsuit.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\CIV\cheapsuit.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_ShirtSurfer_shorts":
			{
				if (_propagate) then {
					[[_unit, "textures\CIV\hellokitty.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\CIV\hellokitty.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_TeeSurfer_shorts_1":
			{
				if (_propagate) then {
					[[_unit, "textures\CIV\withstupid.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\CIV\withstupid.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};


			case "U_C_TeeSurfer_shorts_2":
			{
				if (_propagate) then {
					[[_unit, "textures\CIV\thefa.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\CIV\thefa.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case default {};
		};
	};
};