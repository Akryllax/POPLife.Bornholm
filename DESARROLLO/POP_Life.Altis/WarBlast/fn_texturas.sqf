#include "macro.h"
/*
	@author:WarBlast
*/
_uni = uniform player;
_bando = side player;
_back = unitbackpack player;
_listaMDF = [76561198020910545,76561198051671161,76561198061075269,76561198131927453,76561198132364470,76561198102538451,76561198096995213,76561198040480128,76561198147074169,76561197987947084,76561197991209058,76561198110565897,76561197960590442,76561197960701693,76561197967296882,76561198002003872,76561198011237244,76561198012863609,76561198012897075,76561198045586900,76561198123460176,76561198153325390,76561198004202201];

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
if(_bando == independent) then {
	switch(_uni) do {
			case "U_Rangemaster" : {
			if (__GETC__(life_medicLevel) > 0)  then {
			player setObjectTextureGlobal [0, "textures\MED\medic_uniform.jpg"];
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
           case "U_I_CombatUniform": {
           if (((getPlayerUID player) in _listaMDF)) then {
           	player setObjectTextureGlobal [0,"textures\TRAJES\MDF.jpg"];
           	(unitBackpack player) setObjectTextureGlobal [0,""];
           };
        };
    };
};
