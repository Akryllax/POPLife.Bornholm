/*
	COP UNIFORM SCRIPT
	Author: coldgas (http://altis.newhopeoutfit.de)
	Created for www.altisliferpg.com
*/

	#define __GETC__(var) (call var)
	
	
	if(__GETC__(life_coplevel) > 0) then {
		_lvl = __GETC__(life_coplevel);
		
		switch (backpack player) do
		{
			case "B_AssaultPack_blk":
			{
				(unitBackpack player) setObjectTextureGlobal [0,""];
			};
			case "B_FieldPack_blk":
			{
				(unitBackpack player) setObjectTextureGlobal [0,""];
			};
			case "B_Carryall_Base":
			{
				(unitBackpack player) setObjectTextureGlobal [0,""];
			};
			
			default {};
		};
		
		switch (_lvl) do {
			case 1: {
			    player forceAddUniform "U_Rangemaster";
				//skin de reluta por jip
				[[[],{player setObjectTextureGlobal [0, "textures\COP\policia.jpg"];}],"BIS_fnc_execVM",false,true] call BIS_fnc_MP;
			};
			case 2: {
			    player forceAddUniform "U_Rangemaster";
				player setObjectTextureGlobal [0, "textures\COP\policia.jpg"]; // Municipal
			};
			case 3: {
			    player forceAddUniform "U_Rangemaster";
				player setObjectTextureGlobal [0, "textures\COP\patrullero.jpg"]; // Guardia Civil
			};
			case 4: {
			player forceAddUniform "U_Rangemaster";
				player setObjectTextureGlobal [0, "textures\COP\patrullero.jpg"]; // Guardia Civil
			};
			case 5: {
			    player forceAddUniform "U_Rangemaster";
				player setObjectTextureGlobal [0, "textures\COP\patrullero.jpg"]; // Guardia Civil
			};
			case 6: {
			    player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player setObjectTextureGlobal [0, "textures\COP\agente_montana.jpg"]; // this is for all cops whitelisted or public.
			};
			case 7: {
			    player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player setObjectTextureGlobal [0, "textures\COP\agente_montana.jpg"]; // this is for all cops whitelisted or public.
			};
			case 8: {
			    player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player setObjectTextureGlobal [0, "textures\COP\geo.jpg"]; // this is for all cops whitelisted or public.
			};
			case 9: {
			    player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player setObjectTextureGlobal [0, "textures\COP\geo.jpg"]; // this is for all cops whitelisted or public.
				player setObjectTextureGlobal [1, "#(argb,8,8,3)color(1.0,0.0,0.0,1)"];
			};
			default {
				player setObjectTextureGlobal [0, "textures\COP\policia.jpg"]; // this is for all cops whitelisted or public.
			};
		};
	};
// call this script in as many files as possible, especially init_cop, init_civ and all files related to the cop-shop.