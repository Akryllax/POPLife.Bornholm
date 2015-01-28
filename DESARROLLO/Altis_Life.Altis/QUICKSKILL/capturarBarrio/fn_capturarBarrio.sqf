#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture"];
_params= _this select 3;

_barrioBandera= _params select 0;
_jugador=_params select 1;
_barrioName = _params select 2;
_bandaNombre = (group player) getVariable "gang_name";
_capturado = 0;
_tiempoCaptura = 300;
_barrioMetros = 250;
_capturadoPor = "";


//sino tiene una banda que la creee
if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
//ya la estan caapturando
if((_barrio getVariable ["inCapture",FALSE])) exitWith {hint "Ya estan capturando el barrio";};


while {_tiempoCaptura > 1} do
{    
	life_action_inUse = true;
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	sleep 1;
	
	_tiempoCaptura = _tiempoCaptura - 1;	
	
};

if(_tiempoCaptura<1)then{


	if(_capturado ==0)then{
		//han capturado el barrio

		titleText["El barrio ha sido capturado.","PLAIN"];
		_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
		] call BIS_fnc_selectRandom;
		_barrioBandera setFlagTexture _flagTexture;

		_barrio setVariable["capturadoYa",true,true];
		_barrio setVariable["capturadoPor",true,true];

		//iniciar timer recompensas


	};

	if(_capturado ==1)then{
		//han capturado el barrio

		titleText["Has fallado al capturar el barrio.","PLAIN"];

	};

	life_action_inUse = false;


};


