/*
	File: fn_HandleUniforms.sqf
	Author: TinyBigJacko 03May2014

	Description: Selects local or global uniform texture override and calls accordingly
	_unit: player to be retextured
	_propagate: true = spawn via MP framework, false = just call locally. 

*/

private ["_unit", "_propagate", "_unitgrpside"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_propagate = [_this,1,false,[false]] call BIS_fnc_param;

if (isNull _unit) exitWith {};
_unitgrpside = side (group _unit);

switch (_unitgrpside) do
{
	case west:
	{
		if (_propagate) then {
			[[_unit, "",backpack _unit], "life_fnc_ReTexBackpack", true, true] spawn life_fnc_MP ;
		} else {
			[_unit, "",backpack _unit] call life_fnc_ReTexBackpack;	
		};
		switch (uniform _unit) do 
		{
			case "U_B_CombatUniform_mcam_worn":
			{
				if (_propagate) then {
					[[_unit, "textures\police\uniform\trojan.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\police\uniform\trojan.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case "U_B_CombatUniform_mcam": 
			{
				if (_propagate) then {
					[[_unit, "textures\police\uniform\pc.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\police\uniform\pc.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case "U_B_CTRG_1":
			{
				if (_propagate) then {
					[[_unit, "textures\police\uniform\pcso.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\police\uniform\pcso.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case "U_B_CTRG_3":
			{
				if (_propagate) then {
					[[_unit, "textures\police\uniform\rpu.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\police\uniform\rpu.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			case "U_B_HeliPilotCoveralls":
			{
				if (_propagate) then {
					[[_unit, "textures\police\uniform\npas.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\police\uniform\npas.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case default {};
		};
	};
	
	case independent:
	{
		if(backpack _unit == "B_Carryall_mcamo") then {
			if (_propagate) then {
				[[_unit, "textures\nhs\uniform\mediccarryall.paa",backpack _unit], "life_fnc_ReTexBackpack", true, true] spawn life_fnc_MP ;
			} else {
				[_unit, "textures\nhs\uniform\mediccarryall.paa",backpack _unit] call life_fnc_ReTexBackpack;	
			};
		};

		switch (uniform _unit) do 
		{
			case "U_B_CombatUniform_mcam_worn": 
			{
				if (_propagate) then {
					[[_unit, "textures\nhs\uniform\nhsuniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\nhs\uniform\nhsuniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
		};
	};

	case civilian:
	{

		if(backpack _unit == "B_Carryall_mcamo") then {
			if (_propagate) then {
				[[_unit, "textures\civilian\arac\aracbackpack.paa",backpack _unit], "life_fnc_ReTexBackpack", true, true] spawn life_fnc_MP ;
			} else {
				[_unit, "textures\civilian\arac\aracbackpack.paa",backpack _unit] call life_fnc_ReTexBackpack;	
			};
		};

		switch (uniform _unit) do
		{
			case "U_B_CombatUniform_mcam_worn":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\bountyhunter\bountyhunteruniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\bountyhunter\bountyhunteruniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_Scientist":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\clothes\prisoner.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\clothes\prisoner.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};
			
			case "U_B_CTRG_3":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\arac\aracuniform.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\arac\aracuniform.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			//CUSTOM CLOTHING
			case "U_C_Commoner_shorts":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\clothes\cookiemonster.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\clothes\cookiemonster.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_Poor_shorts_1":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\clothes\cheapsuit.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\clothes\cheapsuit.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_ShirtSurfer_shorts":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\clothes\youwansum.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\clothes\youwansum.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_TeeSurfer_shorts_1":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\clothes\withstupid.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\clothes\withstupid.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case "U_C_TeeSurfer_shorts_2":
			{
				if (_propagate) then {
					[[_unit, "textures\civilian\clothes\thefa.paa",uniform _unit], "life_fnc_ReTexUniform", true, true] spawn life_fnc_MP ;
				} else {
					[_unit, "textures\civilian\clothes\thefa.paa",uniform _unit] call life_fnc_ReTexUniform;	
				};
			};

			case default {};
		};
	};
};