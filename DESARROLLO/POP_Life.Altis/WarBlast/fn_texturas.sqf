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
		case "U_Rangemaster" : {
		if(__GETC__(life_coplevel) == 1) OR (__GETC__(life_coplevel) == 2) then {
			_path = "textures\COP\policia.jpg";
			[[player,0,_path],"WAR_fnc_setTexture",true,false] spawn life_fnc_MP;
		} else {
		    _path = "textures\COP\patrullero.jpg";
		    [[player,0,_path],"WAR_fnc_setTexture",true,false] spawn life_fnc_MP;
	        };
        };
		case "U_B_CombatUniform_mcam_worn" : {
		if(__GETC__(life_coplevel) == 5) OR (__GETC__(life_coplevel) == 6) then {
			_path = "textures\textures\COP\agente_montana.jpg";
			[[player,0,_path],"War_fnc_setTexture",true,false] spawn life_fnc_MP;
		} else {
		    _path = "textures\COP\geo.jpg";
		    [[player,0,_path],"WAR_fnc_setTexture",true,false] spawn life_fnc_MP;
	        };
	    };
	};
};

if(_side == independent) then {
	switch(_type) do {

			case "U_Rangemaster" : {

			if (__GETC__(life_medicLevel) > 0)  then {
			_path = "textures\MED\medic_uniform.jpg";
			[[player,0,_path],"War_fnc_setTexture",true,false] spawn life_fnc_MP;
			};
		 };

	};
};