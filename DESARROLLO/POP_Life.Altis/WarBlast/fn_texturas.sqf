#include "macro.h"
/*
	@author
*/
private["_path","_unit","_type"];
_unit = [_this,0] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
_side = side _unit;

if(_side == west) then {
	switch(_type) do {
		    case "U_Competitor" : {
			player setObjectTextureGlobal [0, "textures\COP\policia.jpg"] call life_fnc_MP;
		    };
            case "U_Rangemaster" : {
		    player setObjectTextureGlobal [0, "textures\COP\patrullero.jpg"] call life_fnc_MP;
	        };
		    case "U_B_CombatUniform_mcam_worn" : {
            player setObjectTextureGlobal [0, "textures\COP\agente_montana.jpg"] call life_fnc_MP;
		    };
		    case "U_B_CombatUniform_mcam" : {
            player setObjectTextureGlobal [0, "textures\COP\geo.jpg"] call life_fnc_MP;
	        };
	    };
	};

if(_side == independent) then {
	switch(_type) do {

			case "U_Rangemaster" : {

			if (__GETC__(life_medicLevel) > 0)  then {
			player setObjectTextureGlobal [0, "textures\MED\medic_uniform.jpg"] call life_fnc_MP;
			};
		 };

	};
};