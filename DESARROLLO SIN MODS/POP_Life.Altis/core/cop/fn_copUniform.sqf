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
				player setObjectTextureGlobal [0, "textures\COP\policia.jpg"]; // Recluta
			};
			case 2: {
				player setObjectTextureGlobal [0, "textures\COP\policia.jpg"]; // Municipal
			};
			case 3: {
				player setObjectTextureGlobal [0, "textures\COP\patrullero.jpg"];// Nacional
			};
			case 4: {
				player setObjectTextureGlobal [0, "textures\COP\patrullero.jpg"]; // Nacional 2
			};
			case 5: {
				player setObjectTextureGlobal [0, "textures\COP\guardia_civil_uniforme_ver.jpg"]; // Guardia Civil
			};
			case 6: {
				player setObjectTextureGlobal [0, "textures\COP\agente_montana.jpg"]; // Guardia Civil 2
			};
			case 7: {
				player setObjectTextureGlobal [0, "textures\COP\geo.jpg"]; // Geo
			};
			case 8: {
				player setObjectTextureGlobal [0, "textures\COP\geo.jpg"]; // Capitan
				player setObjectTextureGlobal [1, "#(argb,8,8,3)color(1.0,0.0,0.0,1)"]; // Capitan
			};

			default {
				player setObjectTextureGlobal [0, "textures\COP\policia.jpg"]; // this is for all cops whitelisted or public.
			};
		};
	};
// call this script in as many files as possible, especially init_cop, init_civ and all files related to the cop-shop.