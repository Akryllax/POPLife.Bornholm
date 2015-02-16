#include "macro.h"
/*
	@author
*/
private["_type"];
_type = uniform player;
_side = side player;

if(_side == west) then {
	switch(_type) do {
		    case "U_Competitor" : {
			player setObjectTextureGlobal [0, "textures\COP\policia.jpg"];
		    };
            case "U_Rangemaster" : {
		    player setObjectTextureGlobal [0, "textures\COP\patrullero.jpg"];
	        };
		    case "U_B_CombatUniform_mcam_worn" : {
            player setObjectTextureGlobal [0, "textures\COP\agente_montana.jpg"];
		    };
		    case "U_B_CombatUniform_mcam" : {
            player setObjectTextureGlobal [0, "textures\COP\geo.jpg"];
	        };
	    };
	};

if(_side == independent) then {
	switch(_type) do {

			case "U_Rangemaster" : {
			if (__GETC__(life_medicLevel) > 0)  then {
			player setObjectTextureGlobal [0, "textures\MED\medic_uniform.jpg"];
			};
		 };

	};
};