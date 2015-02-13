cursorTarget addAction["Vestirse de piloto de kart GRATIS!!",QUICK_equiparRopa];


if(side player == west) exitWith { hint "Eres policia" };


QUICK_equiparRopa = {

_unit = cursorTarget;
_random = round random 5;

if(_random==1) then{
_unit addHeadgear "H_RacingHelmet_1_F";
_unit  forceAddUniform "U_C_Driver_1";
};

if(_random==2) then{
_unit addHeadgear "H_RacingHelmet_2_F";
_unit  forceAddUniform "U_C_Driver_2";
};

if(_random==3) then{
_unit addHeadgear "H_RacingHelmet_3_F";
_unit  forceAddUniform "U_C_Driver_3";
};

if(_random==4) then{
_unit addHeadgear "H_RacingHelmet_4_F";
_unit  forceAddUniform "U_C_Driver_4";
};

if(_random==5) then{
_unit addHeadgear "H_RacingHelmet_4_F";
_unit  forceAddUniform "U_C_Driver_4";
};

if(true) exitWith{hint "Clase Evento kart";[] spawn { sleep 5;hint "";} };