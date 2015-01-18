waitUntil {!isNull player};





QUICK_equiparRopa = {




_random = round random 5;

if(_random==1) then{
_unit addHeadgear "U_C_Driver_1";
_unit  forceAddUniform "H_RacingHelmet_1_F";
};

if(_random==2) then{
_unit addHeadgear "U_C_Driver_2";
_unit  forceAddUniform "H_RacingHelmet_2_F";
};

if(_random==3) then{
_unit addHeadgear "U_C_Driver_3";
_unit  forceAddUniform "H_RacingHelmet_3_F";
};

if(_random==4) then{
_unit addHeadgear "U_C_Driver_4";
_unit  forceAddUniform "H_RacingHelmet_4_F";
};

if(_random==5) then{
_unit addHeadgear "U_C_Driver_4";
_unit  forceAddUniform "H_RacingHelmet_4_F";
};

if(true) exitWith{hint "Clase Evento kart";[] spawn { sleep 5;hint "";} };