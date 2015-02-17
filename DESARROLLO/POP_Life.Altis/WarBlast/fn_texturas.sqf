#include "macro.h"
/*
	@author:WarBlast
*/
_uni = uniform player;
_bando = side player;
_back = backpack player;

if(_bando == west) then {
	switch(_uni) do {
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
	switch(_back) do {
	 	    case "B_AssaultPack_blk": {
			(unitBackpack player) setObjectTextureGlobal [0,""];
			};
			case "B_FieldPack_blk": {
			(unitBackpack player) setObjectTextureGlobal [0,""];
			};
			case "B_Carryall_Base": {
			(unitBackpack player) setObjectTextureGlobal [0,""];
			};
	    };
	};

if(_bando == independent) then {
	switch(_uni) do {
			case "U_Rangemaster" : {
			if (__GETC__(life_medicLevel) > 0)  then {
			player setObjectTextureGlobal [0, "textures\MED\medic_uniform.jpg"];
			};
		 };
	};
	switch(_back) do {
	 	    case "B_AssaultPack_blk": {
			(unitBackpack player) setObjectTextureGlobal [0,""];
			};
			case "B_FieldPack_blk": {
			(unitBackpack player) setObjectTextureGlobal [0,""];
			};
			case "B_Carryall_Base": {
			(unitBackpack player) setObjectTextureGlobal [0,""];
			};
	    };
	};
if(_bando == civilian) then {
	switch(_uni) do {
	       case "U_B_CombatUniform_mcam_worn": {
	       if (life_is_arrested) then {
		   player setObjectTextureGlobal [0,"textures\TRAJES\prisoner.jpg"];
	       };
        };
    };
};
